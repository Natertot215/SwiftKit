import SwiftUI

// Describe-track page for NSCollectionViewLayoutAttributes.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewlayoutattributes.md
// A model object describing one element's position, size, alpha, zIndex,
// and other layout-related properties. Created by the layout object and
// applied to the corresponding view by the collection view.

struct NSCollectionViewLayoutAttributesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewLayoutAttributes",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewlayoutattributes.md",
            availability: "macOS 10.11+",
            blurb: """
            NSCollectionViewLayoutAttributes is the model object the layout \
            engine produces for each element in a collection view. The \
            layout creates an instance per item / supplementary / decoration \
            and the collection view applies those attributes to the \
            corresponding NSView (or NSCollectionViewItem.view).

            Visible properties:

              \u{2022} frame: NSRect — the element's bounding box.
              \u{2022} size: NSSize, center: NSPoint, bounds: NSRect — \
            convenience accessors.
              \u{2022} alpha: CGFloat — opacity.
              \u{2022} zIndex: Int — stacking order within the collection view.
              \u{2022} isHidden: Bool — visibility.
              \u{2022} indexPath: IndexPath? — which item / supplementary / \
            decoration this attribute set describes.
              \u{2022} representedElementCategory / representedElementKind — \
            element kind (item, supplementary, decoration).

            You only interact with this class when implementing a custom \
            NSCollectionViewLayout subclass. Subclass it to add extra \
            properties needed by your layout (custom transforms, tints, \
            etc.); follow the subclassing notes in the doc for proper init \
            / copy / equality overrides.
            """,
            signatures: [
                "@MainActor class NSCollectionViewLayoutAttributes",
                "var frame: NSRect",
                "var alpha: CGFloat",
                "var zIndex: Int",
                "var isHidden: Bool",
                "var indexPath: IndexPath?",
                "var representedElementCategory: NSCollectionElementCategory"
            ],
            notes: [
                "Doc kind: class. Most apps never touch this directly — it surfaces only when subclassing NSCollectionViewLayout.",
                "Subclassing rules: implement init() with no parameters; override copy(with:); override isEqual:; override hash. Otherwise the layout cache misbehaves.",
                "Used by NSCollectionViewElement.apply(_:) — the element receives its computed attributes once per layout cycle.",
                "preferredLayoutAttributesFitting(_:) on NSCollectionViewElement returns a *modified* attributes object for self-sizing."
            ]
        )
    }
}

#Preview {
    NSCollectionViewLayoutAttributesDescribePage().frame(width: 900, height: 700)
}
