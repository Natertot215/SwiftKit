import SwiftUI

struct DigitalCrownRotationGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: ".digitalCrownRotation(_:)",
                signature: "func digitalCrownRotation<V>(_ binding: Binding<V>) -> some View where V : BinaryFloatingPoint",
                note: "Binds Digital Crown rotation on the focused view to a floating-point value. The simplest overload — accepts default sensitivity, no range, no haptics.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: ".digitalCrownRotation(_:onChange:onIdle:)",
                signature: "func digitalCrownRotation<V>(_ binding: Binding<V>, onChange: ((DigitalCrownEvent) -> Void)?, onIdle: (() -> Void)?) -> some View",
                note: "Adds change and idle callbacks. onChange fires for each crown event; onIdle fires after rotation has stopped for a short period.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: ".digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)",
                signature: "Full-form overload with range, step, sensitivity, continuous wrap, and haptics.",
                note: "from/through define an inclusive range; by is the step. sensitivity scales physical rotation to value change; isContinuous wraps past the bounds; haptics provide tactile detents.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: ".digitalCrownRotation(detent:from:through:by:…)",
                signature: "Detent overload — attracts the value to specific detent points.",
                note: "Use a detent binding to snap rotation to a discrete set of stops while still letting the user drag continuously between them.",
                badge: "watchOS"
            )

            ReferenceTile(
                name: "DigitalCrownEvent",
                signature: "struct DigitalCrownEvent { offset: Double, velocity: Double, … }",
                note: "Per-event data delivered to onChange. offset is the cumulative crown displacement; velocity is the angular rate at the time of the event."
            )

            ReferenceTile(
                name: "DigitalCrownRotationalSensitivity",
                signature: "enum DigitalCrownRotationalSensitivity  ·  .low  ·  .medium  ·  .high",
                note: "Scales how much value change a given physical crown rotation produces. Pick .low for fine-grained inputs (sliders) and .high for fast scrolling."
            )

            ReferenceTile(
                name: "macOS availability",
                signature: "Surfaced on macOS for SDK parity; receives no events here.",
                note: "Cross-platform code can compile against these modifiers from a shared file. Live behavior requires watchOS hardware."
            )
        }
    }
}

extension DigitalCrownRotationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.digitalCrownRotation",
        title: "DigitalCrownRotation",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/digitalCrownRotation(_:)",
            "View/digitalCrownRotation(_:onChange:onIdle:)",
            "View/digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)",
            "View/digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)",
            "View/digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)",
            "DigitalCrownEvent",
            "DigitalCrownRotationalSensitivity"
        ],
        blurb: "Binds Digital Crown rotation to a value on a focused view. Range, sensitivity, continuous wrap-around, haptic feedback, and detents are all configurable through the overload set. watchOS-only at runtime; surfaced cross-platform for SDK parity.",
        signature: "func digitalCrownRotation<V>(_ binding: Binding<V>) -> some View where V : BinaryFloatingPoint",
        availability: "watchOS 6.0+",
        docPath: "Documentation/SwiftUI/input-events/digitalcrownrotation(_:).md",
        page: { AnyView(DigitalCrownRotationGalleryPage()) }
    )
}

#Preview {
    DigitalCrownRotationGalleryPage()
        .frame(width: 900, height: 700)
}
