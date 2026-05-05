import SwiftUI

// SwiftUI `AnyGradient` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/anygradient.md
// macOS 13.0+. Type-erased gradient produced by Color/.gradient.

struct AnyGradientDescribePage: View {
    var body: some View {
        DescribePage(
            title: "AnyGradient",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/anygradient.md",
            availability: "macOS 13.0+",
            blurb: """
            A type-erased gradient. AnyGradient is what you get from Color.gradient and \
            from .gradient on hierarchical / semantic styles — a richer, system-tuned \
            gradient that adapts to context. When used as a ShapeStyle, AnyGradient draws \
            a vertical linear gradient (start [0.5, 0] → end [0.5, 1]).

            You'll most often see AnyGradient through the .gradient extension on Color: \
            .blue.gradient, .accentColor.gradient. Apple uses these to add subtle \
            dimensionality to flat colors throughout system UI.

            AnyGradient has no own visible appearance in isolation — it's consumed by \
            shape fills, foregroundStyle, and backgroundStyle. See Gradient for the value-\
            type representation with explicit color stops.
            """,
            signatures: [
                "Color.accentColor.gradient // returns AnyGradient",
                "shape.fill(.accentColor.gradient)",
                ".foregroundStyle(.blue.gradient)",
                ".backgroundStyle(.purple.gradient)"
            ],
            notes: [
                "Type-erased — the underlying gradient construction is opaque to callers.",
                "As a ShapeStyle, draws a vertical linear gradient (top→bottom by default).",
                "Returned by the .gradient property on Color and several semantic styles."
            ]
        )
    }
}

#Preview {
    AnyGradientDescribePage()
        .frame(width: 900, height: 700)
}
