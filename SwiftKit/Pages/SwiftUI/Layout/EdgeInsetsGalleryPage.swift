import SwiftUI

struct EdgeInsetsGalleryPage: View {
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

extension EdgeInsetsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.edgeInsets",
        title: "EdgeInsets",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "EdgeInsets",
            "EdgeInsets3D",
            "swiftui.layout-adjustments.edgeinsets",
            "swiftui.layout-adjustments.edgeinsets3d",
        ],
        blurb: "The inset distances for the sides of a rectangle, used wherever a layout needs per-edge spacing — padding, list-row insets, container background placement. EdgeInsets3D extends the type with a depth-axis component.",
        signature: "@frozen struct EdgeInsets : Equatable, Animatable, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/edgeinsets.md",
        page: { AnyView(EdgeInsetsGalleryPage()) }
    )
}

#Preview {
    EdgeInsetsGalleryPage()
        .frame(width: 900, height: 700)
}
