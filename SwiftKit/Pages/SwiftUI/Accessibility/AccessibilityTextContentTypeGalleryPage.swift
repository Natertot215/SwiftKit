import SwiftUI

struct AccessibilityTextContentTypeGalleryPage: View {
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

extension AccessibilityTextContentTypeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityTextContentType",
        title: "AccessibilityTextContentType",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityTextContentType(_:)",
            "AccessibilityTextContentType",
            "swiftui.accessible-descriptions.accessibilitytextcontenttype(_:)",
            "swiftui.accessible-descriptions.accessibilitytextcontenttype"
        ],
        blurb: "Tags the kind of textual content shown by a view — narrative prose, source code, console output, file path, or messaging — so VoiceOver tunes its reading style.",
        signature: "func accessibilityTextContentType(_ value: AccessibilityTextContentType) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitytextcontenttype(_:).md",
        page: { AnyView(AccessibilityTextContentTypeGalleryPage()) }
    )
}

#Preview {
    AccessibilityTextContentTypeGalleryPage()
        .frame(width: 900, height: 700)
}
