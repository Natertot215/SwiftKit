import SwiftUI

// Describe-track page for NSCollectionLayoutGroupCustomItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutgroupcustomitem.md
// An item used inside a custom-arrangement group. Carries an explicit
// frame and zIndex rather than a layoutSize, so the parent group can
// describe radial / diagonal / non-axial arrangements.

struct NSCollectionLayoutGroupCustomItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutGroupCustomItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutgroupcustomitem.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutGroupCustomItem is an item used inside a \
            custom-arrangement group — created via \
            NSCollectionLayoutGroup.custom(layoutSize:itemProvider:). \
            Unlike a regular NSCollectionLayoutItem (which carries a \
            layoutSize the engine uses to position it inside its parent \
            group), a custom item carries an explicit frame so the \
            parent group can describe radial, diagonal, or otherwise \
            non-axial arrangements.

            Construction:

                NSCollectionLayoutGroupCustomItem(frame: NSRect, \
            zIndex: Int = 0)

            Vended from an NSCollectionLayoutGroupCustomItemProvider \
            closure that runs once for the group with an \
            NSCollectionLayoutEnvironment, returning an array of custom \
            items. The closure can use the environment's container size \
            and trait collection to compute frames responsively.
            """,
            signatures: [
                "@MainActor class NSCollectionLayoutGroupCustomItem",
                "init(frame: NSRect)",
                "init(frame: NSRect, zIndex: Int)",
                "var frame: NSRect { get }",
                "var zIndex: Int { get }"
            ],
            notes: [
                "Doc kind: class. Distinct from NSCollectionLayoutItem — used only inside groups created via NSCollectionLayoutGroup.custom(...).",
                "Frame is in the group's coordinate space — the engine applies the group's transform to position the items.",
                "zIndex controls stacking when custom items overlap.",
                "The doc lists 'radial or diagonal layout' as canonical use cases — anything where items don't sit on a flow / grid axis."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutGroupCustomItemDescribePage().frame(width: 900, height: 700)
}
