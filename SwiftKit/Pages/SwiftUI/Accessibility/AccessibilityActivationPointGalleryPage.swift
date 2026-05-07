import SwiftUI

struct AccessibilityActivationPointGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: UnitPoint variants

            VariantTile(
                name: "center (default)",
                api: ".accessibilityActivationPoint(.center)"
            ) {
                Circle()
                    .fill(.tint)
                    .frame(width: 60, height: 60)
                    .accessibilityActivationPoint(.center)
            }

            VariantTile(
                name: ".topLeading",
                api: ".accessibilityActivationPoint(.topLeading)"
            ) {
                Rectangle()
                    .fill(.tint)
                    .frame(width: 80, height: 60)
                    .accessibilityActivationPoint(.topLeading)
            }

            VariantTile(
                name: "custom UnitPoint",
                api: ".accessibilityActivationPoint(UnitPoint(x: 0.75, y: 0.5))"
            ) {
                Capsule()
                    .fill(.tint)
                    .frame(width: 100, height: 40)
                    .accessibilityActivationPoint(UnitPoint(x: 0.75, y: 0.5))
            }

            // MARK: Reference

            ReferenceTile(
                name: "Why use it",
                signature: "Tells assistive tech where inside an element to land its activation tap.",
                note: "Default is the geometric center. Override when the visible hit region isn't centered — e.g., a long pill where the action is on the trailing icon."
            )

            ReferenceTile(
                name: "isEnabled overload",
                signature: "func accessibilityActivationPoint(_:isEnabled:)",
                note: "Pass `isEnabled: false` to suppress the override at runtime — useful when state changes which sub-element is the action target."
            )
        }
    }
}

extension AccessibilityActivationPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityActivationPoint",
        title: "AccessibilityActivationPoint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityActivationPoint(_:)",
            "View/accessibilityActivationPoint(_:isEnabled:)",
            "swiftui.accessible-controls.accessibilityactivationpoint(_:)",
            "swiftui.accessible-controls.accessibilityactivationpoint(_:isenabled:)"
        ],
        blurb: "Sets the unit-point or absolute point an assistive technology should target when activating the accessibility element associated with this view.",
        signature: "func accessibilityActivationPoint(_ activationPoint: UnitPoint) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityactivationpoint(_:).md",
        page: { AnyView(AccessibilityActivationPointGalleryPage()) }
    )
}

#Preview {
    AccessibilityActivationPointGalleryPage()
        .frame(width: 900, height: 700)
}
