import SwiftUI

struct ImageRendererGalleryPage: View {
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

extension ImageRendererGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.imageRenderer",
        title: "ImageRenderer",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.imagerenderer",
            "ImageRenderer"
        ],
        blurb: "An object that creates images from SwiftUI views. Rasterize on-demand to CGImage, NSImage, UIImage, or PDF data — useful for exporting Canvas content, badges, or any composed view as a bitmap.",
        signature: "final class ImageRenderer<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/images/imagerenderer.md",
        page: { AnyView(ImageRendererGalleryPage()) }
    )
}

#Preview {
    ImageRendererGalleryPage()
        .frame(width: 900, height: 700)
}
