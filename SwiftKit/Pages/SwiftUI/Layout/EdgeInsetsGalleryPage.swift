import SwiftUI

struct EdgeInsetsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Symmetric insets",
                api: "EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)"
            ) {
                Text("Inset")
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    .background(.tint.opacity(0.18), in: RoundedRectangle(cornerRadius: 6))
            }

            VariantTile(
                name: "Asymmetric insets",
                api: "EdgeInsets(top: 4, leading: 24, bottom: 4, trailing: 24)"
            ) {
                Text("Pill")
                    .padding(EdgeInsets(top: 4, leading: 24, bottom: 4, trailing: 24))
                    .background(.tint.opacity(0.18), in: Capsule())
            }

            VariantTile(
                name: "Init from a uniform value",
                api: ".padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))"
            ) {
                RoundedRectangle(cornerRadius: 6)
                    .fill(.tint.opacity(0.18))
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                    .frame(width: 120, height: 64)
                    .background(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator))
            }

            ReferenceTile(
                name: "EdgeInsets",
                signature: "@frozen struct EdgeInsets : Equatable, Animatable  { var top, leading, bottom, trailing: CGFloat }",
                note: "Per-edge inset distances. Used by .padding(_:), .listRowInsets(_:), .containerBackground(for:alignment:content:) — anywhere a layout needs four-sided spacing as a single value."
            )

            ReferenceTile(
                name: "Animatable",
                signature: "extension EdgeInsets : Animatable",
                note: "EdgeInsets animates component-wise. Drive it with .animation(_:value:) or pass it to a custom Animatable view to interpolate insets smoothly."
            )

            ReferenceTile(
                name: "EdgeInsets3D",
                signature: "struct EdgeInsets3D  // adds front, back",
                note: "Six-edge variant for spatial layouts. Adds depth-axis insets for views that participate in volumetric scenes.",
                badge: "visionOS"
            )

            ReferenceTile(
                name: "Convert from CGFloat",
                signature: ".padding(12)  →  EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)",
                note: "The single-CGFloat .padding(_:) overload is sugar for an EdgeInsets with all four sides equal — use the explicit form when sides need to differ."
            )
        }
    }
}

extension EdgeInsetsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.edgeInsets",
        title: "EdgeInsets",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "EdgeInsets",
            "EdgeInsets3D",
            "swiftui.layout-adjustments.edgeinsets",
            "swiftui.layout-adjustments.edgeinsets3d",
        ],
        blurb: "The inset distances for the sides of a rectangle, used wherever a layout needs per-edge spacing — padding, list-row insets, container background placement. EdgeInsets3D extends the type with a depth-axis component.",
        signature: "@frozen struct EdgeInsets : Equatable, Animatable, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/edgeinsets.md",
        page: { AnyView(EdgeInsetsGalleryPage()) }
    )
}

#Preview {
    EdgeInsetsGalleryPage()
        .frame(width: 900, height: 700)
}
