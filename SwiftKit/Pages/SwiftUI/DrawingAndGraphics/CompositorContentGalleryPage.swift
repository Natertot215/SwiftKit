import SwiftUI

struct CompositorContentGalleryPage: View {
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

extension CompositorContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.compositorContent",
        title: "CompositorContent",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "CompositorContent",
            "CompositorContentBuilder",
            "AnyCompositorContent"
        ],
        blurb: "Protocol family describing renderable content composed by SwiftUI's compositor — paired with its result builder and a type-erased AnyCompositorContent value for dynamic content trees.",
        signature: "@MainActor protocol CompositorContent",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/compositorcontent.md",
        page: { AnyView(CompositorContentGalleryPage()) }
    )
}

#Preview {
    CompositorContentGalleryPage()
        .frame(width: 900, height: 700)
}
