import SwiftUI

// Describe-track page for NSSearchFieldCell.
// Source: Documentation/AppKit/views-and-controls/nssearchfieldcell.md

struct NSSearchFieldCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSearchFieldCell",
            docPath: "Documentation/AppKit/views-and-controls/nssearchfieldcell.md",
            availability: "macOS",
            blurb: """
            The NSCell subclass that NSSearchField uses to draw its UI: the \
            magnifying-glass button at the leading edge, the cancel button at \
            the trailing edge, the text field in between, and the recent \
            searches pop-up menu.

            Reach for NSSearchFieldCell directly only when you embed search \
            behavior inside another cell-based surface. For a standalone \
            search field, configure NSSearchField — it forwards every property \
            to the cell.

            Cell-level configuration mirrors the control:

              \u{2022} Buttons — searchButtonCell, cancelButtonCell, \
            resetSearchButtonCell(), resetCancelButtonCell().
              \u{2022} Layout — searchTextRect(forBounds:), \
            searchButtonRect(forBounds:), cancelButtonRect(forBounds:).
              \u{2022} Menu template — searchMenuTemplate.
              \u{2022} Modes — sendsWholeSearchString, sendsSearchStringImmediately.
              \u{2022} History — maximumRecents, recentSearches, \
            recentsAutosaveName.
              \u{2022} Menu tags — recentsTitleMenuItemTag, recentsMenuItemTag, \
            clearRecentsMenuItemTag, noRecentsMenuItemTag.
            """,
            signatures: [
                "class NSSearchFieldCell : NSTextFieldCell",
                "var searchMenuTemplate: NSMenu?",
                "var sendsWholeSearchString: Bool",
                "var sendsSearchStringImmediately: Bool",
                "var maximumRecents: Int",
                "var recentSearches: [String]",
                "var recentsAutosaveName: NSSearchField.RecentsAutosaveName?"
            ],
            notes: [
                "Inherits NSTextFieldCell — the cell-level equivalent of NSSearchField inheriting NSTextField.",
                "When the user types and pauses, the cell sends its action to its target. Don't rely on the menu being the sender — it may change.",
                "The renderable surface lives on the NSSearchField page — that's where you instantiate the wrapping control."
            ]
        )
    }
}

#Preview {
    NSSearchFieldCellDescribePage().frame(width: 900, height: 700)
}
