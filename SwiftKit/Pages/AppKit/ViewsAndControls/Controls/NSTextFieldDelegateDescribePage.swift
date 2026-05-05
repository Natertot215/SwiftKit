import SwiftUI

// Describe-track page for NSTextFieldDelegate.
// Source: Documentation/AppKit/views-and-controls/nstextfielddelegate.md

struct NSTextFieldDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTextFieldDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nstextfielddelegate.md",
            availability: "macOS",
            blurb: """
            Optional methods you implement to drive an NSTextField's autocomplete \
            candidate list. The protocol inherits from \
            NSControlTextEditingDelegate, so a single delegate also receives \
            every controlText… editing notification (begin / change / end \
            editing, validation, key bindings).

            The text-field-specific surface is small — three methods that \
            together feed the inline candidate menu shown above the field \
            during typing:

              \u{2022} textField(_:textView:candidates:forSelectedRange:) — \
            return the array of candidate strings to show.
              \u{2022} textField(_:textView:candidatesForSelectedRange:) — \
            return rich candidate objects (NSTextCheckingResult).
              \u{2022} textField(_:textView:shouldSelectCandidateAt:) — gate \
            programmatic selection of a candidate.

            For most apps the inherited NSControlTextEditingDelegate methods \
            (controlTextDidChange, etc.) are the entry points you actually \
            implement.
            """,
            signatures: [
                "protocol NSTextFieldDelegate : NSControlTextEditingDelegate",
                "func textField(_ textField: NSTextField, textView: NSTextView, candidates: [Any], forSelectedRange selectedRange: NSRange) -> [Any]",
                "func textField(_ textField: NSTextField, textView: NSTextView, candidatesForSelectedRange selectedRange: NSRange) -> [Any]?",
                "func textField(_ textField: NSTextField, textView: NSTextView, shouldSelectCandidateAt index: Int) -> Bool",
                "// Inherited By: NSComboBoxDelegate, NSSearchFieldDelegate, NSTokenFieldDelegate"
            ],
            notes: [
                "Inherits NSControlTextEditingDelegate — that's where the textShouldBeginEditing / controlTextDidChange / textShouldEndEditing methods live.",
                "NSComboBoxDelegate, NSSearchFieldDelegate, and NSTokenFieldDelegate all inherit NSTextFieldDelegate, so the same implementation can drive any of those controls.",
                "isAutomaticTextCompletionEnabled on the host NSTextField gates whether the candidate methods are called at all."
            ]
        )
    }
}

#Preview {
    NSTextFieldDelegateDescribePage().frame(width: 900, height: 700)
}
