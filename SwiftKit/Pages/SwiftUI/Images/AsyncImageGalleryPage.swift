import SwiftUI

struct AsyncImageGalleryPage: View {
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

extension AsyncImageGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.asyncImage",
        title: "AsyncImage",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.asyncimage",
            "swiftui.images.asyncimagephase",
            "AsyncImage",
            "AsyncImagePhase"
        ],
        blurb: "A view that asynchronously loads and displays an image from a URL via the shared URLSession. Supports custom placeholders and a phase-driven content closure (AsyncImagePhase) for empty, success, and failure states.",
        signature: "struct AsyncImage<Content> where Content : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/images/asyncimage.md",
        page: { AnyView(AsyncImageGalleryPage()) }
    )
}

#Preview {
    AsyncImageGalleryPage()
        .frame(width: 900, height: 700)
}
