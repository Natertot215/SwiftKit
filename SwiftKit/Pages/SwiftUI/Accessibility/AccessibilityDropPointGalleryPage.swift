import SwiftUI

struct AccessibilityDropPointGalleryPage: View {
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

extension AccessibilityDropPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityDropPoint",
        title: "AccessibilityDropPoint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityDropPoint(_:description:)",
            "View/accessibilityDropPoint(_:description:isEnabled:)",
            "swiftui.accessible-controls.accessibilitydroppoint(_:description:)",
            "swiftui.accessible-controls.accessibilitydroppoint(_:description:isenabled:)"
        ],
        blurb: "Defines a drop target and description that assistive technologies use to complete an accessible drag-and-drop gesture into a custom view.",
        signature: "func accessibilityDropPoint(_ point: UnitPoint, description: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilitydroppoint(_:description:).md",
        page: { AnyView(AccessibilityDropPointGalleryPage()) }
    )
}

#Preview {
    AccessibilityDropPointGalleryPage()
        .frame(width: 900, height: 700)
}
