import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSSliderAccessoryBehavior — value type configuring how a
// slider accessory tap should affect the slider's value (reset to
// neutral, step, custom action, automatic).
// Source: Documentation/AppKit/views-and-controls/nsslideraccessorybehavior.md

struct NSSliderAccessoryBehaviorDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSliderAccessoryBehavior",
            docPath: "Documentation/AppKit/views-and-controls/nsslideraccessorybehavior.md",
            availability: "macOS 10.12 \u{00b7} iOS 13.0+",
            blurb: """
            Configures the action that a tap on an NSSliderAccessory \
            performs against its host slider. NSSliderAccessoryBehavior \
            ships three system policies and two custom-handler initializers.

            Picking a behavior:

              \u{2022} .automatic — the system picks the right behavior for \
            the accessory's position and the slider's neutralValue. Default \
            choice.
              \u{2022} .valueReset — tap snaps the slider to its neutralValue \
            (the rest position for the slider's domain).
              \u{2022} .valueStep — tap moves the slider by a single \
            altIncrementValue step toward the accessory's side.
              \u{2022} init(handler:) — supply a closure that receives the \
            slider control and updates it however you want.
              \u{2022} init(target:action:) — Cocoa target/action variant of \
            the handler initializer.

            NSSliderAccessoryBehavior is a value type — pair it with an \
            NSSliderAccessory and attach to NSSliderTouchBarItem (or, on \
            iOS, UISlider) for live behavior.
            """,
            signatures: [
                "@MainActor class NSSliderAccessoryBehavior : NSObject",
                "static let automatic: NSSliderAccessoryBehavior",
                "static let valueReset: NSSliderAccessoryBehavior",
                "static let valueStep: NSSliderAccessoryBehavior",
                "init(handler: @escaping (NSSliderAccessory) -> Void)",
                "init(target: AnyObject?, action: Selector)"
            ],
            notes: [
                "Behavior, not a view — has no rendered surface on its own.",
                "Pair with NSSliderAccessory and an NSSliderTouchBarItem for the documented macOS placement.",
                "handleAction(_:) is the override hook in subclasses; the static .automatic / .valueReset / .valueStep cover the common cases."
            ]
        )
    }
}

#Preview {
    NSSliderAccessoryBehaviorDescribePage()
        .frame(width: 900, height: 700)
}
