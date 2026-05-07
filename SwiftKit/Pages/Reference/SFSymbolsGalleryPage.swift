import SwiftUI

struct SFSymbolsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Image(systemName:) basics

            VariantTile(name: "heart", api: "Image(systemName: \"heart\")") {
                Image(systemName: "heart")
                    .font(.title)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "star.fill", api: "Image(systemName: \"star.fill\")") {
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "gearshape", api: "Image(systemName: \"gearshape\")") {
                Image(systemName: "gearshape")
                    .font(.title)
                    .foregroundStyle(.primary)
            }

            VariantTile(
                name: "person.crop.circle",
                api: "Image(systemName: \"person.crop.circle\")"
            ) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
                    .foregroundStyle(.primary)
            }

            // MARK: Rendering modes

            VariantTile(
                name: "monochrome",
                api: ".symbolRenderingMode(.monochrome)"
            ) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.largeTitle)
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(.tint)
            }

            VariantTile(
                name: "hierarchical",
                api: ".symbolRenderingMode(.hierarchical)"
            ) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.largeTitle)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.tint)
            }

            VariantTile(
                name: "palette",
                api: ".symbolRenderingMode(.palette).foregroundStyle(.primary, .secondary, .tertiary)"
            ) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.largeTitle)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.primary, .secondary, .tertiary)
            }

            VariantTile(
                name: "multicolor",
                api: ".symbolRenderingMode(.multicolor)"
            ) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.largeTitle)
                    .symbolRenderingMode(.multicolor)
            }

            // MARK: Symbol variants

            VariantTile(name: "variant .none", api: ".symbolVariant(.none)") {
                Image(systemName: "heart")
                    .font(.title)
                    .symbolVariant(.none)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "variant .fill", api: ".symbolVariant(.fill)") {
                Image(systemName: "heart")
                    .font(.title)
                    .symbolVariant(.fill)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "variant .circle", api: ".symbolVariant(.circle)") {
                Image(systemName: "heart")
                    .font(.title)
                    .symbolVariant(.circle)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "variant .slash", api: ".symbolVariant(.slash)") {
                Image(systemName: "bell")
                    .font(.title)
                    .symbolVariant(.slash)
                    .foregroundStyle(.tint)
            }

            // MARK: Weights

            VariantTile(name: "weight .ultraLight", api: ".fontWeight(.ultraLight)") {
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight .regular", api: ".fontWeight(.regular)") {
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight .bold", api: ".fontWeight(.bold)") {
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "weight .heavy", api: ".fontWeight(.heavy)") {
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
            }

            // MARK: Image scale

            VariantTile(name: "imageScale .small", api: ".imageScale(.small)") {
                Label("Small", systemImage: "bolt.fill")
                    .font(.body)
                    .imageScale(.small)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "imageScale .medium", api: ".imageScale(.medium)") {
                Label("Medium", systemImage: "bolt.fill")
                    .font(.body)
                    .imageScale(.medium)
                    .foregroundStyle(.tint)
            }

            VariantTile(name: "imageScale .large", api: ".imageScale(.large)") {
                Label("Large", systemImage: "bolt.fill")
                    .font(.body)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }

            // MARK: Reference

            ReferenceTile(
                name: "SymbolRenderingMode",
                signature: "enum SymbolRenderingMode  // .monochrome, .hierarchical, .palette, .multicolor",
                note: "Pick a rendering mode per context. Monochrome reads cleanest in dense UI; hierarchical adds depth without color load."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Use SF Symbols app to browse the catalog.",
                note: "Symbols introduced in newer SF Symbols releases require matching OS targets. Don't use SF Symbols in app icons or logos."
            )
        }
    }
}

extension SFSymbolsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "reference.sfSymbols.sfSymbols",
        title: "SF Symbols",
        folder: "Reference",
        framework: .reference,
        absorbedSymbols: ["SFSymbols"],
        blurb: "Thousands of consistent, configurable symbols that align with the San Francisco system font in every weight and size. Covers rendering modes, variants, and animation hooks.",
        signature: "Image(systemName:) \u{00b7} SymbolRenderingMode \u{00b7} SymbolVariants",
        availability: "macOS 11.0+",
        docPath: "Documentation/HIG/foundations/sf-symbols.md",
        page: { AnyView(SFSymbolsGalleryPage()) }
    )
}

#Preview {
    SFSymbolsGalleryPage()
        .frame(width: 900, height: 700)
}
