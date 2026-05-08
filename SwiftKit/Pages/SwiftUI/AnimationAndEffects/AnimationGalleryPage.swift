import SwiftUI

/// Gallery page scaffold for Animation. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct AnimationGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Animation", api: nil) { Color.clear }
            VariantTile(name: "Spring", api: nil) { Color.clear }
            VariantTile(name: "UnitCurve", api: nil) { Color.clear }
            VariantTile(name: "AnimationContext", api: nil) { Color.clear }
            VariantTile(name: "AnimationState", api: nil) { Color.clear }
            VariantTile(name: "AnimationStateKey", api: nil) { Color.clear }
            VariantTile(name: "AnimationCompletionCriteria", api: nil) { Color.clear }
            VariantTile(name: "AnimatablePair", api: nil) { Color.clear }
            VariantTile(name: "AnimatableValues", api: nil) { Color.clear }
            VariantTile(name: "EmptyAnimatableData", api: nil) { Color.clear }
            VariantTile(name: "Animatable", api: nil) { Color.clear }
            VariantTile(name: "AnimatableModifier", api: nil) { Color.clear }
            VariantTile(name: "VectorArithmetic", api: nil) { Color.clear }
            VariantTile(name: "CustomAnimation", api: nil) { Color.clear }
            VariantTile(name: "Transaction", api: nil) { Color.clear }
            VariantTile(name: "TransactionKey", api: nil) { Color.clear }
            VariantTile(name: "withAnimation(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "withTransaction(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "animation(_:value:)", api: nil) { Color.clear }
            VariantTile(name: "animation(_:body:)", api: nil) { Color.clear }
            VariantTile(name: "transaction(_:)", api: nil) { Color.clear }
            VariantTile(name: "transaction(value:_:)", api: nil) { Color.clear }
            VariantTile(name: "geometryGroup()", api: nil) { Color.clear }
            VariantTile(name: "TimelineView", api: nil) { Color.clear }
            VariantTile(name: "TimelineSchedule", api: nil) { Color.clear }
            VariantTile(name: "TimelineViewDefaultContext", api: nil) { Color.clear }
        }
    }
}

extension AnimationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animationAndEffects.animation",
        title: "Animation",
        folder: "Animation and Effects",
        framework: .swiftUI,
        absorbedSymbols: ["Animation", "Spring", "UnitCurve"],
        blurb: "Animation — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(AnimationGalleryPage()) }
    )
}
