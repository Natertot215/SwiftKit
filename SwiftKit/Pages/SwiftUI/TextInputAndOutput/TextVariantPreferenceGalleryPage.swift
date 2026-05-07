import SwiftUI

// TextVariantPreference — protocol controlling the size variant of text views.
// Concrete conformers: FixedTextVariant, SizeDependentTextVariant.

struct TextVariantPreferenceGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Reference — protocol surface only (no live demo target)

            ReferenceTile(
                name: "TextVariantPreference",
                signature: "protocol TextVariantPreference",
                note: "A protocol controlling the size variant of text views. Has two concrete conforming types in SwiftUI: FixedTextVariant and SizeDependentTextVariant."
            )

            ReferenceTile(
                name: "FixedTextVariant",
                signature: "struct FixedTextVariant : TextVariantPreference",
                note: "A text variant preference that picks a fixed size variant rather than adapting to the available space. Accessed via the type property `.fixed`."
            )

            ReferenceTile(
                name: "SizeDependentTextVariant",
                signature: "struct SizeDependentTextVariant : TextVariantPreference",
                note: "A text variant preference that picks the size variant that best fits the available space. Accessed via `.sizeDependent`."
            )

            ReferenceTile(
                name: "Type properties",
                signature: ".fixed · .sizeDependent",
                note: "Both conformers are constructed via static properties on TextVariantPreference. You don't initialize either struct directly."
            )

            ReferenceTile(
                name: "Companion APIs",
                signature: "textScale(_:isEnabled:) · dynamicTypeSize(_:) · DynamicTypeSize · ScaledMetric",
                note: "TextVariantPreference is one piece of SwiftUI's broader text-sizing surface. Pair it with textScale and DynamicTypeSize to fully control how text resizes."
            )

            ReferenceTile(
                name: "Availability",
                signature: "// macOS 15.0+ / iOS 18.0+",
                note: "Introduced alongside SwiftUI's expanded text-rendering controls in 2024."
            )
        }
    }
}

extension TextVariantPreferenceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textVariantPreference",
        title: "TextVariantPreference",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.textvariantpreference",
            "swiftui.text-input-and-output.fixedtextvariant",
            "swiftui.text-input-and-output.sizedependenttextvariant"
        ],
        blurb: "A protocol for controlling the size variant of text views, plus its FixedTextVariant and SizeDependentTextVariant conforming types.",
        signature: "protocol TextVariantPreference",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textvariantpreference.md",
        page: { AnyView(TextVariantPreferenceGalleryPage()) }
    )
}

#Preview {
    TextVariantPreferenceGalleryPage()
        .frame(width: 900, height: 700)
}
