import SwiftUI

struct ScrollViewGalleryPage: View {
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

extension ScrollViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollView",
        title: "ScrollView",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: ["ScrollView"],
        blurb: "A scrollable view that adjusts which portion of its underlying content is visible as the user performs platform-appropriate scroll gestures. Scrolls horizontally, vertically, or both; does not zoom.",
        signature: "struct ScrollView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollview.md",
        page: { AnyView(ScrollViewGalleryPage()) }
    )
}

#Preview {
    ScrollViewGalleryPage()
        .frame(width: 900, height: 700)
}
