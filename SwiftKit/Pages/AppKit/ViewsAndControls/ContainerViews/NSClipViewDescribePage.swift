import SwiftUI

// Describe-track page for NSClipView.
// Source: Documentation/AppKit/views-and-controls/nsclipview.md
// Apple's docs explicitly say: "You don't typically use the NSClipView class
// directly; it's provided primarily as the scrolling machinery for the
// NSScrollView class." Standalone instantiation is rare; the renderable
// surface lives on NSScrollView, where the clip view is created and managed
// for you.

struct NSClipViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSClipView",
            docPath: "Documentation/AppKit/views-and-controls/nsclipview.md",
            availability: "macOS",
            blurb: """
            An object that clips a document view to a scroll view's frame. \
            NSClipView holds the documentView of an NSScrollView, clips it to \
            its own frame, handles scrolling efficiently, and notifies the \
            NSScrollView when the document view's size or position changes.

            Apple's documentation is explicit: "You don't typically use the \
            NSClipView class directly; it's provided primarily as the scrolling \
            machinery for the NSScrollView class." Standalone clip views are \
            rare. The standard advice is even stronger — when an NSClipView is \
            inside an NSScrollView (the usual configuration), call \
            background-related properties (drawsBackground, backgroundColor) on \
            the scroll view, not the clip view, because the scroll view defers \
            to the clip view to maintain that state and setting drawsBackground \
            directly on the clip view can introduce scroll trails.

            Where NSClipView shows up in code is content-inset and visible-rect \
            queries: contentInsets and automaticallyAdjustsContentInsets sit on \
            the clip view; documentVisibleRect tells you what part of the \
            document view is currently visible; viewFrameChanged(_:) and \
            viewBoundsChanged(_:) are override points if you implement an \
            NSScrollView-like container yourself.
            """,
            signatures: [
                "class NSClipView : NSView",
                "var documentView: NSView?",
                "var documentRect: NSRect { get }",
                "var documentVisibleRect: NSRect { get }",
                "var documentCursor: NSCursor?",
                "var contentInsets: NSEdgeInsets",
                "var automaticallyAdjustsContentInsets: Bool",
                "var drawsBackground: Bool",
                "var backgroundColor: NSColor",
                "func scroll(to newOrigin: NSPoint)",
                "func autoscroll(with event: NSEvent) -> Bool",
                "func constrainBoundsRect(_ proposedBounds: NSRect) -> NSRect",
                "func viewBoundsChanged(_ notification: Notification)",
                "func viewFrameChanged(_ notification: Notification)"
            ],
            notes: [
                "Apple: \"You don't typically use the NSClipView class directly.\" The renderable demo lives on NSScrollView.",
                "Inherits NSView. The clip view sits between NSScrollView and the documentView and handles the scroll-cycle bookkeeping.",
                "When inside an NSScrollView, set drawsBackground / backgroundColor on the scroll view — NSScrollView delegates to the clip view, and there is only one background-drawing state for the pair.",
                "Setting drawsBackground = false on the scroll view also implicitly sets copiesOnScroll = false on the clip view; setting drawsBackground directly on the clip view can leave \"trails\" of previous drawing during scrolling.",
                "Override constrainBoundsRect(_:) when you need to clamp where the clip view can scroll (replaces the deprecated constrainScroll(_:)).",
                "contentInsets / automaticallyAdjustsContentInsets are how scroll views reserve space at the top or bottom of the visible area for accessory views (toolbar overlays, search-bar style headers)."
            ]
        )
    }
}

#Preview {
    NSClipViewDescribePage()
        .frame(width: 900, height: 700)
}
