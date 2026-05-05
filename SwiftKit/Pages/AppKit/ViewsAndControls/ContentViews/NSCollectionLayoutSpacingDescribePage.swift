import SwiftUI

// Describe-track page for NSCollectionLayoutSpacing.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutspacing.md
// An object describing the space between or around items in a compositional
// layout. Two flavors: fixed and flexible.

struct NSCollectionLayoutSpacingDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutSpacing",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutspacing.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutSpacing is an object that describes both the \
            amount of space between or around items in a compositional \
            layout AND the way that space is calculated.

            Two flavors:

              \u{2022} fixed(_ spacing: CGFloat) — exactly this many points. \
            "200 points between items, period." If extra width is available, \
            it goes to the items, not the gaps.
              \u{2022} flexible(_ spacing: CGFloat) — at LEAST this many \
            points. As more space becomes available, items are re-spaced \
            evenly into the additional space, growing the gap.

            Used as edgeSpacing on NSCollectionLayoutItem (via \
            NSCollectionLayoutEdgeSpacing), as interItemSpacing on \
            NSCollectionLayoutGroup, and elsewhere in the DSL.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutSpacing",
                "static func fixed(_ fixedSpacing: CGFloat) -> NSCollectionLayoutSpacing",
                "static func flexible(_ flexibleSpacing: CGFloat) -> NSCollectionLayoutSpacing",
                "var spacing: CGFloat { get }",
                "var isFlexibleSpacing: Bool { get }"
            ],
            notes: [
                "Doc kind: class. Construct via the static factories — there is no public initializer.",
                "Fixed: extra space goes to the items. Flexible: extra space grows the gap.",
                "Combines with NSCollectionLayoutEdgeSpacing to specify the four-sided edge padding around an item.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page (interGroupSpacing, contentInsets)."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutSpacingDescribePage().frame(width: 900, height: 700)
}
