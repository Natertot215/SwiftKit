import SwiftUI

// Describe-track page for NSAnimationEffect.
// Source: Documentation/AppKit/animation/nsanimationeffect.md
// Enum — deprecated in macOS 14.0. Two cases (.disappearingItemDefault, .poof)
// plus the static show(centeredAt:size:completionHandler:) helper.
// Not renderable as a child SwiftUI view in a meaningful, predictable way:
// .show plays a system-level overlay animation outside the host window's
// content. This page documents the shape and notes the deprecation.

struct NSAnimationEffectDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSAnimationEffect",
            docPath: "Documentation/AppKit/animation/nsanimationeffect.md",
            availability: "macOS 10.3 (deprecated 14.0)",
            blurb: """
            The type for standard system animation effects. NSAnimationEffect plays an OS-level \
            overlay animation centered at a screen point — historically used to indicate that an \
            item was removed from a collection (such as a toolbar) without deleting the underlying \
            data. Two cases are defined: .disappearingItemDefault (the default disappearing-item \
            effect) and .poof (the classic Mac OS X "poof" cloud puff with sound). Trigger the \
            effect by calling show(centeredAt:size:completionHandler:) on the case value.

            Deprecated as of macOS 14.0 with no direct replacement. New code should drive removal \
            animations through SwiftUI transitions, NSAnimationContext.runAnimationGroup, or Core \
            Animation directly on the relevant view's layer.
            """,
            signatures: [
                "enum NSAnimationEffect: Int, @unchecked Sendable",
                "case disappearingItemDefault   // rawValue 0",
                "case poof                      // rawValue 10",
                "func show(centeredAt: NSPoint, size: NSSize, completionHandler: (() -> Void)? = nil)",
                "init?(rawValue: Int)"
            ],
            notes: [
                "Deprecated in macOS 14.0 — surface unchanged on macOS 26 but slated for removal; do not adopt for new work.",
                "show(centeredAt:size:completionHandler:) draws a transient overlay above all windows at the supplied screen point. The completion handler fires when the overlay finishes.",
                "Modern equivalents: SwiftUI .transition(.scale.combined(with: .opacity)) on a removed item, NSAnimationContext.runAnimationGroup wrapping setAlpha, or CALayer transitions on the affected view's layer."
            ]
        )
    }
}

#Preview {
    NSAnimationEffectDescribePage()
        .frame(width: 900, height: 700)
}
