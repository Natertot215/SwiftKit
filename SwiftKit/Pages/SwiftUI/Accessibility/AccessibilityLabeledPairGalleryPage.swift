import SwiftUI

struct AccessibilityLabeledPairGalleryPage: View {
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

extension AccessibilityLabeledPairGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityLabeledPair",
        title: "AccessibilityLabeledPair",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityLabeledPair(role:id:in:)",
            "AccessibilityLabeledPairRole",
            "swiftui.accessible-descriptions.accessibilitylabeledpair(role:id:in:)",
            "swiftui.accessible-descriptions.accessibilitylabeledpairrole"
        ],
        blurb: "Pairs a label view with the value or control it describes so assistive technologies announce the two together. Each pair shares an id within a Namespace.",
        signature: "func accessibilityLabeledPair<ID>(role: AccessibilityLabeledPairRole, id: ID, in namespace: Namespace.ID) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where ID : Hashable",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitylabeledpair(role:id:in:).md",
        page: { AnyView(AccessibilityLabeledPairGalleryPage()) }
    )
}

#Preview {
    AccessibilityLabeledPairGalleryPage()
        .frame(width: 900, height: 700)
}
