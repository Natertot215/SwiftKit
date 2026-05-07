import SwiftUI

struct ColorGalleryPage: View {
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

extension ColorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.color",
        title: "Color",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Color"],
        blurb: "A representation of a color that adapts to a given context — load from an asset catalog, specify components, or reference a system color.",
        signature: "@frozen struct Color",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/color.md",
        page: { AnyView(ColorGalleryPage()) }
    )
}

#Preview {
    ColorGalleryPage()
        .frame(width: 900, height: 700)
}
