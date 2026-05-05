import SwiftUI

// Describe-track page for the "Grid View" overview article.
// Source: Documentation/AppKit/views-and-controls/grid-view.md
// "Grid View" is a collectionGroup overview page in Apple's docs — it groups
// the four concrete classes that make up AppKit's grid system (NSGridView,
// NSGridCell, NSGridColumn, NSGridRow). There's no API of its own; the page
// summarizes the system and points to each concrete class. The renderable
// demo lives on the NSGridView page; this page documents the grouping.

struct GridViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Grid View",
            docPath: "Documentation/AppKit/views-and-controls/grid-view.md",
            availability: "macOS 10.12+ (NSGridView and supporting types)",
            blurb: """
            Apple's documentation groups four AppKit classes under "Grid View" — \
            NSGridView, NSGridCell, NSGridColumn, and NSGridRow. Together they \
            arrange views in a flexible grid of rows and columns and handle the \
            layout associated with those views. NSGridView is the only renderable \
            container; it owns the cells, columns, and rows, and exposes the \
            layout hooks (column/row spacing, row alignment, x/y placement). The \
            cell, column, and row classes are model-style helpers that NSGridView \
            instantiates and returns through accessors like cell(atColumnIndex:rowIndex:), \
            column(at:), and row(at:).

            Use a grid view when content has a row-column structure that \
            spreadsheet-like alignment helps clarify (settings panes, photo \
            thumbnails with metadata columns, form layouts where labels and \
            fields need to align across rows). Auto Layout under the hood means \
            cells can have their own intrinsic sizes; the grid resolves them \
            into aligned rows and columns. For free-form, scroll-aware grids of \
            uniform items, prefer NSCollectionView with a grid-style layout — \
            NSGridView is for fixed-structure layouts where alignment, not \
            scrolling, is the priority.
            """,
            signatures: [
                "class NSGridView : NSView",
                "@MainActor class NSGridCell",
                "@MainActor class NSGridColumn",
                "@MainActor class NSGridRow"
            ],
            notes: [
                "Doc kind: collectionGroup. The article itself defines no API — it points to NSGridView (the view), NSGridCell (intersection content), NSGridColumn / NSGridRow (geometry models).",
                "All four types arrived together in macOS 10.12.",
                "Renderable surface lives on NSGridView only — the cell, column, and row objects are model helpers vended by the grid view, not standalone views.",
                "See Also targets in the doc: NSSplitView, NSStackView, NSTabView, Scroll View — Apple groups these as the layout-container family.",
                "For row-and-column alignment without scrolling, prefer NSGridView. For uniform scrollable item grids, prefer NSCollectionView with a grid layout."
            ]
        )
    }
}

#Preview {
    GridViewDescribePage()
        .frame(width: 900, height: 700)
}
