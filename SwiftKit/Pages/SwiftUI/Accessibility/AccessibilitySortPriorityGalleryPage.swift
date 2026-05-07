import SwiftUI

struct AccessibilitySortPriorityGalleryPage: View {
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

extension AccessibilitySortPriorityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilitySortPriority",
        title: "AccessibilitySortPriority",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilitySortPriority(_:)",
            "swiftui.accessible-navigation.accessibilitysortpriority(_:)"
        ],
        blurb: "Sets the sort priority order for an accessibility element. VoiceOver visits higher-priority elements first within the same container — useful when geometric ordering doesn't match reading order.",
        signature: "func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-navigation/accessibilitysortpriority(_:).md",
        page: { AnyView(AccessibilitySortPriorityGalleryPage()) }
    )
}

#Preview {
    AccessibilitySortPriorityGalleryPage()
        .frame(width: 900, height: 700)
}
