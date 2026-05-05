import SwiftUI

// SwiftUI `LayoutDirection` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/layoutdirection.md
// macOS 10.15+. Enum — represents the locale's reading direction.

struct LayoutDirectionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "LayoutDirection",
            docPath: "Documentation/SwiftUI/layout-adjustments/layoutdirection.md",
            availability: "macOS 10.15+",
            blurb: """
            An enum that represents a direction in which content is laid out, derived from the \
            user's locale. Read it from the environment to make custom layout decisions, or write \
            it to override the direction for a subtree.

            Cases:
            \u{2022} .leftToRight \u{2014} content reads left-to-right (English, Spanish, etc.).
            \u{2022} .rightToLeft \u{2014} content reads right-to-left (Arabic, Hebrew).

            Read via @Environment(\\.layoutDirection); write via .environment(\\.layoutDirection, …) \
            on a parent view. SwiftUI's leading/trailing alignments and EdgeInsets automatically \
            track LayoutDirection \u{2014} you rarely need to read it directly unless the layout \
            depends on the actual reading direction (e.g., custom shape geometry).
            """,
            signatures: [
                "enum LayoutDirection",
                "case leftToRight",
                "case rightToLeft",
                "@Environment(\\.layoutDirection) var layoutDirection",
                ".environment(\\.layoutDirection, .rightToLeft)"
            ],
            notes: [
                "Conforms to Equatable, Hashable, CaseIterable, Sendable.",
                "Automatically derived from the user's locale \u{2014} setting it manually is for previews, accessibility tests, or per-view overrides.",
                "Distinct from LayoutDirectionBehavior \u{2014} LayoutDirection is the environment value, LayoutDirectionBehavior controls how a view responds to it."
            ]
        )
    }
}

#Preview {
    LayoutDirectionDescribePage().frame(width: 900, height: 700)
}
