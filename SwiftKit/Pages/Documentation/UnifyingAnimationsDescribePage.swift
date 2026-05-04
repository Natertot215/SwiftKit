import SwiftUI

struct UnifyingAnimationsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Unifying Your App's Animations",
            docPath: "Documentation/SwiftUI/appkit-integration/unifying-your-app-s-animations.md",
            availability: "macOS 13.0+",
            blurb: """
            Create a consistent UI animation experience across SwiftUI, UIKit, and AppKit.

            ## Overview

            Many apps use a combination of SwiftUI, UIKit, and AppKit to build and animate their interfaces. In iOS 18 and later, you can use SwiftUI animations in UIKit and AppKit. SwiftUI provides a wide range of standard as well as custom animation types.

            SwiftUI, UIKit, and AppKit use different underlying implementations for animation. Apps that use multiple frameworks for animation might encounter issues such as syncing animation timing or other inconsistencies that can be difficult to troubleshoot and lead to a suboptimal user experience. Use SwiftUI animations to animate UI across all of these frameworks to create a more consistent and seamless experience on every platform.

            ## Create a SwiftUI Animation

            To create a SwiftUI animation in UIKit or AppKit, import SwiftUI and create a SwiftUI Animation. Then, pass that animation as a parameter into:
            - UIView.animate(_:changes:completion:) on UIView (UIKit)
            - NSAnimationContext.animate(_:changes:completion:) on NSAnimationContext (AppKit)

            The API surface is consistent across SwiftUI, UIKit, and AppKit, making it straightforward to use the same animation type across all three frameworks.

            ## Use Completion Handlers with SwiftUI Animations

            You can provide an optional completion handler to these animation methods, which the system calls automatically after the animations complete. This is useful for chaining animations or updating state after an animation finishes.

            ## Retarget a SwiftUI Animation

            Similar to animations in SwiftUI views, you can smoothly retarget animations performed using UIView.animate(_:changes:completion:) or NSAnimationContext.animate(_:changes:completion:). Retargeting uses the velocity from the previous animation to carry the animation forward with continuous velocity, creating a fluid animation experience.

            ## Troubleshoot Animations

            Syncing animations across frameworks can surface differing behavior across implementations. Keep these tips in mind:

            - SwiftUI animations run on a background thread in your app's process.
            - SwiftUI animations don't have a backing CAAnimation, which differentiates them from UIView animations.
            - SwiftUI animations are not compatible with UIViewPropertyAnimator or UIView keyframe animations.

            For more information about providing a great animation experience, see WWDC24 session 10145: developer.apple.com/wwdc24/10145/.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/appkit-integration/unifying-your-app-s-animations.md",
                "Related APIs: Animation, withAnimation(_:_:), NSAnimationContext.animate(_:changes:completion:), NSHostingView."
            ]
        )
    }
}

#Preview {
    UnifyingAnimationsDescribePage()
        .frame(width: 900, height: 900)
}
