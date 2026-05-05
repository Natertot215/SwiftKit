import SwiftUI

// SwiftUI `VisualEffect` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/visualeffect.md
// macOS 14.0+. Protocol for effects that don't impact layout.

struct VisualEffectDescribePage: View {
    var body: some View {
        DescribePage(
            title: "VisualEffect",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/visualeffect.md",
            availability: "macOS 14.0+",
            blurb: """
            Marker protocol for visual effects that change a view's appearance without \
            affecting ancestors or descendants. VisualEffect inherits Sendable + \
            Animatable, so values flow safely across actors and animate naturally.

            You don't conform to VisualEffect yourself. Instead, the closure passed to \
            View/visualEffect(_:) (or visualEffect3D(_:)) receives an \
            EmptyVisualEffect placeholder; you call modifier methods on it (.offset, \
            .scaleEffect, .blur, .brightness, .colorEffect, .blendMode, etc.) and \
            return the resulting VisualEffect value.

            Because effects don't impact layout, they're safe to drive from \
            GeometryProxy in a scroll context \u{2014} no layout invalidation per frame.

            Conforming types: EmptyVisualEffect, ModifiedContent (the wrapper produced \
            by chaining modifier methods).
            """,
            signatures: [
                "protocol VisualEffect : Sendable, Animatable",
                "view.visualEffect { content, proxy in content.offset(y: proxy.frame(in: .global).origin.y) }",
                "view.visualEffect { content, _ in content.scaleEffect(1.1).blur(radius: 4) }"
            ],
            notes: [
                "You can't conform yourself \u{2014} construct values via modifier chains on EmptyVisualEffect.",
                "Inherits Animatable, so chained values interpolate inside withAnimation.",
                "Effects are layout-safe \u{2014} they don't reflow ancestors or descendants.",
                "Available modifier methods include .offset, .scaleEffect, .rotationEffect, .rotation3DEffect, .blur, .brightness, .contrast, .saturation, .grayscale, .hueRotation, .opacity, .colorEffect, .distortionEffect, .layerEffect, .blendMode, .transformEffect, .transform3DEffect."
            ]
        )
    }
}

#Preview {
    VisualEffectDescribePage()
        .frame(width: 900, height: 700)
}
