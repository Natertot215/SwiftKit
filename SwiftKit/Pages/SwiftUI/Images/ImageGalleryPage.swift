import SwiftUI

struct ImageGalleryPage: View {
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

extension ImageGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.image",
        title: "Image",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.image",
            "swiftui.images.scale",
            "swiftui.images.orientation",
            "swiftui.images.resizingmode",
            "swiftui.images.imagescale(_:)",
            "Image",
            "Image/Scale",
            "Image/Orientation",
            "Image/ResizingMode",
            "View/imageScale(_:)"
        ],
        blurb: "A view that displays an image. Sources include asset-catalog files, platform image types (NSImage, UIImage, CGImage), and SF Symbols. Includes the nested Scale, Orientation, and ResizingMode types and the imageScale(_:) modifier.",
        signature: "@frozen struct Image",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/images/image.md",
        page: { AnyView(ImageGalleryPage()) }
    )
}

#Preview {
    ImageGalleryPage()
        .frame(width: 900, height: 700)
}
