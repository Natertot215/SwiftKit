import SwiftUI

// SwiftUI `UnitPoint` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/unitpoint.md
// macOS 10.15+. Normalized 2D point — fractions of a view's size in each axis.

struct UnitPointDescribePage: View {
    var body: some View {
        DescribePage(
            title: "UnitPoint",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/unitpoint.md",
            availability: "macOS 10.15+",
            blurb: """
            A normalized 2D point in a view's coordinate space. Each axis stores \
            a fraction of the view's size measured from its origin — `(0.5, 0.5)` \
            is always the center regardless of the actual rendered dimensions.

            UnitPoint is what SwiftUI uses to talk about positions without \
            committing to pixel measurements:
            \u{2022} Anchor for shape transforms — Shape/rotation(_:anchor:), .scaleEffect anchor.
            \u{2022} Gradient endpoints — LinearGradient(colors:, startPoint:, endPoint:).
            \u{2022} View/gridCellAnchor(_:) for cell alignment within a Grid.
            \u{2022} matchedGeometryEffect anchor parameter.

            Built-in values cover the nine compass positions: .topLeading, .top, \
            .topTrailing, .leading, .center, .trailing, .bottomLeading, .bottom, \
            .bottomTrailing, plus .zero. They mirror the similarly-named \
            Alignment cases.

            Layout direction note: in left-to-right languages the origin is \
            top-left with positive x toward the right; in right-to-left the \
            origin moves to the upper-right and positive x goes left. SwiftUI \
            handles the mirroring automatically — UnitPoint values describe the \
            same intent in either direction.
            """,
            signatures: [
                "@frozen struct UnitPoint: Animatable, Codable, Hashable, Sendable",
                "init(x: CGFloat, y: CGFloat)",
                "static let zero: UnitPoint",
                "static let topLeading, top, topTrailing: UnitPoint",
                "static let leading, center, trailing: UnitPoint",
                "static let bottomLeading, bottom, bottomTrailing: UnitPoint",
                "var x: CGFloat",
                "var y: CGFloat"
            ],
            notes: [
                "Animatable \u{2014} interpolates between unit points (e.g., gradient endpoint anim).",
                "Values outside [0, 1] project to points outside the view \u{2014} legal but unusual.",
                "Mirrors Alignment naming: .topLeading, .center, .bottomTrailing, etc.",
                "Used by .gradient endpoints, .rotationEffect anchor, .scaleEffect anchor, etc.",
                "Codable + Sendable + Hashable \u{2014} safe in @State and persistence.",
                "RTL/LTR layout direction is handled by SwiftUI automatically."
            ]
        )
    }
}

#Preview {
    UnitPointDescribePage().frame(width: 900, height: 700)
}
