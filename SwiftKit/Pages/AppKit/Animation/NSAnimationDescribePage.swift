import SwiftUI

// Describe-track page for NSAnimation.
// Source: Documentation/AppKit/animation/nsanimation.md
// NSAnimation is the abstract base class for AppKit's standalone animation
// objects. Per the Apple subclassing notes, the standard usage pattern is to
// subclass and override currentProgress to drive your own drawing — the bare
// NSAnimation produces no visible output on its own. NSViewAnimation (a
// concrete subclass) is the renderable demo case and lives on its own page.

struct NSAnimationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSAnimation",
            docPath: "Documentation/AppKit/animation/nsanimation.md",
            availability: "macOS 10.4+",
            blurb: """
            The abstract base class for AppKit's standalone animation objects. NSAnimation manages \
            the timing and progress of an animation — duration, frame rate, animation curve, \
            blocking mode (blocking, non-blocking on the main thread, non-blocking on a separate \
            thread), and progress marks — but does not draw anything itself. The standard pattern \
            is to subclass NSAnimation, override currentProgress to call super and then update \
            whatever drawing the animation drives, and optionally implement \
            NSAnimationDelegate.animation(_:valueForProgress:) to map progress to a custom value.

            For most app code the right entry point is one of the concrete tools instead: \
            NSViewAnimation for frame and fade animations on existing views, \
            NSAnimationContext.runAnimationGroup for animator-proxy property changes, or \
            SwiftUI's withAnimation / .animation(_:value:) APIs. Use NSAnimation directly when \
            you need its progress-mark notifications, its three-mode blocking semantics, or its \
            ability to chain animations with start(when:reachesProgress:) and \
            stop(when:reachesProgress:).
            """,
            signatures: [
                "class NSAnimation : NSObject",
                "init(duration: TimeInterval, animationCurve: NSAnimation.Curve)",
                "func start()",
                "func stop()",
                "var currentProgress: NSAnimation.Progress { get set }",
                "var currentValue: Float { get }",
                "var animationBlockingMode: NSAnimation.BlockingMode",
                "var animationCurve: NSAnimation.Curve",
                "var frameRate: Float",
                "func addProgressMark(_ progressMark: NSAnimation.Progress)",
                "func start(when otherAnimation: NSAnimation, reachesProgress otherProgress: NSAnimation.Progress)",
                "func stop(when otherAnimation: NSAnimation, reachesProgress otherProgress: NSAnimation.Progress)"
            ],
            notes: [
                "Abstract entry point — the standard usage pattern (per Apple) is to subclass and override currentProgress.",
                "Curve cases: .easeIn, .easeOut, .easeInOut, .linear.",
                "BlockingMode cases: .blocking, .nonblocking, .nonblockingThreaded.",
                "Apple documentation explicitly recommends Timer for simple non-rendering timing tasks rather than NSAnimation.",
                "See NSViewAnimation for the concrete subclass that ships with frame/fade rendering built in."
            ]
        )
    }
}

#Preview {
    NSAnimationDescribePage()
        .frame(width: 900, height: 700)
}
