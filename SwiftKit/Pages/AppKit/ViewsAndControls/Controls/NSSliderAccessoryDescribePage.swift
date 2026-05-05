import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSSliderAccessory — a small image-based affordance attached
// to a slider track. On macOS, accessories primarily attach via
// NSSliderTouchBarItem (Touch Bar); the AppKit doc surface for
// NSSlider doesn't expose addAccessory(_:atSide:), so a free-standing
// NSSlider gallery wouldn't render the accessory. Describe is the
// honest call.
// Source: Documentation/AppKit/views-and-controls/nsslideraccessory.md

struct NSSliderAccessoryDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSliderAccessory",
            docPath: "Documentation/AppKit/views-and-controls/nsslideraccessory.md",
            availability: "macOS 10.12 \u{00b7} iOS 13.0+",
            blurb: """
            A small image-based affordance attached to a slider track — \
            commonly a tortoise/hare pair flanking a playback-rate slider, \
            or sun icons flanking a brightness slider. The accessory pairs \
            an NSImage with an NSSliderAccessoryBehavior that handles taps \
            (jump-to-value, increment, decrement) and an \
            NSSliderAccessory.Width that controls its sizing slot.

            On macOS, slider accessories are documented for Touch Bar use \
            via NSSliderTouchBarItem (which exposes minimumSliderAccessory / \
            maximumSliderAccessory). The free-standing NSSlider AppKit \
            surface doesn't document an addAccessory method; for live \
            slider-with-accessory rendering, see the NSSliderTouchBarItem \
            page.
            """,
            signatures: [
                "@MainActor class NSSliderAccessory : NSObject",
                "init(image: NSImage)",
                "var behavior: NSSliderAccessoryBehavior",
                "var isEnabled: Bool",
                "// On Touch Bar:",
                "NSSliderTouchBarItem.minimumSliderAccessory = NSSliderAccessory(image: tortoise)",
                "NSSliderTouchBarItem.maximumSliderAccessory = NSSliderAccessory(image: hare)"
            ],
            notes: [
                "Pair with NSSliderAccessoryBehavior to react to taps; .automatic / .valueReset / .valueStep cover the common cases.",
                "Use NSSliderAccessory.Width to size the accessory slot — .default for a square box, .wide for a roomier image.",
                "On macOS the documented attachment surface is NSSliderTouchBarItem. iOS attaches accessories directly to UISlider."
            ]
        )
    }
}

#Preview {
    NSSliderAccessoryDescribePage()
        .frame(width: 900, height: 700)
}
