import SwiftUI

struct AccessibilityCustomContentGalleryPage: View {
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

extension AccessibilityCustomContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityCustomContent",
        title: "AccessibilityCustomContent",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityCustomContent(_:_:importance:)",
            "AccessibilityCustomContentKey",
            "swiftui.accessible-descriptions.accessibilitycustomcontent(_:_:importance:)",
            "swiftui.accessible-descriptions.accessibilitycustomcontentkey"
        ],
        blurb: "Adds keyed metadata that VoiceOver exposes alongside the main label — read aloud at .high importance or available on demand at .default. Use to surface secondary attributes without cluttering the visible UI.",
        signature: "func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitycustomcontent(_:_:importance:).md",
        page: { AnyView(AccessibilityCustomContentGalleryPage()) }
    )
}

#Preview {
    AccessibilityCustomContentGalleryPage()
        .frame(width: 900, height: 700)
}
