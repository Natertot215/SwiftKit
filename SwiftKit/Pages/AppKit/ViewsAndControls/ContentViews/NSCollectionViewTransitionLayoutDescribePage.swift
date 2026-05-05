import SwiftUI

// Describe-track page for NSCollectionViewTransitionLayout.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewtransitionlayout.md
// A layout used to drive interactive transitions between two layouts.
// Inherits NSCollectionViewLayout. macOS 10.11+; the doc explicitly notes
// that AppKit collection views do not provide built-in support for
// driving these transitions — apps wire them up themselves.

struct NSCollectionViewTransitionLayoutDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSCollectionViewTransitionLayout",
            docPath: "Documentation/AppKit/views-and-controls/nscollectionviewtransitionlayout.md",
            availability: "macOS 10.11+",
            blurb: """
            NSCollectionViewTransitionLayout is a layout class that lets \
            you implement custom behaviors when changing from one layout \
            to another in a collection view. It tracks two backing layouts \
            (currentLayout and nextLayout) and a transitionProgress (0 → 1) \
            that drives interpolation between them.

            Typical use is interactive layout transitions driven by a \
            gesture recognizer — pinch the grid to morph it into a list, \
            for example. The transition layout asks each backing layout \
            for attributes at the start and end positions and interpolates \
            them according to transitionProgress.

            > Note: the doc explicitly states that, as of macOS 10.11, \
            collection views do not provide built-in support for *driving* \
            layout transitions. The transition layout provides the \
            attribute-interpolation machinery; the gesture / driver is \
            up to the app.

            Inherits NSCollectionViewLayout — assign it as the collection \
            view's collectionViewLayout during the transition, then swap \
            in the final destination layout when the transition completes.
            """,
            signatures: [
                "class NSCollectionViewTransitionLayout : NSCollectionViewLayout",
                "init(currentLayout: NSCollectionViewLayout, nextLayout: NSCollectionViewLayout)",
                "var transitionProgress: CGFloat",
                "var currentLayout: NSCollectionViewLayout { get }",
                "var nextLayout: NSCollectionViewLayout { get }",
                "func updateValue(_ value: CGFloat, forAnimatedKey key: String)"
            ],
            notes: [
                "Doc kind: class. Inherits NSCollectionViewLayout.",
                "Hard to demo standalone — interactive transitions need a gesture driver and two real layouts to interpolate between.",
                "AppKit's NSCollectionView does not ship with a built-in interactive-transition driver (per the doc note). Apps drive transitionProgress themselves.",
                "Conforms to Sendable, NSCoding — values cross actor boundaries; layouts persist across encoding cycles."
            ]
        )
    }
}

#Preview {
    NSCollectionViewTransitionLayoutDescribePage().frame(width: 900, height: 700)
}
