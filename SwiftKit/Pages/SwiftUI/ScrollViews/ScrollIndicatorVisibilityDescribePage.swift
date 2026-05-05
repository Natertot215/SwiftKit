import SwiftUI

// SwiftUI `ScrollIndicatorVisibility` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollindicatorvisibility.md
// macOS 13.0+. Value type passed to scrollIndicators(_:axes:).

struct ScrollIndicatorVisibilityDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollIndicatorVisibility",
            docPath: "Documentation/SwiftUI/scroll-views/scrollindicatorvisibility.md",
            availability: "macOS 13.0+",
            blurb: """
            A struct describing the preferred visibility of scroll indicators \
            along a scrollable view's axes. Pass an instance to \
            scrollIndicators(_:axes:) to set the preference for a view \
            hierarchy.

            Four static cases:
            \u{2022} automatic \u{2014} let the platform decide. On macOS, indicators \
              are typically transient and surface while scrolling.
            \u{2022} visible \u{2014} prefer indicators be shown. Platform conventions \
              still apply (macOS may still hide them while idle).
            \u{2022} hidden \u{2014} hide the steady-state indicator, but permit \
              scrollIndicatorsFlash to surface it briefly.
            \u{2022} never \u{2014} fully suppress; even flash modifiers do nothing.

            For a working demo, see View/scrollIndicators(_:axes:).
            """,
            signatures: [
                "struct ScrollIndicatorVisibility",
                "static let automatic: ScrollIndicatorVisibility",
                "static let visible: ScrollIndicatorVisibility",
                "static let hidden: ScrollIndicatorVisibility",
                "static let never: ScrollIndicatorVisibility"
            ],
            notes: [
                "Conforms to Equatable. Compare visibility values directly with ==.",
                ".hidden and .never differ in their interaction with scrollIndicatorsFlash \u{2014} .hidden allows flashes; .never blocks them.",
                "The horizontalScrollIndicatorVisibility and verticalScrollIndicatorVisibility environment values let descendants read the active visibility per-axis.",
                "Pre-13: not available \u{2014} use NSScrollView's hasHorizontalScroller / hasVerticalScroller via NSViewRepresentable for finer control on older targets."
            ]
        )
    }
}

#Preview {
    ScrollIndicatorVisibilityDescribePage().frame(width: 900, height: 700)
}
