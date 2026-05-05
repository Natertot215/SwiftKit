import SwiftUI

// Describe-track page for NSCollectionLayoutEnvironment.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutenvironment.md
// Protocol describing the environment a compositional layout's section
// provider sees — container metrics + trait collection.

struct NSCollectionLayoutEnvironmentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutEnvironment",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutenvironment.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutEnvironment is a protocol that gives a \
            section provider visibility into the context the layout will \
            render in. AppKit hands an environment to the closure each \
            time a section is requested — use it to make adaptive \
            decisions about what kind of section to return.

            Surface:

              \u{2022} container: any NSCollectionLayoutContainer — exposes \
            the contentSize, effectiveContentSize, and effective content \
            insets the section will lay out into.
              \u{2022} traitCollection: NSTraitCollection — appearance \
            (light / dark), display scale, and other system traits.

            Typical use: pick a single-column section under a narrow \
            container width, a 2-column section at medium widths, a \
            3-column section at wide widths.

            Also passed into NSCollectionLayoutSectionVisibleItemsInvalidationHandler \
            and NSCollectionLayoutGroupCustomItemProvider closures so \
            those can react to the same context.
            """,
            signatures: [
                "@MainActor protocol NSCollectionLayoutEnvironment : NSObjectProtocol",
                "var container: any NSCollectionLayoutContainer { get }",
                "var traitCollection: NSTraitCollection { get }"
            ],
            notes: [
                "Doc kind: protocol. AppKit provides the conforming object — apps consume it.",
                "container.contentSize is the responsive lever — gate column counts on it.",
                "traitCollection exposes appearance — useful for layout decisions that differ between light and dark.",
                "Surfaces in three places: section providers, custom-group item providers, and visible-items invalidation handlers."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutEnvironmentDescribePage().frame(width: 900, height: 700)
}
