import SwiftUI

// SwiftUI `ContentMarginPlacement` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/contentmarginplacement.md
// macOS 14.0+. Value type — selects which part of a scroll container receives margins.

struct ContentMarginPlacementDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ContentMarginPlacement",
            docPath: "Documentation/SwiftUI/layout-adjustments/contentmarginplacement.md",
            availability: "macOS 14.0+",
            blurb: """
            A value type that selects which logical region of a scrollable view receives the \
            content margins set by View/contentMargins(_:for:) or View/contentMargins(_:_:for:).

            Built-in placements:
            \u{2022} .automatic \u{2014} let SwiftUI decide which regions get the margin based on the container.
            \u{2022} .scrollContent \u{2014} the scrollable content area itself; indicators are not insetted.
            \u{2022} .scrollIndicators \u{2014} the scroll indicator track, leaving content flush with the container edges.

            Use .scrollContent + .scrollIndicators in two separate contentMargins calls to inset \
            each region independently \u{2014} a common pattern when content needs breathing room \
            but indicators should stay near the trailing edge.
            """,
            signatures: [
                "struct ContentMarginPlacement",
                "static let automatic: ContentMarginPlacement",
                "static let scrollContent: ContentMarginPlacement",
                "static let scrollIndicators: ContentMarginPlacement",
                ".contentMargins(24, for: .scrollContent)"
            ],
            notes: [
                "Pass to either contentMargins overload via the for: parameter.",
                "On macOS 14+, scroll containers respect both placements. Pre-14 used per-modifier padding which inset both content and indicators together.",
                "Multiple contentMargins calls with different placements stack rather than override."
            ]
        )
    }
}

#Preview {
    ContentMarginPlacementDescribePage().frame(width: 900, height: 700)
}
