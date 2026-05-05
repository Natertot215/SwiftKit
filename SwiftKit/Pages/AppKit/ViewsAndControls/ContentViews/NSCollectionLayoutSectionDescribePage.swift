import SwiftUI

// Describe-track page for NSCollectionLayoutSection.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutsection.md
// Combines groups into the third tier of compositional layouts: a section.
// Each section can have its own scroll behavior, content insets, boundary
// supplementary items (headers/footers), and decoration items.

struct NSCollectionLayoutSectionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutSection",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutsection.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutSection is the third tier of the \
            compositional-layout DSL. A compositional layout is composed of \
            one or more sections; each section wraps a single \
            NSCollectionLayoutGroup that defines how that section's items \
            are arranged.

            Per-section configuration:

              \u{2022} contentInsets — padding inside the section.
              \u{2022} interGroupSpacing — vertical (or horizontal, depending \
            on scroll direction) gap between repeated group instances when \
            the group repeats to fill the section.
              \u{2022} boundarySupplementaryItems — array of \
            NSCollectionLayoutBoundarySupplementaryItem for headers and \
            footers attached to the section.
              \u{2022} decorationItems — backgrounds via \
            NSCollectionLayoutDecorationItem.
              \u{2022} orthogonalScrollingBehavior — opt the section into \
            scrolling perpendicular to the layout's main axis (useful for \
            "shelf" rows in App Store-style screens).
              \u{2022} visibleItemsInvalidationHandler — a closure called \
            before each layout cycle, typed \
            NSCollectionLayoutSectionVisibleItemsInvalidationHandler, for \
            custom animations driven by visibility.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutSection",
                "init(group: NSCollectionLayoutGroup)",
                "var contentInsets: NSDirectionalEdgeInsets { get set }",
                "var interGroupSpacing: CGFloat { get set }",
                "var orthogonalScrollingBehavior: NSCollectionLayoutSectionOrthogonalScrollingBehavior",
                "var boundarySupplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]"
            ],
            notes: [
                "Doc kind: class. Each section wraps exactly one root NSCollectionLayoutGroup.",
                "Different sections in the same compositional layout can use entirely different groups — that's the layered freedom compositional layouts provide.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page.",
                "supplementariesFollowContentInsets (Bool) controls whether boundary supplementary items respect the section's contentInsets."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutSectionDescribePage().frame(width: 900, height: 700)
}
