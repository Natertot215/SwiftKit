import SwiftUI

// Describe-track page for NSCollectionLayoutItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutitem.md
// The smallest unit in the compositional-layout DSL — a blueprint for sizing,
// spacing, and arranging a single rendered cell. Combined into groups and
// then into sections by NSCollectionViewCompositionalLayout.

struct NSCollectionLayoutItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutitem.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutItem is the most basic component of a \
            compositional collection-view layout — a blueprint for how to \
            size, space, and arrange a single rendered cell. It does NOT \
            describe what's drawn (the data source still vends \
            NSCollectionViewItem instances) — only how that drawn view is \
            positioned within its parent group.

            Each item carries an NSCollectionLayoutSize built from two \
            NSCollectionLayoutDimension values (width, height), expressed \
            as fractional, absolute, or estimated. Items can also carry \
            content insets (NSDirectionalEdgeInsets), edge spacing \
            (NSCollectionLayoutEdgeSpacing), and supplementary items \
            (NSCollectionLayoutSupplementaryItem) for badges or other \
            decorations attached to that specific cell.

            You combine items into NSCollectionLayoutGroup containers; \
            groups go inside NSCollectionLayoutSection; sections become \
            an NSCollectionViewCompositionalLayout.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutItem",
                "init(layoutSize: NSCollectionLayoutSize)",
                "init(layoutSize: NSCollectionLayoutSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])",
                "var contentInsets: NSDirectionalEdgeInsets { get set }",
                "var edgeSpacing: NSCollectionLayoutEdgeSpacing? { get set }"
            ],
            notes: [
                "Doc kind: class. Lives in the compositional-layout DSL alongside Group, Section, Size, Dimension, Spacing.",
                "NSCollectionLayoutGroup is itself a subclass of NSCollectionLayoutItem — every group can be used as an item in a parent group, enabling nested arrangements.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page; this page documents the type itself.",
                "Sized via NSCollectionLayoutSize — fractional / absolute / estimated dimensions."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutItemDescribePage().frame(width: 900, height: 700)
}
