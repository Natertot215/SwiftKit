import SwiftUI

// SwiftUI `LayoutDirectionBehavior` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/layoutdirectionbehavior.md
// macOS 14.0+. Enum value type — selector for layoutDirectionBehavior modifier.

struct LayoutDirectionBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "LayoutDirectionBehavior",
            docPath: "Documentation/SwiftUI/layout-adjustments/layoutdirectionbehavior.md",
            availability: "macOS 14.0+",
            blurb: """
            An enum that describes what should happen when the layout direction changes. Pass to \
            View/layoutDirectionBehavior(_:) or use as the layoutDirectionBehavior property of a \
            Shape.

            Cases:
            \u{2022} .fixed \u{2014} the view's contents stay in their natural direction regardless of \
              the surrounding layout direction. Suitable for intrinsically directional content \
              (logos, video timelines, text in a specific script).
            \u{2022} .mirrors \u{2014} mirrors horizontally when the layout direction is right-to-left. \
              Equivalent to .mirrors(in: .rightToLeft).
            \u{2022} .mirrors(in: LayoutDirection) \u{2014} parameterized form; mirrors when the \
              surrounding layout direction matches the supplied case.
            """,
            signatures: [
                "enum LayoutDirectionBehavior",
                "case fixed",
                "case mirrors",
                "static func mirrors(in direction: LayoutDirection) -> LayoutDirectionBehavior",
                ".layoutDirectionBehavior(.mirrors(in: .rightToLeft))"
            ],
            notes: [
                "Conforms to Equatable, Hashable, Sendable.",
                "Default for SwiftUI views (no modifier set) is automatic mirroring \u{2014} the framework handles common cases without intervention.",
                "Also exposed as Shape.layoutDirectionBehavior \u{2014} relevant for asymmetric custom shapes that should never flip."
            ]
        )
    }
}

#Preview {
    LayoutDirectionBehaviorDescribePage().frame(width: 900, height: 700)
}
