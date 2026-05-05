import SwiftUI

// Describe-track page for NSCollectionLayoutEdgeSpacing.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutedgespacing.md
// Four-sided edge spacing applied around an item — leading, top, trailing,
// bottom. Each side is an optional NSCollectionLayoutSpacing (fixed or
// flexible) so any subset of edges can be padded independently.

struct NSCollectionLayoutEdgeSpacingDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutEdgeSpacing",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutedgespacing.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutEdgeSpacing applies space around the four \
            edges of an item to adjust the item's position relative to its \
            container and other items.

            Each edge — leading, top, trailing, bottom — takes an optional \
            NSCollectionLayoutSpacing (fixed or flexible). Pass nil for any \
            edge that should use its default. The leading and trailing \
            edges flip in right-to-left environments so the spacing is \
            written from the user's reading direction.

                let spacing = NSCollectionLayoutEdgeSpacing(
                    leading: .fixed(8),
                    top: nil,
                    trailing: .flexible(8),
                    bottom: nil)

            Assigned to NSCollectionLayoutItem.edgeSpacing.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutEdgeSpacing",
                "init(leading: NSCollectionLayoutSpacing?, top: NSCollectionLayoutSpacing?, trailing: NSCollectionLayoutSpacing?, bottom: NSCollectionLayoutSpacing?)",
                "var leading: NSCollectionLayoutSpacing? { get }",
                "var top: NSCollectionLayoutSpacing? { get }",
                "var trailing: NSCollectionLayoutSpacing? { get }",
                "var bottom: NSCollectionLayoutSpacing? { get }"
            ],
            notes: [
                "Doc kind: class. Each edge value is an optional NSCollectionLayoutSpacing (fixed or flexible) — pass nil for the default.",
                "Leading / trailing flip in right-to-left environments — supports localized layouts automatically.",
                "Distinct from NSCollectionLayoutItem.contentInsets, which insets the item's *content* relative to its frame. EdgeSpacing inserts space *outside* the item.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutEdgeSpacingDescribePage().frame(width: 900, height: 700)
}
