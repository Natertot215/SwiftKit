import SwiftUI

/// Gallery page scaffold for ScrollView. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ScrollViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "ScrollView", api: nil) { Color.clear }
            VariantTile(name: "ScrollViewProxy", api: nil) { Color.clear }
            VariantTile(name: "ScrollViewReader", api: nil) { Color.clear }
            VariantTile(name: "ScrollPosition", api: nil) { Color.clear }
            VariantTile(name: "ScrollGeometry", api: nil) { Color.clear }
            VariantTile(name: "ScrollTarget", api: nil) { Color.clear }
            VariantTile(name: "ScrollTargetBehavior", api: nil) { Color.clear }
            VariantTile(name: "AnyScrollTargetBehavior", api: nil) { Color.clear }
            VariantTile(name: "PagingScrollTargetBehavior", api: nil) { Color.clear }
            VariantTile(name: "ViewAlignedScrollTargetBehavior", api: nil) { Color.clear }
            VariantTile(name: "ScrollTargetBehaviorContext", api: nil) { Color.clear }
            VariantTile(name: "ScrollBounceBehavior", api: nil) { Color.clear }
            VariantTile(name: "ScrollIndicatorVisibility", api: nil) { Color.clear }
            VariantTile(name: "ScrollEdgeEffectStyle", api: nil) { Color.clear }
            VariantTile(name: "ScrollDismissesKeyboardMode", api: nil) { Color.clear }
            VariantTile(name: "ScrollInputBehavior", api: nil) { Color.clear }
            VariantTile(name: "ScrollInputKind", api: nil) { Color.clear }
            VariantTile(name: "ScrollPhase", api: nil) { Color.clear }
            VariantTile(name: "ScrollTransitionPhase", api: nil) { Color.clear }
            VariantTile(name: "ScrollPhaseChangeContext", api: nil) { Color.clear }
            VariantTile(name: "ScrollTransitionConfiguration", api: nil) { Color.clear }
            VariantTile(name: "ScrollContentOffsetAdjustmentBehavior", api: nil) { Color.clear }
            VariantTile(name: "ScrollAnchorRole", api: nil) { Color.clear }
            VariantTile(name: "ScrollTargetBehaviorProperties", api: nil) { Color.clear }
            VariantTile(name: "defaultScrollAnchor(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollBounceBehavior(_:axes:)", api: nil) { Color.clear }
            VariantTile(name: "scrollClipDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollContentBackground(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollIndicators(_:axes:)", api: nil) { Color.clear }
            VariantTile(name: "scrollIndicatorsFlash(onAppear:)", api: nil) { Color.clear }
            VariantTile(name: "scrollIndicatorsFlash(trigger:)", api: nil) { Color.clear }
            VariantTile(name: "scrollPosition(_:anchor:)", api: nil) { Color.clear }
            VariantTile(name: "scrollTargetBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollTargetLayout(isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "scrollTransition(_:axis:transition:)", api: nil) { Color.clear }
            VariantTile(name: "onScrollGeometryChange(for:of:action:)", api: nil) { Color.clear }
            VariantTile(name: "onScrollPhaseChange(_:)", api: nil) { Color.clear }
            VariantTile(name: "scrollEdgeEffectHidden(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "scrollEdgeEffectStyle(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "scrollInputBehavior(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "safeAreaBar(edge:alignment:spacing:content:)", api: nil) { Color.clear }
        }
    }
}

extension ScrollViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.scrollView",
        title: "ScrollView",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["ScrollView", "ScrollViewProxy", "ScrollViewReader"],
        blurb: "ScrollView — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ScrollViewGalleryPage()) }
    )
}
