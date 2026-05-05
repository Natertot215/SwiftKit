import SwiftUI

// Describe-track page for NSCollectionViewCompositionalLayoutConfiguration.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewcompositionallayoutconfiguration.md
// Top-level configuration object for an NSCollectionViewCompositionalLayout —
// scroll direction, inter-section spacing, and global headers/footers.

struct NSCollectionViewCompositionalLayoutConfigurationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewCompositionalLayoutConfiguration",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewcompositionallayoutconfiguration.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionViewCompositionalLayoutConfiguration is the \
            top-level configuration object for a compositional layout. \
            It controls properties that apply to the layout as a whole, \
            independent of any individual section.

            What you configure:

              \u{2022} scrollDirection — .vertical or .horizontal.
              \u{2022} interSectionSpacing — extra space between sections.
              \u{2022} boundarySupplementaryItems — array of \
            NSCollectionLayoutBoundarySupplementaryItem applied to the \
            entire collection view (e.g., a global header that floats \
            above all sections).

            Two ways to apply:

              1. Pass into the compositional-layout initializer:
                 NSCollectionViewCompositionalLayout(\
            section:configuration:) or \
            NSCollectionViewCompositionalLayout(\
            sectionProvider:configuration:).
              2. Set after the fact: \
            layout.configuration = newConfig — this invalidates the layout \
            so the new configuration takes effect on the next layout cycle.
            """,
            signatures: [
                "@MainActor class NSCollectionViewCompositionalLayoutConfiguration",
                "init()",
                "var scrollDirection: NSCollectionView.ScrollDirection",
                "var interSectionSpacing: CGFloat",
                "var boundarySupplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]"
            ],
            notes: [
                "Doc kind: class. Used only with NSCollectionViewCompositionalLayout.",
                "Setting layout.configuration after construction invalidates the layout — no manual invalidateLayout() needed.",
                "Per-section properties (orthogonalScrollingBehavior, contentInsets, decoration items) live on NSCollectionLayoutSection, not here.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page."
            ]
        )
    }
}

#Preview {
    NSCollectionViewCompositionalLayoutConfigurationDescribePage().frame(width: 900, height: 700)
}
