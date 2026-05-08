import SwiftUI

/// Gallery page scaffold for Popover. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct PopoverGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "popover(isPresented:attachmentAnchor:arrowEdge:content:)", api: nil) { Color.clear }
            VariantTile(name: "popover(item:attachmentAnchor:arrowEdge:content:)", api: nil) { Color.clear }
            VariantTile(name: "PopoverAttachmentAnchor", api: nil) { Color.clear }
        }
    }
}

extension PopoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.presentation.popover",
        title: "Popover",
        folder: "Presentation",
        framework: .swiftUI,
        absorbedSymbols: ["Popover", "PopoverAttachmentAnchor", "popover"],
        blurb: "Popover — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(PopoverGalleryPage()) }
    )
}
