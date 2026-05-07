import SwiftUI

struct AccessibilityZoomActionGalleryPage: View {
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

extension AccessibilityZoomActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityZoomAction",
        title: "AccessibilityZoomAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityZoomAction(_:)",
            "AccessibilityZoomGestureAction",
            "swiftui.accessible-controls.accessibilityzoomaction(_:)",
            "swiftui.accessible-controls.accessibilityzoomgestureaction"
        ],
        blurb: "Adds an action to allow VoiceOver users to zoom a view via two-finger double tap gestures. The handler receives an AccessibilityZoomGestureAction describing direction and phase.",
        signature: "func accessibilityZoomAction(_ handler: @escaping (AccessibilityZoomGestureAction) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityzoomaction(_:).md",
        page: { AnyView(AccessibilityZoomActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityZoomActionGalleryPage()
        .frame(width: 900, height: 700)
}
