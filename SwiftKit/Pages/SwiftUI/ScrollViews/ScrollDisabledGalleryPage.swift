import SwiftUI

struct ScrollDisabledGalleryPage: View {
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

extension ScrollDisabledGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollDisabled",
        title: "ScrollDisabled",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scrollDisabled(_:)"
        ],
        blurb: "Disables or enables scrolling in scrollable views (ScrollView, List, TextEditor). The content remains laid out and visible — only the scroll gesture is suppressed.",
        signature: "func scrollDisabled(_ disabled: Bool) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrolldisabled(_:).md",
        page: { AnyView(ScrollDisabledGalleryPage()) }
    )
}

#Preview {
    ScrollDisabledGalleryPage()
        .frame(width: 900, height: 700)
}
