import SwiftUI

struct CanvasGalleryPage: View {
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

extension CanvasGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.canvas",
        title: "Canvas",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Canvas"],
        blurb: "A view type that supports immediate-mode drawing. Pass a closure that draws into a GraphicsContext using paths, images, and text.",
        signature: "struct Canvas<Symbols> where Symbols : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/canvas.md",
        page: { AnyView(CanvasGalleryPage()) }
    )
}

#Preview {
    CanvasGalleryPage()
        .frame(width: 900, height: 700)
}
