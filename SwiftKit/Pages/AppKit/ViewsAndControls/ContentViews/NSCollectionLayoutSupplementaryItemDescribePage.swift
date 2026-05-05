import SwiftUI

// Describe-track page for NSCollectionLayoutSupplementaryItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutsupplementaryitem.md
// Base class for supplementary items that attach to a specific item in a
// compositional layout (badges and similar in-frame decorations). For
// section-wide headers/footers, use NSCollectionLayoutBoundarySupplementaryItem.

struct NSCollectionLayoutSupplementaryItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutSupplementaryItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutsupplementaryitem.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutSupplementaryItem is the base class for \
            supplementary items in a compositional layout. A supplementary \
            item attaches to a specific item via an NSCollectionLayoutAnchor \
            — typically used for badges (a count chip on a corner), labels, \
            or other in-frame decorations that follow the item's index path.

            Construction:

                let badge = NSCollectionLayoutSupplementaryItem(
                    layoutSize: .init(widthDimension: .absolute(20),
                                      heightDimension: .absolute(20)),
                    elementKind: \"badge\",
                    containerAnchor: NSCollectionLayoutAnchor(
                        edges: [.top, .trailing], absoluteOffset: \
                            NSPoint(x: 8, y: -8)))

            Pass an array of these as the supplementaryItems parameter \
            when initializing an NSCollectionLayoutItem so the badge \
            tracks that item's index path.

            For section / layout boundaries (headers, footers), use the \
            specialized subclass NSCollectionLayoutBoundarySupplementaryItem.
            """,
            signatures: [
                "class NSCollectionLayoutSupplementaryItem : NSCollectionLayoutItem",
                "init(layoutSize: NSCollectionLayoutSize, elementKind: String, containerAnchor: NSCollectionLayoutAnchor)",
                "init(layoutSize: NSCollectionLayoutSize, elementKind: String, containerAnchor: NSCollectionLayoutAnchor, itemAnchor: NSCollectionLayoutAnchor)",
                "var elementKind: String { get }",
                "var containerAnchor: NSCollectionLayoutAnchor { get }",
                "var zIndex: Int"
            ],
            notes: [
                "Doc kind: class. Inherits NSCollectionLayoutItem so a supplementary item is sized via NSCollectionLayoutSize like any other item.",
                "Anchored to a specific item via containerAnchor — for section/layout-wide headers/footers, use NSCollectionLayoutBoundarySupplementaryItem instead.",
                "elementKind strings must be unique within the layout — track them in a dedicated constants enum.",
                "Vended by the data source via collectionView(_:viewForSupplementaryElementOfKind:at:) the same as boundary items."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutSupplementaryItemDescribePage().frame(width: 900, height: 700)
}
