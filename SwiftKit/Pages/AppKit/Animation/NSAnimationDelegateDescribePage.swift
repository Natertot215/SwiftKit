import SwiftUI

// Describe-track page for NSAnimationDelegate.
// Source: Documentation/AppKit/animation/nsanimationdelegate.md
// Protocol — implemented on a delegate object to control or monitor an
// NSAnimation. Not renderable on its own.

struct NSAnimationDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSAnimationDelegate",
            docPath: "Documentation/AppKit/animation/nsanimationdelegate.md",
            availability: "macOS 10.4+",
            blurb: """
            A set of optional methods implemented by delegates of NSAnimation objects. The delegate \
            lets you veto an animation before it starts (animationShouldStart), respond when it ends \
            normally or is stopped early (animationDidEnd / animationDidStop), supply a custom mapped \
            value for each progress sample (animation(_:valueForProgress:)), or be notified when a \
            registered progress mark is reached (animation(_:didReachProgressMark:)). All methods are \
            optional — implement only the ones you need. NSTitlebarAccessoryViewController is the only \
            AppKit class that conforms to this protocol; in app code it is almost always adopted on \
            a custom controller or coordinator object.
            """,
            signatures: [
                "protocol NSAnimationDelegate : NSObjectProtocol",
                "func animationShouldStart(_ animation: NSAnimation) -> Bool",
                "func animationDidEnd(_ animation: NSAnimation)",
                "func animationDidStop(_ animation: NSAnimation)",
                "func animation(_ animation: NSAnimation, valueForProgress progress: NSAnimation.Progress) -> Float",
                "func animation(_ animation: NSAnimation, didReachProgressMark progress: NSAnimation.Progress)"
            ],
            notes: [
                "Wire up with: animation.delegate = self after conforming the delegate type to NSAnimationDelegate.",
                "animation(_:valueForProgress:) overrides the default animation curve — return your own mapping of progress -> value for arbitrary easing.",
                "Progress marks are registered with NSAnimation.addProgressMark(_:); the delegate is notified whenever the animation crosses one.",
                "animationShouldStart returning false aborts the animation before it begins."
            ]
        )
    }
}

#Preview {
    NSAnimationDelegateDescribePage()
        .frame(width: 900, height: 700)
}
