import SwiftUI

struct AccessibilityLabelGalleryPage: View {
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
                name: "string literal",
                api: #".accessibilityLabel("Like")"#
            ) {
                Button {
                } label: {
                    Image(systemName: "heart")
                }
                .accessibilityLabel("Like")
            }

            VariantTile(
                name: "Text label",
                api: #".accessibilityLabel(Text("Send message"))"#
            ) {
                Button {
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .accessibilityLabel(Text("Send message"))
            }

            VariantTile(
                name: "isEnabled gate",
                api: ".accessibilityLabel(_:isEnabled: false)"
            ) {
                Button("Profile") {}
                    .accessibilityLabel("User profile", isEnabled: false)
            }

            VariantTile(
                name: "content closure",
                api: ".accessibilityLabel { Text(\"Settings\"); Text(\"unread\") }"
            ) {
                Button {
                } label: {
                    Image(systemName: "gearshape")
                }
                .accessibilityLabel {
                    Text("Settings")
                    Text("3 unread")
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "When SwiftUI fills it for you",
                signature: "Text-bearing controls inherit their label automatically.",
                note: "`Button(\"Save\")` already labels itself \"Save\". Reach for `accessibilityLabel` only when the visible UI is icon-only or otherwise non-textual."
            )

            ReferenceTile(
                name: "Don't include 'button' or 'image'",
                signature: "VoiceOver appends the role automatically.",
                note: "Bad: \"Send button\". Good: \"Send\". The role is communicated by the AccessibilityTraits attached to the control."
            )

            ReferenceTile(
                name: "Pair with hint and value",
                signature: ".accessibilityHint, .accessibilityValue",
                note: "Label = what the control is. Hint = what activation does. Value = the current state. All three answer different questions."
            )
        }
    }
}

extension AccessibilityLabelGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityLabel",
        title: "AccessibilityLabel",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityLabel(_:isEnabled:)",
            "View/accessibilityLabel(content:)",
            "swiftui.accessible-descriptions.accessibilitylabel(_:isenabled:)",
            "swiftui.accessible-descriptions.accessibilitylabel(content:)"
        ],
        blurb: "Adds a label that assistive technologies use to describe a view. Accepts a string, a LocalizedStringKey, a Text, or a content closure for richer composition.",
        signature: "func accessibilityLabel<S>(_ label: S, isEnabled: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where S : StringProtocol",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitylabel(_:isenabled:).md",
        page: { AnyView(AccessibilityLabelGalleryPage()) }
    )
}

#Preview {
    AccessibilityLabelGalleryPage()
        .frame(width: 900, height: 700)
}
