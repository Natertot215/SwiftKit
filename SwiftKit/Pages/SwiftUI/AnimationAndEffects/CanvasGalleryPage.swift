import SwiftUI

/// Gallery page scaffold for Canvas. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct CanvasGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Canvas", api: nil) { Color.clear }
            VariantTile(name: "GraphicsContext", api: nil) { Color.clear }
            VariantTile(name: "Shader", api: nil) { Color.clear }
            VariantTile(name: "ShaderFunction", api: nil) { Color.clear }
            VariantTile(name: "ShaderLibrary", api: nil) { Color.clear }
            VariantTile(name: "visualEffect(_:)", api: nil) { Color.clear }
            VariantTile(name: "visualEffect3D(_:)", api: nil) { Color.clear }
            VariantTile(name: "colorEffect(_:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "distortionEffect(_:maxSampleOffset:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "layerEffect(_:maxSampleOffset:isEnabled:)", api: nil) { Color.clear }
            VariantTile(name: "VisualEffect", api: nil) { Color.clear }
            VariantTile(name: "EmptyVisualEffect", api: nil) { Color.clear }
            VariantTile(name: "drawingGroup(opaque:colorMode:)", api: nil) { Color.clear }
            VariantTile(name: "compositingGroup()", api: nil) { Color.clear }
            VariantTile(name: "blendMode(_:)", api: nil) { Color.clear }
            VariantTile(name: "blur(radius:opaque:)", api: nil) { Color.clear }
            VariantTile(name: "shadow(color:radius:x:y:)", api: nil) { Color.clear }
            VariantTile(name: "brightness(_:)", api: nil) { Color.clear }
            VariantTile(name: "contrast(_:)", api: nil) { Color.clear }
            VariantTile(name: "colorInvert()", api: nil) { Color.clear }
            VariantTile(name: "colorMultiply(_:)", api: nil) { Color.clear }
            VariantTile(name: "grayscale(_:)", api: nil) { Color.clear }
            VariantTile(name: "hueRotation(_:)", api: nil) { Color.clear }
            VariantTile(name: "luminanceToAlpha()", api: nil) { Color.clear }
            VariantTile(name: "saturation(_:)", api: nil) { Color.clear }
            VariantTile(name: "scaleEffect(_:anchor:)", api: nil) { Color.clear }
            VariantTile(name: "rotationEffect(_:anchor:)", api: nil) { Color.clear }
            VariantTile(name: "rotation3DEffect(_:anchor:)", api: nil) { Color.clear }
            VariantTile(name: "transformEffect(_:)", api: nil) { Color.clear }
            VariantTile(name: "projectionEffect(_:)", api: nil) { Color.clear }
            VariantTile(name: "perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)", api: nil) { Color.clear }
            VariantTile(name: "ProjectionTransform", api: nil) { Color.clear }
            VariantTile(name: "Angle", api: nil) { Color.clear }
            VariantTile(name: "Axis", api: nil) { Color.clear }
            VariantTile(name: "ContentMode", api: nil) { Color.clear }
            VariantTile(name: "aspectRatio(_:contentMode:)", api: nil) { Color.clear }
            VariantTile(name: "scaledToFit()", api: nil) { Color.clear }
            VariantTile(name: "scaledToFill()", api: nil) { Color.clear }
            VariantTile(name: "clipShape(_:style:)", api: nil) { Color.clear }
            VariantTile(name: "clipped(antialiased:)", api: nil) { Color.clear }
            VariantTile(name: "mask(alignment:_:)", api: nil) { Color.clear }
            VariantTile(name: "border(_:width:)", api: nil) { Color.clear }
            VariantTile(name: "materialActiveAppearance(_:)", api: nil) { Color.clear }
            VariantTile(name: "MaterialActiveAppearance", api: nil) { Color.clear }
        }
    }
}

extension CanvasGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animationAndEffects.canvas",
        title: "Canvas",
        folder: "Animation and Effects",
        framework: .swiftUI,
        absorbedSymbols: ["Canvas", "GraphicsContext", "Shader"],
        blurb: "Canvas — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(CanvasGalleryPage()) }
    )
}
