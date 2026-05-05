import SwiftUI

// Describe-track page for NSTextFinderClient.
// Source: Documentation/AppKit/views-and-controls/nstextfinderclient.md

struct NSTextFinderClientDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSTextFinderClient",
            docPath: "Documentation/AppKit/views-and-controls/nstextfinderclient.md",
            availability: "macOS",
            blurb: """
            A protocol that an object adopts to provide an NSTextFinder with \
            the content being searched plus the visual feedback for matches. \
            NSTextView already conforms — most apps never adopt this manually.

            The protocol covers four concerns; implementations are mostly \
            optional, with the implemented set determining which find \
            actions are enabled:

              \u{2022} String access — implement either string (returns the \
            full searchable string) OR string(at:effectiveRange:\
            endsWithSearchBoundary:) + stringLength() (lazy, useful for \
            very large or chunked content). One of these is required.
              \u{2022} Selection — firstSelectedRange (required for next /\
            previous match), selectedRanges (required for select-all-in-\
            selection and replaceAllInSelection), isSelectable, \
            allowsMultipleSelection.
              \u{2022} Editability — isEditable (gates replace actions), \
            shouldReplaceCharacters(inRanges:with:), \
            replaceCharacters(in:with:), didReplaceCharacters().
              \u{2022} Display — contentView(at:effectiveCharacterRange:), \
            rects(forCharacterRange:), scrollRangeToVisible(_:), \
            visibleCharacterRanges, drawCharacters(in:forContentView:). \
            These power the yellow find-indicator highlight and incremental \
            match dimming.

            Default Cocoa adoption: NSTextView. Adopt this protocol only \
            when implementing find inside a custom non-text-view content \
            surface.
            """,
            signatures: [
                "protocol NSTextFinderClient : NSObjectProtocol",
                "var string: String { get }",
                "func string(at index: Int, effectiveRange: NSRangePointer, endsWithSearchBoundary: UnsafeMutablePointer<ObjCBool>) -> String",
                "func stringLength() -> Int",
                "var firstSelectedRange: NSRange { get }",
                "var selectedRanges: [NSValue] { get set }",
                "func shouldReplaceCharacters(inRanges ranges: [NSValue], with strings: [String]) -> Bool",
                "func replaceCharacters(in range: NSRange, with string: String)",
                "func contentView(at index: Int, effectiveCharacterRange: NSRangePointer) -> NSView",
                "func rects(forCharacterRange range: NSRange) -> [NSValue]?"
            ],
            notes: [
                "Default Cocoa adoption: NSTextView. Adopting this protocol on a custom view is the rare case — for a text view the only line you usually write is textView.usesFindBar = true.",
                "Implement endsWithSearchBoundary correctly when you provide chunked strings — without it, find matches can span chunks (e.g. straddle two email headers).",
                "Replace actions are only available when isEditable returns true and the three replace methods are implemented. NSTextFinder skips them otherwise."
            ]
        )
    }
}

#Preview {
    NSTextFinderClientDescribePage().frame(width: 900, height: 700)
}
