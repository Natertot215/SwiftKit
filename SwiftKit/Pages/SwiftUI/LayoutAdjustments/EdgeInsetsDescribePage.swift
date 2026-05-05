import SwiftUI

// SwiftUI `EdgeInsets` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/edgeinsets.md
// macOS 10.15+. Struct value type — per-edge inset amounts.

struct EdgeInsetsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "EdgeInsets",
            docPath: "Documentation/SwiftUI/layout-adjustments/edgeinsets.md",
            availability: "macOS 10.15+",
            blurb: """
            A struct that holds four CGFloat values, one for each edge of a rectangle. Used by \
            View/padding(_:), View/safeAreaPadding(_:), and any modifier that takes per-edge \
            insets in a single value.

            Properties:
            \u{2022} top: CGFloat
            \u{2022} leading: CGFloat
            \u{2022} bottom: CGFloat
            \u{2022} trailing: CGFloat

            Honors layout direction \u{2014} leading/trailing flip in right-to-left locales. Use \
            EdgeInsets when each edge needs its own amount; for one amount across some/all edges, \
            reach for the Edge.Set + CGFloat overload of the modifier.
            """,
            signatures: [
                "struct EdgeInsets",
                "init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)",
                "init()  //  zero on every edge",
                "static let zero: EdgeInsets",
                ".padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))",
                ".safeAreaPadding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))"
            ],
            notes: [
                "Conforms to Animatable, Equatable, Sendable.",
                "Animatable conformance means EdgeInsets values interpolate smoothly during animations \u{2014} useful for animated padding transitions.",
                "Initialized from NSDirectionalEdgeInsets (AppKit) via init(_:) on macOS \u{2014} bridges cleanly to AppKit code.",
                "Pre-macOS 13 EdgeInsets had no Sendable conformance \u{2014} on macOS 26 it does."
            ]
        )
    }
}

#Preview {
    EdgeInsetsDescribePage().frame(width: 900, height: 700)
}
