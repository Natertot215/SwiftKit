import SwiftUI

struct HoverEffectFamilyDescribePage: View {
    var body: some View {
        DescribePage(
            title: "HoverEffect Family (iOS / visionOS)",
            docPath: "Documentation/SwiftUI/input-events/",
            availability: "iOS 13.4+ / visionOS 1.0+",
            blurb: """
            SwiftUI's HoverEffect system provides visual feedback when a pointer or hand hovers \
            over a view. On iOS 13.4+ with a connected pointer device, hoverEffect(_:) applies \
            standard effects: .highlight dims to the accent color, .lift scales up, .automatic \
            picks based on context. The richer visionOS 2.0 API adds CustomHoverEffect (implement \
            body(content:phase:) to animate arbitrary view properties), HoverEffectContent and \
            EmptyHoverEffectContent (the building blocks), HoverEffectGroup and its modifier forms \
            for coordinating effects across multiple sibling views, and the view-body form \
            hoverEffect(in:isEnabled:body:). OrnamentHoverEffect and OrnamentHoverContentEffect \
            style visionOS ornament overlays. HandPointerBehavior / handPointerBehavior(_:) \
            fine-tunes how a spatial hand pointer targets elements. HoverEffectPhaseOverride \
            (visionOS 26) lets you lock the hover phase for Previews testing. \
            defaultHoverEffect(_:) and hoverEffectDisabled(_:) are iOS/visionOS only. \
            None are available on macOS 26 — macOS pointer hover is handled by \
            onHover(perform:) which is already wired.
            """,
            signatures: [
                ".hoverEffect(.highlight) — standard iOS/visionOS pointer effect",
                "HoverEffect — .automatic, .highlight, .lift",
                ".hoverEffect(in: namespace, isEnabled: true, body: { content, isActive in … }) — custom shape (visionOS 2.0)",
                "HoverEffectContent, CustomHoverEffect, EmptyHoverEffectContent",
                "HoverEffectGroup, .hoverEffectGroup(), .hoverEffectGroup(_:)",
                ".hoverEffectGroup(id:in:behavior:) — cross-view coordinated effects",
                "HoverEffectPhaseOverride — lock phase for testing (visionOS 26)",
                ".defaultHoverEffect(.lift) — default for child views",
                ".hoverEffectDisabled(true) — opt out",
                "OrnamentHoverEffect, OrnamentHoverContentEffect — visionOS ornament styling",
                ".handPointerBehavior(.dim) — visionOS hand pointer behavior",
                "HandPointerBehavior — .automatic, .dim, .hide"
            ],
            notes: [
                "On macOS, use .onHover(perform:) to respond to pointer hovering — no HoverEffect support.",
                "HoverEffectGroup coordinates effects across multiple sibling views — useful for card-hover that highlights an icon and dims a background simultaneously.",
                "hoverEffect(in:isEnabled:body:) requires visionOS 2.0 (macOS 26 SDK era)."
            ]
        )
    }
}

#Preview {
    HoverEffectFamilyDescribePage()
        .frame(width: 900, height: 700)
}
