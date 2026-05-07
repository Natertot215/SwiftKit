import SwiftUI

struct AccessibilitySortPriorityGalleryPage: View {
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
                name: "high priority (visited first)",
                api: ".accessibilitySortPriority(2)"
            ) {
                Text("Critical alert")
                    .padding(8)
                    .background(.tint.opacity(0.2), in: Capsule())
                    .accessibilitySortPriority(2)
            }

            VariantTile(
                name: "default priority",
                api: ".accessibilitySortPriority(0)"
            ) {
                Text("Body content")
                    .padding(8)
                    .background(.secondary.opacity(0.15), in: Capsule())
                    .accessibilitySortPriority(0)
            }

            VariantTile(
                name: "low priority (visited last)",
                api: ".accessibilitySortPriority(-1)"
            ) {
                Text("Footer note")
                    .font(.caption)
                    .padding(8)
                    .background(.secondary.opacity(0.1), in: Capsule())
                    .accessibilitySortPriority(-1)
            }

            // MARK: Reference

            ReferenceTile(
                name: "How it sorts",
                signature: "Higher Double values come first within the same container.",
                note: "Default is 0. VoiceOver uses geometric position as a tiebreaker — sort priority only re-orders elements that share an accessibility container."
            )

            ReferenceTile(
                name: "When to reach for it",
                signature: "Visual layout doesn't match reading order.",
                note: "Multi-column layouts, overlapping toolbars, decorative elements that should be deprioritized. Don't use sort priority to compensate for poor information architecture."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Use sparingly and locally.",
                note: "Sort priority applies *within* a container. Re-architect with `.accessibilityElement(children: …)` if you need cross-container reordering."
            )
        }
    }
}

extension AccessibilitySortPriorityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilitySortPriority",
        title: "AccessibilitySortPriority",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilitySortPriority(_:)",
            "swiftui.accessible-navigation.accessibilitysortpriority(_:)"
        ],
        blurb: "Sets the sort priority order for an accessibility element. VoiceOver visits higher-priority elements first within the same container — useful when geometric ordering doesn't match reading order.",
        signature: "func accessibilitySortPriority(_ sortPriority: Double) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-navigation/accessibilitysortpriority(_:).md",
        page: { AnyView(AccessibilitySortPriorityGalleryPage()) }
    )
}

#Preview {
    AccessibilitySortPriorityGalleryPage()
        .frame(width: 900, height: 700)
}
