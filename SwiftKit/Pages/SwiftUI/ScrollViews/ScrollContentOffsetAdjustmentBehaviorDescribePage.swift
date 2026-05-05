import SwiftUI

// SwiftUI `ScrollContentOffsetAdjustmentBehavior` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollcontentoffsetadjustmentbehavior.md
// macOS 15.0+.

struct ScrollContentOffsetAdjustmentBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollContentOffsetAdjustmentBehavior",
            docPath: "Documentation/SwiftUI/scroll-views/scrollcontentoffsetadjustmentbehavior.md",
            availability: "macOS 15.0+",
            blurb: """
            A struct describing how a scroll view should behave when its \
            content size changes. By default a scroll view automatically \
            re-anchors when content is inserted (so the user sees the same \
            piece of content stay still), but for chat-style feeds you want \
            insertions at the top to push existing content down without \
            jumping the scroll position.

            Two cases:
            \u{2022} automatic \u{2014} the scroll view adjusts contentOffset to \
              preserve the visible content as content size changes. This is the \
              default for most scroll views.
            \u{2022} disabled \u{2014} the scroll view does not auto-adjust. The \
              user-visible position depends only on the scroll position state, \
              which is what you want for prepended chat-style content.

            This type is the value side of a forthcoming environment-key / \
            modifier; you typically reach for it via the scroll content \
            offset adjustment API surface.
            """,
            signatures: [
                "struct ScrollContentOffsetAdjustmentBehavior",
                "static var automatic: ScrollContentOffsetAdjustmentBehavior",
                "static var disabled: ScrollContentOffsetAdjustmentBehavior"
            ],
            notes: [
                "Use .disabled when prepending content to a list while the user is reading older content \u{2014} a chat scrollback or activity feed.",
                "Use .automatic (default) when content insertions should preserve the user's current visual focus regardless of where they happen.",
                "Pair with defaultScrollAnchor(.bottom) for chat-style UIs \u{2014} that pins on first paint and on size grow; this then governs whether older insertions yank the offset.",
                "Pre-15: not available \u{2014} previous SwiftUI scroll views always re-anchored automatically."
            ]
        )
    }
}

#Preview {
    ScrollContentOffsetAdjustmentBehaviorDescribePage().frame(width: 900, height: 700)
}
