import SwiftUI

struct GradientGalleryPage: View {
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

extension GradientGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.gradient",
        title: "Gradient",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Gradient"],
        blurb: "A color gradient defined as an array of color stops with parametric locations — used as a ShapeStyle in linear, radial, and angular forms.",
        signature: "@frozen struct Gradient",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/gradient.md",
        page: { AnyView(GradientGalleryPage()) }
    )
}

#Preview {
    GradientGalleryPage()
        .frame(width: 900, height: 700)
}
