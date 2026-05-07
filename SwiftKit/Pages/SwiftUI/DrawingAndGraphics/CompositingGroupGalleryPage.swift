import SwiftUI

struct CompositingGroupGalleryPage: View {
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

extension CompositingGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.compositingGroup",
        title: "CompositingGroup",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/compositingGroup()",
            "View/drawingGroup(opaque:colorMode:)",
            "ColorRenderingMode"
        ],
        blurb: "Forces a view's contents to render into an offscreen buffer before being composited — compositingGroup for SwiftUI semantics, drawingGroup for Metal-backed flattening, with ColorRenderingMode controlling working color space.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/compositinggroup().md",
        page: { AnyView(CompositingGroupGalleryPage()) }
    )
}

#Preview {
    CompositingGroupGalleryPage()
        .frame(width: 900, height: 700)
}
