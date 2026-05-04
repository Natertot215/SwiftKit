import SwiftUI

struct DigitalCrownDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Digital Crown APIs (watchOS)",
            docPath: "Documentation/SwiftUI/input-events/",
            availability: "watchOS 6.0+",
            blurb: """
            The Digital Crown is the physical rotating knob on Apple Watch. SwiftUI exposes it \
            through a family of digitalCrownRotation(_:...) view modifiers that bind crown rotation \
            to a @State value. The simplest overload binds any BinaryFloatingPoint value directly. \
            The bounded overload adds from:through:by: range, sensitivity: (.low, .medium, .high), \
            isContinuous: (whether the value wraps at the ends), and isHapticFeedbackEnabled:. \
            The detented overload adds click-stop positions at each step. The callback overloads \
            fire onChange: with a DigitalCrownEvent on each rotation (carrying offset, velocity, \
            and idle state) and onIdle: when the crown stops. DigitalCrownRotationalSensitivity \
            controls how much physical rotation maps to value change. digitalCrownAccessory(_:) \
            and digitalCrownAccessory(content:) attach a decorative view to the watchOS crown \
            indicator ring. All watchOS-only; no macOS equivalent.
            """,
            signatures: [
                ".digitalCrownRotation($value) — bind crown rotation to a value",
                ".digitalCrownRotation($value, from: 0, through: 100, by: 1, sensitivity: .medium, isContinuous: false, isHapticFeedbackEnabled: true) — bounded rotation",
                ".digitalCrownRotation($value, onChange: { event in … }, onIdle: { … }) — with callbacks",
                ".digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:) — detented rotation",
                "DigitalCrownEvent — offset: Double, velocity: Double, isCrownIdle: Bool",
                "DigitalCrownRotationalSensitivity — .low, .medium, .high",
                ".digitalCrownAccessory(.automatic) — crown indicator accessory",
                ".digitalCrownAccessory(content: { … }) — custom accessory view"
            ],
            notes: [
                "All Digital Crown APIs are watchOS 6.0+ only.",
                "Pair .digitalCrownRotation with .focusable() so the view receives crown events.",
                "The onIdle: closure fires after approximately 0.5 seconds of no rotation."
            ]
        )
    }
}

#Preview {
    DigitalCrownDescribePage()
        .frame(width: 900, height: 700)
}
