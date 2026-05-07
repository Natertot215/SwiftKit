import SwiftUI

struct AccessibilityRespondsToUserInteractionGalleryPage: View {
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
                name: "true (default)",
                api: ".accessibilityRespondsToUserInteraction()"
            ) {
                Button("Activate") {}
                    .accessibilityRespondsToUserInteraction()
            }

            VariantTile(
                name: "false — informational",
                api: ".accessibilityRespondsToUserInteraction(false)"
            ) {
                Label("Last synced 5m ago", systemImage: "clock")
                    .accessibilityRespondsToUserInteraction(false)
            }

            VariantTile(
                name: "isEnabled overload",
                api: ".accessibilityRespondsToUserInteraction(_:isEnabled:)"
            ) {
                Button("Conditional") {}
                    .accessibilityRespondsToUserInteraction(false, isEnabled: true)
            }

            // MARK: Reference

            ReferenceTile(
                name: "What it suppresses",
                signature: "Hides actions, hints, and the activation point from assistive tech.",
                note: "Use when a view looks tappable but is purely decorative — a status badge, illustration, or read-only summary that users shouldn't be invited to activate."
            )

            ReferenceTile(
                name: "Don't conflate with isHidden",
                signature: ".accessibilityHidden(true)",
                note: "`accessibilityHidden` removes the element entirely. `respondsToUserInteraction(false)` keeps it visible to VoiceOver but marks it as non-interactive."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Mirror the visible affordance of the view.",
                note: "If your UI gives no hint that an element is tappable, this modifier prevents VoiceOver from announcing one. Keep the assistive experience honest."
            )
        }
    }
}

extension AccessibilityRespondsToUserInteractionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityRespondsToUserInteraction",
        title: "AccessibilityRespondsToUserInteraction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityRespondsToUserInteraction(_:)",
            "View/accessibilityRespondsToUserInteraction(_:isEnabled:)",
            "swiftui.accessible-controls.accessibilityrespondstouserinteraction(_:)",
            "swiftui.accessible-controls.accessibilityrespondstouserinteraction(_:isenabled:)"
        ],
        blurb: "Sets whether assistive technologies treat this view as interactive — controlling whether actions, hints, and the activation point are exposed to users.",
        signature: "func accessibilityRespondsToUserInteraction(_ respondsToUserInteraction: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityrespondstouserinteraction(_:).md",
        page: { AnyView(AccessibilityRespondsToUserInteractionGalleryPage()) }
    )
}

#Preview {
    AccessibilityRespondsToUserInteractionGalleryPage()
        .frame(width: 900, height: 700)
}
