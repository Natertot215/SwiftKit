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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
