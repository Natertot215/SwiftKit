import SwiftUI

// Describe-track page for NSCollectionLayoutDecorationItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutdecorationitem.md
// Section-background decoration. Unlike supplementary items, decoration
// items are not driven by the data source — the layout owns them and
// registers a view class via NSCollectionViewLayout.register(_:forDecorationViewOfKind:).

struct NSCollectionLayoutDecorationItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutDecorationItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutdecorationitem.md",
            availability: "macOS 10.15+",
            blurb: """
            NSCollectionLayoutDecorationItem adds a background to a \
            section of a compositional layout — for example, a \
            rounded-rectangle plate that sits beneath an entire section \
            and provides visual grouping.

            Two distinguishing facts versus supplementary items:

              \u{2022} Decoration items are NOT driven by the data source. \
            The layout itself registers the decoration view class via \
            NSCollectionViewLayout.register(_:forDecorationViewOfKind:); \
            no data-source method runs to vend it.
              \u{2022} Each decoration item must have a unique elementKind \
            string and the layout must register a view class for that \
            kind before the decoration can render.

            Construction and use:

                let bg = NSCollectionLayoutDecorationItem.background(
                    elementKind: \"section-bg\")
                section.decorationItems = [bg]
                layout.register(SectionBackgroundView.self,
                                forDecorationViewOfKind: \"section-bg\")
            """,
            signatures: [
                "class NSCollectionLayoutDecorationItem : NSCollectionLayoutItem",
                "static func background(elementKind: String) -> NSCollectionLayoutDecorationItem",
                "var elementKind: String { get }",
                "var zIndex: Int",
                "section.decorationItems = [decoration]",
                "layout.register(_ viewClass: AnyClass?, forDecorationViewOfKind: String)"
            ],
            notes: [
                "Doc kind: class. Inherits NSCollectionLayoutItem.",
                "Layout-owned, not data-source-driven — distinct from supplementary items.",
                "Register the decoration view class via NSCollectionViewLayout.register(_:forDecorationViewOfKind:). Without registration, no view is created.",
                "Visual chrome lives in the registered view class — typically an NSView subclass that draws a background plate."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutDecorationItemDescribePage().frame(width: 900, height: 700)
}
