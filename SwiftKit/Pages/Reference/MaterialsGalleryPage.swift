import SwiftUI

struct MaterialsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Standard Material variants

            MaterialDemoTile(
                name: "ultraThinMaterial",
                api: ".background(.ultraThinMaterial, in: Capsule())",
                material: .ultraThinMaterial
            )

            MaterialDemoTile(
                name: "thinMaterial",
                api: ".background(.thinMaterial, in: Capsule())",
                material: .thinMaterial
            )

            MaterialDemoTile(
                name: "regularMaterial",
                api: ".background(.regularMaterial, in: Capsule())",
                material: .regularMaterial
            )

            MaterialDemoTile(
                name: "thickMaterial",
                api: ".background(.thickMaterial, in: Capsule())",
                material: .thickMaterial
            )

            MaterialDemoTile(
                name: "ultraThickMaterial",
                api: ".background(.ultraThickMaterial, in: Capsule())",
                material: .ultraThickMaterial
            )

            MaterialDemoTile(
                name: "bar",
                api: ".background(.bar, in: Capsule())",
                material: .bar
            )

            // MARK: Liquid Glass (macOS 26)

            VariantTile(
                name: "glassEffect()",
                api: ".glassEffect()"
            ) {
                ZStack {
                    LinearGradient(
                        colors: [Color.accentColor, Color.secondary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: 140, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                    Text("Aa")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .glassEffect()
                }
            }

            VariantTile(
                name: "glassEffect(.regular, in: Capsule())",
                api: ".glassEffect(.regular, in: Capsule())"
            ) {
                ZStack {
                    LinearGradient(
                        colors: [Color.accentColor, Color.secondary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: 140, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                    Text("Aa")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .glassEffect(.regular, in: Capsule())
                }
            }

            VariantTile(
                name: "glassEffect interactive",
                api: ".glassEffect(.regular.interactive())"
            ) {
                ZStack {
                    LinearGradient(
                        colors: [Color.accentColor, Color.secondary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: 140, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))

                    Text("Aa")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .glassEffect(.regular.interactive())
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "Material",
                signature: "enum Material : ShapeStyle  // .ultraThin, .thin, .regular, .thick, .ultraThick, .bar",
                note: "Materials filter what's behind them. Pair with `.background(_:in:)` and a clipping shape so the material has a defined surface."
            )

            ReferenceTile(
                name: "Liquid Glass",
                signature: "View.glassEffect(_:in:)",
                note: "Liquid Glass takes color from the content directly behind it. Apply sparingly to controls that benefit from emphasis — primary actions, status indicators.",
                badge: "macOS 26"
            )

            ReferenceTile(
                name: "Apple guidance",
                signature: "Materials adapt to vibrancy and Dark Mode automatically.",
                note: "Don't reach for hand-mixed translucent fills to mimic this look — they don't track OS appearance changes or accessibility settings."
            )
        }
    }
}

extension MaterialsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "reference.materials.materials",
        title: "Materials",
        folder: "Reference",
        framework: .reference,
        absorbedSymbols: ["Material"],
        blurb: "Visual effects that create a sense of depth, layering, and hierarchy. Spans Liquid Glass for controls and navigation plus the standard materials for content surfaces.",
        signature: "Material \u{00b7} .background(_:) \u{00b7} .glassEffect(_:)",
        availability: "macOS 12.0+",
        docPath: "Documentation/HIG/foundations/materials.md",
        page: { AnyView(MaterialsGalleryPage()) }
    )
}

#Preview {
    MaterialsGalleryPage()
        .frame(width: 900, height: 700)
}
