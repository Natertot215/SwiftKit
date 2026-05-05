import SwiftUI

// SwiftUI `ProjectionTransform` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/projectiontransform.md
// macOS 10.15+. A 3x3 transform that bridges CATransform3D / CGAffineTransform into SwiftUI.

struct ProjectionTransformDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ProjectionTransform",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/projectiontransform.md",
            availability: "macOS 10.15+",
            blurb: """
            A frozen value type representing a 3\u{00d7}3 transform matrix that SwiftUI's \
            projectionEffect(_:) modifier consumes. ProjectionTransform exists primarily as \
            a bridge: you can construct one from a CGAffineTransform (purely 2D) or from a \
            CATransform3D (full 3D, including perspective).

            The matrix coefficients are exposed individually \u{2014} m11, m12, m13, m21, m22, \
            m23, m31, m32, m33 \u{2014} for direct manipulation. The struct also provides \
            inverted() / invert() for in-place inversion, concatenating(_:) for composition, \
            and isAffine / isIdentity for inspection.

            Use ProjectionTransform when you're porting Core Animation matrix code, or when \
            you need finer control than rotation3DEffect / scaleEffect / transformEffect \
            offer. For most cases, those higher-level modifiers are clearer.
            """,
            signatures: [
                "ProjectionTransform()",
                "ProjectionTransform(_ m: CGAffineTransform)",
                "ProjectionTransform(_ m: CATransform3D)",
                "view.projectionEffect(ProjectionTransform(matrix))",
                "transform.inverted() / transform.concatenating(other)",
                "transform.isAffine / transform.isIdentity"
            ],
            notes: [
                "Bridges CGAffineTransform and CATransform3D into SwiftUI's render pipeline.",
                "Coefficients m11\u{2026}m33 are individually addressable for matrix-level control.",
                "Sendable, BitwiseCopyable, Equatable \u{2014} cheap to pass through state.",
                "Higher-level effect modifiers (rotation3DEffect, scaleEffect) are usually clearer than building a ProjectionTransform by hand."
            ]
        )
    }
}

#Preview {
    ProjectionTransformDescribePage()
        .frame(width: 900, height: 700)
}
