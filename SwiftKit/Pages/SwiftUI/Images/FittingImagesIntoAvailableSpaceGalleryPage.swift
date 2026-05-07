import SwiftUI

struct FittingImagesIntoAvailableSpaceGalleryPage: View {
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

extension FittingImagesIntoAvailableSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.fittingImagesIntoAvailableSpace",
        title: "Fitting images into available space",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.fitting-images-into-available-space"
        ],
        blurb: "An article on adjusting the size and shape of images by applying view modifiers — resizing, aspect ratio, clipping, and tiling — so images fit the visible interface across device sizes.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/images/fitting-images-into-available-space.md",
        page: { AnyView(FittingImagesIntoAvailableSpaceGalleryPage()) }
    )
}

#Preview {
    FittingImagesIntoAvailableSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
