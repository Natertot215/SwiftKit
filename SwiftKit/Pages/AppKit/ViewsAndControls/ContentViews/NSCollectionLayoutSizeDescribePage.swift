import SwiftUI

// Describe-track page for NSCollectionLayoutSize.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutsize.md
// A pair of NSCollectionLayoutDimension values (width, height) describing
// the size of any compositional-layout component.

struct NSCollectionLayoutSizeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutSize",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutsize.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutSize is a pair of dimensions — width and \
            height — that describes the size of any component in a \
            compositional layout. Every item, group, supplementary item, \
            and decoration item carries one.

            The two NSCollectionLayoutDimension values can be mixed and \
            matched freely:

                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(44))

            Sizes are read by the layout engine relative to the component's \
            *container* — for an item this is its enclosing group, for a \
            group its enclosing section, for a section the collection view \
            itself.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutSize",
                "init(widthDimension: NSCollectionLayoutDimension, heightDimension: NSCollectionLayoutDimension)",
                "var widthDimension: NSCollectionLayoutDimension { get }",
                "var heightDimension: NSCollectionLayoutDimension { get }"
            ],
            notes: [
                "Doc kind: class. Always paired with the two NSCollectionLayoutDimension values supplied at init.",
                "The width / height dimensions can independently be absolute, estimated, or fractional.",
                "Used everywhere in the compositional DSL: NSCollectionLayoutItem(layoutSize:), NSCollectionLayoutGroup.horizontal(layoutSize:subitems:), NSCollectionLayoutBoundarySupplementaryItem(layoutSize:elementKind:alignment:).",
                "Demoed in context on the NSCollectionViewCompositionalLayout page."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutSizeDescribePage().frame(width: 900, height: 700)
}
