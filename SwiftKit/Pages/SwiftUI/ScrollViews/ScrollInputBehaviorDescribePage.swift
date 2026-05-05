import SwiftUI

// SwiftUI `ScrollInputBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollinputbehavior.md
// macOS 15.0+.

struct ScrollInputBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollInputBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/scrollinputbehavior.md",
            availability: "macOS 15.0+",
            blurb: """
            A struct describing whether a particular kind of input should be \
            allowed to scroll a view. You pass values of this type as the \
            first argument to scrollInputBehavior(_:for:).

            Three cases:
            \u{2022} automatic \u{2014} the platform's default behavior for the \
              targeted input kind.
            \u{2022} enabled \u{2014} explicitly allow this input to scroll.
            \u{2022} disabled \u{2014} block this input from scrolling. \
              scrollDisabled(true) overrides any .enabled here.

            For a working demo, see View/scrollInputBehavior(_:for:).
            """,
            signatures: [
                "struct ScrollInputBehavior",
                "static var automatic: ScrollInputBehavior",
                "static var enabled: ScrollInputBehavior",
                "static var disabled: ScrollInputBehavior"
            ],
            notes: [
                "Conforms to Equatable, Sendable.",
                "scrollDisabled(true) wins. If a parent has globally disabled scrolling, .enabled here cannot re-allow it.",
                ".automatic is the same as not setting the modifier at all \u{2014} useful for state-driven toggles where you want to fall back to the system default.",
                "Pre-15: not available \u{2014} earlier SwiftUI didn't expose per-input scroll behavior."
            ]
        )
    }
}

#Preview {
    ScrollInputBehaviorDescribePage().frame(width: 900, height: 700)
}
