import SwiftUI

struct CoordinateSpaceGalleryPage: View {
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

extension CoordinateSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.coordinateSpace",
        title: "CoordinateSpace",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "CoordinateSpace",
            "CoordinateSpaceProtocol",
            "View/coordinateSpace(_:)"
        ],
        blurb: "Names and resolves coordinate spaces — the CoordinateSpace enum, the CoordinateSpaceProtocol used by .global / .local / .named(_:), and the view modifier that registers a custom space.",
        signature: "enum CoordinateSpace",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/coordinatespace.md",
        page: { AnyView(CoordinateSpaceGalleryPage()) }
    )
}

#Preview {
    CoordinateSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
