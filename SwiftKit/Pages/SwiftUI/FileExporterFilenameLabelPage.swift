import SwiftUI

// SwiftUI `View/fileExporterFilenameLabel(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/fileexporterfilenamelabel(_:).md
// macOS 14.0+. Renames the label next to the filename text field in NSSavePanel.

struct FileExporterFilenameLabelPage: View {
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
            Text("View/fileExporterFilenameLabel(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("On macOS, configures the fileExporter with a label for the file name field. Replaces the default \"Save As:\" with custom text.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/fileexporterfilenamelabel(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FELSnippet(
            api: ".fileExporterFilenameLabel(\"Project Name:\")",
            code: """
            Button("Export project") { isExporting = true }
                .fileExporter(
                    isPresented: $isExporting,
                    document: project,
                    contentType: .json,
                    defaultFilename: "Untitled"
                ) { result in … }
                .fileExporterFilenameLabel("Project Name:")
            """,
            note: "Renames the label that sits to the LEFT of the filename text field in NSSavePanel."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "LocalizedStringResource form") {
                FELSnippet(
                    api: ".fileExporterFilenameLabel(LocalizedStringResource(\"export.filename.label\"))",
                    code: """
                    .fileExporterFilenameLabel(
                        LocalizedStringResource("export.filename.label")
                    )
                    """,
                    note: "The parameter is LocalizedStringResource — string literals work via implicit conversion; pass an explicit resource for table/bundle control."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileExporterFilenameLabel(_ label: LocalizedStringResource) -> some View")
            }
        }
    }

    private struct FELNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FELNote] = [
        .init(title: "macOS-only and exporter-only.",
              detail: "iOS document pickers don't expose this label. Also doesn't apply to fileImporter or fileMover — only fileExporter has a filename field.",
              symbol: "macwindow"),
        .init(title: "Use to clarify the filename's role.",
              detail: "Default \"Save As:\" is generic. \"Project Name:\", \"Filename:\", \"Export As:\" all clarify what the user is naming.",
              symbol: "textformat"),
        .init(title: "LocalizedStringResource — bring your own strings table.",
              detail: "Pair with a Localizable.strings entry so the label translates with the rest of your UI.",
              symbol: "globe"),
        .init(title: "Pair with .fileDialogConfirmationLabel for full panel control.",
              detail: "Filename label + button label + dialog message together completely re-skin the save panel for your task.",
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

private struct FELSnippet: View {
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
    FileExporterFilenameLabelPage()
        .frame(width: 1100, height: 800)
}
