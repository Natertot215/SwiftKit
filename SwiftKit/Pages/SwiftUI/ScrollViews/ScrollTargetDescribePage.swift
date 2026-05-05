import SwiftUI

// SwiftUI `ScrollTarget` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltarget.md
// macOS 14.0+. Value type representing a target rect + anchor inside a scroll view's content.

struct ScrollTargetDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTarget",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltarget.md",
            availability: "macOS 14.0+",
            blurb: """
            A type defining the target in which a scroll view should try to scroll to. \
            ScrollTarget is the inout parameter passed to a ScrollTargetBehavior's \
            updateTarget(_:context:) method \u{2014} mutate it to redirect where the \
            scroll view will end.

            ScrollTarget exposes:
            \u{2022} rect \u{2014} the proposed CGRect within the scroll view's content.
            \u{2022} anchor \u{2014} an optional UnitPoint controlling alignment of the rect.

            You don't construct ScrollTarget directly. SwiftUI hands it to your custom \
            behavior with the deceleration-projected default; your behavior rewrites it \
            (e.g., rounds rect.x to a multiple of 100) so the scroll lands somewhere else.

            See ScrollTargetBehavior for the protocol that uses ScrollTarget.
            """,
            signatures: [
                "struct ScrollTarget",
                "var rect: CGRect",
                "var anchor: UnitPoint?"
            ],
            notes: [
                "Conforms to Equatable and Hashable.",
                "Mutate inside ScrollTargetBehavior.updateTarget(_:context:) to redirect the scroll.",
                "anchor: nil keeps the rect's natural placement; setting it pins the rect to a UnitPoint.",
                "Built-in behaviors (.paging, .viewAligned) round rect to container/view boundaries.",
                "Pairs with ScrollTargetBehaviorContext for read-only state (containerSize, contentSize, velocity, axes)."
            ]
        )
    }
}

#Preview {
    ScrollTargetDescribePage().frame(width: 900, height: 700)
}
