import SwiftUI

struct AccessibilityHintGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Variants

            VariantTile(
                name: "Text hint",
                api: #".accessibilityHint(Text("Double tap to like"))"#
            ) {
                Button {
                } label: {
                    Image(systemName: "heart")
                }
                .accessibilityHint(Text("Double tap to like"))
            }

            VariantTile(
                name: "string literal",
                api: #".accessibilityHint("Opens the share sheet")"#
            ) {
                Button {
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .accessibilityHint("Opens the share sheet")
            }

            VariantTile(
                name: "isEnabled toggle",
                api: ".accessibilityHint(_:isEnabled: false)"
            ) {
                Button("Save") {}
                    .accessibilityHint("Saves the current document", isEnabled: false)
            }

            // MARK: Reference

            ReferenceTile(
                name: "When to use",
                signature: "Hints supplement labels — they describe the *result* of activation.",
                note: "If a control's purpose can be inferred from the label, skip the hint. VoiceOver users can disable hints globally and rely on labels alone."
            )

            ReferenceTile(
                name: "Voice-over delay",
                signature: "VoiceOver speaks the hint ~2s after the label.",
                note: "Keep hints to one short phrase. Long hints are easy to miss and frustrating to wait through."
            )

            ReferenceTile(
                name: "Don't repeat the label",
                signature: "Bad: label 'Like', hint 'Like this post'.",
                note: "Good: label 'Like', hint 'Adds to your favorites'. Tell users what happens, not what the button is."
            )
        }
    }
}

extension AccessibilityHintGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityHint",
        title: "AccessibilityHint",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityHint(_:)",
            "View/accessibilityHint(_:isEnabled:)",
            "swiftui.accessible-descriptions.accessibilityhint(_:)",
            "swiftui.accessible-descriptions.accessibilityhint(_:isenabled:)"
        ],
        blurb: "Adds a hint VoiceOver speaks after the label and after a short delay — typically a single phrase explaining what activating the control will do.",
        signature: "func accessibilityHint(_ hint: Text) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityhint(_:).md",
        page: { AnyView(AccessibilityHintGalleryPage()) }
    )
}

#Preview {
    AccessibilityHintGalleryPage()
        .frame(width: 900, height: 700)
}
