import SwiftUI

struct ClippingGalleryPage: View {
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

extension ClippingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.clipping",
        title: "Clipping",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/clipped(antialiased:)",
            "View/clipShape(_:style:)",
            "View/mask(alignment:_:)"
        ],
        blurb: "Restricts a view's drawing to a region — clip to its bounding rectangle, clip to an arbitrary Shape, or use another view as an alpha mask.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/clipshape(_:style:).md",
        page: { AnyView(ClippingGalleryPage()) }
    )
}

#Preview {
    ClippingGalleryPage()
        .frame(width: 900, height: 700)
}
