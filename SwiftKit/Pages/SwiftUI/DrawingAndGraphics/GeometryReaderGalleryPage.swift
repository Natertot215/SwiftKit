import SwiftUI

struct GeometryReaderGalleryPage: View {
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

extension GeometryReaderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.geometryReader",
        title: "GeometryReader",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "GeometryReader",
            "GeometryReader3D",
            "GeometryProxy",
            "GeometryProxy3D",
            "GeometryProxyCoordinateSpace3D",
            "View/onGeometryChange(for:of:action:)"
        ],
        blurb: "A container that exposes its own size and coordinate space to its content — covers 2D and 3D readers, the proxy types they vend, and the onGeometryChange observation modifier.",
        signature: "@frozen struct GeometryReader<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/geometryreader.md",
        page: { AnyView(GeometryReaderGalleryPage()) }
    )
}

#Preview {
    GeometryReaderGalleryPage()
        .frame(width: 900, height: 700)
}
