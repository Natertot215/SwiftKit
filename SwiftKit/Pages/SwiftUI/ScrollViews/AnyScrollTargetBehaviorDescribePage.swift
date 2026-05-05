import SwiftUI

// SwiftUI `AnyScrollTargetBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/anyscrolltargetbehavior.md
// macOS 15.0+. Type-erased ScrollTargetBehavior wrapper for runtime swapping.

struct AnyScrollTargetBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "AnyScrollTargetBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/anyscrolltargetbehavior.md",
            availability: "macOS 15.0+",
            blurb: """
            A type-erased scroll target behavior. Wrap a concrete ScrollTargetBehavior \
            (such as .paging or .viewAligned) in an AnyScrollTargetBehavior to expose \
            a single computed-property type that can change at runtime.

            Use case: branching scroll behavior on the horizontal size class, an A/B test, \
            or a user preference. Whenever the wrapped value changes, the scroll view \
            updates its behavior live.

            ```swift
            @Environment(\\.horizontalSizeClass) var sizeClass
            var scrollTargetBehavior: some ScrollTargetBehavior {
                sizeClass == .compact
                    ? AnyScrollTargetBehavior(.paging)
                    : AnyScrollTargetBehavior(.viewAligned)
            }
            ```

            For a working demo see View/scrollTargetBehavior(_:), 'States' section.
            """,
            signatures: [
                "@frozen struct AnyScrollTargetBehavior",
                "init<B>(_ base: B) where B : ScrollTargetBehavior",
                "var base: any ScrollTargetBehavior"
            ],
            notes: [
                "Conforms to ScrollTargetBehavior \u{2014} pass directly to .scrollTargetBehavior(_:).",
                "macOS 15+. Pre-15 use a separate behavior per branch; SwiftUI can't switch behaviors at runtime without erasure.",
                "Wrapping is cheap; the SwiftUI invalidation system updates the scroll view as the wrapped value changes.",
                "base exposes the underlying behavior if you need to introspect its type.",
                "Useful for size-class-dependent paging vs view-aligned UX."
            ]
        )
    }
}

#Preview {
    AnyScrollTargetBehaviorDescribePage().frame(width: 900, height: 700)
}
