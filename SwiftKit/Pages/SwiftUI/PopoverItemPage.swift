import SwiftUI

// SwiftUI `View/popover(item:attachmentAnchor:arrowEdge:content:)` reference page.
// Source: Documentation/SwiftUI/popovers/popover(item:attachmentanchor:arrowedge:content:).md
// Item-driven overload — popover present iff item is non-nil. macOS 10.15+.

private let demoFrameWidth: CGFloat = 400

struct PopoverItemPage: View {
    @State private var current: PopoverItemModel?

    private let entries: [PopoverItemModel] = [
        .init(message: "First option"),
        .init(message: "Second option"),
        .init(message: "Third option")
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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/popover(item:attachmentAnchor:arrowEdge:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a popover using the given item as a data source for the popover's content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/popovers/popover(item:attachmentanchor:arrowedge:content:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".popover(item: $current) { item in Text(item.message) }") {
            HStack(spacing: 8) {
                ForEach(entries) { entry in
                    Button(entry.message) { current = entry }
                }
            }
            .popover(item: $current) { item in
                Text(item.message)
                    .padding(16)
                    .frame(maxWidth: 220, alignment: .leading)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Bottom-anchored arrow") {
                DemoCard(api: ".popover(item: $current, arrowEdge: .bottom) { … }") {
                    Text("Same surface as the default — set `arrowEdge: .bottom` on the modifier when you want the popover to stick out below the trigger.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("Button(\"Pick\") { current = entries[0] }.popover(item: $current, arrowEdge: .bottom) { … }")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "current Optional drives presentation") {
                DemoCard(api: "@State private var current: PopoverItemModel?") {
                    HStack(spacing: 12) {
                        Button("Clear (current = nil)") { current = nil }
                        Text("current = \(current.map { "PopoverItemModel(\($0.message))" } ?? "nil")")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private struct PopItemNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PopItemNote] = [
        .init(title: "Item must conform to Identifiable.",
              detail: "Replacing the bound item with a different id dismisses the current popover and presents a new one — useful when navigating between rows.",
              symbol: "barcode"),
        .init(title: "Closure receives the unwrapped item.",
              detail: "No `if let` needed inside the popover body — the item is non-optional once the closure runs.",
              symbol: "chevron.right.circle"),
        .init(title: "Same anchor + arrowEdge controls as the boolean overload.",
              detail: "attachmentAnchor accepts `.rect(.bounds)` (the default), `.rect(...)` for a sub-rect, or `.point(UnitPoint)`. arrowEdge: nil lets the system pick.",
              symbol: "arrow.up.left.and.arrow.down.right")
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

private struct PopoverItemModel: Identifiable {
    let id = UUID()
    let message: String
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
    PopoverItemPage()
        .frame(width: 1100, height: 800)
}
