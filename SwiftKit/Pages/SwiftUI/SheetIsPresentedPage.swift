import SwiftUI

// SwiftUI `View/sheet(isPresented:onDismiss:content:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/sheet(ispresented:ondismiss:content:).md
// One overload — Boolean-binding driven sheet presentation. macOS 10.15+.

private let demoFrameWidth: CGFloat = 380

struct SheetIsPresentedPage: View {
    @State private var isShowingSheet = false
    @State private var isShowingDismissable = false
    @State private var dismissCount = 0

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
            Text("View/sheet(isPresented:onDismiss:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a sheet when a binding to a Boolean value that you provide is true.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/sheet(ispresented:ondismiss:content:).md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".sheet(isPresented: $isShowingSheet) { … }") {
            Button("Open sheet") { isShowingSheet = true }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $isShowingSheet) {
                    SheetBody(title: "License Agreement",
                              detail: "Terms and conditions go here.")
                }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With onDismiss callback") {
                DemoCard(api: ".sheet(isPresented: $isShowingDismissable, onDismiss: { dismissCount += 1 }) { … }") {
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
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Trigger button — bound state") {
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
                DemoCard(api: "@Environment(\\.dismiss) private var dismiss; Button(\"Done\") { dismiss() }") {
                    Text("Sheet content reads `\\.dismiss` from the environment and calls it from a button. The framework also flips the bound `isPresented` back to false on dismissal.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
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
        .init(title: "For data-driven presentation, prefer .sheet(item:).",
              detail: "If the sheet needs a non-nil model object to render, use the item-driven overload — it ties presentation and content to the same Optional source of truth, eliminating the two-state bug where isPresented is true but the model is stale.",
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

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let height {
                    content().frame(width: demoFrameWidth, height: height)
                } else {
                    content().frame(width: demoFrameWidth, alignment: .leading)
                }
            }
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
    SheetIsPresentedPage()
        .frame(width: 1100, height: 800)
}
