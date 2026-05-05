import SwiftUI

// Describe-track page for NSCollectionLayoutGroupCustomItemProvider.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutgroupcustomitemprovider.md
// Typealias for the closure used to vend custom items inside a custom group.

struct NSCollectionLayoutGroupCustomItemProviderDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutGroupCustomItemProvider",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutgroupcustomitemprovider.md",
            availability: "macOS",
            blurb: """
            NSCollectionLayoutGroupCustomItemProvider is a typealias for \
            the closure used to vend NSCollectionLayoutGroupCustomItem \
            instances inside a custom group. Used with the \
            NSCollectionLayoutGroup.custom(layoutSize:itemProvider:) \
            initializer.

            Signature:

                typealias \
            NSCollectionLayoutGroupCustomItemProvider = \
            (any NSCollectionLayoutEnvironment) -> \
            [NSCollectionLayoutGroupCustomItem]

            The closure receives the layout environment (\
            NSCollectionLayoutEnvironment, exposing container size and \
            trait collection) and returns the items that make up the \
            group at runtime. Frames inside each returned custom item \
            are in the group's coordinate space.

            Used to express radial / diagonal / fully custom \
            arrangements that don't fit the horizontal / vertical group \
            arrangements.
            """,
            signatures: [
                "typealias NSCollectionLayoutGroupCustomItemProvider = (any NSCollectionLayoutEnvironment) -> [NSCollectionLayoutGroupCustomItem]",
                "NSCollectionLayoutGroup.custom(layoutSize:itemProvider:)"
            ],
            notes: [
                "Doc kind: typealias. The closure is captured once per group construction and re-invoked when the group lays out.",
                "Use NSCollectionLayoutEnvironment.container.contentSize to compute responsive frames.",
                "Items returned must be inside the group's bounds (otherwise they're hidden by the layout engine).",
                "For axial arrangements (horizontal / vertical), use the simpler factory methods on NSCollectionLayoutGroup instead."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutGroupCustomItemProviderDescribePage().frame(width: 900, height: 700)
}
