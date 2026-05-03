import SwiftUI

// SwiftUI dismissalConfirmationDialog reference page — bundles two overloads:
// • View/dismissalConfirmationDialog(_:shouldPresent:actions:)
// • View/dismissalConfirmationDialog(_:shouldPresent:actions:message:)
// Source: Documentation/SwiftUI/modal-presentations/dismissalconfirmationdialog(_:shouldpresent:actions:[message:]).md
// macOS 15.0+. Triggered when the user attempts to close a window/sheet with unsaved work.

private let demoFrameWidth: CGFloat = 480

struct DismissalConfirmationDialogPage: View {
    @State private var hasUnsavedChanges = true

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
            Text("View/dismissalConfirmationDialog(_:shouldPresent:actions:[message:])")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a confirmation dialog when a dismiss action has been triggered. On macOS, fires when attempting to close the enclosing window.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/dismissalconfirmationdialog(_:shouldpresent:actions:[message:]).md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DCSnippet(
            api: ".dismissalConfirmationDialog(\"Save This Message As Draft?\", shouldPresent: hasUnsavedChanges, actions: { … })",
            code: """
            struct ComposeMessage: View {
                @State private var message = Message()

                var body: some View {
                    MessageEditor(message: $message)
                        .dismissalConfirmationDialog(
                            "Save This Message As Draft?",
                            shouldPresent: message.hasUnsavedChanges
                        ) {
                            Button("Save") {
                                message.save()
                            }
                            Button("Don't Save", role: .destructive) {
                                message.discard()
                            }
                        }
                }
            }
            """,
            note: "Reference example from the Apple documentation. Attaches to MessageEditor; triggers when the user closes the window."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With message — second overload") {
                DCSnippet(
                    api: ".dismissalConfirmationDialog(_:shouldPresent:actions:message:)",
                    code: """
                    .dismissalConfirmationDialog(
                        "Save This Message As Draft?",
                        shouldPresent: message.hasUnsavedChanges
                    ) {
                        Button("Save") { message.save() }
                        Button("Don't Save", role: .destructive) { message.discard() }
                    } message: {
                        Text(\"\"\"
                            This message has not been sent and contains \\
                            unsaved changes.
                            \"\"\")
                    }
                    """,
                    note: "Adds a body message under the title."
                )
            }

            VariantBlock(title: "Cancellation always cancels the dismiss") {
                Text("If you provide a button with role .cancel, that button takes the place of the default cancellation. The cancel action ALWAYS prevents the dismiss; other actions ALWAYS allow the dismiss to proceed.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Toggle the trigger state") {
                HStack(spacing: 12) {
                    Toggle("hasUnsavedChanges", isOn: $hasUnsavedChanges)
                        .toggleStyle(.switch)
                    Text("shouldPresent: \(String(describing: hasUnsavedChanges))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
                .frame(width: demoFrameWidth, alignment: .leading)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
                APICallout("dismissalConfirmationDialog(_:shouldPresent: hasUnsavedChanges, actions: { … })")
                Text("Demo trigger state — the actual close-window trigger only fires inside an owning window context, which this in-app demo doesn't provide.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct DCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DCNote] = [
        .init(title: "macOS-only intercept of window close.",
              detail: "On macOS this fires when the user tries to close the window containing the modified view. There's no general 'dismiss' hook on iOS in macOS 15.",
              symbol: "macwindow"),
        .init(title: "Cancel button blocks the dismiss; everything else allows it.",
              detail: "Unlike .confirmationDialog where the cancel button is just visually styled, here the role.cancel button is functionally what STOPS the close. Any non-cancel button ALLOWS the close to complete.",
              symbol: "xmark.shield"),
        .init(title: "shouldPresent gates whether the dialog appears at all.",
              detail: "When shouldPresent is false, dismissals proceed silently. Bind it to your dirty-state flag (hasUnsavedChanges, etc.) so users only see the prompt when there's something to lose.",
              symbol: "switch.2"),
        .init(title: "Doesn't replace .interactiveDismissDisabled.",
              detail: "Use .interactiveDismissDisabled to prevent gestural dismissal of sheets/popovers. Use .dismissalConfirmationDialog to ALLOW dismissal but require user confirmation first.",
              symbol: "lock.open")
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

private struct DCSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note).font(.footnote).foregroundStyle(.secondary)
            }
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
    DismissalConfirmationDialogPage()
        .frame(width: 1100, height: 800)
}
