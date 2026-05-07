import SwiftUI

struct AccessibilityRotorGalleryPage: View {
    private struct Section: Identifiable {
        let id = UUID()
        let title: String
    }

    private let sections: [Section] = [
        Section(title: "Overview"),
        Section(title: "Examples"),
        Section(title: "Troubleshooting")
    ]

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demos

            VariantTile(
                name: "labeled-entries rotor",
                api: ".accessibilityRotor(\"Sections\", entries: …)"
            ) {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(sections) { section in
                        Text(section.title).font(.caption)
                    }
                }
                .accessibilityRotor("Sections", entries: sections, entryLabel: \.title)
            }

            VariantTile(
                name: "system rotor override",
                api: ".accessibilityRotor(.headings, entries: …)"
            ) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("h1 — Title").font(.headline)
                    Text("h2 — Subtitle").font(.subheadline)
                }
                .accessibilityRotor(.headings, entries: sections, entryLabel: \.title)
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityRotorContent",
                signature: "protocol AccessibilityRotorContent",
                note: "Result-builder protocol returned from the rotor closure. `AccessibilityRotorEntry` is the canonical building block."
            )

            ReferenceTile(
                name: "AccessibilitySystemRotor",
                signature: "struct AccessibilitySystemRotor  // .links, .headings, .landmarks, …",
                note: "Override or supplement system rotors with app-specific entries. Use `.headings` to publish your own heading hierarchy when SwiftUI's auto-detection misses entries."
            )

            ReferenceTile(
                name: "Text-range overload",
                signature: "func accessibilityRotor(_:textRanges:)",
                note: "For long-form Text views, expose RangeReplaceableCollection text ranges (URLs, mentions, citations) as rotor entries so VoiceOver users can jump between them."
            )

            ReferenceTile(
                name: "AccessibilityRotorEntry",
                signature: "struct AccessibilityRotorEntry<ID>",
                note: "Manual entry constructor when you need to bind a label to a specific id within a Namespace — useful for cross-scrollview navigation."
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
