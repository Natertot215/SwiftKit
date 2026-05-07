import SwiftUI

struct GraphicsContextGalleryPage: View {
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

extension GraphicsContextGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.graphicsContext",
        title: "GraphicsContext",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["GraphicsContext", "ColorMatrix"],
        blurb: "An immediate-mode drawing destination — used inside a Canvas closure to fill, stroke, draw, and apply filters like color matrices to 2D content.",
        signature: "@frozen struct GraphicsContext",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/graphicscontext.md",
        page: { AnyView(GraphicsContextGalleryPage()) }
    )
}

#Preview {
    GraphicsContextGalleryPage()
        .frame(width: 900, height: 700)
}
