import SwiftUI

struct UnitPointGalleryPage: View {
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

extension UnitPointGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.unitPoint",
        title: "UnitPoint",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["UnitPoint", "UnitPoint3D"],
        blurb: "A normalized 2D point in a view's coordinate space — and its 3D sibling — letting you describe locations as fractions of a view's size without knowing its rendered dimensions.",
        signature: "@frozen struct UnitPoint",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/unitpoint.md",
        page: { AnyView(UnitPointGalleryPage()) }
    )
}

#Preview {
    UnitPointGalleryPage()
        .frame(width: 900, height: 700)
}
