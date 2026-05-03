import SwiftUI

// SwiftUI `View/fileDialogMessage(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/filedialogmessage(_:).md
// macOS 14.0+. Sets a sub-title message at the top of the file dialog panel.

struct FileDialogMessagePage: View {
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
            Text("View/fileDialogMessage(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("On macOS, configures the file dialog with custom text presented to the user, similar to a title.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogmessage(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FMSnippet(
            api: ".fileDialogMessage(\"Choose images to attach to this email.\")",
            code: """
            Button("Attach images") { isImporting = true }
                .fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.image],
                    allowsMultipleSelection: true
                ) { result in … }
                .fileDialogMessage(
                    "Choose images to attach to this email."
                )
            """,
            note: "The message appears prominently at the top of the panel — use it to give the user task context."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pass nil to hide") {
                FMSnippet(
                    api: ".fileDialogMessage(nil)",
                    code: """
                    .fileDialogMessage(nil)
                    """,
                    note: "Reverts to no custom message."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileDialogMessage(_ message: Text?) -> some View")
            }
        }
    }

    private struct FMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FMNote] = [
        .init(title: "macOS-only.",
              detail: "iOS document pickers don't expose a custom message field. The modifier is a no-op there.",
              symbol: "macwindow"),
        .init(title: "Parameter is Text?, not String.",
              detail: "Pass `Text(\"…\")` for localization-aware text. Nil clears the message.",
              symbol: "textformat"),
        .init(title: "Pair with .fileDialogConfirmationLabel.",
              detail: "Message + custom button label is the canonical recipe for clarifying the dialog's purpose. Together they replace the generic \"Choose a file…\" framing.",
              symbol: "rectangle.and.text.magnifyingglass"),
        .init(title: "Keep it short.",
              detail: "One sentence. NSOpenPanel/NSSavePanel doesn't wrap long text gracefully.",
              symbol: "scissors")
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

private struct FMSnippet: View {
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
    FileDialogMessagePage()
        .frame(width: 1100, height: 800)
}
