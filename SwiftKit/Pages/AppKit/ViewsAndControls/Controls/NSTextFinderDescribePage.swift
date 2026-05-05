import SwiftUI

// Describe-track page for NSTextFinder.
// Source: Documentation/AppKit/views-and-controls/nstextfinder.md
// NSTextFinder is a controller for Cocoa's standard find bar. The renderable
// surface lives inside an NSScrollView / NSTextView pair (both already
// adopt the supporting protocols), not as a standalone view — Describe is
// the right kind of page.

struct NSTextFinderDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTextFinder",
            docPath: "Documentation/AppKit/views-and-controls/nstextfinder.md",
            availability: "macOS 10.7+",
            blurb: """
            An optional search-and-replace find interface inside a view, \
            usually a scroll view. NSTextFinder is a controller, not a \
            view — it manages Cocoa's standard find bar (Cmd-F) by talking \
            to two objects:

              \u{2022} A "client" — an object adopting NSTextFinderClient that \
            owns the searchable content. NSTextView already conforms.
              \u{2022} A "container" — an object adopting \
            NSTextFinderBarContainer that owns the view real estate where the \
            find bar appears. NSScrollView already conforms.

            For most apps, the renderable side is just \
            textView.usesFindBar = true on a text view inside a scroll view; \
            AppKit instantiates and owns the NSTextFinder for you. \
            Instantiate NSTextFinder directly only when implementing find on \
            a custom non-text-view content surface.

            Menu hookup: every find-related menu item (Find…, Find Next, Find \
            Previous, Use Selection for Find, Replace, Replace All, etc.) \
            should target NSResponder.performTextFinderAction(_:) and use the \
            corresponding NSTextFinder.Action raw value as its tag. The \
            responder chain routes that to the owning text-finder, which \
            calls performAction(_:) on itself.

            Incremental search: set isIncrementalSearchingEnabled = true to \
            highlight all matches as the user types. NSScrollView provides \
            the dimming overlay automatically; on custom containers the \
            client supplies visibleCharacterRanges + drawCharacters.
            """,
            signatures: [
                "class NSTextFinder : NSObject",
                "init()",
                "weak var client: NSTextFinderClient?",
                "weak var findBarContainer: NSTextFinderBarContainer?",
                "func performAction(_ action: NSTextFinder.Action)",
                "func validateAction(_ action: NSTextFinder.Action) -> Bool",
                "var isIncrementalSearchingEnabled: Bool",
                "var incrementalMatchRanges: [NSValue]"
            ],
            notes: [
                "The simplest adoption is one line: textView.usesFindBar = true. AppKit instantiates the NSTextFinder, makes the text view both client and container's owner, and wires the find menu.",
                "NSScrollView's findBarPosition determines whether the find bar appears above or below the document view; default behavior matches Cocoa convention.",
                "When the client supplies content via string(at:effectiveRange:endsWithSearchBoundary:), set endsWithSearchBoundary = true at logical breaks (e.g. between two emails) so a search match doesn't span them.",
                "Renderable surface: any NSScrollView / NSTextView pair with usesFindBar = true demonstrates this API end-to-end. There is no \"NSTextFinder view\" to embed."
            ]
        )
    }
}

#Preview {
    NSTextFinderDescribePage().frame(width: 900, height: 700)
}
