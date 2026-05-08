import SwiftUI

/// Gallery page scaffold for SafeArea. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct SafeAreaGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "ignoresSafeArea(_:edges:)", api: nil) { Color.clear }
            VariantTile(name: "safeAreaInset(edge:alignment:spacing:content:)", api: nil) { Color.clear }
            VariantTile(name: "safeAreaPadding(_:)", api: nil) { Color.clear }
            VariantTile(name: "SafeAreaRegions", api: nil) { Color.clear }
            VariantTile(name: "EdgeInsets", api: nil) { Color.clear }
        }
    }
}

extension SafeAreaGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.safeArea",
        title: "SafeArea",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["SafeArea", "ignoresSafeArea", "safeAreaInset", "safeAreaPadding"],
        blurb: "SafeArea — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(SafeAreaGalleryPage()) }
    )
}
