import SwiftUI

// monospaced(_:) and monospacedDigit() — swap fonts to fixed-width variants.
// monospaced applies to all glyphs; monospacedDigit only to numerals.

struct MonospacedGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: monospaced

            VariantTile(
                name: "Default (proportional)",
                api: "// no modifier"
            ) {
                Text("WWW iii lll mmm")
            }

            VariantTile(
                name: ".monospaced()",
                api: ".monospaced()"
            ) {
                Text("WWW iii lll mmm")
                    .monospaced()
            }

            VariantTile(
                name: ".monospaced(true)",
                api: ".monospaced(true)"
            ) {
                Text("WWW iii lll mmm")
                    .monospaced(true)
            }

            VariantTile(
                name: ".monospaced(false)",
                api: ".monospaced(false)"
            ) {
                Text("WWW iii lll mmm")
                    .monospaced(false)
            }

            // MARK: monospacedDigit

            VariantTile(
                name: "Default digits (proportional)",
                api: "// no modifier"
            ) {
                Text("123,456.789 vs 000,000.000")
            }

            VariantTile(
                name: ".monospacedDigit()",
                api: ".monospacedDigit()"
            ) {
                Text("123,456.789 vs 000,000.000")
                    .monospacedDigit()
            }

            // MARK: Practical use — counter that doesn't jitter

            VariantTile(
                name: "Counter — no horizontal jitter",
                api: ".font(.title3.monospacedDigit())"
            ) {
                Text("00:42")
                    .font(.title3.monospacedDigit())
            }

            // MARK: Reference

            ReferenceTile(
                name: "monospaced(_:)",
                signature: "func monospaced(_ isActive: Bool = true) -> some View",
                note: "Modifies the fonts of all child views to use the fixed-width variant of the current font. Applies to every glyph, not just digits."
            )

            ReferenceTile(
                name: "monospacedDigit()",
                signature: "func monospacedDigit() -> some View",
                note: "Swaps in fixed-width digits while leaving other characters proportional. Use for counters, prices, and timestamps that update in place — keeps columns from wiggling as digits change."
            )

            ReferenceTile(
                name: "Font.monospaced()",
                signature: "func monospaced() -> Font · func monospacedDigit() -> Font",
                note: "The same modifiers are also available directly on Font, so you can author a font value once: `.font(.title3.monospacedDigit())`."
            )
        }
    }
}

extension MonospacedGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.monospaced",
        title: "Monospaced",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.monospaced(_:)",
            "swiftui.text-input-and-output.monospaceddigit()"
        ],
        blurb: "Modifies the fonts of all child views to use the fixed-width variant of the current font; companion modifier swaps in fixed-width digits while leaving other characters proportional.",
        signature: "func monospaced(_ isActive: Bool = true) -> some View · func monospacedDigit() -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/monospaced(_:).md",
        page: { AnyView(MonospacedGalleryPage()) }
    )
}

#Preview {
    MonospacedGalleryPage()
        .frame(width: 900, height: 700)
}
