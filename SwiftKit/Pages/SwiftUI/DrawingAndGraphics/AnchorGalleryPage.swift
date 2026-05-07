import SwiftUI

struct AnchorGalleryPage: View {
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

extension AnchorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.anchor",
        title: "Anchor",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Anchor", "Alignment3D", "DepthAlignmentID"],
        blurb: "An opaque value derived from an anchor source and a particular view — converted to a coordinate-space value via GeometryProxy. Includes 3D alignment IDs used by Alignment3D for depth-aware layouts.",
        signature: "@frozen struct Anchor<Value>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/anchor.md",
        page: { AnyView(AnchorGalleryPage()) }
    )
}

#Preview {
    AnchorGalleryPage()
        .frame(width: 900, height: 700)
}
