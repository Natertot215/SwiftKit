import SwiftUI

// Describe-track page for NSViewControllerPresentationAnimator.
// Source: Documentation/AppKit/animation/nsviewcontrollerpresentationanimator.md
// Protocol — adopted on a custom animator object passed to
// NSViewController.present(_:animator:). Not renderable on its own.

struct NSViewControllerPresentationAnimatorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSViewControllerPresentationAnimator",
            docPath: "Documentation/AppKit/animation/nsviewcontrollerpresentationanimator.md",
            availability: "macOS 10.10+",
            blurb: """
            A protocol you adopt on a custom animator object to define the animations that play \
            when an NSViewController is presented and dismissed. The animator owns both halves of \
            the transition — it must handle adding the presented view to the host hierarchy and \
            animating it in (animatePresentation), and animating it back out and removing it \
            (animateDismissal). Pass an instance to NSViewController.present(_:animator:) and \
            the system will invoke the appropriate method at each transition.

            For most apps the built-in transitions in NSViewController.TransitionOptions \
            (.slideUp, .slideDown, .crossfade, .effectFade, .effectMoveIn, .effectPush, etc.) \
            cover the standard cases — implement NSViewControllerPresentationAnimator only when \
            you need a transition not provided by that enumeration.
            """,
            signatures: [
                "protocol NSViewControllerPresentationAnimator : NSObjectProtocol",
                "func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController)",
                "func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController)",
                "// Wire-up site:",
                "fromViewController.present(viewController, animator: customAnimator)"
            ],
            notes: [
                "The animator is responsible for both presenting AND dismissing — the same object services the round trip.",
                "Inside animatePresentation you must add the presented view to fromViewController's view hierarchy (or its window) before animating.",
                "Inside animateDismissal you are responsible for removing the presented view from its superview when the animation completes.",
                "Built-in alternatives in NSViewController.TransitionOptions cover slide, crossfade, push, and reveal effects — try those before adopting this protocol."
            ]
        )
    }
}

#Preview {
    NSViewControllerPresentationAnimatorDescribePage()
        .frame(width: 900, height: 700)
}
