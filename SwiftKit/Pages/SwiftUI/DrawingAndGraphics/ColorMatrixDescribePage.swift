import SwiftUI

// SwiftUI `ColorMatrix` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/colormatrix.md
// macOS 12.0+. A 4x5 matrix used in RGBA color transformations.

struct ColorMatrixDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ColorMatrix",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/colormatrix.md",
            availability: "macOS 12.0+",
            blurb: """
            A frozen value type representing a 4\u{00d7}5 matrix used in RGBA color \
            transformations. ColorMatrix has 5 columns (each with r, g, b, a components) \
            \u{2014} the first four columns multiply the input RGBA, and the fifth column \
            is an additive bias. The default-init() returns the identity matrix.

            ColorMatrix is the building block for arbitrary per-pixel color transforms. \
            Pass one to GraphicsContext/Filter/colorMatrix(_:) when building a Canvas \
            filter, or feed one through a custom Metal Shader for visualEffect-driven \
            color grading.

            Most common color adjustments \u{2014} brightness, contrast, saturation, \
            grayscale \u{2014} have higher-level View modifiers (View/brightness, \
            View/contrast, View/saturation, View/grayscale). Reach for ColorMatrix when \
            you need a transform those don't cover (custom channel mixing, hue rotation \
            beyond what hueRotation offers, sepia tone, etc.).
            """,
            signatures: [
                "ColorMatrix() // identity",
                "var matrix = ColorMatrix(); matrix.r1 = 0.5; matrix.g2 = 0.5; matrix.b3 = 0.5",
                "graphicsContext.addFilter(.colorMatrix(matrix))",
                "// columns: r1\u{2026}a1 (R out), r2\u{2026}a2 (G out), r3\u{2026}a3 (B out), r4\u{2026}a4 (A out), r5\u{2026}a5 (bias)"
            ],
            notes: [
                "5 columns, 4 rows \u{2014} 20 individually addressable coefficients (r1\u{2026}a5).",
                "The fifth column is an additive constant offset, not a multiplier.",
                "Use ColorMatrix inside GraphicsContext for Canvas-rendered effects.",
                "BitwiseCopyable / Equatable / Sendable \u{2014} cheap to thread through state.",
                "Prefer the high-level color modifiers (brightness, contrast, saturation, grayscale, hueRotation) when they cover your need."
            ]
        )
    }
}

#Preview {
    ColorMatrixDescribePage()
        .frame(width: 900, height: 700)
}
