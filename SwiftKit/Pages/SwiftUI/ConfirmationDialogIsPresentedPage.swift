import SwiftUI

// SwiftUI confirmationDialog reference page — bundles two overloads:
// • View/confirmationDialog(_:isPresented:titleVisibility:actions:)
// • View/confirmationDialog(_:isPresented:titleVisibility:actions:message:)
// Source: Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:actions:[message:]).md

private let demoFrameWidth: CGFloat = 420

struct ConfirmationDialogIsPresentedPage: View {
    @State private var isShowingDialog = false
    @State private var isShowingDialogWithMessage = false
    @State private var titleHidden = false

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
            Text("View/confirmationDialog(_:isPresented:titleVisibility:actions:[message:])")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a confirmation dialog when a given condition is true. Use for user-initiated multi-choice prompts (the migration target of the deprecated ActionSheet).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:actions:[message:]).md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".confirmationDialog(\"Permanently erase the items in the trash?\", isPresented: $isShowingDialog) { Button(\"Empty Trash\", role: .destructive) { } }") {
            Button("Empty Trash") { isShowingDialog = true }
                .buttonStyle(.borderedProminent)
                .confirmationDialog(
                    "Permanently erase the items in the trash?",
                    isPresented: $isShowingDialog
                ) {
                    Button("Empty Trash", role: .destructive) { }
                }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With message — confirmationDialog(_:isPresented:titleVisibility:actions:message:)") {
                DemoCard(api: ".confirmationDialog(_:isPresented:, titleVisibility: .visible, actions: { … }, message: { Text(\"…\") })") {
                    Button("Empty trash with message") { isShowingDialogWithMessage = true }
                        .confirmationDialog(
                            "Permanently erase the items in the trash?",
                            isPresented: $isShowingDialogWithMessage,
                            titleVisibility: .visible
                        ) {
                            Button("Empty Trash", role: .destructive) { }
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("This action cannot be undone.")
                        }
                }
            }

            VariantBlock(title: "titleVisibility: .hidden — title is read-aloud only") {
                DemoCard(api: ".confirmationDialog(\"Title (hidden)\", isPresented:, titleVisibility: .hidden) { … }") {
                    Button("Show with hidden title") { titleHidden = true }
                        .confirmationDialog(
                            "Choose a destination",
                            isPresented: $titleHidden,
                            titleVisibility: .hidden
                        ) {
                            Button("Inbox") { }
                            Button("Archive") { }
                            Button("Cancel", role: .cancel) { }
                        }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "titleVisibility — three values") {
                VStack(alignment: .leading, spacing: 6) {
                    APICallout(".automatic — system default")
                    APICallout(".visible — title shown above actions")
                    APICallout(".hidden — title used for accessibility only")
                }
            }
        }
    }

    private struct CDNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CDNote] = [
        .init(title: "Confirmation dialogs always include a dismiss action.",
              detail: "Even without an explicit cancel button the framework adds one. Provide your own .cancel-role button to override the wording or behavior.",
              symbol: "xmark.circle"),
        .init(title: "Action ordering is system-controlled.",
              detail: "The system reorders by role + prominence (destructive last, cancel separated). The order in your code is not guaranteed to be the order on screen.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "macOS renders contextually, often as a popover.",
              detail: "On macOS the dialog can render as a small popover anchored to the trigger view. On iOS regular size classes it may also appear as a popover. Compact size classes show the bottom-attached action sheet style.",
              symbol: "macwindow"),
        .init(title: "Use this overload when no model object is needed.",
              detail: "If your buttons need to interpolate model values (e.g. \"Delete \\(file.name)\"), prefer the .confirmationDialog(_:isPresented:titleVisibility:presenting:actions:) overload to avoid stale captures.",
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
    ConfirmationDialogIsPresentedPage()
        .frame(width: 1100, height: 800)
}
