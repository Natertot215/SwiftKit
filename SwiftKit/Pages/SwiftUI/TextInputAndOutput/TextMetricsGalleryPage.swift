import SwiftUI

// Text metrics — baseline offset, kerning, tracking. All operate on Text
// (not arbitrary View) and return Text so they compose with other Text mods.

struct TextMetricsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: baselineOffset

            VariantTile(
                name: "Default baseline",
                api: "// no modifier"
            ) {
                Text("AaBbCc")
                    .font(.title3)
            }

            VariantTile(
                name: ".baselineOffset(8)",
                api: ".baselineOffset(8)"
            ) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text("E=mc")
                    Text("2").baselineOffset(8).font(.caption)
                }
                .font(.title3)
            }

            VariantTile(
                name: ".baselineOffset(-6)",
                api: ".baselineOffset(-6)"
            ) {
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text("H")
                    Text("2").baselineOffset(-6).font(.caption)
                    Text("O")
                }
                .font(.title3)
            }

            // MARK: kerning

            VariantTile(
                name: ".kerning(2)",
                api: ".kerning(2)"
            ) {
                Text("LIGATURE")
                    .kerning(2)
                    .font(.title3)
            }

            VariantTile(
                name: ".kerning(-1)",
                api: ".kerning(-1)"
            ) {
                Text("LIGATURE")
                    .kerning(-1)
                    .font(.title3)
            }

            // MARK: tracking

            VariantTile(
                name: ".tracking(4)",
                api: ".tracking(4)"
            ) {
                Text("WIDE")
                    .tracking(4)
                    .font(.title3)
            }

            VariantTile(
                name: ".tracking(-2)",
                api: ".tracking(-2)"
            ) {
                Text("TIGHT")
                    .tracking(-2)
                    .font(.title3)
            }

            // MARK: Reference

            ReferenceTile(
                name: "baselineOffset(_:)",
                signature: "func baselineOffset(_ baselineOffset: CGFloat) -> Text",
                note: "Shifts the rendered baseline by the given amount in points. Positive values move text up; negative move it down. Useful for sub/superscripts."
            )

            ReferenceTile(
                name: "kerning(_:)",
                signature: "func kerning(_ kerning: CGFloat) -> Text",
                note: "Adjusts spacing between specific character pairs that the font has kerning information for. Set to 0 for the font's natural kerning."
            )

            ReferenceTile(
                name: "tracking(_:)",
                signature: "func tracking(_ tracking: CGFloat) -> Text",
                note: "Adds a uniform amount of space between every character in the run. Unlike kerning, tracking does not vary by glyph pair — it's flat letter-spacing."
            )

            ReferenceTile(
                name: "kerning vs tracking",
                signature: "// kerning = pair-aware, tracking = uniform",
                note: "When both are applied, the effects compound. Kerning preserves the font's typographic intent; tracking reads more like a hard letter-spacing override."
            )
        }
    }
}

extension TextMetricsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textMetrics",
        title: "Text Metrics",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.baselineoffset(_:)",
            "swiftui.text-input-and-output.kerning(_:)",
            "swiftui.text-input-and-output.tracking(_:)"
        ],
        blurb: "Typographic metrics applied to text: baseline offset shifts vertical position, kerning adjusts spacing between specific character pairs, and tracking adjusts spacing uniformly across the run.",
        signature: "func baselineOffset(_:) · func kerning(_:) · func tracking(_:)",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/kerning(_:).md",
        page: { AnyView(TextMetricsGalleryPage()) }
    )
}

#Preview {
    TextMetricsGalleryPage()
        .frame(width: 900, height: 700)
}
