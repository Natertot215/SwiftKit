import SwiftUI

/// Gallery page scaffold for ConfirmationDialog. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ConfirmationDialogGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "confirmationDialog(_:isPresented:titleVisibility:actions:)", api: nil) { Color.clear }
            VariantTile(name: "confirmationDialog(_:isPresented:titleVisibility:actions:message:)", api: nil) { Color.clear }
            VariantTile(name: "confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)", api: nil) { Color.clear }
        }
    }
}

extension ConfirmationDialogGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.presentation.confirmationDialog",
        title: "ConfirmationDialog",
        folder: "Presentation",
        framework: .swiftUI,
        absorbedSymbols: ["ConfirmationDialog", "confirmationDialog"],
        blurb: "ConfirmationDialog — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ConfirmationDialogGalleryPage()) }
    )
}
