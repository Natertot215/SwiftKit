import SwiftUI

// SwiftUI `ViewAlignedScrollTargetBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/viewalignedscrolltargetbehavior.md
// macOS 14.0+. Concrete behavior that aligns scrolls to individual view geometry.

struct ViewAlignedScrollTargetBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ViewAlignedScrollTargetBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/viewalignedscrolltargetbehavior.md",
            availability: "macOS 14.0+",
            blurb: """
            The scroll behavior that aligns scroll targets to view-based geometry. Every \
            scroll gesture settles on a specific child view rather than a container-sized \
            page \u{2014} ideal for card carousels, photo strips, or any list of equally \
            sized items.

            Apply via .scrollTargetBehavior(.viewAligned). REQUIRES \
            .scrollTargetLayout() on the LazyHStack/LazyVStack inside the ScrollView so \
            SwiftUI knows which children are alignment candidates.

            ViewAlignedScrollTargetBehavior.LimitBehavior controls how many views can be \
            scrolled per gesture:
            \u{2022} .automatic \u{2014} default; limits in compact size classes only.
            \u{2022} .always \u{2014} only allow a few views per gesture in any size class.
            \u{2022} .never \u{2014} no limit; unrestricted scrolling.

            For a working demo see View/scrollTargetBehavior(_:), variant '.viewAligned'.
            """,
            signatures: [
                "struct ViewAlignedScrollTargetBehavior",
                "init(limitBehavior: LimitBehavior = .automatic)",
                "init(anchor: UnitPoint?)",
                "init(limitBehavior: LimitBehavior, anchor: UnitPoint?)",
                "enum ViewAlignedScrollTargetBehavior.LimitBehavior",
                "// usage: .scrollTargetBehavior(.viewAligned)"
            ],
            notes: [
                "Conforms to ScrollTargetBehavior.",
                "REQUIRES .scrollTargetLayout() inside the ScrollView; without it, has nothing to align to.",
                "Optional anchor: nudges where each settled view lands in the visible region.",
                "limitBehavior controls per-gesture distance \u{2014} default .automatic limits in compact size classes.",
                "Pair with .safeAreaPadding(.horizontal,) so first/last items remain reachable."
            ]
        )
    }
}

#Preview {
    ViewAlignedScrollTargetBehaviorDescribePage().frame(width: 900, height: 700)
}
