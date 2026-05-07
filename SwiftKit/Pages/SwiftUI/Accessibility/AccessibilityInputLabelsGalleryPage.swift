import SwiftUI

struct AccessibilityInputLabelsGalleryPage: View {
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
                name: "synonyms",
                api: #".accessibilityInputLabels(["Heart", "Like", "Favorite"])"#
            ) {
                Button {
                } label: {
                    Image(systemName: "heart")
                }
                .accessibilityInputLabels(["Heart", "Like", "Favorite"])
            }

            VariantTile(
                name: "icon-only control",
                api: #".accessibilityInputLabels(["Share", "Send"])"#
            ) {
                Button {
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .accessibilityInputLabels(["Share", "Send"])
            }

            VariantTile(
                name: "ambiguous label",
                api: #".accessibilityInputLabels(["Plus", "Add", "New"])"#
            ) {
                Button("+") {}
                    .accessibilityInputLabels(["Plus", "Add", "New"])
            }

            // MARK: Reference

            ReferenceTile(
                name: "Targets Voice Control",
                signature: "Voice Control says \"Tap [name]\" — input labels are the names that match.",
                note: "VoiceOver still uses `accessibilityLabel`. Input labels are specifically the speech-recognition vocabulary for invoking a control."
            )

            ReferenceTile(
                name: "List the visible label first",
                signature: "Order matters — first entry is the canonical command name.",
                note: "Voice Control says \"Show numbers\" using the first label. Subsequent entries are equivalent ways to refer to the same control."
            )

            ReferenceTile(
                name: "isEnabled overload",
                signature: "func accessibilityInputLabels(_:isEnabled:)",
                note: "Toggle off when a state change makes the synonyms misleading — e.g., a play button labelled both \"Play\" and \"Pause\"."
            )
        }
    }
}

extension AccessibilityInputLabelsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityInputLabels",
        title: "AccessibilityInputLabels",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityInputLabels(_:)",
            "View/accessibilityInputLabels(_:isEnabled:)",
            "swiftui.accessible-descriptions.accessibilityinputlabels(_:)",
            "swiftui.accessible-descriptions.accessibilityinputlabels(_:isenabled:)"
        ],
        blurb: "Sets alternate names that Voice Control and other speech-input technologies use to address a view. Provide synonyms when the visible label may not be what users say.",
        signature: "func accessibilityInputLabels(_ inputLabels: [LocalizedStringKey]) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityinputlabels(_:).md",
        page: { AnyView(AccessibilityInputLabelsGalleryPage()) }
    )
}

#Preview {
    AccessibilityInputLabelsGalleryPage()
        .frame(width: 900, height: 700)
}
