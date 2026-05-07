import SwiftUI

struct AccessibilityHintGalleryPage: View {
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

extension AccessibilityHintGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityHint",
        title: "AccessibilityHint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityHint(_:)",
            "View/accessibilityHint(_:isEnabled:)",
            "swiftui.accessible-descriptions.accessibilityhint(_:)",
            "swiftui.accessible-descriptions.accessibilityhint(_:isenabled:)"
        ],
        blurb: "Adds a hint VoiceOver speaks after the label and after a short delay — typically a single phrase explaining what activating the control will do.",
        signature: "func accessibilityHint(_ hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityhint(_:).md",
        page: { AnyView(AccessibilityHintGalleryPage()) }
    )
}

#Preview {
    AccessibilityHintGalleryPage()
        .frame(width: 900, height: 700)
}
