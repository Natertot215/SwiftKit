import SwiftUI

// SwiftUI `ShadowStyle` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/shadowstyle.md
// macOS 13.0+. Drop and inner shadow style values consumed by ShapeStyle/shadow.

struct ShadowStyleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ShadowStyle",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/shadowstyle.md",
            availability: "macOS 13.0+",
            blurb: """
            A style describing how to render a shadow. ShadowStyle is a value type with two \
            cases — drop (an outer shadow) and inner (an inset shadow) — each parameterized \
            by color, radius, and x/y offsets.

            ShadowStyle is consumed by ShapeStyle/shadow(_:), letting you compose shadows \
            into any ShapeStyle without using the standalone .shadow(...) view modifier. \
            That's how you get shadows that travel with a fill (a gradient with a built-in \
            inner shadow, for example).

            ShadowStyle isn't a renderable view on its own — it's a configuration value. \
            See View/shadow(color:radius:x:y:) for the simpler view-modifier shadow API.
            """,
            signatures: [
                "ShadowStyle.drop(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)",
                "ShadowStyle.inner(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat)",
                ".foregroundStyle(.blue.shadow(.drop(radius: 4, y: 2)))",
                ".foregroundStyle(.accentColor.shadow(.inner(color: .black.opacity(0.4), radius: 3)))"
            ],
            notes: [
                "Two cases — drop (outer) and inner (inset). Apply via ShapeStyle.shadow(_:) for fills, or use View/shadow(_:) for outer view shadows.",
                "Composes with any ShapeStyle: chain .shadow(.drop(...)) on a Color, Gradient, or Material.",
                "Not a view — ShadowStyle is a value passed into ShapeStyle.shadow(_:)."
            ]
        )
    }
}

#Preview {
    ShadowStyleDescribePage()
        .frame(width: 900, height: 700)
}
