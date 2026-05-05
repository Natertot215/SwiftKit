import SwiftUI

// Describe-track page for NSScroller.
// Source: Documentation/AppKit/views-and-controls/nsscroller.md
// NSScroller is the scroll-bar control class. Apple's docs explicitly say:
// "Typically, you don't need to program with scrollers; instead, you configure
// them with an NSScrollView object." Standalone NSScroller instances exist but
// are rare in modern apps — overlay scrollers, system-wide scroller-style
// preferences, and NSScrollView's auto-wired scrollers cover almost every
// case. Documenting via Describe rather than instantiating a bare scroller.

struct NSScrollerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSScroller",
            docPath: "Documentation/AppKit/views-and-controls/nsscroller.md",
            availability: "macOS",
            blurb: """
            An object that controls scrolling of a document view within a \
            scroll view or other type of container view. A scroller displays a \
            slot containing a knob the user can drag — the knob's position \
            represents the visible portion of the document, and its size \
            (relative to the slot) represents how much of the document is \
            currently visible.

            Apple's documentation is explicit: "Typically, you don't need to \
            program with scrollers; instead, you configure them with an \
            NSScrollView object." NSScrollView creates and manages its \
            horizontal and vertical scrollers; you configure which scrollers \
            exist via hasVerticalScroller / hasHorizontalScroller / \
            autohidesScrollers, and the rest is automatic. Direct NSScroller \
            use shows up only in custom container views that mimic scroll-view \
            behavior without using NSScrollView itself.

            The platform-wide scroller style (legacy gutter scrollers vs. \
            overlay scrollers that fade out) is governed by the system \
            preference and exposed through NSScroller.preferredScrollerStyle, \
            with NSScroller.preferredScrollerStyleDidChangeNotification firing \
            when the user toggles "Show scroll bars" in System Settings.
            """,
            signatures: [
                "class NSScroller : NSControl",
                "class var preferredScrollerStyle: NSScroller.Style { get }",
                "class func scrollerWidth(for controlSize: NSControl.ControlSize, scrollerStyle: NSScroller.Style) -> CGFloat",
                "class let preferredScrollerStyleDidChangeNotification: Notification.Name",
                "class var isCompatibleWithOverlayScrollers: Bool { get }",
                "var scrollerStyle: NSScroller.Style",
                "var knobStyle: NSScroller.KnobStyle",
                "var arrowsPosition: NSScroller.ArrowPosition",
                "var knobProportion: CGFloat",
                "var hitPart: NSScroller.Part { get }",
                "var usableParts: NSScroller.UsableParts { get }",
                "func rect(for part: NSScroller.Part) -> NSRect",
                "func testPart(_ point: NSPoint) -> NSScroller.Part",
                "func drawKnob()",
                "func drawKnobSlot(in slotRect: NSRect, highlight: Bool)",
                "func drawArrow(_ whichArrow: NSScroller.Arrow, highlight: Bool)",
                "func trackKnob(with event: NSEvent)",
                "func trackScrollButtons(with event: NSEvent)"
            ],
            notes: [
                "Inherits NSControl. Apple recommends configuring scrollers through NSScrollView rather than instantiating NSScroller directly.",
                "preferredScrollerStyle reflects the system preference; the user toggles it under System Settings > Appearance > Show scroll bars.",
                "Style cases (NSScroller.Style): .legacy (always-visible gutter scrollers), .overlay (modern fade-out scrollers).",
                "KnobStyle cases (NSScroller.KnobStyle): .default, .light, .dark — only meaningful for overlay scrollers; pick a contrast that reads against the document content.",
                "Part cases (NSScroller.Part): .noPart, .knob, .knobSlot, .decrementPage, .incrementPage, .decrementLine, .incrementLine. Used by hitPart and testPart for hit testing.",
                "preferredScrollerStyleDidChangeNotification fires app-wide when the user toggles scroller visibility — observe to update custom scrollable containers.",
                "Subclassing entry points: drawKnob(), drawKnobSlot(in:highlight:), drawArrow(_:highlight:), trackKnob(with:) for fully custom appearance / behavior."
            ]
        )
    }
}

#Preview {
    NSScrollerDescribePage()
        .frame(width: 900, height: 700)
}
