import SwiftUI

// Describe-track page for NSCollectionLayoutGroup.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutgroup.md
// A container that arranges a set of items along a path — horizontal,
// vertical, or custom. Inherits NSCollectionLayoutItem so groups can nest
// inside other groups.

struct NSCollectionLayoutGroupDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutGroup",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutgroup.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutGroup is a container for a set of items that \
            lays them out along a path. It's the second tier of the \
            compositional-layout DSL: items become groups, groups become \
            sections, sections become a compositional layout.

            Three built-in arrangements:

              \u{2022} horizontal(layoutSize:subitems:) — items flow left to \
            right inside the group's frame.
              \u{2022} vertical(layoutSize:subitems:) — items flow top to \
            bottom.
              \u{2022} custom(layoutSize:itemProvider:) — you provide a \
            closure (NSCollectionLayoutGroupCustomItemProvider) that returns \
            an array of NSCollectionLayoutGroupCustomItem with explicit \
            frames, for radial / diagonal / non-axial arrangements.

            Each group has its own NSCollectionLayoutSize. Because \
            NSCollectionLayoutGroup inherits NSCollectionLayoutItem, a \
            group can be used as an item inside a parent group — enabling \
            nested layouts (e.g., a vertical group whose subitems are \
            horizontal groups).
            """,
            signatures: [
                "class NSCollectionLayoutGroup : NSCollectionLayoutItem",
                "static func horizontal(layoutSize:subitems:) -> NSCollectionLayoutGroup",
                "static func vertical(layoutSize:subitems:) -> NSCollectionLayoutGroup",
                "static func custom(layoutSize:itemProvider:) -> NSCollectionLayoutGroup"
            ],
            notes: [
                "Doc kind: class. Inherits NSCollectionLayoutItem so groups are themselves valid item-tier subitems.",
                "Two repetition modes for horizontal / vertical: by `count` (fixed number of items) or by `subitems` (cycle through the array).",
                "Demoed in context on the NSCollectionViewCompositionalLayout page (NSCollectionLayoutGroup.horizontal call).",
                "interItemSpacing: NSCollectionLayoutSpacing? — applied between subitems within the group."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutGroupDescribePage().frame(width: 900, height: 700)
}
