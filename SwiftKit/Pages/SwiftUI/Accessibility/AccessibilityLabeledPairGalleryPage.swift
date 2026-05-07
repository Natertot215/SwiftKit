import SwiftUI

struct AccessibilityLabeledPairGalleryPage: View {
    @Namespace private var pairNamespace

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
                name: ".label / .content",
                api: ".accessibilityLabeledPair(role: .label, id: \"battery\", in: ns)"
            ) {
                HStack(spacing: 12) {
                    Text("Battery")
                        .accessibilityLabeledPair(role: .label, id: "battery", in: pairNamespace)
                    Text("78%")
                        .accessibilityLabeledPair(role: .content, id: "battery", in: pairNamespace)
                }
                .font(.callout)
            }

            VariantTile(
                name: "decoupled label/value pair",
                api: "Same id across non-adjacent views",
                height: 110
            ) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Wi-Fi")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .accessibilityLabeledPair(role: .label, id: "wifi", in: pairNamespace)
                    Text("Studio-5G")
                        .font(.headline)
                        .accessibilityLabeledPair(role: .content, id: "wifi", in: pairNamespace)
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityLabeledPairRole",
                signature: "enum AccessibilityLabeledPairRole { case label, content }",
                note: "Identifies which side of the pair a view represents. VoiceOver reads them as a single concatenated element."
            )

            ReferenceTile(
                name: "Namespace required",
                signature: "@Namespace private var ns",
                note: "The id must be unique within the namespace. Declare a `@Namespace` in the view that owns both halves of the pair."
            )

            ReferenceTile(
                name: "When to use",
                signature: "Inspector rows, settings tables, key/value summaries.",
                note: "Use when label and value are visually separated (across columns, with whitespace) but semantically belong together. For inline pairs, just `accessibilityElement(children: .combine)`."
            )
        }
    }
}

extension AccessibilityLabeledPairGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityLabeledPair",
        title: "AccessibilityLabeledPair",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityLabeledPair(role:id:in:)",
            "AccessibilityLabeledPairRole",
            "swiftui.accessible-descriptions.accessibilitylabeledpair(role:id:in:)",
            "swiftui.accessible-descriptions.accessibilitylabeledpairrole"
        ],
        blurb: "Pairs a label view with the value or control it describes so assistive technologies announce the two together. Each pair shares an id within a Namespace.",
        signature: "func accessibilityLabeledPair<ID>(role: AccessibilityLabeledPairRole, id: ID, in namespace: Namespace.ID) -> ModifiedContent<Self, AccessibilityAttachmentModifier> where ID : Hashable",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitylabeledpair(role:id:in:).md",
        page: { AnyView(AccessibilityLabeledPairGalleryPage()) }
    )
}

#Preview {
    AccessibilityLabeledPairGalleryPage()
        .frame(width: 900, height: 700)
}
