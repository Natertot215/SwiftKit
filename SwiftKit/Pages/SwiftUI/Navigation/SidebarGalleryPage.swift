import SwiftUI

/// Gallery page scaffold for Sidebar. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct SidebarGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "SidebarCommands", api: nil) { Color.clear }
            VariantTile(name: "SidebarRowSize", api: nil) { Color.clear }
            VariantTile(name: "sectionActions(content:)", api: nil) { Color.clear }
        }
    }
}

extension SidebarGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.sidebar",
        title: "Sidebar",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: ["Sidebar", "SidebarCommands", "SidebarRowSize", "sectionActions"],
        blurb: "Sidebar — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(SidebarGalleryPage()) }
    )
}
