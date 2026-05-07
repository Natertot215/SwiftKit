import SwiftUI

struct AccessibilityLinkedGroupGalleryPage: View {
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

extension AccessibilityLinkedGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityLinkedGroup",
        title: "AccessibilityLinkedGroup",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityLinkedGroup(id:in:)",
            "swiftui.accessible-navigation.accessibilitylinkedgroup(id:in:)"
        ],
        blurb: "Links accessibility elements together so users can navigate between related views — across non-contiguous areas of the screen — using a single rotor entry.",
        signature: "func accessibilityLinkedGroup<ID>(id: ID, in namespace: Namespace.ID) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where ID : Hashable",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-navigation/accessibilitylinkedgroup(id:in:).md",
        page: { AnyView(AccessibilityLinkedGroupGalleryPage()) }
    )
}

#Preview {
    AccessibilityLinkedGroupGalleryPage()
        .frame(width: 900, height: 700)
}
