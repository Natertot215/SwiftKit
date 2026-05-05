import SwiftUI

// Describe-track page for NSTextFinderBarContainer.
// Source: Documentation/AppKit/views-and-controls/nstextfinderbarcontainer.md

struct NSTextFinderBarContainerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTextFinderBarContainer",
            docPath: "Documentation/AppKit/views-and-controls/nstextfinderbarcontainer.md",
            availability: "macOS",
            blurb: """
            A protocol that an object adopts to host Cocoa's standard find \
            bar inside its view hierarchy. The container provides the strip \
            of UI real estate the find bar lives in.

            NSScrollView already conforms — most apps never need to adopt \
            this protocol manually. Only adopt it when you build a custom \
            scroll-or-search container that doesn't use NSScrollView.

            Container responsibilities:

              \u{2022} findBarView — the find bar's own view. NSTextFinder \
            assigns this property; the container retains it and inserts it \
            in its view hierarchy when isFindBarVisible becomes true.
              \u{2022} contentView() — the view that's being searched, used \
            by NSTextFinder to position its find indicator.
              \u{2022} isFindBarVisible — drives show / hide of the find bar.
              \u{2022} findBarViewDidChangeHeight() — react to user-driven \
            height changes (rare; the bar grows when "Replace" is exposed).

            Do not modify the find-bar view's height directly — only its \
            width. NSTextFinder owns the height and signals changes via \
            findBarViewDidChangeHeight().
            """,
            signatures: [
                "protocol NSTextFinderBarContainer : NSObjectProtocol",
                "var findBarView: NSView? { get set }",
                "func contentView() -> NSView?",
                "var isFindBarVisible: Bool { get set }",
                "func findBarViewDidChangeHeight()",
                "// Conforming Type: NSScrollView"
            ],
            notes: [
                "Default Cocoa adoption: NSScrollView. If your text lives inside an NSScrollView, you already have a working container.",
                "When isFindBarVisible toggles, the container should add/remove the find-bar view from its hierarchy and animate the document view down/up to make room.",
                "NSScrollView's findBarPosition (above / below) controls where the bar appears; custom containers decide their own placement."
            ]
        )
    }
}

#Preview {
    NSTextFinderBarContainerDescribePage().frame(width: 900, height: 700)
}
