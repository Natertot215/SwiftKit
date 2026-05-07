import SwiftUI

struct AccessibilityQuickActionGalleryPage: View {
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

extension AccessibilityQuickActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityQuickAction",
        title: "AccessibilityQuickAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityQuickAction(style:content:)",
            "View/accessibilityQuickAction(style:isActive:content:)",
            "AccessibilityQuickActionStyle",
            "swiftui.accessible-controls.accessibilityquickaction(style:content:)",
            "swiftui.accessible-controls.accessibilityquickaction(style:isactive:content:)",
            "swiftui.accessible-controls.accessibilityquickactionstyle"
        ],
        blurb: "Provides a Quick Action menu — a focused secondary surface — that the system presents on devices with limited input. Style the surface as a prompt or full-screen sheet.",
        signature: "func accessibilityQuickAction<Style, Content>(style: Style, @ViewBuilder content: @escaping () -> Content) -> some View where Style : AccessibilityQuickActionStyle, Content : View",
        availability: nil,
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityquickaction(style:content:).md",
        page: { AnyView(AccessibilityQuickActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityQuickActionGalleryPage()
        .frame(width: 900, height: 700)
}
