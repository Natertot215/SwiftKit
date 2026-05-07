import SwiftUI

struct TypographyGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Font.TextStyle ramp

            VariantTile(name: "largeTitle", api: ".font(.largeTitle)") {
                Text("The quick fox.")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "title", api: ".font(.title)") {
                Text("The quick fox.")
                    .font(.title)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "title2", api: ".font(.title2)") {
                Text("The quick fox.")
                    .font(.title2)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "title3", api: ".font(.title3)") {
                Text("The quick fox.")
                    .font(.title3)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "headline", api: ".font(.headline)") {
                Text("The quick fox.")
                    .font(.headline)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "body", api: ".font(.body)") {
                Text("The quick fox.")
                    .font(.body)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "callout", api: ".font(.callout)") {
                Text("The quick fox.")
                    .font(.callout)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "subheadline", api: ".font(.subheadline)") {
                Text("The quick fox.")
                    .font(.subheadline)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "footnote", api: ".font(.footnote)") {
                Text("The quick fox.")
                    .font(.footnote)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "caption", api: ".font(.caption)") {
                Text("The quick fox.")
                    .font(.caption)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "caption2", api: ".font(.caption2)") {
                Text("The quick fox.")
                    .font(.caption2)
                    .foregroundStyle(.primary)
            }

            // MARK: Font.Weight

            VariantTile(name: "weight ultraLight", api: ".fontWeight(.ultraLight)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight light", api: ".fontWeight(.light)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight regular", api: ".fontWeight(.regular)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight medium", api: ".fontWeight(.medium)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight semibold", api: ".fontWeight(.semibold)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight bold", api: ".fontWeight(.bold)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight heavy", api: ".fontWeight(.heavy)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight black", api: ".fontWeight(.black)") {
                Text("SwiftKit")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
            }

            // MARK: Font.Design

            VariantTile(name: "design default (SF Pro)", api: ".fontDesign(.default)") {
                Text("The quick fox.")
                    .font(.title2)
                    .fontDesign(.default)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "design serif (New York)", api: ".fontDesign(.serif)") {
                Text("The quick fox.")
                    .font(.title2)
                    .fontDesign(.serif)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "design rounded (SF Rounded)", api: ".fontDesign(.rounded)") {
                Text("The quick fox.")
                    .font(.title2)
                    .fontDesign(.rounded)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "design monospaced (SF Mono)", api: ".fontDesign(.monospaced)") {
                Text("The quick fox.")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.primary)
            }

            // MARK: Reference

            ReferenceTile(
                name: "Font.TextStyle",
                signature: "enum Font.TextStyle  // .largeTitle … .caption2",
                note: "11 documented macOS text styles. Pick the role you need; let the system size optically. Don't substitute .system(size:)."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Avoid Ultralight, Thin, and Light at body sizes.",
                note: "Prefer Regular, Medium, Semibold, or Bold for legibility. SF Symbols match the adjacent text weight automatically — never set symbol weight independently."
            )

            ReferenceTile(
                name: "DynamicTypeSize",
                signature: ".dynamicTypeSize(_:)",
                note: "macOS does not honor a system-wide Dynamic Type setting; iOS/iPadOS/visionOS/watchOS opt-in via Settings. Apply directly only when you need to demonstrate a specific size."
            )
        }
    }
}

extension TypographyGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "reference.typography.typography",
        title: "Typography",
        folder: "Reference",
        framework: .reference,
        absorbedSymbols: ["Typography"],
        blurb: "Text styles, font weights, designs, and widths that establish legible hierarchy on macOS. Mirrors Apple's HIG typography reference and the SwiftUI Font catalog.",
        signature: "Font \u{00b7} TextStyle \u{00b7} Weight",
        availability: "macOS 13.0+",
        docPath: "Documentation/HIG/foundations/typography.md",
        page: { AnyView(TypographyGalleryPage()) }
    )
}

#Preview {
    TypographyGalleryPage()
        .frame(width: 900, height: 700)
}
