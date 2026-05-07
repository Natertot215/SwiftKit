import SwiftUI

struct ColorEffectsGalleryPage: View {
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

extension ColorEffectsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.colorEffects",
        title: "Color Effects",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/brightness(_:)",
            "View/contrast(_:)",
            "View/colorInvert()",
            "View/colorMultiply(_:)",
            "View/saturation(_:)",
            "View/grayscale(_:)",
            "View/hueRotation(_:)",
            "View/luminanceToAlpha()"
        ],
        blurb: "View modifiers that adjust the rendered color of a view — brightness, contrast, saturation, grayscale, hue rotation, color inversion, color multiplication, and luminance-to-alpha conversion.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/brightness(_:).md",
        page: { AnyView(ColorEffectsGalleryPage()) }
    )
}

#Preview {
    ColorEffectsGalleryPage()
        .frame(width: 900, height: 700)
}
