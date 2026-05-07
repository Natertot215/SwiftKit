import SwiftUI

struct AccessibilityValueGalleryPage: View {
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

extension AccessibilityValueGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityValue",
        title: "AccessibilityValue",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityValue(_:isEnabled:)",
            "swiftui.accessible-descriptions.accessibilityvalue(_:isenabled:)"
        ],
        blurb: "Sets the textual value an assistive technology reads after the label — for example, a slider's current position or a stepper's current count.",
        signature: "func accessibilityValue(_ valueDescription: Text, isEnabled: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityvalue(_:isenabled:).md",
        page: { AnyView(AccessibilityValueGalleryPage()) }
    )
}

#Preview {
    AccessibilityValueGalleryPage()
        .frame(width: 900, height: 700)
}
