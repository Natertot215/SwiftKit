import SwiftUI

// Describe-track page for the "Scroll View" overview article.
// Source: Documentation/AppKit/views-and-controls/scroll-view.md
// "Scroll View" is a collectionGroup overview page in Apple's docs — it groups
// the five classes that make up AppKit's scrolling and ruler machinery
// (NSScrollView, NSScroller, NSClipView, NSRulerView, NSRulerMarker). The
// renderable demo lives on the NSScrollView page; this page documents the
// grouping and how the pieces fit together.

struct ScrollViewDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Scroll View",
            docPath: "Documentation/AppKit/views-and-controls/scroll-view.md",
            availability: "macOS (NSScrollView and supporting types)",
            blurb: """
            Apple's documentation groups five AppKit classes under "Scroll View" — \
            NSScrollView, NSScroller, NSClipView, NSRulerView, NSRulerMarker. \
            Together they provide an interface for navigating content that's \
            too large to fit in the available space.

            How the pieces compose:

              \u{2022} NSScrollView is the central coordinator and the only one \
            most apps interact with directly. It owns a documentView (the \
            content) and a contentView (the NSClipView clipping it).
              \u{2022} NSClipView holds the document view and clips it to the \
            scroll view's frame. You usually don't touch the clip view — \
            NSScrollView delegates background-drawing properties to it \
            automatically.
              \u{2022} NSScroller draws the scroll bars themselves. The scroll \
            view configures them as needed.
              \u{2022} NSRulerView and NSRulerMarker provide optional rulers \
            and marker symbols above or beside the document view, used by \
            text-editing apps for tab stops, margins, and similar guides.

            For modern code, prefer NSScrollView at the top and let the other \
            classes compose underneath. SwiftUI's ScrollView is the modern \
            equivalent for new code; NSScrollView remains the right choice \
            when wrapping NSTextView, NSTableView, NSCollectionView, or \
            anything else that needs AppKit's text-view ruler integration.
            """,
            signatures: [
                "class NSScrollView : NSView",
                "class NSScroller   : NSControl",
                "class NSClipView   : NSView",
                "class NSRulerView  : NSView",
                "class NSRulerMarker"
            ],
            notes: [
                "Doc kind: collectionGroup. The article itself defines no API — it points to NSScrollView (coordinator), NSScroller (scroll bars), NSClipView (clip), NSRulerView (rulers), NSRulerMarker (markers).",
                "NSScrollView's docs explicitly say: when an NSClipView is inside an NSScrollView (the usual config), call background-related setters on the scroll view, not the clip view.",
                "Rulers attach via NSScrollView.hasHorizontalRuler / hasVerticalRuler and become visible when rulersVisible is true. Use NSRulerView only inside an NSScrollView.",
                "See Also targets in the doc: NSSplitView, NSStackView, NSTabView, Grid View — Apple groups these as the layout-container family.",
                "Magnification, floating subviews, and content-insets all live on NSScrollView. Most app code never touches NSClipView or NSScroller directly."
            ]
        )
    }
}

#Preview {
    ScrollViewDescribePage()
        .frame(width: 900, height: 700)
}
