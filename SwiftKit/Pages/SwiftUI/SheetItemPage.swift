import SwiftUI

// SwiftUI `View/sheet(item:onDismiss:content:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/sheet(item:ondismiss:content:).md
// Item-driven overload — presented when the bound Optional is non-nil. macOS 10.15+.

private let demoFrameWidth: CGFloat = 380

struct SheetItemPage: View {
    @State private var detail: SheetItemDetail?
    @State private var dismissedItem: String = "—"

    private let catalog: [SheetItemDetail] = [
        .init(name: "Widget", partNumber: "Z-1234A", quantity: 100),
        .init(name: "Sprocket", partNumber: "B-9087C", quantity: 42),
        .init(name: "Flange", partNumber: "K-5512D", quantity: 7)
    ]

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/sheet(item:onDismiss:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a sheet using a given item as a data source for the sheet's content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/sheet(item:ondismiss:content:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".sheet(item: $detail) { item in DetailSheet(item: item) }") {
            HStack(spacing: 8) {
                ForEach(catalog) { item in
                    Button(item.name) { detail = item }
                }
            }
            .sheet(item: $detail) { item in
                DetailSheet(item: item)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With onDismiss callback — captures the dismissed item") {
                DemoCard(api: ".sheet(item: $detail, onDismiss: { dismissedItem = … }) { … }") {
                    HStack(spacing: 12) {
                        Button("Show first part") { detail = catalog.first }
                        Text("Last dismissed: \(dismissedItem)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .sheet(item: $detail, onDismiss: {
                        // The detail is already nil here — capture it inside the
                        // sheet body before dismissal if you need it.
                        dismissedItem = "(an item)"
                    }) { item in
                        DetailSheet(item: item)
                    }
                }
            }

            VariantBlock(title: "Replacement — changing the item dismisses + re-presents") {
                Text("If you assign a new value while the sheet is showing, the framework dismisses the current sheet and immediately presents a new one with the replacement item.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Inline binding state") {
                DemoCard(api: "@State private var detail: InventoryItem?") {
                    HStack(spacing: 12) {
                        Button("Clear (detail = nil)") { detail = nil }
                        Text("detail = \(detail.map { "InventoryItem(\($0.name))" } ?? "nil")")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ItemNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ItemNote] = [
        .init(title: "Item must conform to Identifiable.",
              detail: "The framework uses item.id to detect changes. Replacing the item with a different id triggers dismiss + re-present; mutating its other fields doesn't.",
              symbol: "barcode"),
        .init(title: "Pass-through to closure removes optional unwrapping.",
              detail: "Inside the content closure, the item is non-optional — eliminating the `if let` dance you'd need with .sheet(isPresented:) + a separate optional model.",
              symbol: "chevron.right.circle"),
        .init(title: "Setting item = nil dismisses the sheet.",
              detail: "Sheet content can call dismiss() (which clears the binding to nil), or you can set detail = nil from anywhere — both routes dismiss the sheet and trigger onDismiss.",
              symbol: "xmark.circle"),
        .init(title: "Choose this overload when the sheet needs a model.",
              detail: "If your sheet is data-bound (e.g. detail editor for a selected row), .sheet(item:) eliminates the failure mode where isPresented is true but the model is nil or stale.",
              symbol: "shippingbox")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

// MARK: - Page-local types

private struct SheetItemDetail: Identifiable {
    let id = UUID()
    let name: String
    let partNumber: String
    let quantity: Int
}

private struct DetailSheet: View {
    let item: SheetItemDetail
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(item.name)
                .font(.title2)
                .fontWeight(.semibold)
            Group {
                Text("Part Number: \(item.partNumber)")
                Text("Quantity: \(item.quantity)")
            }
            .font(.callout)
            .foregroundStyle(.secondary)
            HStack {
                Spacer()
                Button("Done") { dismiss() }
                    .keyboardShortcut(.defaultAction)
            }
        }
        .padding(24)
        .frame(minWidth: 320, minHeight: 180)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    SheetItemPage()
        .frame(width: 1100, height: 800)
}
