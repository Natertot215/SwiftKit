import SwiftUI

// Describe-track page for NSCollectionViewUpdateItem.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewupdateitem.md
// A description of a single change about to be applied to the collection.
// You don't construct these — the collection view creates them and passes
// them to the layout's prepare(forCollectionViewUpdates:) hook.

struct NSCollectionViewUpdateItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewUpdateItem",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewupdateitem.md",
            availability: "macOS 10.11+",
            blurb: """
            NSCollectionViewUpdateItem describes a single change about to \
            be made to an item in a collection view (insert, delete, \
            reload, move). You don't construct instances — the collection \
            view assembles an array of them whenever a batch update is \
            applied and passes that array to the layout's \
            prepare(forCollectionViewUpdates:) method so the layout can \
            stage animations.

            What's on each update item:

              \u{2022} updateAction: NSCollectionView.UpdateAction — the \
            kind of change (.insert / .delete / .reload / .move / .none).
              \u{2022} indexPathBeforeUpdate: IndexPath? — where the item \
            was before the change (nil for inserts).
              \u{2022} indexPathAfterUpdate: IndexPath? — where it ends up \
            after the change (nil for deletes).

            Custom layouts use these to compute initialLayoutAttributes \
            and finalLayoutAttributes for the elements participating in \
            the batch, which drives the insert/delete animations.
            """,
            signatures: [
                "@MainActor class NSCollectionViewUpdateItem : NSObject",
                "var updateAction: NSCollectionView.UpdateAction { get }",
                "var indexPathBeforeUpdate: IndexPath? { get }",
                "var indexPathAfterUpdate: IndexPath? { get }",
                "// NSCollectionView.UpdateAction: .insert, .delete, .reload, .move, .none"
            ],
            notes: [
                "Doc kind: class. App code never constructs — the collection view does.",
                "Surfaced inside NSCollectionViewLayout.prepare(forCollectionViewUpdates:) only — for staging insert/delete/move animations.",
                "Most apps don't touch this type. Reach for it only when implementing a custom NSCollectionViewLayout subclass.",
                "Diffable data sources handle update bookkeeping internally — you don't see update items when using the diffable path."
            ]
        )
    }
}

#Preview {
    NSCollectionViewUpdateItemDescribePage().frame(width: 900, height: 700)
}
