import SwiftUI

struct AccessibilityHeadingGalleryPage: View {
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

extension AccessibilityHeadingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityHeading",
        title: "AccessibilityHeading",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityHeading(_:)",
            "AccessibilityHeadingLevel",
            "swiftui.accessible-descriptions.accessibilityheading(_:)",
            "swiftui.accessible-descriptions.accessibilityheadinglevel"
        ],
        blurb: "Marks a view as a heading and assigns its level. VoiceOver users can navigate by headings using the rotor — equivalent to HTML h1–h6.",
        signature: "func accessibilityHeading(_ level: AccessibilityHeadingLevel) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityheading(_:).md",
        page: { AnyView(AccessibilityHeadingGalleryPage()) }
    )
}

#Preview {
    AccessibilityHeadingGalleryPage()
        .frame(width: 900, height: 700)
}
