import SwiftUI

// Describe-track page for NSCollectionViewSectionHeaderView.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewsectionheaderview.md
// Despite the name, this is a PROTOCOL — not a view subclass. It defines a
// single property (sectionCollapseButton) that lets a collection view
// communicate with the button that controls the collapsing of a section.

struct NSCollectionViewSectionHeaderViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewSectionHeaderView",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewsectionheaderview.md",
            availability: "macOS",
            blurb: """
            NSCollectionViewSectionHeaderView is a protocol — not a view \
            subclass. It defines the contract a section-header view must \
            adopt so the collection view can drive section collapse.

            A collection view can support a section that collapses into a \
            single horizontally scrollable row, similar to the groupings in \
            Finder's icon view. The collapse is driven by a button. To let \
            the collection view discover and operate that button, the \
            section header view conforms to this protocol and exposes its \
            collapse button via the protocol's sole property:

                var sectionCollapseButton: NSButton? { get set }

            Connect the button outlet in your nib (or assign in code) so \
            the collection view can target it. Apply this protocol to any \
            NSView (or NSViewController) you use as a section header — it \
            inherits NSCollectionViewElement, so the same view can also \
            participate in the standard layout-attribute / reuse machinery.
            """,
            signatures: [
                "protocol NSCollectionViewSectionHeaderView : NSCollectionViewElement",
                "var sectionCollapseButton: NSButton? { get set }"
            ],
            notes: [
                "Doc kind: protocol. The name is misleading — there is no NSCollectionViewSectionHeaderView class.",
                "Inherits NSCollectionViewElement — so headers also opt into the apply(layoutAttributes:) and prepareForReuse() lifecycle.",
                "The collapse button is the single requirement; everything else (label, layout, vibrancy) is up to the conforming class.",
                "Use NSCollectionLayoutBoundarySupplementaryItem (compositional) or NSCollectionViewFlowLayout's headerReferenceSize (flow) to position the header view itself."
            ]
        )
    }
}

#Preview {
    NSCollectionViewSectionHeaderViewDescribePage().frame(width: 900, height: 700)
}
