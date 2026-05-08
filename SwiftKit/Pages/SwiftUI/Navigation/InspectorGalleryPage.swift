import SwiftUI

/// Gallery page scaffold for Inspector. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct InspectorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "inspector(isPresented:content:)", api: nil) { Color.clear }
            VariantTile(name: "inspectorColumnWidth(_:)", api: nil) { Color.clear }
            VariantTile(name: "inspectorColumnWidth(min:ideal:max:)", api: nil) { Color.clear }
            VariantTile(name: "InspectorCommands", api: nil) { Color.clear }
        }
    }
}

extension InspectorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.inspector",
        title: "Inspector",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: ["Inspector", "inspector", "inspectorColumnWidth"],
        blurb: "Inspector — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(InspectorGalleryPage()) }
    )
}
