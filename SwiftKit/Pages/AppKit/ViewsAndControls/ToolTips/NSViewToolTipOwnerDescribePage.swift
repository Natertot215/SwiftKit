import SwiftUI

// AppKit Views and Controls / Tool tips describe page.
// Covers: NSViewToolTipOwner — the protocol used to dynamically supply tool
// tip strings for arbitrary regions of an NSView at runtime.
// Source: Documentation/AppKit/views-and-controls/nsviewtooltipowner.md
//
// Why describe rather than render: This is a protocol. The visible effect
// (tooltip-on-hover) is identical to NSView.toolTip = "..."; the protocol's
// distinguishing surface is the dynamic per-rect lookup callback, which
// requires hovering over a custom NSView region. SwiftUI alternative for a
// renderable demo is the .help(_:) modifier.

struct NSViewToolTipOwnerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSViewToolTipOwner",
            docPath: "Documentation/AppKit/views-and-controls/nsviewtooltipowner.md",
            availability: "macOS",
            blurb: """
            A set of methods for dynamically associating a tool tip with a \
            view. Adopt this protocol when you want different tool tip text \
            for different regions of the same NSView, computed lazily on \
            hover.

            Lifecycle:

              \u{2022} Register a tool tip rect on the view: \
            view.addToolTipRect(_:owner:userData:). The owner can be self or \
            any object conforming to NSViewToolTipOwner.
              \u{2022} When the user hovers over the rect, AppKit calls \
            view(_:stringForToolTip:point:userData:) on the owner.
              \u{2022} Return the desired tool-tip string for that point in \
            view coordinates; AppKit displays it.

            For a single static tool tip, set NSView.toolTip directly — no \
            need for this protocol. Reach for NSViewToolTipOwner only when \
            the tooltip text varies by region or by app state.

            SwiftUI equivalent: the .help(_:) modifier provides the static \
            single-string case. A region-varying tool tip in SwiftUI requires \
            an NSViewRepresentable bridging this AppKit API.
            """,
            signatures: [
                "protocol NSViewToolTipOwner : NSObjectProtocol",
                "func view(_ view: NSView, stringForToolTip tag: NSView.ToolTipTag, point: NSPoint, userData: UnsafeMutableRawPointer?) -> String"
            ],
            notes: [
                "Built-in conformers: NSForm, NSMatrix, NSTableHeaderView. Most apps register their own NSView subclass (or some controller) as the owner.",
                "Pair with NSView.addToolTipRect(_:owner:userData:) and NSView.removeAllToolTips() — those manage the rect-to-owner mapping.",
                "userData is an UnsafeMutableRawPointer — use it for lightweight tagging, not for owning Swift references. Capture stronger state on the owner itself.",
                "If the conformer doesn't implement this method, AppKit falls back to the object's NSObjectProtocol.description.",
                "For static, full-view tool tips just set NSView.toolTip — don't reach for this protocol."
            ]
        )
    }
}

#Preview {
    NSViewToolTipOwnerDescribePage()
        .frame(width: 900, height: 700)
}
