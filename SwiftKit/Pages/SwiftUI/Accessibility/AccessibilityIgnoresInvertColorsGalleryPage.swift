import SwiftUI

struct AccessibilityIgnoresInvertColorsGalleryPage: View {
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

extension AccessibilityIgnoresInvertColorsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityIgnoresInvertColors",
        title: "AccessibilityIgnoresInvertColors",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityIgnoresInvertColors(_:)",
            "swiftui.accessible-appearance.accessibilityignoresinvertcolors(_:)"
        ],
        blurb: "Sets whether this view should ignore the system Smart Invert setting. Use to protect images, photos, and color-critical artwork from color inversion.",
        signature: "func accessibilityIgnoresInvertColors(_ active: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-appearance/accessibilityignoresinvertcolors(_:).md",
        page: { AnyView(AccessibilityIgnoresInvertColorsGalleryPage()) }
    )
}

#Preview {
    AccessibilityIgnoresInvertColorsGalleryPage()
        .frame(width: 900, height: 700)
}
