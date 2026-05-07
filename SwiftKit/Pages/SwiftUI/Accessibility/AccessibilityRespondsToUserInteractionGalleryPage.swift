import SwiftUI

struct AccessibilityRespondsToUserInteractionGalleryPage: View {
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

extension AccessibilityRespondsToUserInteractionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityRespondsToUserInteraction",
        title: "AccessibilityRespondsToUserInteraction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityRespondsToUserInteraction(_:)",
            "View/accessibilityRespondsToUserInteraction(_:isEnabled:)",
            "swiftui.accessible-controls.accessibilityrespondstouserinteraction(_:)",
            "swiftui.accessible-controls.accessibilityrespondstouserinteraction(_:isenabled:)"
        ],
        blurb: "Sets whether assistive technologies treat this view as interactive — controlling whether actions, hints, and the activation point are exposed to users.",
        signature: "func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityrespondstouserinteraction(_:).md",
        page: { AnyView(AccessibilityRespondsToUserInteractionGalleryPage()) }
    )
}

#Preview {
    AccessibilityRespondsToUserInteractionGalleryPage()
        .frame(width: 900, height: 700)
}
