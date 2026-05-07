import SwiftUI

struct AccessibilityDragPointGalleryPage: View {
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

extension AccessibilityDragPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityDragPoint",
        title: "AccessibilityDragPoint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityDragPoint(_:description:)",
            "View/accessibilityDragPoint(_:description:isEnabled:)",
            "swiftui.accessible-controls.accessibilitydragpoint(_:description:)",
            "swiftui.accessible-controls.accessibilitydragpoint(_:description:isenabled:)"
        ],
        blurb: "Defines a drag origin and description that assistive technologies use to start an accessible drag gesture from a custom view.",
        signature: "func accessibilityDragPoint(_ point: UnitPoint, description: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilitydragpoint(_:description:).md",
        page: { AnyView(AccessibilityDragPointGalleryPage()) }
    )
}

#Preview {
    AccessibilityDragPointGalleryPage()
        .frame(width: 900, height: 700)
}
