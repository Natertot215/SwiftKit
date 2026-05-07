import SwiftUI

struct AccessibilityActionGalleryPage: View {
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

extension AccessibilityActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityAction",
        title: "AccessibilityAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityAction(_:_:)",
            "View/accessibilityAction(named:_:)",
            "View/accessibilityAction(action:label:)",
            "View/accessibilityAction(intent:label:)",
            "View/accessibilityAction(_:intent:)",
            "View/accessibilityAction(named:intent:)",
            "View/accessibilityActions(_:)",
            "View/accessibilityActions(category:_:)",
            "AccessibilityActionKind",
            "AccessibilityActionCategory",
            "swiftui.accessible-controls.accessibilityaction(_:_:)",
            "swiftui.accessible-controls.accessibilityaction(named:_:)",
            "swiftui.accessible-controls.accessibilityaction(action:label:)",
            "swiftui.accessible-controls.accessibilityaction(intent:label:)",
            "swiftui.accessible-controls.accessibilityaction(_:intent:)",
            "swiftui.accessible-controls.accessibilityaction(named:intent:)",
            "swiftui.accessible-controls.accessibilityactions(_:)",
            "swiftui.accessible-controls.accessibilityactions(category:_:)",
            "swiftui.accessible-controls.accessibilityactionkind",
            "swiftui.accessible-controls.accessibilityactioncategory"
        ],
        blurb: "Adds an accessibility action to a view so assistive technologies — VoiceOver, Switch Control, Voice Control — can invoke it. Supports named actions, App Intents, and custom action categories.",
        signature: "func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityaction(_:_:).md",
        page: { AnyView(AccessibilityActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityActionGalleryPage()
        .frame(width: 900, height: 700)
}
