import SwiftUI

// Describe-track page for NSCollectionLayoutBoundarySupplementaryItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutboundarysupplementaryitem.md
// A specialized supplementary item for headers/footers attached to a section
// or to the entire collection view layout.

struct NSCollectionLayoutBoundarySupplementaryItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutBoundarySupplementaryItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutboundarysupplementaryitem.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutBoundarySupplementaryItem is a specialized \
            supplementary item used to attach headers or footers to a \
            section of a compositional layout — or to the entire layout \
            via NSCollectionViewCompositionalLayoutConfiguration.

            Construction takes a layoutSize, an elementKind string, and an \
            alignment (NSRectAlignment) that tells the layout where the \
            header or footer attaches relative to the section / layout:

                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1),
                                      heightDimension: .estimated(44)),
                    elementKind: NSCollectionView.elementKindSectionHeader,
                    alignment: .top)

            Configurable behavior:

              \u{2022} pinToVisibleBounds — keep the supplementary view \
            stuck to the leading edge of the visible region as the section \
            scrolls.
              \u{2022} extendsBoundary — extend the section's boundary to \
            include the supplementary item.
              \u{2022} zIndex — stacking order relative to other elements.
            """,
            signatures: [
                "class NSCollectionLayoutBoundarySupplementaryItem : NSCollectionLayoutSupplementaryItem",
                "init(layoutSize: NSCollectionLayoutSize, elementKind: String, alignment: NSRectAlignment)",
                "init(layoutSize: NSCollectionLayoutSize, elementKind: String, alignment: NSRectAlignment, absoluteOffset: NSPoint)",
                "var pinToVisibleBounds: Bool",
                "var extendsBoundary: Bool"
            ],
            notes: [
                "Doc kind: class. Inherits NSCollectionLayoutSupplementaryItem.",
                "Use unique elementKind strings — convention is to track them in a dedicated enum or struct of constants.",
                "Pin to visible bounds for sticky headers in scrolling lists.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page (the per-section header item)."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutBoundarySupplementaryItemDescribePage().frame(width: 900, height: 700)
}
