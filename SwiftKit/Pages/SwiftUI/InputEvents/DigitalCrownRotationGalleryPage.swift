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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
