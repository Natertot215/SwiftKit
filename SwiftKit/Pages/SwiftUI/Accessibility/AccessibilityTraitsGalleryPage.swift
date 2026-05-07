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
            // MARK: Add traits

            VariantTile(
                name: "isButton",
                api: ".accessibilityAddTraits(.isButton)"
            ) {
                Text("Tap to expand")
                    .padding(8)
                    .background(.tint.opacity(0.2), in: Capsule())
                    .accessibilityAddTraits(.isButton)
            }

            VariantTile(
                name: "isHeader",
                api: ".accessibilityAddTraits(.isHeader)"
            ) {
                Text("Section title")
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
            }

            VariantTile(
                name: "isSelected",
                api: ".accessibilityAddTraits(.isSelected)"
            ) {
                Label("Inbox", systemImage: "tray.fill")
                    .accessibilityAddTraits(.isSelected)
            }

            VariantTile(
                name: "isLink",
                api: ".accessibilityAddTraits(.isLink)"
            ) {
                Text("Read more")
                    .underline()
                    .accessibilityAddTraits(.isLink)
            }

            VariantTile(
                name: "isModal",
                api: ".accessibilityAddTraits(.isModal)"
            ) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.tint.opacity(0.15))
                    .frame(width: 120, height: 60)
                    .overlay(Text("Modal").font(.caption))
                    .accessibilityAddTraits(.isModal)
            }

            // MARK: Remove traits

            VariantTile(
                name: "remove .isButton",
                api: ".accessibilityRemoveTraits(.isButton)"
            ) {
                Button("Decorative") {}
                    .accessibilityRemoveTraits(.isButton)
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityTraits",
                signature: "struct AccessibilityTraits : OptionSet",
                note: "Combine traits with bracket syntax: `[.isButton, .isSelected]`. Available traits include .isButton, .isHeader, .isImage, .isLink, .isSelected, .isStaticText, .isSummaryElement, .updatesFrequently, .playsSound, .isModal, .isToggle, .startsMediaSession, .isSearchField, .allowsDirectInteraction, .causesPageTurn, .isKeyboardKey, .isTabBar."
            )

            ReferenceTile(
                name: "When SwiftUI applies traits for you",
                signature: "Button → .isButton; Toggle → .isToggle; Image → .isImage.",
                note: "You only need `accessibilityAddTraits` when wrapping a non-control view to behave like one — e.g., a styled HStack that responds to tap."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Match the visible affordance.",
                note: "Don't add `.isButton` to non-interactive views. Don't add `.isHeader` to body copy. Misleading traits actively harm assistive tech users."
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
