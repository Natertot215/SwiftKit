import SwiftUI

// SwiftUI `Anchor` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/anchor.md
// macOS 10.15+. Generic value derived from an anchor source and a particular view.

struct AnchorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Anchor",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/anchor.md",
            availability: "macOS 10.15+",
            blurb: """
            An opaque value carrying a geometric reference (point, rect, etc.) \
            anchored to a specific view in the layout tree. Generic over the \
            value type — `Anchor<CGPoint>`, `Anchor<CGRect>` are the common \
            instantiations.

            You don't construct an Anchor directly. You produce one with an \
            Anchor.Source (e.g., .center, .topLeading, .bounds, .rect(_:)) and \
            propagate it via .anchorPreference or .transformAnchorPreference. \
            Downstream views then resolve the anchor into a concrete value by \
            subscripting a GeometryProxy:

                GeometryReader { proxy in
                    if let anchor = anchorValue {
                        let point = proxy[anchor]   // CGPoint in proxy's space
                        // ...
                    }
                }

            That subscript projects the anchor — wherever the source view ended \
            up in the layout tree — into the GeometryProxy's coordinate space.

            Anchor is the bridge that lets one view announce "here is where I \
            am" and an unrelated view (a tooltip, a connector line, a drag \
            target) read that location without sharing parent state.
            """,
            signatures: [
                "@frozen struct Anchor<Value>: Equatable, Hashable, Sendable",
                "struct Anchor.Source<Value>",
                "// Source factories (Anchor<CGPoint>.Source / Anchor<CGRect>.Source)",
                "static let center, topLeading, bottomTrailing: Anchor<CGPoint>.Source",
                "static let bounds: Anchor<CGRect>.Source",
                "static func point(_: CGPoint) -> Anchor<CGPoint>.Source",
                "static func rect(_: CGRect) -> Anchor<CGRect>.Source",
                "// Resolution",
                "geometryProxy[anchor] // returns Value in proxy's space"
            ],
            notes: [
                "Generic value type \u{2014} parameterised by what's anchored (CGPoint, CGRect, ...).",
                "Hashable / Equatable / Sendable \u{2014} safe to store in preferences.",
                "Produced via Anchor.Source values; emitted via .anchorPreference / .transformAnchorPreference.",
                "Resolved via GeometryProxy.subscript(_:Anchor) into the proxy's coordinate space.",
                "Pair with PreferenceKey to ferry anchors up the view hierarchy.",
                "Common use: connectors, tooltips, popovers that target a sibling's bounds."
            ]
        )
    }
}

#Preview {
    AnchorDescribePage().frame(width: 900, height: 700)
}
