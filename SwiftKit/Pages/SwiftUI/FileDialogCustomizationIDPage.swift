import SwiftUI

// SwiftUI `View/fileDialogCustomizationID(_:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/filedialogcustomizationid(_:).md
// macOS 14.0+. Persists per-customization-ID settings (current dir, view style, etc.).

struct FileDialogCustomizationIDPage: View {
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
            Text("View/fileDialogCustomizationID(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("On macOS, configures the fileExporter / fileImporter / fileMover to persist and restore the file dialog configuration (current dir, view style, recent places, window size).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/filedialogcustomizationid(_:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FCISnippet(
            api: ".fileDialogCustomizationID(\"image-import\")",
            code: """
            Button("Import image") { isImporting = true }
                .fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.image]
                ) { result in … }
                .fileDialogCustomizationID("image-import")

            Button("Import document") { isImportingDoc = true }
                .fileImporter(
                    isPresented: $isImportingDoc,
                    allowedContentTypes: [.pdf]
                ) { result in … }
                .fileDialogCustomizationID("document-import")
            """,
            note: "Distinct IDs let two file dialogs in the same app remember their own settings independently."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "What gets persisted") {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Per Apple's documentation, the customization ID stores:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("• Current directory")
                    APICallout("• View style (Icons, List, Columns)")
                    APICallout("• Recent places")
                    APICallout("• Expanded window size")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                APICallout("func fileDialogCustomizationID(_ id: String) -> some View")
            }
        }
    }

    private struct FCINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FCINote] = [
        .init(title: "macOS-only.",
              detail: "iOS doesn't expose persistent file-dialog state; the modifier is a no-op there.",
              symbol: "macwindow"),
        .init(title: "Without an ID, every launch starts fresh.",
              detail: "The default behavior is to open the dialog with system defaults. Add a stable ID to give users a per-context experience.",
              symbol: "arrow.counterclockwise"),
        .init(title: "ID overrides .fileDialogDefaultDirectory after first launch.",
              detail: "If you provide both, the customization ID's stored directory wins on subsequent launches. The default directory only applies on the first launch.",
              symbol: "folder"),
        .init(title: "Use distinct IDs for distinct flows.",
              detail: "An app's 'import image' and 'import receipt' flows benefit from different IDs so each remembers its own folder. Reusing the same ID conflates them.",
              symbol: "tag")
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

private struct FCISnippet: View {
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
    FileDialogCustomizationIDPage()
        .frame(width: 1100, height: 800)
}
