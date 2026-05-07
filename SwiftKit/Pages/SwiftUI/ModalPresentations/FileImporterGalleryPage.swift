import SwiftUI

// SwiftUI fileImporter reference page — bundles all three overloads:
// • View/fileImporter(isPresented:allowedContentTypes:onCompletion:)
// • View/fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)
// • View/fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:onCancellation:)
// Source: Documentation/SwiftUI/modal-presentations/fileimporter(*).md
// macOS 11.0+. Demos use a non-opening Bool toggle to avoid interrupting the user.

private let demoFrameWidth: CGFloat = 480

struct FileImporterGalleryPage: View {
    @State private var isShowing = false

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
            Text("View/fileImporter(…) — three overloads")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a system open panel for importing files. macOS shows NSOpenPanel; iOS shows the document picker. Single, multi-select, and multi-select+cancellation forms.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/fileimporter(*).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".fileImporter(isPresented: $isShowing, allowedContentTypes: [.image]) { result in … }") {
            HStack(spacing: 12) {
                Button("Toggle importer flag") { isShowing.toggle() }
                    .buttonStyle(.borderedProminent)
                Text("isShowing = \(String(describing: isShowing))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            Text("Demo trigger only flips the flag; it does NOT open the system open panel (which would interrupt the gallery). See snippets below for production form.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "1. Single file — fileImporter(isPresented:allowedContentTypes:onCompletion:)") {
                FISnippet(
                    api: "fileImporter(isPresented:allowedContentTypes:onCompletion:)",
                    code: """
                    .fileImporter(
                        isPresented: $isImporting,
                        allowedContentTypes: [.image]
                    ) { result in
                        switch result {
                        case .success(let url):
                            let didStart = url.startAccessingSecurityScopedResource()
                            defer {
                                if didStart { url.stopAccessingSecurityScopedResource() }
                            }
                            // Read the file…
                        case .failure(let error):
                            print("Import failed: \\(error)")
                        }
                    }
                    """,
                    note: "URLs are security-scoped — call startAccessingSecurityScopedResource() before reading."
                )
            }

            VariantBlock(title: "2. Multi-select — allowsMultipleSelection") {
                FISnippet(
                    api: "fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)",
                    code: """
                    .fileImporter(
                        isPresented: $isImporting,
                        allowedContentTypes: [.image, .pdf],
                        allowsMultipleSelection: true
                    ) { result in
                        switch result {
                        case .success(let urls):
                            for url in urls { /* read each */ }
                        case .failure(let error):
                            print("Import failed: \\(error)")
                        }
                    }
                    """,
                    note: "When allowsMultipleSelection is true, the closure receives [URL]."
                )
            }

            VariantBlock(title: "3. Multi-select + onCancellation") {
                FISnippet(
                    api: "fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:onCancellation:)",
                    code: """
                    .fileImporter(
                        isPresented: $isImporting,
                        allowedContentTypes: [.image],
                        allowsMultipleSelection: false,
                        onCompletion: { result in … },
                        onCancellation: { print("User cancelled") }
                    )
                    """,
                    note: "onCancellation runs when the user dismisses the picker without choosing a file."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Cancellation contract") {
                Text("If the user cancels, isPresented is set back to false but onCompletion is NOT called. To react to cancellation, use the third overload (which adds onCancellation).")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct FINote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FINote] = [
        .init(title: "URLs are security-scoped resources.",
              detail: "Both macOS sandbox and iOS return URLs that require explicit start/stop accessing. Wrap reads in startAccessingSecurityScopedResource() / stopAccessingSecurityScopedResource().",
              symbol: "lock.shield"),
        .init(title: "allowedContentTypes filters the picker.",
              detail: "Pass UTType values from UniformTypeIdentifiers (.image, .pdf, .json, etc., or your own UTType.exportedAs declarations).",
              symbol: "line.3.horizontal.decrease.circle"),
        .init(title: "Single vs multi — different Result type.",
              detail: "allowsMultipleSelection: false → Result<URL, Error>. allowsMultipleSelection: true → Result<[URL], Error>. Note that overload 1 (no allowsMultipleSelection parameter) is single-select.",
              symbol: "1.circle"),
        .init(title: "Use bookmarks for persistent access.",
              detail: "If you need to re-open the file in a future launch, store an NSURL bookmark (URL.bookmarkData()), not the URL itself.",
              symbol: "bookmark")
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

private struct FISnippet: View {
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

extension FileImporterGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.fileDialogs",
        title: "File dialogs",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "FileDialogBrowserOptions",
            "View/fileDialogBrowserOptions(_:)",
            "View/fileDialogConfirmationLabel(_:)",
            "View/fileDialogCustomizationID(_:)",
            "View/fileDialogDefaultDirectory(_:)",
            "View/fileDialogImportsUnresolvedAliases(_:)",
            "View/fileDialogMessage(_:)",
            "View/fileDialogURLEnabled(_:)",
            "View/fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)",
            "View/fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)",
            "View/fileExporter(isPresented:documents:contentType:onCompletion:)",
            "View/fileExporter(isPresented:documents:contentTypes:onCompletion:onCancellation:)",
            "View/fileExporter(isPresented:item:contentTypes:defaultFilename:onCompletion:onCancellation:)",
            "View/fileExporter(isPresented:items:contentTypes:onCompletion:onCancellation:)",
            "View/fileExporterFilenameLabel(_:)",
            "View/fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)",
            "View/fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:onCancellation:)",
            "View/fileImporter(isPresented:allowedContentTypes:onCompletion:)",
            "View/fileMover(isPresented:file:onCompletion:)",
            "View/fileMover(isPresented:file:onCompletion:onCancellation:)",
            "View/fileMover(isPresented:files:onCompletion:)",
            "View/fileMover(isPresented:files:onCompletion:onCancellation:)"
        ],
        blurb: "SwiftUI's file-dialog API surface — three trigger modifiers (fileImporter, fileExporter, fileMover) plus the fileDialog* customization modifiers that tailor the open/save panels they present.",
        signature: "fileImporter · fileExporter · fileMover · fileDialog* customization modifiers",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/fileimporter(ispresented:allowedcontenttypes:oncompletion:).md",
        page: { AnyView(FileImporterGalleryPage()) }
    )
}

#Preview {
    FileImporterGalleryPage()
        .frame(width: 1100, height: 800)
}
