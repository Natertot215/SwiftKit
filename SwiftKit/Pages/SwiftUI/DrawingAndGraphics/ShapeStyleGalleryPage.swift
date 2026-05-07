import SwiftUI

struct ShapeStyleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Color conformers

            ShapeStyleDemoTile(
                name: "Color.accentColor",
                api: ".fill(Color.accentColor)",
                style: Color.accentColor
            )

            ShapeStyleDemoTile(
                name: "Color.primary",
                api: ".fill(Color.primary)",
                style: Color.primary
            )

            ShapeStyleDemoTile(
                name: "Color.secondary",
                api: ".fill(Color.secondary)",
                style: Color.secondary
            )

            // MARK: Hierarchical / semantic

            ShapeStyleDemoTile(
                name: "HierarchicalShapeStyle.primary",
                api: ".fill(.primary)",
                style: HierarchicalShapeStyle.primary
            )

            ShapeStyleDemoTile(
                name: ".secondary",
                api: ".fill(.secondary)",
                style: HierarchicalShapeStyle.secondary
            )

            ShapeStyleDemoTile(
                name: ".tertiary",
                api: ".fill(.tertiary)",
                style: HierarchicalShapeStyle.tertiary
            )

            ShapeStyleDemoTile(
                name: ".quaternary",
                api: ".fill(.quaternary)",
                style: HierarchicalShapeStyle.quaternary
            )

            // MARK: Gradient conformers

            ShapeStyleDemoTile(
                name: "LinearGradient",
                api: "LinearGradient(colors:startPoint:endPoint:)",
                style: LinearGradient(
                    colors: [.blue, .purple, .pink],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )

            ShapeStyleDemoTile(
                name: "RadialGradient",
                api: "RadialGradient(colors:center:startRadius:endRadius:)",
                style: RadialGradient(
                    colors: [.yellow, .orange, .red],
                    center: .center,
                    startRadius: 4,
                    endRadius: 60
                )
            )

            ShapeStyleDemoTile(
                name: "AngularGradient",
                api: "AngularGradient(colors:center:)",
                style: AngularGradient(
                    colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                    center: .center
                )
            )

            ShapeStyleDemoTile(
                name: "Color.gradient (AnyGradient)",
                api: "Color.accentColor.gradient",
                style: Color.accentColor.gradient
            )

            // MARK: Material

            ShapeStyleDemoTile(
                name: "Material.regular",
                api: ".fill(.regularMaterial)",
                style: Material.regular
            )

            // MARK: Reference

            ReferenceTile(
                name: "ShapeStyle",
                signature: "protocol ShapeStyle : Sendable",
                note: "Anything renderable as a fill — Color, gradient types, Material, hierarchical levels, ImagePaint, and Shader. Drives `.fill`, `.foregroundStyle`, `.backgroundStyle`, and `.tint`."
            )

            ReferenceTile(
                name: "AnyShapeStyle",
                signature: "@frozen struct AnyShapeStyle : ShapeStyle",
                note: "A type-erased ShapeStyle wrapper. Use it to store heterogeneous styles in a single property without leaking the concrete type."
            )

            ReferenceTile(
                name: "View.foregroundStyle(_:)",
                signature: "func foregroundStyle<S: ShapeStyle>(_ style: S) -> some View",
                note: "Applies a primary foreground style. Two- and three-argument overloads set secondary/tertiary in one call: `.foregroundStyle(.primary, .secondary)`."
            )

            ReferenceTile(
                name: "View.backgroundStyle(_:)",
                signature: "func backgroundStyle<S: ShapeStyle>(_ style: S) -> some View",
                note: "Sets the implicit background style for descendants. Used by `.background()` when no explicit style is supplied."
            )

            ReferenceTile(
                name: "View.tint(_:)",
                signature: "func tint<S: ShapeStyle>(_ tint: S?) -> some View",
                note: "Overrides the accent color for descendants. Buttons, toggles, and progress views consult tint when rendering."
            )
        }
    }
}

extension ShapeStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.shapeStyle",
        title: "ShapeStyle",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "ShapeStyle",
            "AnyShapeStyle",
            "View/tint(_:)",
            "View/foregroundStyle(_:)",
            "View/foregroundStyle(_:_:)",
            "View/foregroundStyle(_:_:_:)",
            "View/backgroundStyle(_:)"
        ],
        blurb: "A color or pattern used to render shapes and surfaces. Drives tint, foregroundStyle, and backgroundStyle — single, dual, and triple-style applications all flow through the ShapeStyle protocol.",
        signature: "protocol ShapeStyle : Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/shapestyle.md",
        page: { AnyView(ShapeStyleGalleryPage()) }
    )
}

#Preview {
    ShapeStyleGalleryPage()
        .frame(width: 900, height: 700)
}
