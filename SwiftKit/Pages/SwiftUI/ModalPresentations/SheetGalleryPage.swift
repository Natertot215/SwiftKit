import SwiftUI

// Dense SwiftUI Sheet gallery — consolidates the entire family:
//   View/sheet(isPresented:onDismiss:content:)
//   View/sheet(item:onDismiss:content:)
//
// Source docs:
//   Documentation/SwiftUI/modal-presentations/sheet(ispresented:ondismiss:content:).md
//   Documentation/SwiftUI/modal-presentations/sheet(item:ondismiss:content:).md

private let demoFrameWidth: CGFloat = 380

private struct SheetItemDetail: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let partNumber: String
    let quantity: Int
}

private let sheetCatalog: [SheetItemDetail] = [
    .init(name: "Widget",   partNumber: "Z-1234A", quantity: 100),
    .init(name: "Sprocket", partNumber: "B-9087C", quantity: 42),
    .init(name: "Flange",   partNumber: "K-5512D", quantity: 7)
]

struct SheetGalleryPage: View {
    // .sheet(isPresented:) demos
    @State private var isShowingSheet = false
    @State private var isShowingDismissable = false
    @State private var dismissCount = 0

    // .sheet(item:) demos
    @State private var detail: SheetItemDetail?
    @State private var dismissedItem: String = "—"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                isPresentedSection
                itemSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Sheet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a modal sheet over the current scene. Two overloads: a Boolean binding for simple show/hide and an item binding for data-driven presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/  \u{00b7}  macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".sheet(isPresented:onDismiss:content:)  \u{00b7}  .sheet(item:onDismiss:content:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: .sheet(isPresented:) (absorbed from SheetIsPresentedPage)

