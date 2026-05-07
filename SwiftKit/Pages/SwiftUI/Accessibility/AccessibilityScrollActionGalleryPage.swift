import SwiftUI

struct AccessibilityScrollActionGalleryPage: View {
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

extension AccessibilityScrollActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityScrollAction",
        title: "AccessibilityScrollAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityScrollAction(_:)",
            "swiftui.accessible-controls.accessibilityscrollaction(_:)"
        ],
        blurb: "Adds an action to allow assistive technologies to scroll the content of a custom container view in any of the four cardinal directions.",
        signature: "func accessibilityScrollAction(_ handler: @escaping (Edge) -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityscrollaction(_:).md",
        page: { AnyView(AccessibilityScrollActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityScrollActionGalleryPage()
        .frame(width: 900, height: 700)
}
