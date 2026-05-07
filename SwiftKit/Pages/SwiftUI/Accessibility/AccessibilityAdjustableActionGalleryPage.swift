import SwiftUI

struct AccessibilityAdjustableActionGalleryPage: View {
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
