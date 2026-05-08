import SwiftUI

/// Gallery page scaffold for Shapes. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ShapesGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Shape", api: nil) { Color.clear }
            VariantTile(name: "InsettableShape", api: nil) { Color.clear }
            VariantTile(name: "ShapeView", api: nil) { Color.clear }
            VariantTile(name: "AnyShape", api: nil) { Color.clear }
            VariantTile(name: "Circle", api: nil) { Color.clear }
            VariantTile(name: "Ellipse", api: nil) { Color.clear }
            VariantTile(name: "Capsule", api: nil) { Color.clear }
            VariantTile(name: "Rectangle", api: nil) { Color.clear }
            VariantTile(name: "RoundedRectangle", api: nil) { Color.clear }
            VariantTile(name: "UnevenRoundedRectangle", api: nil) { Color.clear }
            VariantTile(name: "ContainerRelativeShape", api: nil) { Color.clear }
            VariantTile(name: "ConcentricRectangle", api: nil) { Color.clear }
            VariantTile(name: "OffsetShape", api: nil) { Color.clear }
            VariantTile(name: "RotatedShape", api: nil) { Color.clear }
            VariantTile(name: "ScaledShape", api: nil) { Color.clear }
            VariantTile(name: "TransformedShape", api: nil) { Color.clear }
            VariantTile(name: "Path", api: nil) { Color.clear }
            VariantTile(name: "FillStyle", api: nil) { Color.clear }
            VariantTile(name: "StrokeStyle", api: nil) { Color.clear }
            VariantTile(name: "FillShapeView", api: nil) { Color.clear }
            VariantTile(name: "StrokeShapeView", api: nil) { Color.clear }
            VariantTile(name: "StrokeBorderShapeView", api: nil) { Color.clear }
            VariantTile(name: "RectangleCornerRadii", api: nil) { Color.clear }
            VariantTile(name: "RectangleCornerInsets", api: nil) { Color.clear }
            VariantTile(name: "RoundedCornerStyle", api: nil) { Color.clear }
            VariantTile(name: "ShapeRole", api: nil) { Color.clear }
            VariantTile(name: "RoundedRectangularShape", api: nil) { Color.clear }
            VariantTile(name: "RoundedRectangularShapeCorners", api: nil) { Color.clear }
            VariantTile(name: "containerShape(_:)", api: nil) { Color.clear }
        }
    }
}

extension ShapesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.imagesAndShapes.shapes",
        title: "Shapes",
        folder: "Images and Shapes",
        framework: .swiftUI,
        absorbedSymbols: ["InsettableShape", "Shape", "ShapeView", "Shapes"],
        blurb: "Shapes — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ShapesGalleryPage()) }
    )
}
