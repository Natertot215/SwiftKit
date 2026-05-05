import SwiftUI

// Describe-track page for NSCollectionViewLayout.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewlayout.md
// The abstract base class for every collection view layout. You don't
// instantiate it directly — you subclass it (or use one of the built-in
// concrete subclasses: Flow, Grid, Compositional, Transition).

struct NSCollectionViewLayoutDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewLayout",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewlayout.md",
            availability: "macOS 10.11+",
            blurb: """
            NSCollectionViewLayout is the abstract base class for every \
            layout assigned to an NSCollectionView. Layout objects compute \
            the placement and appearance of items, supplementary views, \
            decoration views, and inter-item gaps; the collection view \
            then creates the views and applies the computed \
            NSCollectionViewLayoutAttributes.

            You don't instantiate NSCollectionViewLayout directly — pick a \
            concrete subclass:

              \u{2022} NSCollectionViewFlowLayout — line/column flow with \
            optional headers and footers.
              \u{2022} NSCollectionViewGridLayout — fixed grid (legacy look).
              \u{2022} NSCollectionViewCompositionalLayout — composable \
            sections built from NSCollectionLayoutItem / Group / Section.
              \u{2022} NSCollectionViewTransitionLayout — interpolation \
            between two layouts during an interactive transition.
              \u{2022} A custom subclass — for radial / diagonal / non-axial \
            layouts.

            When subclassing, override the four-way invalidation contract \
            (prepare, layoutAttributesForElements(in:), \
            layoutAttributesForItem(at:), invalidateLayout(with:)) and \
            the contentSize machinery (collectionViewContentSize).
            """,
            signatures: [
                "@MainActor class NSCollectionViewLayout : NSObject",
                "func prepare()",
                "var collectionViewContentSize: NSSize { get }",
                "func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes]",
                "func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes?",
                "func invalidateLayout(with context: NSCollectionViewLayoutInvalidationContext)"
            ],
            notes: [
                "Doc kind: class (abstract). Don't instantiate — subclass or use one of the four concrete layouts.",
                "Layout objects produce attributes; they don't own the views. The collection view + data source do that.",
                "Reach for compositional first for new code — it covers the cases that previously needed custom subclasses.",
                "Custom layouts override prepare(), collectionViewContentSize, layoutAttributesForElements(in:), and layoutAttributesForItem(at:)."
            ]
        )
    }
}

#Preview {
    NSCollectionViewLayoutDescribePage().frame(width: 900, height: 700)
}
