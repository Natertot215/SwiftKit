import SwiftUI

struct ScrollContentBackgroundGalleryPage: View {
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

extension ScrollContentBackgroundGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollContentBackground",
        title: "ScrollContentBackground",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scrollContentBackground(_:)"
        ],
        blurb: "Specifies the visibility of the standard system background for scrollable views (List, Form, ScrollView). Hide it to put your own background underneath the scroll content.",
        signature: "func scrollContentBackground(_ visibility: Visibility) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollcontentbackground(_:).md",
        page: { AnyView(ScrollContentBackgroundGalleryPage()) }
    )
}

#Preview {
    ScrollContentBackgroundGalleryPage()
        .frame(width: 900, height: 700)
}
