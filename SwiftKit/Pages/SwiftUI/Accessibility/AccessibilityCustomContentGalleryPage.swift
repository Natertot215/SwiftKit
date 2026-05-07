import SwiftUI

struct AccessibilityCustomContentGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Importance variants

            VariantTile(
                name: ".default importance",
                api: #".accessibilityCustomContent("Author", "K. Wong")"#
            ) {
                VStack(alignment: .leading) {
                    Text("Designing for VoiceOver")
                        .font(.headline)
                    Text("K. Wong")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .accessibilityElement(children: .combine)
                .accessibilityCustomContent("Author", "K. Wong")
            }

            VariantTile(
                name: ".high importance",
                api: #".accessibilityCustomContent("Status", "Overdue", importance: .high)"#
            ) {
                Label("Q3 Report", systemImage: "doc.text")
                    .accessibilityCustomContent("Status", "Overdue", importance: .high)
            }

            // MARK: Keyed content

            VariantTile(
                name: "AccessibilityCustomContentKey",
                api: #"AccessibilityCustomContentKey("Reading time")"#
            ) {
                Text("12 min read")
                    .font(.callout)
                    .accessibilityCustomContent(
                        AccessibilityCustomContentKey("Reading time"),
                        Text("12 minutes")
                    )
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityCustomContentKey",
                signature: "struct AccessibilityCustomContentKey",
                note: "Pre-key your custom content so multiple values share a label across the app — VoiceOver can present them as a unified attribute."
            )

            ReferenceTile(
                name: "AXCustomContent.Importance",
                signature: "enum AXCustomContent.Importance { case `default`, high }",
                note: ".default: the value is announced when the user requests more info. .high: announced automatically on every focus."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Surface secondary metadata without bloating the visible label.",
                note: "Use for attributes the visible UI conveys via icons or position — author, due date, file type. Don't replace `accessibilityLabel`."
            )
        }
    }
}

extension AccessibilityCustomContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityCustomContent",
        title: "AccessibilityCustomContent",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityCustomContent(_:_:importance:)",
            "AccessibilityCustomContentKey",
            "swiftui.accessible-descriptions.accessibilitycustomcontent(_:_:importance:)",
            "swiftui.accessible-descriptions.accessibilitycustomcontentkey"
        ],
        blurb: "Adds keyed metadata that VoiceOver exposes alongside the main label — read aloud at .high importance or available on demand at .default. Use to surface secondary attributes without cluttering the visible UI.",
        signature: "func accessibilityCustomContent(_ key: AccessibilityCustomContentKey, _ value: Text, importance: AXCustomContent.Importance = .default) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitycustomcontent(_:_:importance:).md",
        page: { AnyView(AccessibilityCustomContentGalleryPage()) }
    )
}

#Preview {
    AccessibilityCustomContentGalleryPage()
        .frame(width: 900, height: 700)
}
