import SwiftUI

// Describe-track page for NSCollectionLayoutSectionOrthogonalScrollingBehavior.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutsectionorthogonalscrollingbehavior.md
// Enum that controls per-section orthogonal scrolling. The default (.none)
// makes the section follow the layout's main scroll axis; other cases
// enable scrolling perpendicular to that axis with various paging behaviors.

struct NSCollectionLayoutSectionOrthogonalScrollingBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutSectionOrthogonalScrollingBehavior",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutsectionorthogonalscrollingbehavior.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutSectionOrthogonalScrollingBehavior is the \
            enum assigned to NSCollectionLayoutSection.orthogonalScrolling \
            Behavior. By default a section lays out along the main axis \
            defined by the compositional layout's configuration; setting \
            this property to anything other than .none makes that section \
            scroll perpendicular to the main axis instead.

            Cases:

              \u{2022} none — the section follows the main layout axis (the \
            default).
              \u{2022} continuous — free orthogonal scrolling.
              \u{2022} continuousGroupLeadingBoundary — orthogonal \
            scrolling that snaps the leading edge of a group to the \
            visible bounds.
              \u{2022} paging — orthogonal scrolling that pages in \
            container-width chunks.
              \u{2022} groupPaging — pages by groups instead of by \
            container width.
              \u{2022} groupPagingCentered — group paging with the visible \
            group centered.

            This is how App Store-style "horizontal shelf" rows are \
            built — vertical main axis, with each shelf using \
            .continuousGroupLeadingBoundary or .groupPagingCentered.
            """,
            signatures: [
                "enum NSCollectionLayoutSectionOrthogonalScrollingBehavior",
                "case none, continuous, continuousGroupLeadingBoundary",
                "case paging, groupPaging, groupPagingCentered",
                "section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary"
            ],
            notes: [
                "Doc kind: enum. RawRepresentable and Sendable.",
                "Only meaningful in compositional layouts — orthogonal scrolling is implemented per section.",
                "Conforms to BitwiseCopyable, Hashable, Sendable.",
                "Default is .none — sections follow the layout's main axis."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutSectionOrthogonalScrollingBehaviorDescribePage().frame(width: 900, height: 700)
}
