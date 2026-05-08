import SwiftUI

/// Gallery page scaffold for NSGlassEffectView. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NSGlassEffectViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NSGlassEffectView", api: nil) { Color.clear }
            VariantTile(name: "NSGlassEffectView.Style", api: nil) { Color.clear }
            VariantTile(name: "NSGlassEffectContainerView", api: nil) { Color.clear }
        }
    }
}

extension NSGlassEffectViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsGlassEffectView.nsGlassEffectView",
        title: "NSGlassEffectView",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSGlassEffectContainerView", "NSGlassEffectView"],
        blurb: "NSGlassEffectView — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NSGlassEffectViewGalleryPage()) }
    )
}
