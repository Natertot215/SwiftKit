import SwiftUI

struct ShadowStyleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Drop shadow — radius variants

            VariantTile(
                name: "drop, radius 2",
                api: ".shadow(radius: 2)"
            ) {
                shadowPlate
                    .shadow(radius: 2)
            }

            VariantTile(
                name: "drop, radius 6",
                api: ".shadow(radius: 6)"
            ) {
                shadowPlate
                    .shadow(radius: 6)
            }

            VariantTile(
                name: "drop, radius 14",
                api: ".shadow(radius: 14)"
            ) {
                shadowPlate
                    .shadow(radius: 14)
            }

            // MARK: Color + offset

            VariantTile(
                name: "tinted shadow",
                api: ".shadow(color: .accentColor.opacity(0.5), radius: 8, y: 4)"
            ) {
                shadowPlate
                    .shadow(color: Color.accentColor.opacity(0.5), radius: 8, x: 0, y: 4)
            }

            VariantTile(
                name: "offset y: 6",
                api: ".shadow(color: .black.opacity(0.3), radius: 6, y: 6)"
            ) {
                shadowPlate
                    .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 6)
            }

            // MARK: ShadowStyle (drop / inner) — applied via .fill on a Shape

            VariantTile(
                name: "ShadowStyle.drop",
                api: ".fill(.tint.shadow(.drop(radius: 6, y: 4)))"
            ) {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.accentColor.shadow(.drop(radius: 6, y: 4)))
                    .frame(width: 120, height: 64)
            }

            VariantTile(
                name: "ShadowStyle.inner",
                api: ".fill(.tint.shadow(.inner(radius: 6, y: 2)))"
            ) {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.accentColor.shadow(.inner(radius: 6, y: 2)))
                    .frame(width: 120, height: 64)
            }

            // MARK: Reference

            ReferenceTile(
                name: "ShadowStyle",
                signature: "struct ShadowStyle  // .drop(color:radius:x:y:)  ·  .inner(color:radius:x:y:)",
                note: "Constructs `drop` or `inner` shadow descriptions for use as part of a ShapeStyle via `.shadow(_:)` on a style — e.g. `Color.tint.shadow(.drop(radius: 4))`."
            )

            ReferenceTile(
                name: "View.shadow(color:radius:x:y:)",
                signature: "func shadow(color: Color = .init(...), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> some View",
                note: "Adds a drop shadow to the rendered view. The default color is a translucent black tuned for both light and dark mode."
            )

            ReferenceTile(
                name: "ShapeStyle.shadow(_:)",
                signature: "func shadow(_ style: ShadowStyle) -> some ShapeStyle",
                note: "Returns a new ShapeStyle that draws the receiver under the supplied shadow. Use this when the shadow needs to participate in a fill (Shape, Text, SF Symbol)."
            )
        }
    }

    private var shadowPlate: some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(Color(nsColor: .controlBackgroundColor))
            .frame(width: 120, height: 64)
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(.separator.opacity(0.5), lineWidth: 0.5)
            )
    }
}

extension ShadowStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.shadowStyle",
        title: "ShadowStyle",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["ShadowStyle", "View/shadow(color:radius:x:y:)"],
        blurb: "A style used when rendering shadows — paired with the shadow modifier to add drop and inner shadows to views with configurable color, radius, and offset.",
        signature: "struct ShadowStyle",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/shadowstyle.md",
        page: { AnyView(ShadowStyleGalleryPage()) }
    )
}

#Preview {
    ShadowStyleGalleryPage()
        .frame(width: 900, height: 700)
}
