import SwiftUI

// Describe-track page for Animation Protocols.
// Source: Documentation/SwiftUI/animations/
// macOS 12.0+. These are conformance targets implemented on your own types —
// none render as standalone Views.

struct AnimationProtocolsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Animation Protocols",
            docPath: "Documentation/SwiftUI/animations/",
            availability: "macOS 12.0+",
            blurb: """
            Animatable, CustomAnimation, and VectorArithmetic are the three foundational protocols \
            powering SwiftUI's animation engine. Animatable marks a type whose animatableData property \
            SwiftUI can interpolate between two states — conforming types (like CGPoint, CGRect, or \
            custom geometry structs) expose their interpolatable values through this property. \
            VectorArithmetic defines the scalar-multiplication and addition operations that make \
            interpolation possible across any numeric type — you rarely conform to it directly since \
            Foundation types already conform. CustomAnimation lets you fully replace the built-in curve \
            logic: implement animate(value:time:context:) and return the current interpolated value at \
            each frame, or nil to signal completion. AnimatablePair is the standard way to combine two \
            animatable values into one. None of these are renderable views — they are conformance targets \
            you implement on your own types.
            """,
            signatures: [
                "protocol Animatable — var animatableData: AnimatableData { get set }",
                "protocol VectorArithmetic: AdditiveArithmetic — mutating func scale(by rhs: Double), var magnitudeSquared: Double",
                "protocol CustomAnimation — func animate<V: VectorArithmetic>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V?",
                "AnimatablePair<First, Second> — tuple of two VectorArithmetic values",
                "EmptyAnimatableData — zero-size animatable stub"
            ],
            notes: [
                "To make a custom Shape animatable, conform it to Animatable and implement animatableData.",
                "CustomAnimation was introduced in macOS 14.0 — earlier targets must use Animation directly.",
                "The article 'Controlling the timing and movements of your animations' in the local docs mirror has worked examples."
            ]
        )
    }
}

#Preview {
    AnimationProtocolsDescribePage()
        .frame(width: 900, height: 700)
}
