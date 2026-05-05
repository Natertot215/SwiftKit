import SwiftUI

// Describe-track page for NSCollectionLayoutSectionVisibleItemsInvalidationHandler.
// Source: Documentation/AppKit/views-and-controls/nscollectionlayoutsectionvisibleitemsinvalidationhandler.md
// Typealias for the closure attached to NSCollectionLayoutSection.
// visibleItemsInvalidationHandler — runs before each layout cycle.

struct NSCollectionLayoutSectionVisibleItemsInvalidationHandlerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionLayoutSectionVisibleItemsInvalidationHandler",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionlayoutsectionvisibleitemsinvalidationhandler.md",
            availability: "macOS",
            blurb: """
            NSCollectionLayoutSectionVisibleItemsInvalidationHandler is a \
            typealias for the closure attached to a section's \
            visibleItemsInvalidationHandler. The closure is called before \
            each layout cycle for the section — every time the layout \
            needs to update due to scrolling, insert / delete, or \
            geometry changes.

            Signature:

                typealias \
            NSCollectionLayoutSectionVisibleItemsInvalidationHandler = \
            ([any NSCollectionLayoutVisibleItem], NSPoint, \
            any NSCollectionLayoutEnvironment) -> Void

            Parameters:

              \u{2022} The array of NSCollectionLayoutVisibleItem currently \
            visible — modify their alpha / transform / isHidden to drive \
            per-item animations.
              \u{2022} An NSPoint giving the section's current content \
            offset.
              \u{2022} The NSCollectionLayoutEnvironment (container size, \
            trait collection).

            Used to implement scroll-driven custom animations — for \
            example, fading items as they approach the edge of an \
            orthogonally-scrolling shelf.
            """,
            signatures: [
                "typealias NSCollectionLayoutSectionVisibleItemsInvalidationHandler = ([any NSCollectionLayoutVisibleItem], NSPoint, any NSCollectionLayoutEnvironment) -> Void",
                "section.visibleItemsInvalidationHandler = { items, offset, env in /* ... */ }"
            ],
            notes: [
                "Doc kind: typealias. Stored on NSCollectionLayoutSection.visibleItemsInvalidationHandler.",
                "Runs frequently — before every layout cycle. Keep work cheap.",
                "Modifications to visible item attributes (alpha, transform, etc.) persist for that cycle.",
                "Combine with .orthogonalScrollingBehavior to react to per-section scrolling."
            ]
        )
    }
}

#Preview {
    NSCollectionLayoutSectionVisibleItemsInvalidationHandlerDescribePage().frame(width: 900, height: 700)
}
