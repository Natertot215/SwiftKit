import SwiftUI

struct AccessibilityDirectTouchGalleryPage: View {
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

extension AccessibilityDirectTouchGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityDirectTouch",
        title: "AccessibilityDirectTouch",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityDirectTouch(_:options:)",
            "AccessibilityDirectTouchOptions",
            "swiftui.accessible-controls.accessibilitydirecttouch(_:options:)",
            "swiftui.accessible-controls.accessibilitydirecttouchoptions"
        ],
        blurb: "Marks a region as one that VoiceOver passes through directly so users can interact with it without VoiceOver intercepting touches. Useful for drawing canvases and musical instruments.",
        signature: "func accessibilityDirectTouch(_ isDirectTouchArea: Bool = true, options: AccessibilityDirectTouchOptions = []) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilitydirecttouch(_:options:).md",
        page: { AnyView(AccessibilityDirectTouchGalleryPage()) }
    )
}

#Preview {
    AccessibilityDirectTouchGalleryPage()
        .frame(width: 900, height: 700)
}
