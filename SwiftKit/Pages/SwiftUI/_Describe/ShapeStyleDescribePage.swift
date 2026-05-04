import SwiftUI

// Describe-track page for ShapeStyle.
// Source: Documentation/SwiftUI/drawing-and-graphics/shapestyle.md
// macOS 11.0+. Protocol — conformance target, not a renderable view.

struct ShapeStyleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ShapeStyle",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/shapestyle.md",
            availability: "macOS 11.0+",
            blurb: """
            ShapeStyle is the protocol that unifies everything you can use as a fill or stroke on a \
            SwiftUI Shape or as a foreground/background style on a view. Conforming types include: Color, \
            LinearGradient, RadialGradient, AngularGradient, EllipticalGradient, ImagePaint, Material \
            (.ultraThinMaterial, etc.), HierarchicalShapeStyle (.primary, .secondary, .tertiary, \
            .quaternary), and semantic values like .foreground, .background, .tint, .fill, .separator, \
            .placeholder. You call .fill(style:) or .stroke(style:) on a Shape, or .foregroundStyle(_:) \
            / .background(_:) on any view.

            AnyShapeStyle is a type-erased wrapper for when you need to store or pass a ShapeStyle value \
            without knowing its concrete type. ShapeStyle itself is a conformance target — you conform \
            your own types to it by implementing func resolve(in environment: EnvironmentValues) -> some ShapeStyle.
            """,
            signatures: [
                "protocol ShapeStyle — conformance target for fill/stroke values",
                "Color.red — Color conforms to ShapeStyle",
                "LinearGradient(…) — LinearGradient conforms to ShapeStyle",
                ".foreground, .background, .tint — semantic ShapeStyle values",
                "HierarchicalShapeStyle — .primary, .secondary, .tertiary, .quaternary",
                "AnyShapeStyle(someStyle) — type-erased wrapper",
                ".fill(myStyle) on Shape — applies a ShapeStyle as fill"
            ],
            notes: [
                "ShapeStyle is a protocol — never instantiate it directly.",
                "Semantic styles like .tint, .background, .foreground resolve against the environment.",
                "To create a custom ShapeStyle, implement resolve(in:) returning any concrete ShapeStyle."
            ]
        )
    }
}

#Preview {
    ShapeStyleDescribePage()
        .frame(width: 900, height: 700)
}
