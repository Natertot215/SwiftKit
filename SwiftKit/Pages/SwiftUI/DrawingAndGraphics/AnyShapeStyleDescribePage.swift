import SwiftUI

// SwiftUI `AnyShapeStyle` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/anyshapestyle.md
// macOS 12.0+. Type-erased ShapeStyle.

struct AnyShapeStyleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "AnyShapeStyle",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/anyshapestyle.md",
            availability: "macOS 12.0+",
            blurb: """
            A type-erased ShapeStyle value. AnyShapeStyle wraps any concrete ShapeStyle so \
            heterogeneous styles can flow through the same property, return type, or \
            collection — Color, Gradient, Material, hierarchical (.primary), etc.

            You'll reach for this when storing a ShapeStyle in @State, returning different \
            ShapeStyles from a single function, or threading a style through a generic API \
            that requires a homogeneous type. The wrapped value is opaque: AnyShapeStyle \
            itself conforms to ShapeStyle, so it's a drop-in replacement wherever a \
            ShapeStyle is required.

            AnyShapeStyle has no visible appearance of its own — it renders as whatever it \
            wraps. See View/foregroundStyle and View/background(_:in:) for live examples \
            of consuming a style.
            """,
            signatures: [
                "AnyShapeStyle(_ style: some ShapeStyle)",
                "@State private var fill: AnyShapeStyle = AnyShapeStyle(Color.accentColor)",
                "shape.fill(fill) // accepts any ShapeStyle including AnyShapeStyle",
                "func style(for state: State) -> AnyShapeStyle { /* return Color/Gradient/Material as needed */ }"
            ],
            notes: [
                "Type-erased — useful for storing a ShapeStyle in @State or returning different ShapeStyles from a function.",
                "Conforms to ShapeStyle, so it's a drop-in wherever a ShapeStyle is required.",
                "No own appearance — renders as whatever ShapeStyle it wraps."
            ]
        )
    }
}

#Preview {
    AnyShapeStyleDescribePage()
        .frame(width: 900, height: 700)
}
