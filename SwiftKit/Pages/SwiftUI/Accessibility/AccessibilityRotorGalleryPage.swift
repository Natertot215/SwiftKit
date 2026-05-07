import SwiftUI

struct AccessibilityRotorGalleryPage: View {
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

extension AccessibilityRotorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityRotor",
        title: "AccessibilityRotor",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityRotor(_:entries:)",
            "View/accessibilityRotor(_:entries:entryID:entryLabel:)",
            "View/accessibilityRotor(_:entries:entryLabel:)",
            "View/accessibilityRotor(_:textRanges:)",
            "View/accessibilityRotorEntry(id:in:)",
            "AccessibilityRotorContent",
            "AccessibilityRotorContentBuilder",
            "AccessibilityRotorEntry",
            "AccessibilitySystemRotor",
            "swiftui.accessible-navigation.accessibilityrotor(_:entries:)",
            "swiftui.accessible-navigation.accessibilityrotor(_:entries:entryid:entrylabel:)",
            "swiftui.accessible-navigation.accessibilityrotor(_:entries:entrylabel:)",
            "swiftui.accessible-navigation.accessibilityrotor(_:textranges:)",
            "swiftui.accessible-navigation.accessibilityrotorcontent",
            "swiftui.accessible-navigation.accessibilityrotorcontentbuilder",
            "swiftui.accessible-navigation.accessibilityrotorentry",
            "swiftui.accessible-navigation.accessibilitysystemrotor",
            "swiftui.accessible-navigation.accessibilityrotorentry(id:in:)"
        ],
        blurb: "Builds an Accessibility Rotor — VoiceOver's navigation menu — listing labelled entries within a view. Use custom rotors for app-specific groupings or override system rotors like links and headings.",
        signature: "func accessibilityRotor<Content>(_ label: LocalizedStringResource, @AccessibilityRotorContentBuilder entries: @escaping () -> Content) -> some View where Content : AccessibilityRotorContent",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-navigation/accessibilityrotor(_:entries:).md",
        page: { AnyView(AccessibilityRotorGalleryPage()) }
    )
}

#Preview {
    AccessibilityRotorGalleryPage()
        .frame(width: 900, height: 700)
}
