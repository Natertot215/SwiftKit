import SwiftUI

// CustomAnimation family — protocol surface for authoring bespoke timing curves.
// CustomAnimation has no built-in renderable; document the protocol shape and
// show two stock animations the system synthesizes from custom curves.

struct CustomAnimationGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demo — Animation values that exercise the system's curve plumbing

            AnimationDemoTile(
                name: "Animation.timingCurve(_:_:_:_:duration:)",
                api: ".animation(.timingCurve(0.2, 0.0, 0.0, 1.0, duration: 0.5), value:)",
                animation: .timingCurve(0.2, 0.0, 0.0, 1.0, duration: 0.5)
            )

            AnimationDemoTile(
                name: "Animation.interpolatingSpring",
                api: ".animation(.interpolatingSpring(stiffness: 180, damping: 14), value:)",
                animation: .interpolatingSpring(stiffness: 180, damping: 14)
            )

            // MARK: Reference

            ReferenceTile(
                name: "CustomAnimation",
                signature: "@preconcurrency protocol CustomAnimation : Hashable, Sendable",
                note: "Implement to drive a fully custom animation curve. Required: animate(value:time:context:) returning the interpolated value, with optional velocity(value:time:context:) and shouldMerge(previous:value:time:context:)."
            )

            ReferenceTile(
                name: "AnimationContext",
                signature: "struct AnimationContext<Value> where Value : VectorArithmetic",
                note: "Per-animation scratchpad passed into CustomAnimation methods. Carries `state` (an AnimationState bag) and `environment` so the curve can store per-frame data across `animate(...)` calls."
            )

            ReferenceTile(
                name: "AnimationState<Value>",
                signature: "struct AnimationState<Value> where Value : VectorArithmetic",
                note: "Type-erased keyed storage attached to the AnimationContext. Read/write via subscript by AnimationStateKey — this is how a CustomAnimation persists state between frames."
            )

            ReferenceTile(
                name: "AnimationStateKey",
                signature: "protocol AnimationStateKey",
                note: "Static-property-based key into AnimationState (mirrors EnvironmentKey). Provide `defaultValue` so reads succeed before any write."
            )

            ReferenceTile(
                name: "Animation(_:)",
                signature: "init<A: CustomAnimation>(_ animation: A)",
                note: "Wraps a CustomAnimation conformer in the type-erased Animation value used by .animation(_:value:) and withAnimation(_:_:)."
            )
        }
    }
}

extension CustomAnimationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.customAnimation",
        title: "CustomAnimation",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.animations.customanimation",
            "AnimationContext",
            "AnimationState",
            "AnimationStateKey"
        ],
        blurb: "A type that defines how an animatable value changes over time. Implement CustomAnimation to drive bespoke timing, interpolation, or per-frame state, with AnimationContext and AnimationState carrying the cross-frame storage.",
        signature: "@preconcurrency protocol CustomAnimation : Hashable, Sendable",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/customanimation.md",
        page: { AnyView(CustomAnimationGalleryPage()) }
    )
}

#Preview {
    CustomAnimationGalleryPage()
        .frame(width: 900, height: 700)
}
