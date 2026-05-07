import SwiftUI

struct FileImporterGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
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
        .frame(width: 900, height: 700)
}
