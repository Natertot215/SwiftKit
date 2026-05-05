import SwiftUI

// Describe-track page for NSCollectionLayoutAnchor.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutanchor.md
// Defines how a supplementary item attaches to a host item — which edges,
// at what offset.

struct NSCollectionLayoutAnchorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutAnchor",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutanchor.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutAnchor describes how an \
            NSCollectionLayoutSupplementaryItem attaches to its host \
            item — which edges to attach to, and at what offset relative \
            to the host's frame.

            What's in an anchor:

              \u{2022} edges — an NSDirectionalRectEdge option set. Single \
            edge for an edge-anchored badge; two adjacent edges for a \
            corner-anchored badge.
              \u{2022} offset — an absolute or fractional offset from the \
            anchored edges. Use init(edges:absoluteOffset:) for fixed \
            point offsets, or init(edges:fractionalOffset:) for offsets \
            expressed as fractions of the host's size.

            Leading and trailing edges flip in right-to-left environments \
            so anchored decorations stay on the user's reading-direction \
            side.

            Used as the containerAnchor of an \
            NSCollectionLayoutSupplementaryItem. For headers/footers \
            attached to entire sections (not items), use \
            NSCollectionLayoutBoundarySupplementaryItem with an \
            NSRectAlignment instead.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutAnchor",
                "init(edges: NSDirectionalRectEdge)",
                "init(edges: NSDirectionalRectEdge, absoluteOffset: NSPoint)",
                "init(edges: NSDirectionalRectEdge, fractionalOffset: NSPoint)",
                "var edges: NSDirectionalRectEdge { get }",
                "var offset: NSPoint { get }"
            ],
            notes: [
                "Doc kind: class. Used as the containerAnchor / itemAnchor of NSCollectionLayoutSupplementaryItem.",
                "Specify a single edge for an edge anchor; two adjacent edges for a corner anchor.",
                "Leading and trailing flip under right-to-left layouts — automatic localization.",
                "Boundary supplementary items use NSRectAlignment instead — anchors are for item-attached supplementaries."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutAnchorDescribePage().frame(width: 900, height: 700)
}
