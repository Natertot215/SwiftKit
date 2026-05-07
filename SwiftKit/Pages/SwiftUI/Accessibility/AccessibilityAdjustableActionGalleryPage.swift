import SwiftUI

struct AccessibilityAdjustableActionGalleryPage: View {
    @State private var value: Int = 5

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demo

            VariantTile(
                name: "increment / decrement handler",
                api: ".accessibilityAdjustableAction { direction in … }"
            ) {
                VStack(spacing: 6) {
                    Text("\(value)")
                        .font(.title2)
                        .monospacedDigit()
                    Text("Custom stepper")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .accessibilityElement(children: .combine)
                .accessibilityValue(Text("\(value)"))
                .accessibilityAdjustableAction { direction in
                    switch direction {
                    case .increment: value += 1
                    case .decrement: value -= 1
                    @unknown default: break
                    }
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityAdjustmentDirection",
                signature: "enum AccessibilityAdjustmentDirection { case increment, decrement }",
                note: "VoiceOver maps swipe-up to .increment and swipe-down to .decrement. Switch Control offers explicit Increase / Decrease commands."
            )

            ReferenceTile(
                name: "Pair with accessibilityValue",
                signature: ".accessibilityValue(Text(currentValue))",
                note: "An adjustable element without a spoken value is silent — always pair the action with `accessibilityValue` so VoiceOver reads the new value after each adjustment."
            )

            ReferenceTile(
                name: "Use sparingly",
                signature: "Best for custom controls that mimic Slider, Stepper, Picker, or DatePicker.",
                note: "Native controls already adopt the trait — only reach for this when you've replaced the default control with a custom rendering."
            )
        }
    }
}

extension AccessibilityAdjustableActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityAdjustableAction",
        title: "AccessibilityAdjustableAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityAdjustableAction(_:)",
            "AccessibilityAdjustmentDirection",
            "swiftui.accessible-controls.accessibilityadjustableaction(_:)",
            "swiftui.accessible-controls.accessibilityadjustmentdirection"
        ],
        blurb: "Adds an action to allow VoiceOver users to adjust the value of a custom control with swipe-up and swipe-down gestures. The handler receives an AccessibilityAdjustmentDirection.",
        signature: "func accessibilityAdjustableAction(_ handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityadjustableaction(_:).md",
        page: { AnyView(AccessibilityAdjustableActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityAdjustableActionGalleryPage()
        .frame(width: 900, height: 700)
}
