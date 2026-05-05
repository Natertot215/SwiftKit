import SwiftUI

// Describe-track page for NSCollectionLayoutDimension.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutdimension.md
// A single width or height value used to size compositional-layout components.
// Three flavors: absolute (exact pts), estimated (initial guess that may
// resolve later), and fractional (relative to the container).

struct NSCollectionLayoutDimensionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutDimension",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutdimension.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutDimension is a single dimension — a width OR a \
            height — used to size any component in a compositional layout. \
            Pairs of dimensions combine into NSCollectionLayoutSize, which \
            sizes items, groups, and supplementary items.

            Three flavors:

              \u{2022} absolute(_ value: CGFloat) — fixed point value. \
            "44 points tall."
              \u{2022} estimated(_ value: CGFloat) — initial guess that may \
            be replaced later when the actual content size is known (e.g., \
            self-sizing content in response to a Dynamic Type change).
              \u{2022} fractionalWidth(_ fraction: CGFloat) / \
            fractionalHeight(_ fraction: CGFloat) — relative to the parent \
            container. "Half the width of the group."

            Fractional dimensions are how compositional layouts express \
            aspect ratios: a square that's 20% of the container width is \
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), \
            heightDimension: .fractionalWidth(0.2)).
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutDimension",
                "static func absolute(_ value: CGFloat) -> NSCollectionLayoutDimension",
                "static func estimated(_ value: CGFloat) -> NSCollectionLayoutDimension",
                "static func fractionalWidth(_ fractionalWidth: CGFloat) -> NSCollectionLayoutDimension",
                "static func fractionalHeight(_ fractionalHeight: CGFloat) -> NSCollectionLayoutDimension"
            ],
            notes: [
                "Doc kind: class. The four static factories above are the only construction paths.",
                "Fractional values are relative to the dimension's container — fractionalWidth(0.5) inside a group is half that group's width, not half the collection view's width.",
                "Estimated dimensions enable self-sizing items via auto layout; the system resolves the real size after layout.",
                "Demoed in context on the NSCollectionViewCompositionalLayout page."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutDimensionDescribePage().frame(width: 900, height: 700)
}
