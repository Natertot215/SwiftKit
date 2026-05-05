import SwiftUI

// SwiftUI `ScrollTargetBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolltargetbehavior.md
// macOS 14.0+. Protocol defining custom scroll-end behavior.

struct ScrollTargetBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollTargetBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/scrolltargetbehavior.md",
            availability: "macOS 14.0+",
            blurb: """
            A protocol that defines the scroll behavior of a scrollable view. A scrollable \
            view normally calculates where a scroll gesture should end using its deceleration \
            rate; conforming a type to ScrollTargetBehavior lets you override that logic.

            The single required method is updateTarget(_:context:). SwiftUI calls it with the \
            default decelerated target as an inout ScrollTarget and a TargetContext describing \
            the scroll view's geometry and gesture state. Mutate target.rect (and optionally \
            target.anchor) to redirect where the scroll lands.

            Built-in conforming types:
            \u{2022} PagingScrollTargetBehavior \u{2014} aligns to container-sized pages.
            \u{2022} ViewAlignedScrollTargetBehavior \u{2014} aligns to individual view geometry.
            \u{2022} AnyScrollTargetBehavior \u{2014} type-erased wrapper for runtime swapping.

            Apply via View/scrollTargetBehavior(_:). For a working demo see that page.
            """,
            signatures: [
                "protocol ScrollTargetBehavior",
                "func updateTarget(_ target: inout Target, context: TargetContext)",
                "func properties(context: ScrollTargetBehaviorPropertiesContext) -> ScrollTargetBehaviorProperties",
                "typealias Target = ScrollTarget",
                "typealias TargetContext = ScrollTargetBehaviorContext",
                "static var paging: PagingScrollTargetBehavior",
                "static var viewAligned: ViewAlignedScrollTargetBehavior",
                "static func viewAligned(limitBehavior:) -> ViewAlignedScrollTargetBehavior",
                "static func viewAligned(anchor:) -> ViewAlignedScrollTargetBehavior",
                "static func viewAligned(limitBehavior:anchor:) -> ViewAlignedScrollTargetBehavior"
            ],
            notes: [
                "Custom example: round target.rect.x to a multiple of containerSize.width / 10 to snap to a 10-step grid.",
                "Mutate target.rect inside updateTarget; the projected rect is the post-deceleration default.",
                "TargetContext gives axes, containerSize, contentSize, originalTarget, velocity.",
                "properties(context:) is optional \u{2014} return ScrollTargetBehaviorProperties to influence the scroll view (e.g., limitsScrolls).",
                "Type-erase with AnyScrollTargetBehavior when you need to swap behaviors at runtime."
            ]
        )
    }
}

#Preview {
    ScrollTargetBehaviorDescribePage().frame(width: 900, height: 700)
}
