import SwiftUI

struct AxisGalleryPage: View {
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

extension AxisGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.axis",
        title: "Axis",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Axis"],
        blurb: "The horizontal or vertical dimension in a 2D coordinate system — used by stack, scroll, and layout primitives to express axis-aligned behavior.",
        signature: "@frozen enum Axis",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/axis.md",
        page: { AnyView(AxisGalleryPage()) }
    )
}

#Preview {
    AxisGalleryPage()
        .frame(width: 900, height: 700)
}
