import SwiftUI

struct GridGalleryPage: View {
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

extension GridGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.grid",
        title: "Grid",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Grid",
            "GridRow",
            "View/gridCellAnchor(_:)",
            "View/gridCellColumns(_:)",
            "View/gridCellUnsizedAxes(_:)",
            "View/gridColumnAlignment(_:)",
        ],
        blurb: "A container view that arranges other views in a two-dimensional layout. Compose Grid with GridRow values, then refine alignment, column spans, and per-cell behavior with the gridCell* and gridColumnAlignment(_:) modifiers.",
        signature: "@frozen struct Grid<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/grid.md",
        page: { AnyView(GridGalleryPage()) }
    )
}

#Preview {
    GridGalleryPage()
        .frame(width: 900, height: 700)
}
