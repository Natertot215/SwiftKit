import SwiftUI

// Describe-track page for NSCollectionViewElement.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewelement.md
// The base protocol for anything displayed in an NSCollectionView — items,
// supplementary views, and decoration views all conform. Includes hooks for
// applying layout attributes and cleaning up before reuse.

struct NSCollectionViewElementDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewElement",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewelement.md",
            availability: "macOS",
            blurb: """
            NSCollectionViewElement is the base protocol every visual \
            participant in an NSCollectionView adopts — items, supplementary \
            views (headers, footers, badges), and decoration views. It \
            inherits NSUserInterfaceItemIdentification (so each element has \
            an identifier for reuse) and NSObjectProtocol.

            Optional methods:

              \u{2022} apply(_ layoutAttributes: \
            NSCollectionViewLayoutAttributes) — receive the layout's \
            computed attributes (frame, alpha, zIndex, etc) and apply \
            them to your view.
              \u{2022} prepareForReuse() — clean up state before the element \
            is recycled and presented at a different index path.
              \u{2022} willTransition(from:to:) / didTransition(from:to:) — \
            receive layout-transition notifications during interactive \
            layout swaps.
              \u{2022} preferredLayoutAttributesFitting(_:) — opt into \
            self-sizing by returning revised attributes from the element's \
            measured fitting size.

            NSCollectionViewItem already conforms — you only adopt this \
            protocol manually on custom NSView subclasses you use as \
            supplementary or decoration views.
            """,
            signatures: [
                "protocol NSCollectionViewElement : NSUserInterfaceItemIdentification, NSObjectProtocol",
                "func apply(_ layoutAttributes: NSCollectionViewLayoutAttributes)",
                "func prepareForReuse()",
                "func willTransition(from oldLayout: NSCollectionViewLayout, to newLayout: NSCollectionViewLayout)",
                "func preferredLayoutAttributesFitting(_ layoutAttributes: NSCollectionViewLayoutAttributes) -> NSCollectionViewLayoutAttributes"
            ],
            notes: [
                "Doc kind: protocol. All methods optional.",
                "NSCollectionViewItem already adopts NSCollectionViewElement — you don't add it twice.",
                "Adopt on custom supplementary or decoration views (e.g., a custom section header NSView subclass).",
                "preferredLayoutAttributesFitting(_:) is the entry point for self-sizing — return revised attributes when you want auto-layout-driven sizing."
            ]
        )
    }
}

#Preview {
    NSCollectionViewElementDescribePage().frame(width: 900, height: 700)
}
