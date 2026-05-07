import SwiftUI

struct ScrollViewReaderGalleryPage: View {
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

extension ScrollViewReaderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollViewReader",
        title: "ScrollViewReader",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollViewReader",
            "ScrollViewProxy"
        ],
        blurb: "A view that provides programmatic scrolling by passing a ScrollViewProxy to its content. Use the proxy's scrollTo(_:anchor:) to drive scroll position from buttons, gestures, or onChange handlers.",
        signature: "@frozen struct ScrollViewReader<Content> where Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollviewreader.md",
        page: { AnyView(ScrollViewReaderGalleryPage()) }
    )
}

#Preview {
    ScrollViewReaderGalleryPage()
        .frame(width: 900, height: 700)
}
