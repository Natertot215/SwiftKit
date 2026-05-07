import SwiftUI

struct AccessibilityFocusedGalleryPage: View {
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

extension AccessibilityFocusedGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityFocused",
        title: "AccessibilityFocused",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityFocused(_:)",
            "View/accessibilityFocused(_:equals:)",
            "AccessibilityFocusState",
            "swiftui.accessible-controls.accessibilityfocused(_:)",
            "swiftui.accessible-controls.accessibilityfocused(_:equals:)",
            "swiftui.accessible-controls.accessibilityfocusstate"
        ],
        blurb: "Binds a view's accessibility-focus state to an AccessibilityFocusState property. Read or write the state to track or move VoiceOver focus programmatically.",
        signature: "func accessibilityFocused<Value>(_ binding: AccessibilityFocusState<Value>.Binding, equals value: Value) -> some View where Value : Hashable",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityfocused(_:).md",
        page: { AnyView(AccessibilityFocusedGalleryPage()) }
    )
}

#Preview {
    AccessibilityFocusedGalleryPage()
        .frame(width: 900, height: 700)
}
