import SwiftUI

/// Gallery page scaffold for GroupBox. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct GroupBoxGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "GroupBox", api: nil) { Color.clear }
            VariantTile(name: "GroupBoxStyle", api: nil) { Color.clear }
            VariantTile(name: "GroupBoxStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "groupBoxStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "ControlGroup", api: nil) { Color.clear }
            VariantTile(name: "ControlGroupStyle", api: nil) { Color.clear }
            VariantTile(name: "ControlGroupStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "controlGroupStyle(_:)", api: nil) { Color.clear }
        }
    }
}

extension GroupBoxGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.containers.groupBox",
        title: "GroupBox",
        folder: "Containers",
        framework: .swiftUI,
        absorbedSymbols: ["GroupBox", "GroupBoxStyle", "GroupBoxStyleConfiguration"],
        blurb: "GroupBox — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(GroupBoxGalleryPage()) }
    )
}
