import SwiftUI

struct AccessibilityTraitsGalleryPage: View {
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

extension AccessibilityTraitsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityTraits",
        title: "AccessibilityTraits",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityAddTraits(_:)",
            "View/accessibilityRemoveTraits(_:)",
            "AccessibilityTraits",
            "swiftui.accessible-descriptions.accessibilityaddtraits(_:)",
            "swiftui.accessible-descriptions.accessibilityremovetraits(_:)",
            "swiftui.accessible-descriptions.accessibilitytraits"
        ],
        blurb: "An option set describing how a view behaves to assistive technologies — button, header, image, link, selected, and others. Add or remove traits to refine VoiceOver's behavior.",
        signature: "struct AccessibilityTraits : OptionSet, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitytraits.md",
        page: { AnyView(AccessibilityTraitsGalleryPage()) }
    )
}

#Preview {
    AccessibilityTraitsGalleryPage()
        .frame(width: 900, height: 700)
}
