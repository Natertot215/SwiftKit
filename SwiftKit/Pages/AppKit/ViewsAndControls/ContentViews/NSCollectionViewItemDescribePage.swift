import SwiftUI

// Describe-track page for NSCollectionViewItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewitem.md
// NSCollectionViewItem is a view-controller that provides the visual
// representation for a single data element in a collection view. The default
// implementation supports a single image or string; richer items subclass it
// and add views in loadView(). Items are vended by the data source via
// makeItem(withIdentifier:for:) and recycled by the collection view, so apps
// must never store references to them. Demoed in context on the
// NSCollectionView page; this page documents the type itself.

struct NSCollectionViewItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewitem.md",
            availability: "macOS 10.5+",
            blurb: """
            NSCollectionViewItem is the visual representation for a single \
            data element in a collection view. Each item is an NSViewController \
            whose view hierarchy renders one cell of the collection.

            How it composes:

              \u{2022} Subclass NSCollectionViewItem and override loadView() to \
            build the view tree, OR provide a nib whose top-level object is \
            an NSCollectionViewItem.
              \u{2022} Register the class or nib with the collection view via \
            register(_:forItemWithIdentifier:) before reloadData() runs.
              \u{2022} The data source vends items from \
            collectionView(_:itemForRepresentedObjectAt:) by calling \
            collectionView.makeItem(withIdentifier:for:), then configures \
            the item with the model value at that index path.
              \u{2022} Items are recycled — never store a reference to one. \
            When the underlying data changes, ask the collection view to \
            reload that index path; AppKit will re-vend a fresh item.

            The base class includes outlets for image and textField so an \
            empty NSCollectionViewItem is enough for the simplest "image + \
            label" item; for anything richer, subclass and add accessor \
            properties for the new views.
            """,
            signatures: [
                "class NSCollectionViewItem : NSViewController",
                "// override loadView() to provide custom views",
                "// var representedObject: Any? — the model value for this item",
                "collectionView.register(MyItem.self, forItemWithIdentifier: .my)",
                "let item = cv.makeItem(withIdentifier: .my, for: indexPath) as! MyItem"
            ],
            notes: [
                "Inherits NSViewController. Items are full view-controllers — viewDidLoad / viewWillAppear / viewDidDisappear all run as items are recycled in and out of the visible window.",
                "Default base class has outlets for an image (imageView) and a string (textField). Subclass when the item needs richer content.",
                "Conforms to NSCollectionViewElement — applies layout attributes, supports highlight/selection state, performs cleanup before reuse.",
                "Demoed in context on the NSCollectionView page (TileItem subclass) — this page covers the type itself."
            ]
        )
    }
}

#Preview {
    NSCollectionViewItemDescribePage().frame(width: 900, height: 700)
}
