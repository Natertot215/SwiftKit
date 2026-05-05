import SwiftUI

// Article-style describe page for the "Search Field" doc collection.
// Source: Documentation/AppKit/views-and-controls/search-field.md

struct SearchFieldDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Search Field",
            docPath: "Documentation/AppKit/views-and-controls/search-field.md",
            availability: "macOS",
            blurb: """
            Provide a text field optimized for text-based search interfaces. \
            AppKit groups five APIs under this collection: NSSearchField (the \
            rendered control), NSSearchFieldCell (the cell behind it), and \
            three NSTextFinder types that work with NSSearchField to drive a \
            "find bar" inside text views.

            Pick the right entry point:

              \u{2022} NSSearchField — embed in a window or a SwiftUI hierarchy \
            via NSViewRepresentable. Inherits NSTextField — same delegation, \
            same binding patterns.
              \u{2022} NSSearchFieldCell — instantiate when you embed search \
            behavior in another cell-based surface (rare).
              \u{2022} NSTextFinder + NSTextFinderBarContainer + \
            NSTextFinderClient — together implement Cocoa's standard "find \
            bar" inside an NSScrollView / NSTextView. NSScrollView already \
            adopts NSTextFinderBarContainer; NSTextView already adopts \
            NSTextFinderClient. Most apps just turn on \
            textView.usesFindBar = true.

            The renderable surface for search-as-you-type lives on the \
            NSSearchField page.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/search-field (collection)",
                "View: NSSearchField",
                "Cell: NSSearchFieldCell",
                "Search and Replace: NSTextFinder, NSTextFinderBarContainer, NSTextFinderClient"
            ],
            notes: [
                "An NSSearchField fires its action when the user pauses while typing or presses Return — query the cell's stringValue for the current text.",
                "sendsSearchStringImmediately controls whether the action fires every keystroke (true) or only after a brief pause (false). sendsWholeSearchString fires only on commit (Return / focus loss).",
                "Recent searches autosave through recentsAutosaveName — set a unique name and AppKit persists the user's history across launches."
            ]
        )
    }
}

#Preview {
    SearchFieldDescribePage().frame(width: 900, height: 700)
}
