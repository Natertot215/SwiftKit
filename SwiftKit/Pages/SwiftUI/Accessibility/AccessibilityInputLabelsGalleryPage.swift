import SwiftUI

struct AccessibilityInputLabelsGalleryPage: View {
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

extension AccessibilityInputLabelsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityInputLabels",
        title: "AccessibilityInputLabels",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityInputLabels(_:)",
            "View/accessibilityInputLabels(_:isEnabled:)",
            "swiftui.accessible-descriptions.accessibilityinputlabels(_:)",
            "swiftui.accessible-descriptions.accessibilityinputlabels(_:isenabled:)"
        ],
        blurb: "Sets alternate names that Voice Control and other speech-input technologies use to address a view. Provide synonyms when the visible label may not be what users say.",
        signature: "func accessibilityInputLabels(_ inputLabels: [LocalizedStringKey]) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityinputlabels(_:).md",
        page: { AnyView(AccessibilityInputLabelsGalleryPage()) }
    )
}

#Preview {
    AccessibilityInputLabelsGalleryPage()
        .frame(width: 900, height: 700)
}
