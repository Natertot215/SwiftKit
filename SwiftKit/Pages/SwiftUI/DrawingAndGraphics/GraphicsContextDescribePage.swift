import SwiftUI

// SwiftUI `GraphicsContext` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/graphicscontext.md
// macOS 12.0+. An immediate-mode drawing destination passed by Canvas.

struct GraphicsContextDescribePage: View {
    var body: some View {
        DescribePage(
            title: "GraphicsContext",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/graphicscontext.md",
            availability: "macOS 12.0+",
            blurb: """
            An immediate-mode drawing destination handed to a Canvas's render closure. \
            GraphicsContext exposes 2D drawing primitives — fill, stroke, draw, clip, blend \
            modes, transforms, filters, and resolved Image/Text/View shading. It's a value \
            type with mutating draw operations, so each call mutates the local context state.

            GraphicsContext isn't independently renderable — it's always produced by Canvas \
            (or the closure of related APIs). See the Canvas page for live demos that drive \
            this type's API surface.
            """,
            signatures: [
                "Canvas { context, size in /* draw via context */ }",
                "context.fill(_ path: Path, with shading: GraphicsContext.Shading)",
                "context.stroke(_ path: Path, with shading: GraphicsContext.Shading, lineWidth: CGFloat)",
                "context.draw(_ image: GraphicsContext.ResolvedImage, in rect: CGRect)",
                "context.draw(_ text: GraphicsContext.ResolvedText, at point: CGPoint, anchor: UnitPoint)",
                "context.clip(to path: Path, style: FillStyle, options: GraphicsContext.ClipOptions)",
                "context.addFilter(_ filter: GraphicsContext.Filter)",
                "context.blendMode = .multiply",
                "let resolvedImage = context.resolve(Image(systemName: \"star.fill\"))"
            ],
            notes: [
                "Lives inside Canvas — a free-standing GraphicsContext can't be constructed by user code.",
                "Mutating: blendMode, opacity, transform, environment, addFilter all change state for subsequent draws.",
                "Use context.resolve(_:) to convert SwiftUI Image, Text, or any resolvable view into a drawable form with mutable shading."
            ]
        )
    }
}

#Preview {
    GraphicsContextDescribePage()
        .frame(width: 900, height: 700)
}
