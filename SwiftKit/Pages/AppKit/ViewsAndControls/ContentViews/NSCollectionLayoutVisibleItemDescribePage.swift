import SwiftUI

// Describe-track page for NSCollectionLayoutVisibleItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutvisibleitem.md
// Protocol describing an item that is currently visible in a section.
// Used inside a section's visibleItemsInvalidationHandler to perform custom
// animations on items as they enter/leave/scroll.

struct NSCollectionLayoutVisibleItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutVisibleItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutvisibleitem.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutVisibleItem is a protocol describing an item \
            currently visible within the bounds of a section in a \
            compositional layout. You see this protocol on values passed \
            into a section's visibleItemsInvalidationHandler — the \
            closure called before each layout cycle so you can animate \
            items as they scroll, enter, or leave.

            Surface (per Apple docs):

              \u{2022} name: String? — the element kind (item / supplementary \
            kind / decoration kind).
              \u{2022} indexPath: IndexPath — which slot this visible item \
            represents.
              \u{2022} frame, bounds, center — the layout-attribute values \
            for this item right now.
              \u{2022} alpha, transform, transform3D, zIndex, isHidden — \
            mutable per-cycle so the handler can animate visibility / \
            transform.

            The handler runs every time the section needs to re-render \
            (scroll, insert, delete, rotate). Modifications inside it \
            persist for that cycle.
            """,
            signatures: [
                "@MainActor protocol NSCollectionLayoutVisibleItem : NSObjectProtocol",
                "var indexPath: IndexPath { get }",
                "var frame: NSRect { get }",
                "var bounds: NSRect { get }",
                "var alpha: CGFloat",
                "var zIndex: Int"
            ],
            notes: [
                "Doc kind: protocol. AppKit provides the conforming objects — apps consume them but don't implement the protocol.",
                "Reached only inside NSCollectionLayoutSection.visibleItemsInvalidationHandler.",
                "Modifying alpha / transform / isHidden inside the handler animates the items for that layout cycle.",
                "Used together with NSCollectionLayoutSectionVisibleItemsInvalidationHandler typealias."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutVisibleItemDescribePage().frame(width: 900, height: 700)
}
