import SwiftUI

struct WatchOSAccessibilityDescribePage: View {
    var body: some View {
        DescribePage(
            title: "watchOS Accessibility Quick Actions",
            docPath: "Documentation/SwiftUI/accessible-controls/",
            availability: "watchOS 9.0+",
            blurb: """
            Accessibility Quick Actions are a watchOS 9.0 feature that lets users trigger common \
            view actions through an Assistive Access squeeze-and-hold gesture, without requiring \
            precision tapping. accessibilityQuickAction(style:content:) registers a button to \
            appear in the quick-action overlay when the gesture fires. The isActive: variant \
            exposes a binding that your view can use to animate or prepare for the action. \
            AccessibilityQuickActionStyle controls the overlay presentation: .prompt shows a \
            full-screen prompt with the action; .outline shows a smaller outline around the view. \
            These APIs are watchOS 9.0+ only — no macOS equivalent exists.
            """,
            signatures: [
                ".accessibilityQuickAction(style: .prompt) { Button(\"Archive\") { … } } — squeeze gesture shortcut",
                ".accessibilityQuickAction(style: .outline, isActive: $isShowing) { Button … } — with active binding",
                "AccessibilityQuickActionStyle — .prompt, .outline"
            ],
            notes: [
                "Quick Actions are part of the Assistive Access accessibility feature on Apple Watch.",
                "Test with the watchOS Simulator's Accessibility > Quick Actions option enabled."
            ]
        )
    }
}

#Preview {
    WatchOSAccessibilityDescribePage()
        .frame(width: 900, height: 700)
}
