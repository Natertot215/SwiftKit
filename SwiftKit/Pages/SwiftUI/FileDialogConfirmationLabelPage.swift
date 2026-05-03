import SwiftUI

// SwiftUI `View/fileDialogConfirmationLabel(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/filedialogconfirmationlabel(_:).md
// macOS 14.0+. Sets the label for the confirmation (Save/Open/Move) button in NSOpenPanel/NSSavePanel.

struct FileDialogConfirmationLabelPage: View {
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
            Text("View/fileDialogConfirmationLabel(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("On macOS, configures the fileExporter / fileImporter / fileMover with a custom confirmation button label.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogconfirmationlabel(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FCLSnippet(
            api: ".fileDialogConfirmationLabel(\"Send\")",
            code: """
            Button("Attach file") { isImporting = true }
                .fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.image]
                ) { result in … }
                .fileDialogConfirmationLabel("Send")
            """,
            note: "Renames the panel's primary button. Use a verb that matches the user's outcome (Send, Attach, Process)."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "LocalizedStringResource — pass a localized key") {
                FCLSnippet(
                    api: ".fileDialogConfirmationLabel(LocalizedStringResource(\"button.send\"))",
                    code: """
                    .fileDialogConfirmationLabel(
                        LocalizedStringResource("button.send")
                    )
                    """,
                    note: "The parameter type is LocalizedStringResource. String literals work via implicit conversion; pass the explicit type when targeting a specific table or bundle."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileDialogConfirmationLabel(_ label: LocalizedStringResource) -> some View")
            }
        }
    }

    private struct FCLNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FCLNote] = [
        .init(title: "macOS-only.",
              detail: "iOS document pickers don't expose a customizable confirmation button. The modifier is a no-op there.",
              symbol: "macwindow"),
        .init(title: "Localized resource.",
              detail: "The parameter is LocalizedStringResource — pair with a Localizable.strings entry so the label translates with the rest of your app.",
              symbol: "globe"),
        .init(title: "Match the user's mental model.",
              detail: "If the dialog is part of an Attach flow, the button should say Attach — not Save or Open. Custom labels reduce ambiguity for non-developer users.",
              symbol: "text.bubble"),
        .init(title: "Pair with .fileDialogMessage for full panel context.",
              detail: ".fileDialogMessage gives the panel a body sentence; .fileDialogConfirmationLabel renames the button. Together they make the panel's purpose self-evident.",
              symbol: "rectangle.and.text.magnifyingglass")
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

private struct FCLSnippet: View {
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
    FileDialogConfirmationLabelPage()
        .frame(width: 1100, height: 800)
}
