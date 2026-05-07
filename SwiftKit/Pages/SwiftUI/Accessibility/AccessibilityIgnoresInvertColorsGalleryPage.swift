import SwiftUI

struct AccessibilityIgnoresInvertColorsGalleryPage: View {
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
                api: ".accessibilityIgnoresInvertColors()"
            ) {
                LinearGradient(
                    colors: [.orange, .pink, .purple],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 140, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .accessibilityIgnoresInvertColors()
            }

            VariantTile(
                name: "explicit false",
                api: ".accessibilityIgnoresInvertColors(false)"
            ) {
                LinearGradient(
                    colors: [.orange, .pink, .purple],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: 140, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .accessibilityIgnoresInvertColors(false)
            }

            // MARK: Reference

            ReferenceTile(
                name: "When to set true",
                signature: "Photos, app icons, brand artwork, color-coded data viz.",
                note: "Smart Invert flips most colors but exempts media — opt out manually for any color where Smart Invert would corrupt meaning."
            )

            ReferenceTile(
                name: "Don't blanket-disable",
                signature: "Smart Invert is opt-in by users who need it.",
                note: "Use sparingly. The user has chosen color inversion as an accommodation — only protect content where flipping breaks comprehension."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "macOS Smart Invert ≠ Classic Invert.",
                note: "Smart Invert preserves images and media by default. This modifier is for cases the system can't auto-detect — chart series, gradient backgrounds, custom illustrations."
            )
        }
    }
}

extension AccessibilityIgnoresInvertColorsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityIgnoresInvertColors",
        title: "AccessibilityIgnoresInvertColors",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityIgnoresInvertColors(_:)",
            "swiftui.accessible-appearance.accessibilityignoresinvertcolors(_:)"
        ],
        blurb: "Sets whether this view should ignore the system Smart Invert setting. Use to protect images, photos, and color-critical artwork from color inversion.",
        signature: "func accessibilityIgnoresInvertColors(_ active: Bool = true) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/accessible-appearance/accessibilityignoresinvertcolors(_:).md",
        page: { AnyView(AccessibilityIgnoresInvertColorsGalleryPage()) }
    )
}

#Preview {
    AccessibilityIgnoresInvertColorsGalleryPage()
        .frame(width: 900, height: 700)
}
