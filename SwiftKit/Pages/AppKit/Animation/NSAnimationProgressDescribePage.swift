import SwiftUI

// Describe-track page for NSAnimation.Progress.
// Source: Documentation/AppKit/animation/progress.md
// Type alias — Float in 0.0 ... 1.0. Not renderable on its own.

struct NSAnimationProgressDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSAnimationProgress",
            docPath: "Documentation/AppKit/animation/progress.md",
            availability: "macOS 10.4+",
            blurb: """
            A type alias for Float used to express animation progress as a floating-point number \
            between 0.0 and 1.0. Returned by NSAnimation.currentProgress, supplied to addProgressMark(_:) \
            when registering progress marks, and delivered in the userInfo dictionary of \
            NSAnimation.progressMarkNotification. Because it is a type alias for Float, any Float \
            literal in the 0.0 ... 1.0 range is a valid value — there are no enumeration cases or \
            struct constructors. The alias exists to document intent at API boundaries (a value of \
            type NSAnimation.Progress signals "this is normalized animation progress" to readers \
            of the call site).
            """,
            signatures: [
                "typealias NSAnimation.Progress = Float",
                "var currentProgress: NSAnimation.Progress { get set }   // on NSAnimation",
                "func addProgressMark(_ progressMark: NSAnimation.Progress)",
                "func removeProgressMark(_ progressMark: NSAnimation.Progress)",
                "var progressMarks: [NSNumber] { get set }"
            ],
            notes: [
                "Valid range is 0.0 (start) to 1.0 (end). Values outside the range are clamped by NSAnimation.",
                "Delegate hook animation(_:valueForProgress:) receives the progress and returns a Float — that return value becomes NSAnimation.currentValue.",
                "Notification key NSAnimationProgressMark in progressMarkNotification.userInfo carries the progress mark that was reached, boxed as NSNumber."
            ]
        )
    }
}

#Preview {
    NSAnimationProgressDescribePage()
        .frame(width: 900, height: 700)
}
