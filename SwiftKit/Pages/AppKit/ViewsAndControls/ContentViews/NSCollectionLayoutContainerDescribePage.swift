import SwiftUI

// Describe-track page for NSCollectionLayoutContainer.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutcontainer.md
// Protocol that exposes the size and effective content insets of a layout's
// container. Reached via NSCollectionLayoutEnvironment.container in a
// section provider.

struct NSCollectionLayoutContainerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutContainer",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutcontainer.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutContainer is a protocol that exposes the size \
            and content insets of a compositional layout's container. \
            Reached through NSCollectionLayoutEnvironment.container inside \
            a section provider, it lets you make decisions about how to \
            display a section based on the available width / height — for \
            example, switching between a single-column list under a narrow \
            window and a multi-column grid under a wide one.

            The protocol exposes:

              \u{2022} contentSize: NSSize — the size available to the layout \
            after the container's own insets and safe area are subtracted.
              \u{2022} effectiveContentSize: NSSize — the content size minus \
            the container's effectiveContentInsets.
              \u{2022} contentInsets: NSDirectionalEdgeInsets — explicit \
            insets the container was configured with.
              \u{2022} effectiveContentInsets: NSDirectionalEdgeInsets — the \
            insets actually applied by the container, including any system \
            safe-area additions.

            Used inside an NSCollectionViewCompositionalLayoutSectionProvider \
            closure to drive responsive section layouts.
            """,
            signatures: [
                "@MainActor protocol NSCollectionLayoutContainer : NSObjectProtocol",
                "var contentSize: NSSize { get }",
                "var effectiveContentSize: NSSize { get }",
                "var contentInsets: NSDirectionalEdgeInsets { get }",
                "var effectiveContentInsets: NSDirectionalEdgeInsets { get }"
            ],
            notes: [
                "Doc kind: protocol. AppKit provides the conforming object — apps consume it but don't implement it.",
                "Reached via NSCollectionLayoutEnvironment.container inside a section-provider closure.",
                "Pair with NSCollectionLayoutEnvironment.traitCollection for adaptive layouts that respond to size + appearance.",
                "Demoed conceptually on the NSCollectionViewCompositionalLayout page (the section-provider variant uses environment.container)."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutContainerDescribePage().frame(width: 900, height: 700)
}
