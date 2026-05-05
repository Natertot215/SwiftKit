import SwiftUI

// Describe-track page for NSCollectionViewCompositionalLayoutSectionProvider.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewcompositionallayoutsectionprovider.md
// Typealias for the closure used to build a multi-section compositional
// layout where each section may have a different layout.

struct NSCollectionViewCompositionalLayoutSectionProviderDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewCompositionalLayoutSectionProvider",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewcompositionallayoutsectionprovider.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionViewCompositionalLayoutSectionProvider is a \
            typealias for a closure that returns a different \
            NSCollectionLayoutSection per section index, used to build \
            multi-section compositional layouts where each section can \
            have its own layout.

            Signature:

                typealias \
            NSCollectionViewCompositionalLayoutSectionProvider = \
            (Int, any NSCollectionLayoutEnvironment) -> \
            NSCollectionLayoutSection?

            The closure receives the section index and a layout \
            environment (NSCollectionLayoutEnvironment, exposing \
            container size and trait collection). Use them to choose \
            different group / item / section structures for different \
            sections — a two-column section followed by a four-column \
            section, for example.

            Pair with NSCollectionViewCompositionalLayout(\
            sectionProvider:configuration:).

            Returning nil from the closure for a section index causes \
            the layout to skip that section.
            """,
            signatures: [
                "typealias NSCollectionViewCompositionalLayoutSectionProvider = (Int, any NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?",
                "NSCollectionViewCompositionalLayout(sectionProvider:configuration:)"
            ],
            notes: [
                "Doc kind: typealias. The closure runs on demand for each section the layout needs to render.",
                "The environment parameter (NSCollectionLayoutEnvironment) carries container size + traits — useful for adaptive sections.",
                "Pair with NSCollectionViewCompositionalLayoutConfiguration for layout-wide scroll direction / inter-section spacing / global supplementary items.",
                "For a single-section layout you can use the simpler NSCollectionViewCompositionalLayout(section:) initializer instead."
            ]
        )
    }
}

#Preview {
    NSCollectionViewCompositionalLayoutSectionProviderDescribePage().frame(width: 900, height: 700)
}
