import SwiftUI

/// Gallery page scaffold for MatchedGeometry. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct MatchedGeometryGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "matchedGeometryEffect(id:in:properties:anchor:isSource:)", api: nil) { Color.clear }
            VariantTile(name: "matchedTransitionSource(id:in:)", api: nil) { Color.clear }
            VariantTile(name: "matchedTransitionSource(id:in:configuration:)", api: nil) { Color.clear }
            VariantTile(name: "MatchedGeometryProperties", api: nil) { Color.clear }
            VariantTile(name: "MatchedTransitionSourceConfiguration", api: nil) { Color.clear }
            VariantTile(name: "EmptyMatchedTransitionSourceConfiguration", api: nil) { Color.clear }
            VariantTile(name: "Namespace", api: nil) { Color.clear }
            VariantTile(name: "KeyframeAnimator", api: nil) { Color.clear }
            VariantTile(name: "PhaseAnimator", api: nil) { Color.clear }
            VariantTile(name: "KeyframeTimeline", api: nil) { Color.clear }
            VariantTile(name: "KeyframeTrack", api: nil) { Color.clear }
            VariantTile(name: "KeyframeTrackContentBuilder", api: nil) { Color.clear }
            VariantTile(name: "KeyframesBuilder", api: nil) { Color.clear }
            VariantTile(name: "CubicKeyframe", api: nil) { Color.clear }
            VariantTile(name: "LinearKeyframe", api: nil) { Color.clear }
            VariantTile(name: "MoveKeyframe", api: nil) { Color.clear }
            VariantTile(name: "SpringKeyframe", api: nil) { Color.clear }
            VariantTile(name: "KeyframeTrackContent", api: nil) { Color.clear }
            VariantTile(name: "Keyframes", api: nil) { Color.clear }
            VariantTile(name: "keyframeAnimator(initialValue:repeating:content:keyframes:)", api: nil) { Color.clear }
            VariantTile(name: "phaseAnimator(_:content:animation:)", api: nil) { Color.clear }
        }
    }
}

extension MatchedGeometryGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animationAndEffects.matchedGeometry",
        title: "MatchedGeometry",
        folder: "Animation and Effects",
        framework: .swiftUI,
        absorbedSymbols: ["MatchedGeometry", "matchedGeometryEffect", "matchedTransitionSource"],
        blurb: "MatchedGeometry — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(MatchedGeometryGalleryPage()) }
    )
}
