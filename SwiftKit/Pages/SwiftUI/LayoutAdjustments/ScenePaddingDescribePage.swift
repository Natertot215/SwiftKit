import SwiftUI

// SwiftUI `ScenePadding` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/scenepadding.md
// macOS 13.0+ (struct itself; cases macOS 13.0+).

struct ScenePaddingDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScenePadding",
            docPath: "Documentation/SwiftUI/layout-adjustments/scenepadding.md",
            availability: "macOS 13.0+",
            blurb: """
            A struct describing the padding amount appropriate for spacing a view from its \
            containing scene. Pass values of this type to View/scenePadding(_:edges:) to align \
            content with the scene's structural metrics rather than picking a literal CGFloat.

            Two cases:
            \u{2022} minimum \u{2014} the smallest scene-appropriate amount. Available on macOS, \
              iOS, watchOS, and tvOS. On macOS this matches the recommended minimum window \
              content margin.
            \u{2022} navigationBar \u{2014} the amount needed to align with the watchOS navigation \
              title bar. UNAVAILABLE on macOS \u{2014} the symbol exists but is marked \
              unavailable; passing it to scenePadding(_:edges:) is a compile-time error.

            For the modifier itself, see View/scenePadding(_:) (Edge.Set only) and \
            View/scenePadding(_:edges:) (ScenePadding + Edge.Set).
            """,
            signatures: [
                "struct ScenePadding",
                "static let minimum: ScenePadding",
                "static let navigationBar: ScenePadding  // unavailable on macOS"
            ],
            notes: [
                "Conforms to Equatable, Sendable, SendableMetatype.",
                "On macOS the resolved amount matches the recommended scene margin; on watchOS it also accounts for curved screen edges.",
                "Pre-macOS 13: not available \u{2014} earlier macOS used the View/scenePadding(_:) modifier (macOS 12+) without the kind parameter."
            ]
        )
    }
}

#Preview {
    ScenePaddingDescribePage().frame(width: 900, height: 700)
}
