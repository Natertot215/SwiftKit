import SwiftUI
import UniformTypeIdentifiers

// SwiftUI fileExporter reference page — bundles all six overloads:
// • View/fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)
// • View/fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)
// • View/fileExporter(isPresented:documents:contentType:onCompletion:)
// • View/fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)
// • View/fileExporter(isPresented:item:contentTypes:defaultFilename:onCompletion:onCancellation:)
// • View/fileExporter(isPresented:items:contentTypes:onCompletion:onCancellation:)
// Source: Documentation/SwiftUI/modal-presentations/fileexporter(*).md
// macOS 11.0+. Demos use a non-opening Bool toggle to avoid interrupting the user with NSSavePanel.

private let demoFrameWidth: CGFloat = 480

struct FileExporterPage: View {
    @State private var isShowing = false
    @State private var lastResult: String = "—"

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
            Text("View/fileExporter(…) — six overloads")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a system save panel for exporting documents. macOS shows NSSavePanel; iOS shows the document picker. Single-document, multi-document, and Transferable-item forms.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/fileexporter(*).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".fileExporter(isPresented: $isShowing, document: doc, contentType: .plainText, defaultFilename: \"Untitled\") { result in … }") {
            HStack(spacing: 12) {
                Button("Toggle exporter flag") { isShowing.toggle() }
                    .buttonStyle(.borderedProminent)
                Text("isShowing = \(String(describing: isShowing))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            Text("Demo trigger only flips the flag; it does NOT open the system save panel (which would interrupt the gallery). See snippets below for production form.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "1. Single document, single contentType — production form") {
                FXSnippet(
                    api: "fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)",
                    code: """
                    .fileExporter(
                        isPresented: $isExporting,
                        document: TextFile(text: editor.text),
                        contentType: .plainText,
                        defaultFilename: "Untitled"
                    ) { result in
                        switch result {
                        case .success(let url): print("Saved to: \\(url.path)")
                        case .failure(let error): print("Failed: \\(error)")
                        }
                    }
                    """,
                    note: "TextFile must conform to FileDocument."
                )
            }

            VariantBlock(title: "2. Single document, multiple contentTypes + onCancellation") {
                FXSnippet(
                    api: "fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)",
                    code: """
                    .fileExporter(
                        isPresented: $isExporting,
                        document: doc,
                        contentTypes: [.plainText, .rtf],
                        defaultFilename: "Untitled",
                        onCompletion: { result in … },
                        onCancellation: { … }
                    )
                    """,
                    note: "User picks the format from the contentTypes set in the save dialog."
                )
            }

            VariantBlock(title: "3. Multiple documents — fileExporter(isPresented:documents:contentType:onCompletion:)") {
                FXSnippet(
                    api: "fileExporter(isPresented:documents:contentType:onCompletion:)",
                    code: """
                    .fileExporter(
                        isPresented: $isExporting,
                        documents: docs,
                        contentType: .plainText
                    ) { result in
                        switch result {
                        case .success(let urls): print("Saved \\(urls.count) files")
                        case .failure(let error): print("Failed: \\(error)")
                        }
                    }
                    """,
                    note: "Multi-document — opens a folder picker; each document is written into the chosen folder."
                )
            }

            VariantBlock(title: "4. Multiple documents + multiple types + onCancellation") {
                FXSnippet(
                    api: "fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)",
                    code: """
                    .fileExporter(
                        isPresented: $isExporting,
                        documents: docs,
                        contentTypes: [.plainText, .rtf],
                        onCompletion: { … },
                        onCancellation: { … }
                    )
                    """,
                    note: "Multi-document + user-chosen format."
                )
            }

            VariantBlock(title: "5 + 6. item / items overloads — Transferable") {
                FXSnippet(
                    api: "fileExporter(isPresented:item: / items: contentTypes:onCompletion:onCancellation:)",
                    code: """
                    // Single Transferable item:
                    .fileExporter(
                        isPresented: $isExporting,
                        item: profile,
                        contentTypes: [.json],
                        defaultFilename: "profile",
                        onCompletion: { … },
                        onCancellation: { … }
                    )

                    // Multiple Transferable items:
                    .fileExporter(
                        isPresented: $isExporting,
                        items: profiles,
                        contentTypes: [.json],
                        onCompletion: { … },
                        onCancellation: { … }
                    )
                    """,
                    note: "Use the item / items overloads for types conforming to Transferable (the modern alternative to FileDocument for arbitrary export shapes)."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two-state contract") {
                Text("For all six overloads: the panel appears only when isPresented is true AND the document/item is non-nil. When the user finishes or cancels, isPresented is set back to false BEFORE onCompletion / onCancellation are called.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Result handling") {
                APICallout("onCompletion: (Result<URL, any Error>) -> Void  // single-doc")
                APICallout("onCompletion: (Result<[URL], any Error>) -> Void  // multi-doc")
                Text("If the user cancels, onCompletion is NOT called — only the flag flips. Use onCancellation (overloads 2, 4, 5, 6) to react to cancellation.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct FENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FENote] = [
        .init(title: "Six overloads — pick by document model.",
              detail: "Single FileDocument vs [FileDocument] vs single Transferable vs [Transferable]. Within each pair, pick the contentType (single) vs contentTypes (user-chosen) variant.",
              symbol: "square.split.2x2"),
        .init(title: "FileDocument is the classic SwiftUI file model.",
              detail: "Conform a value type to FileDocument — provide readableContentTypes, writableContentTypes, and an init(configuration:) + fileWrapper(configuration:). The exporter writes via that protocol.",
              symbol: "doc"),
        .init(title: "Transferable item / items overloads — modern path.",
              detail: "When you don't need the full FileDocument lifecycle (read + write + UndoManager), conform to Transferable instead — simpler for one-shot exports.",
              symbol: "arrow.up.doc"),
        .init(title: "Returned URLs may be security-scoped.",
              detail: "On macOS sandbox + iOS, the URLs you receive in onCompletion may be security-scoped. Call startAccessingSecurityScopedResource() before reading and stopAccessingSecurityScopedResource() when done.",
              symbol: "lock.shield"),
        .init(title: "Customize the panel chrome with the file-dialog modifiers.",
              detail: ".fileDialogConfirmationLabel / .fileDialogDefaultDirectory / .fileDialogMessage / .fileDialogCustomizationID / .fileDialogBrowserOptions / .fileDialogURLEnabled all attach to the same view as fileExporter and tweak the panel.",
              symbol: "slider.horizontal.3")
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

private struct FXSnippet: View {
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
    FileExporterPage()
        .frame(width: 1100, height: 800)
}
