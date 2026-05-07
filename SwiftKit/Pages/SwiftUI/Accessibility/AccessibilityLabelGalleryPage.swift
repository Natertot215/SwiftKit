import SwiftUI

struct AccessibilityLabelGalleryPage: View {
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

extension AccessibilityLabelGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityLabel",
        title: "AccessibilityLabel",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityLabel(_:isEnabled:)",
            "View/accessibilityLabel(content:)",
            "swiftui.accessible-descriptions.accessibilitylabel(_:isenabled:)",
            "swiftui.accessible-descriptions.accessibilitylabel(content:)"
        ],
        blurb: "Adds a label that assistive technologies use to describe a view. Accepts a string, a LocalizedStringKey, a Text, or a content closure for richer composition.",
        signature: "func accessibilityLabel<S>(_ label: S, isEnabled: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitylabel(_:isenabled:).md",
        page: { AnyView(AccessibilityLabelGalleryPage()) }
    )
}

#Preview {
    AccessibilityLabelGalleryPage()
        .frame(width: 900, height: 700)
}
