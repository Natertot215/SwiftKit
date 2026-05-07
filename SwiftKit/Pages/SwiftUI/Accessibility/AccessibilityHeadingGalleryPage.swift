import SwiftUI

struct AccessibilityHeadingGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Heading levels

            VariantTile(
                name: "h1",
                api: ".accessibilityHeading(.h1)"
            ) {
                Text("Settings")
                    .font(.title)
                    .accessibilityHeading(.h1)
            }

            VariantTile(
                name: "h2",
                api: ".accessibilityHeading(.h2)"
            ) {
                Text("General")
                    .font(.title2)
                    .accessibilityHeading(.h2)
            }

            VariantTile(
                name: "h3",
                api: ".accessibilityHeading(.h3)"
            ) {
                Text("Appearance")
                    .font(.title3)
                    .accessibilityHeading(.h3)
            }

            VariantTile(
                name: ".unspecified",
                api: ".accessibilityHeading(.unspecified)"
            ) {
                Text("Section divider")
                    .font(.headline)
                    .accessibilityHeading(.unspecified)
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityHeadingLevel",
                signature: "enum AccessibilityHeadingLevel { case unspecified, h1, h2, h3, h4, h5, h6 }",
                note: "Mirrors HTML heading levels. Use exactly one h1 per screen and nest subsequent levels logically — VoiceOver users navigate by heading hierarchy."
            )

            ReferenceTile(
                name: "Pair with traits",
                signature: ".accessibilityAddTraits(.isHeader)",
                note: "Older macOS still relies on the `.isHeader` trait. Apply both for maximum compatibility on long-lived codebases."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Don't skip levels just because the visible text is smaller.",
                note: "Heading hierarchy is for navigation, not styling. A small subtitle can still be h2 if it groups the section below it."
            )
        }
    }
}

extension AccessibilityHeadingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityHeading",
        title: "AccessibilityHeading",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityHeading(_:)",
            "AccessibilityHeadingLevel",
            "swiftui.accessible-descriptions.accessibilityheading(_:)",
            "swiftui.accessible-descriptions.accessibilityheadinglevel"
        ],
        blurb: "Marks a view as a heading and assigns its level. VoiceOver users can navigate by headings using the rotor — equivalent to HTML h1–h6.",
        signature: "func accessibilityHeading(_ level: AccessibilityHeadingLevel) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilityheading(_:).md",
        page: { AnyView(AccessibilityHeadingGalleryPage()) }
    )
}

#Preview {
    AccessibilityHeadingGalleryPage()
        .frame(width: 900, height: 700)
}
