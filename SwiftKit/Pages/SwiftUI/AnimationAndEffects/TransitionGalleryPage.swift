import SwiftUI

/// Gallery page scaffold for Transition. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct TransitionGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "AnyTransition", api: nil) { Color.clear }
            VariantTile(name: "Transition", api: nil) { Color.clear }
            VariantTile(name: "TransitionProperties", api: nil) { Color.clear }
            VariantTile(name: "TransitionPhase", api: nil) { Color.clear }
            VariantTile(name: "AsymmetricTransition", api: nil) { Color.clear }
            VariantTile(name: "ContentTransition", api: nil) { Color.clear }
            VariantTile(name: "transition(_:)", api: nil) { Color.clear }
            VariantTile(name: "contentTransition(_:)", api: nil) { Color.clear }
            VariantTile(name: "navigationTransition(_:)", api: nil) { Color.clear }
            VariantTile(name: "NavigationTransition", api: nil) { Color.clear }
            VariantTile(name: "GlassEffectTransition", api: nil) { Color.clear }
            VariantTile(name: "SymbolEffectTransition", api: nil) { Color.clear }
        }
    }
}

extension TransitionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animationAndEffects.transition",
        title: "Transition",
        folder: "Animation and Effects",
        framework: .swiftUI,
        absorbedSymbols: ["AnyTransition", "Transition", "TransitionProperties"],
        blurb: "Transition — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(TransitionGalleryPage()) }
    )
}
