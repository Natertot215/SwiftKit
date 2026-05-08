import SwiftUI

/// Gallery page scaffold for Section. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct SectionGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Section", api: nil) { Color.clear }
            VariantTile(name: "SectionConfiguration", api: nil) { Color.clear }
            VariantTile(name: "SectionCollection", api: nil) { Color.clear }
            VariantTile(name: "ForEachSectionCollection", api: nil) { Color.clear }
            VariantTile(name: "Subview", api: nil) { Color.clear }
            VariantTile(name: "SubviewsCollection", api: nil) { Color.clear }
            VariantTile(name: "SubviewsCollectionSlice", api: nil) { Color.clear }
            VariantTile(name: "Group", api: nil) { Color.clear }
            VariantTile(name: "GroupElementsOfContent", api: nil) { Color.clear }
            VariantTile(name: "GroupSectionsOfContent", api: nil) { Color.clear }
            VariantTile(name: "ContainerValues", api: nil) { Color.clear }
            VariantTile(name: "ContainerValueKey", api: nil) { Color.clear }
            VariantTile(name: "containerValue(_:_:)", api: nil) { Color.clear }
        }
    }
}

extension SectionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.containers.section",
        title: "Section",
        folder: "Containers",
        framework: .swiftUI,
        absorbedSymbols: ["Section", "SectionCollection", "SectionConfiguration"],
        blurb: "Section — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(SectionGalleryPage()) }
    )
}
