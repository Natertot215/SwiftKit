import SwiftUI

/// Gallery page scaffold for Document. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct DocumentGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "DocumentGroup", api: nil) { Color.clear }
            VariantTile(name: "DocumentGroupLaunchScene", api: nil) { Color.clear }
            VariantTile(name: "DocumentLaunchView", api: nil) { Color.clear }
            VariantTile(name: "DocumentLaunchGeometryProxy", api: nil) { Color.clear }
            VariantTile(name: "DefaultDocumentGroupLaunchActions", api: nil) { Color.clear }
            VariantTile(name: "FileDocument", api: nil) { Color.clear }
            VariantTile(name: "ReferenceFileDocument", api: nil) { Color.clear }
            VariantTile(name: "DocumentBaseBox", api: nil) { Color.clear }
            VariantTile(name: "FileDocumentConfiguration", api: nil) { Color.clear }
            VariantTile(name: "ReferenceFileDocumentConfiguration", api: nil) { Color.clear }
            VariantTile(name: "FileDocumentReadConfiguration", api: nil) { Color.clear }
            VariantTile(name: "FileDocumentWriteConfiguration", api: nil) { Color.clear }
            VariantTile(name: "DocumentConfiguration", api: nil) { Color.clear }
            VariantTile(name: "NewDocumentAction", api: nil) { Color.clear }
            VariantTile(name: "OpenDocumentAction", api: nil) { Color.clear }
            VariantTile(name: "RenameAction", api: nil) { Color.clear }
            VariantTile(name: "RenameButton", api: nil) { Color.clear }
            VariantTile(name: "NewDocumentButton", api: nil) { Color.clear }
            VariantTile(name: "renameAction(_:)", api: nil) { Color.clear }
            VariantTile(name: "init(editing:contentType:editor:prepareDocument:)", api: nil) { Color.clear }
            VariantTile(name: "fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)", api: nil) { Color.clear }
            VariantTile(name: "fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)", api: nil) { Color.clear }
            VariantTile(name: "fileMover(isPresented:file:onCompletion:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogDefaultDirectory(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogMessage(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogConfirmationLabel(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogBrowserOptions(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogCustomizationID(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogImportsUnresolvedAliases(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileDialogURLEnabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "fileExporterFilenameLabel(_:)", api: nil) { Color.clear }
            VariantTile(name: "FileDialogBrowserOptions", api: nil) { Color.clear }
            VariantTile(name: "handlesExternalEvents(matching:)", api: nil) { Color.clear }
            VariantTile(name: "exportableToServices(_:)", api: nil) { Color.clear }
            VariantTile(name: "exportsItemProviders(_:onExport:)", api: nil) { Color.clear }
            VariantTile(name: "importableFromServices(for:action:)", api: nil) { Color.clear }
            VariantTile(name: "importsItemProviders(_:onImport:)", api: nil) { Color.clear }
        }
    }
}

extension DocumentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.document",
        title: "Document",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["Document", "DocumentGroup", "DocumentGroupLaunchScene", "DocumentLaunchView"],
        blurb: "Document — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(DocumentGalleryPage()) }
    )
}
