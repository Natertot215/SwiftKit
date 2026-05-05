import SwiftUI

// SwiftUI `ScrollViewProxy` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollviewproxy.md
// macOS 11.0+. The value type vended by ScrollViewReader's content closure.

struct ScrollViewProxyDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollViewProxy",
            docPath: "Documentation/SwiftUI/scroll-views/scrollviewproxy.md",
            availability: "macOS 11.0+",
            blurb: """
            A proxy value that supports programmatic scrolling of the scrollable views \
            within a view hierarchy. You don't construct ScrollViewProxy directly \u{2014} \
            it is vended to the closure of ScrollViewReader.

            The proxy exposes a single primary action:
            \u{2022} scrollTo(_:anchor:) \u{2014} scrolls to the descendant view tagged \
            with a matching .id(_:) value, optionally anchoring it inside the visible region.

            Apple's docs explicitly forbid using the proxy during execution of the content \
            view builder; doing so is a runtime error. Only actions created within content \
            (gesture handlers, button actions, .onChange) can call the proxy.

            See View/ScrollViewReader for a working demo \u{2014} the buttons there call \
            proxy.scrollTo(_:anchor:) inside an .onChange handler.
            """,
            signatures: [
                "struct ScrollViewProxy",
                "func scrollTo<ID>(_ id: ID, anchor: UnitPoint? = nil) where ID : Hashable"
            ],
            notes: [
                "Vended only by ScrollViewReader \u{2014} not directly constructible.",
                "scrollTo target must match a view's .id(_:) of the same Hashable type.",
                "Wrap the call in withAnimation { \u{2026} } for an animated scroll.",
                "Calling the proxy synchronously inside the body view builder is a runtime error.",
                "For two-way binding (read and write the visible id) prefer scrollPosition(id:anchor:) on macOS 14+."
            ]
        )
    }
}

#Preview {
    ScrollViewProxyDescribePage().frame(width: 900, height: 700)
}
