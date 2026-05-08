import SwiftUI

/// Gallery page scaffold for DisclosureGroup. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct DisclosureGroupGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "DisclosureGroup", api: nil) { Color.clear }
            VariantTile(name: "DisclosureGroupStyle", api: nil) { Color.clear }
            VariantTile(name: "disclosureGroupStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "OutlineGroup", api: nil) { Color.clear }
        }
    }
}

extension DisclosureGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.containers.disclosureGroup",
        title: "DisclosureGroup",
        folder: "Containers",
        framework: .swiftUI,
        absorbedSymbols: ["DisclosureGroup", "DisclosureGroupStyle", "disclosureGroupStyle"],
        blurb: "DisclosureGroup — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(DisclosureGroupGalleryPage()) }
    )
}
