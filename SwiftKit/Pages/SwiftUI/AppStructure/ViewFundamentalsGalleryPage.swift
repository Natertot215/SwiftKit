import SwiftUI

/// Gallery page scaffold for View Fundamentals. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ViewFundamentalsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "AnyView", api: nil) { Color.clear }
            VariantTile(name: "EmptyView", api: nil) { Color.clear }
            VariantTile(name: "View", api: nil) { Color.clear }
            VariantTile(name: "ViewModifier", api: nil) { Color.clear }
            VariantTile(name: "ViewBuilder", api: nil) { Color.clear }
        }
    }
}

extension ViewFundamentalsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.viewFundamentals",
        title: "View Fundamentals",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["AnyView", "EmptyView", "View", "ViewFundamentals"],
        blurb: "View Fundamentals — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ViewFundamentalsGalleryPage()) }
    )
}
