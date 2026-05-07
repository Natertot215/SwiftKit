import SwiftUI

struct ReferenceColorGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Hierarchical foreground levels

            VariantTile(name: "primary", api: ".foregroundStyle(.primary)") {
                Text("Aa")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
            }

            VariantTile(name: "secondary", api: ".foregroundStyle(.secondary)") {
                Text("Aa")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }

            VariantTile(name: "tertiary", api: ".foregroundStyle(.tertiary)") {
                Text("Aa")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.tertiary)
            }

            VariantTile(name: "quaternary", api: ".foregroundStyle(.quaternary)") {
                Text("Aa")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.quaternary)
            }

            // MARK: Accent and tint

            VariantTile(name: "tint", api: "RoundedRectangle(...).fill(.tint)") {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.tint)
                    .frame(width: 120, height: 56)
            }

            VariantTile(name: "accentColor", api: ".fill(Color.accentColor)") {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.accentColor)
                    .frame(width: 120, height: 56)
            }

            VariantTile(name: "tint at 50% opacity", api: ".fill(.tint.opacity(0.5))") {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.tint.opacity(0.5))
                    .frame(width: 120, height: 56)
            }

            // MARK: Surfaces and separators

            VariantTile(name: "background", api: ".fill(.background)") {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.background)
                    .frame(width: 120, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .strokeBorder(.separator, lineWidth: 0.5)
                    )
            }

            VariantTile(
                name: "controlBackgroundColor",
                api: "Color(nsColor: .controlBackgroundColor)"
            ) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color(nsColor: .controlBackgroundColor))
                    .frame(width: 120, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .strokeBorder(.separator, lineWidth: 0.5)
                    )
            }

            VariantTile(
                name: "windowBackgroundColor",
                api: "Color(nsColor: .windowBackgroundColor)"
            ) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color(nsColor: .windowBackgroundColor))
                    .frame(width: 120, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .strokeBorder(.separator, lineWidth: 0.5)
                    )
            }

            VariantTile(name: "separator", api: "Rectangle().fill(.separator)") {
                Rectangle()
                    .fill(.separator)
                    .frame(height: 1)
                    .frame(maxWidth: 140)
            }

            // MARK: Light vs dark color scheme

            VariantTile(
                name: "Light scheme swatch",
                api: ".preferredColorScheme(.light)"
            ) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.background)
                    .frame(width: 120, height: 56)
                    .overlay(
                        Text("Aa")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primary)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .strokeBorder(.separator, lineWidth: 0.5)
                    )
                    .preferredColorScheme(.light)
            }

            VariantTile(
                name: "Dark scheme swatch",
                api: ".preferredColorScheme(.dark)"
            ) {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.background)
                    .frame(width: 120, height: 56)
                    .overlay(
                        Text("Aa")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primary)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .strokeBorder(.separator, lineWidth: 0.5)
                    )
                    .preferredColorScheme(.dark)
            }

            // MARK: Reference

            ReferenceTile(
                name: "ShapeStyle hierarchy",
                signature: "HierarchicalShapeStyle  // .primary, .secondary, .tertiary, .quaternary",
                note: "Each level draws the same content in a progressively muted tone of the surrounding context. Designed for hierarchy, not raw color choice."
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Avoid hard-coding system color values.",
                note: "Documented values are for design reference only. Use Color or NSColor APIs so colors track OS updates, accessibility, and Liquid Glass."
            )
        }
    }
}

extension ReferenceColorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "reference.color.color",
        title: "Color",
        folder: "Reference",
        framework: .reference,
        absorbedSymbols: ["ReferenceColor"],
        blurb: "System and custom colors that adapt to light, dark, and increased-contrast contexts. Surfaces SwiftUI's Color, ShapeStyle hierarchy, and the AppKit NSColor catalog.",
        signature: "Color \u{00b7} ShapeStyle \u{00b7} NSColor",
        availability: "macOS 10.15+",
        docPath: "Documentation/HIG/foundations/color.md",
        page: { AnyView(ReferenceColorGalleryPage()) }
    )
}

#Preview {
    ReferenceColorGalleryPage()
        .frame(width: 900, height: 700)
}
