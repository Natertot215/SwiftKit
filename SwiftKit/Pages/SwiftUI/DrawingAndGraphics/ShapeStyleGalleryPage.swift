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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
