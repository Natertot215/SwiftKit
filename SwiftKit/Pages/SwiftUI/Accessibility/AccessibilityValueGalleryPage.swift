import SwiftUI

struct AccessibilityValueGalleryPage: View {
    @State private var sliderValue: Double = 0.6

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demos

            VariantTile(
                name: "static value",
                api: #".accessibilityValue(Text("78%"))"#
            ) {
                ProgressView(value: 0.78)
                    .progressViewStyle(.linear)
                    .frame(width: 140)
                    .accessibilityValue(Text("78%"))
            }

            VariantTile(
                name: "string overload",
                api: #".accessibilityValue("Bookmark on")"#
            ) {
                Toggle(isOn: .constant(true)) {
                    Label("Bookmark", systemImage: "bookmark")
                }
                .toggleStyle(.button)
                .accessibilityValue("Bookmark on")
            }

            VariantTile(
                name: "isEnabled toggle",
                api: ".accessibilityValue(_:isEnabled: false)"
            ) {
                Slider(value: $sliderValue)
                    .frame(width: 140)
                    .accessibilityValue(Text("\(Int(sliderValue * 100))%"), isEnabled: false)
            }

            // MARK: Reference

            ReferenceTile(
                name: "Label vs value",
                signature: "Label = what the control is. Value = its current state.",
                note: "A slider's label is \"Volume\". Its value is \"78%\". VoiceOver reads them together: \"Volume, 78%, slider.\""
            )

            ReferenceTile(
                name: "When SwiftUI fills it for you",
                signature: "Native sliders, steppers, toggles, and pickers expose their value automatically.",
                note: "Reach for `accessibilityValue` when you've replaced a native control with custom rendering or when the displayed value differs from the underlying state (e.g., relative time, abbreviated counts)."
            )

            ReferenceTile(
                name: "Localize values",
                signature: "Use Text(\"...\") with format specifiers, not raw strings.",
                note: "Percentages, times, and counts should be locale-aware. `Text(value, format: .percent)` ensures decimal separators and number formatting respect the user's locale."
            )
        }
    }
}

extension AccessibilityValueGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityValue",
        title: "AccessibilityValue",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityValue(_:isEnabled:)",
            "swiftui.accessible-descriptions.accessibilityvalue(_:isenabled:)"
        ],
        blurb: "Sets the textual value an assistive technology reads after the label — for example, a slider's current position or a stepper's current count.",
        signature: "func accessibilityValue(_ valueDescription: Text, isEnabled: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityvalue(_:isenabled:).md",
        page: { AnyView(AccessibilityValueGalleryPage()) }
    )
}

#Preview {
    AccessibilityValueGalleryPage()
        .frame(width: 900, height: 700)
}