    private var isPresentedSection: some View {
        PageSection("View/sheet(isPresented:onDismiss:content:)",
                    subtitle: "Boolean-driven sheet \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Bind a Boolean to drive presentation. The framework flips the binding back to false on dismissal; the optional onDismiss closure runs after that flip.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".sheet(isPresented: $isShowingSheet) { … }") {
                    Button("Open sheet") { isShowingSheet = true }
                        .buttonStyle(.borderedProminent)
                        .sheet(isPresented: $isShowingSheet) {
                            SheetBody(title: "License Agreement",
                                      detail: "Terms and conditions go here.")
                        }
                }

                VariantBlock(title: "With onDismiss callback") {
                    DemoCard(api: ".sheet(isPresented: $flag, onDismiss: { dismissCount += 1 }) { … }") {
                        HStack(spacing: 12) {
                            Button("Open sheet") { isShowingDismissable = true }
                                .buttonStyle(.borderedProminent)
                            Text("Dismissed \(dismissCount) time\(dismissCount == 1 ? "" : "s")")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .sheet(isPresented: $isShowingDismissable, onDismiss: {
                            dismissCount += 1
                        }) {
                            SheetBody(title: "Closed?",
                                      detail: "Counter on the trigger updates each time this sheet dismisses.")
                        }
                    }
                }

                VariantBlock(title: "Trigger button — bound state inspection") {
                    DemoCard(api: "Button(\"Open sheet\") { isShowingSheet = true }.sheet(isPresented: $isShowingSheet) { … }") {
                        HStack(spacing: 12) {
                            Button("Toggle") { isShowingSheet.toggle() }
                            Text("isShowingSheet = \(String(describing: isShowingSheet))")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                VariantBlock(title: "Programmatic dismiss inside the sheet — @Environment(\\.dismiss)") {
                    Text("Sheet content reads `\\.dismiss` from the environment and calls it from a button. The framework also flips the bound `isPresented` back to false on dismissal.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("@Environment(\\.dismiss) private var dismiss; Button(\"Done\") { dismiss() }")
                }
            }
        }
    }

    // MARK: .sheet(item:) (absorbed from SheetItemPage)

    private var itemSection: some View {
        PageSection("View/sheet(item:onDismiss:content:)",
                    subtitle: "Item-driven sheet \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Bind an Optional<Identifiable>. Non-nil presents, nil dismisses, replacing with a different id triggers dismiss + re-present.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                DemoCard(api: ".sheet(item: $detail) { item in DetailSheet(item: item) }") {
                    HStack(spacing: 8) {
                        ForEach(sheetCatalog) { item in
                            Button(item.name) { detail = item }
                        }
                    }
                    .sheet(item: $detail) { item in
                        DetailSheet(item: item)
                    }
                }

                VariantBlock(title: "With onDismiss callback") {
                    DemoCard(api: ".sheet(item: $detail, onDismiss: { dismissedItem = … }) { … }") {
                        HStack(spacing: 12) {
                            Button("Show first part") { detail = sheetCatalog.first }
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

                VariantBlock(title: "Inline binding state") {
                    DemoCard(api: "@State private var detail: SheetItemDetail?") {
                        HStack(spacing: 12) {
                            Button("Clear (detail = nil)") { detail = nil }
                            Text("detail = \(detail.map { "SheetItemDetail(\($0.name))" } ?? "nil")")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct SheetNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SheetNote] = [
        .init(title: "Sheet sizing on macOS uses Window-style metrics.",
              detail: "Unlike iOS sheets, macOS sheets don't have detents by default. They size to the content's intrinsic size, with optional .presentationSizing on macOS 15+ for explicit form/page sizing.",
              symbol: "macwindow"),
        .init(title: "Bool flips back to false on dismissal.",
              detail: "When the user dismisses the sheet — by pressing Esc, clicking a button bound to dismiss(), or your own logic — SwiftUI sets the bound Boolean back to false. The onDismiss closure runs after that flip.",
              symbol: "arrow.counterclockwise"),
        .init(title: "Only one sheet per attached view.",
              detail: "A view can only host one .sheet modifier. If two sheets need to share the same parent, attach them at different layers (e.g. one on the parent VStack, one on a child) or use a single sheet that switches its content based on enum state.",
              symbol: "rectangle.stack.badge.plus"),
        .init(title: "Compose with .interactiveDismissDisabled to require a choice.",
              detail: "Apply `.interactiveDismissDisabled()` to the sheet's root content to block Esc-key and click-outside dismissal until the user completes a required action.",
              symbol: "lock.shield"),
        .init(title: "Item must conform to Identifiable.",
              detail: "The framework uses item.id to detect changes. Replacing the item with a different id triggers dismiss + re-present; mutating its other fields doesn't.",
              symbol: "barcode"),
        .init(title: "Pass-through to closure removes optional unwrapping.",
              detail: "Inside the content closure of .sheet(item:), the item is non-optional — eliminating the `if let` dance you'd need with .sheet(isPresented:) + a separate optional model.",
              symbol: "chevron.right.circle"),
        .init(title: "Choose the item overload when the sheet needs a model.",
              detail: "If your sheet is data-bound (e.g. detail editor for a selected row), .sheet(item:) eliminates the failure mode where isPresented is true but the model is nil or stale.",
              symbol: "shippingbox")
    ]

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
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
}

// MARK: - Page-local helpers

private struct SheetBody: View {
    let title: String
    let detail: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Button("Dismiss") { dismiss() }
                .keyboardShortcut(.defaultAction)
        }
        .padding(32)
        .frame(minWidth: 320, minHeight: 200)
    }
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

extension SheetGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.sheet",
        title: "Sheet",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/sheet(isPresented:onDismiss:content:)",
            "View/sheet(item:onDismiss:content:)",
            "View/presentationCompactAdaptation(_:)",
            "View/presentationCompactAdaptation(horizontal:vertical:)",
            "PresentationAdaptation",
            "View/presentationSizing(_:)",
            "PresentationSizing",
            "PresentationSizingRoot",
            "PresentationSizingContext",
            "View/presentationDetents(_:)",
            "View/presentationDetents(_:selection:)",
            "View/presentationContentInteraction(_:)",
            "View/presentationDragIndicator(_:)",
            "PresentationDetent",
            "CustomPresentationDetent",
            "PresentationContentInteraction",
            "View/presentationCornerRadius(_:)",
            "View/presentationBackground(_:)",
            "View/presentationBackground(alignment:content:)",
            "View/presentationBackgroundInteraction(_:)",
            "PresentationBackgroundInteraction",
            "EnvironmentValues/isPresented",
            "View/interactiveDismissDisabled(_:)"
        ],
        blurb: "Presents a modal sheet over the current scene. Companion modifiers configure detents, sizing, background, drag indicator, corner radius, and dismissal behavior.",
        signature: "func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/modal-presentations/sheet(ispresented:ondismiss:content:).md",
        page: { AnyView(SheetGalleryPage()) }
    )
}

#Preview {
    SheetGalleryPage()
        .frame(width: 1100, height: 1400)
}
