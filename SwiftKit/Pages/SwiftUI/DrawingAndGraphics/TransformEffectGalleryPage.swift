import SwiftUI

struct TransformEffectGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension TransformEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.transformEffect",
        title: "TransformEffect",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/transformEffect(_:)",
            "View/transform3DEffect(_:)",
            "View/projectionEffect(_:)",
            "ProjectionTransform"
        ],
        blurb: "Applies an affine or projection transform to a view's rendered output — covers 2D affine transforms, 3D affine transforms, and the ProjectionTransform value type used by projectionEffect.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/transformeffect(_:).md",
        page: { AnyView(TransformEffectGalleryPage()) }
    )
}

#Preview {
    TransformEffectGalleryPage()
        .frame(width: 900, height: 700)
}
