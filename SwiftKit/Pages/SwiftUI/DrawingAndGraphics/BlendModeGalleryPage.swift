import SwiftUI

struct BlendModeGalleryPage: View {
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

extension BlendModeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.blendMode",
        title: "BlendMode",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["BlendMode", "View/blendMode(_:)"],
        blurb: "Modes for compositing a view with overlapping content — multiply, screen, overlay, source-over, plus the full Porter-Duff and Quartz blending suite.",
        signature: "enum BlendMode",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/blendmode.md",
        page: { AnyView(BlendModeGalleryPage()) }
    )
}

#Preview {
    BlendModeGalleryPage()
        .frame(width: 900, height: 700)
}
