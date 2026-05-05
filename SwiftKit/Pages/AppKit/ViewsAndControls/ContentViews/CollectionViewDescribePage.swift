import SwiftUI

// Describe-track page for the "Collection View" overview article.
// Source: Documentation/AppKit/views-and-controls/collection-view.md
// "Collection View" is a collectionGroup overview page in Apple's docs that
// groups every member of AppKit's NSCollectionView family — the view itself,
// its items and section header, the data-source / delegate protocols, the
// diffable data source, and the modern compositional-layout DSL primitives
// (item / group / section / dimension / size / spacing / supplementary item /
// decoration item / anchor / environment / etc). Renderable demos live on the
// member pages — primarily NSCollectionView, NSCollectionViewFlowLayout,
// NSCollectionViewGridLayout, and NSCollectionViewCompositionalLayout.

struct CollectionViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Collection View",
            docPath: "Documentation/AppKit/views-and-controls/collection-view.md",
            availability: "macOS (NSCollectionView family)",
            blurb: """
            Apple's documentation groups the NSCollectionView family of \
            classes, protocols, and value types under "Collection View". \
            Together they let you display one or more subviews in a highly \
            configurable arrangement — a grid by default, a flow, or any \
            arrangement the layout object describes.

            How the pieces compose:

              \u{2022} NSCollectionView is the visible NSView subclass. It \
            asks a data source for items, asks a layout object where to put \
            them, and asks a delegate about behavior (selection, drag/drop, \
            highlighting).
              \u{2022} The data side is either the NSCollectionViewDataSource \
            protocol (for items / supplementary views / sections) or the \
            modern NSCollectionViewDiffableDataSource generic class working \
            with NSDiffableDataSourceSnapshot.
              \u{2022} The behavior side is the NSCollectionViewDelegate \
            protocol — selection, highlighting, drag/drop. \
            NSCollectionViewDelegateFlowLayout extends it for sizing/spacing \
            with flow layouts.
              \u{2022} Each rendered item is an NSCollectionViewItem (view \
            controller). Section headers and other supplementary content can \
            adopt NSCollectionViewSectionHeaderView to provide a collapse \
            button, or any class adopting NSCollectionViewElement.
              \u{2022} Layouts are NSCollectionViewLayout subclasses: \
            NSCollectionViewFlowLayout (line/column flow), \
            NSCollectionViewGridLayout (fixed grid), \
            NSCollectionViewCompositionalLayout (composable sections), and \
            NSCollectionViewTransitionLayout (interactive transitions).
              \u{2022} Compositional layouts are described by a tree of \
            value/builder objects: NSCollectionLayoutItem inside an \
            NSCollectionLayoutGroup inside an NSCollectionLayoutSection, \
            sized by NSCollectionLayoutSize / NSCollectionLayoutDimension, \
            spaced by NSCollectionLayoutSpacing / NSCollectionLayoutEdgeSpacing, \
            decorated by NSCollectionLayoutBoundarySupplementaryItem / \
            NSCollectionLayoutSupplementaryItem / NSCollectionLayoutDecorationItem, \
            attached by NSCollectionLayoutAnchor, scoped by \
            NSCollectionLayoutContainer / NSCollectionLayoutEnvironment.
              \u{2022} Updates flow through NSCollectionViewUpdateItem and \
            invalidations through NSCollectionViewLayoutInvalidationContext / \
            NSCollectionViewFlowLayoutInvalidationContext.

            Reach for NSCollectionView when you need a grid, a flow, or any \
            other custom arrangement of repeating views — Photos, the App \
            Store, and Finder's icon view are all in this shape. SwiftUI's \
            LazyVGrid / LazyHGrid cover most pure-grid cases; bridge through \
            NSViewRepresentable when you need NSCollectionView's section \
            collapse, drag-and-drop machinery, or compositional layout.
            """,
            signatures: [
                "class NSCollectionView : NSView",
                "class NSCollectionViewItem : NSViewController",
                "protocol NSCollectionViewDataSource",
                "class NSCollectionViewDiffableDataSource<Section, Item>",
                "class NSCollectionViewCompositionalLayout : NSCollectionViewLayout"
            ],
            notes: [
                "Doc kind: collectionGroup. The article itself defines no API — it points to the View / Components / Size and spacing / Data / Layouts / Updates topics under it.",
                "NSCollectionView inherits NSView (compare NSTableView : NSControl, NSBrowser : NSControl). The collection view is layout-agnostic — the layout object decides placement.",
                "Two data-source paths: classic NSCollectionViewDataSource protocol, or the modern generic NSCollectionViewDiffableDataSource<Section, Item> class. Diffable is recommended for new code.",
                "Three layout families ship in-box: flow (NSCollectionViewFlowLayout), fixed grid (NSCollectionViewGridLayout), and compositional (NSCollectionViewCompositionalLayout).",
                "See Also targets in the doc: Browser View, Outline View, Table View, NSTextView — the four other AppKit content-view families."
            ]
        )
    }
}

#Preview {
    CollectionViewDescribePage()
        .frame(width: 900, height: 700)
}
