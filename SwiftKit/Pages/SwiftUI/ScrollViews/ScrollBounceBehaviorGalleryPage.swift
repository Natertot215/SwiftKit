import SwiftUI

struct ScrollBounceBehaviorGalleryPage: View {
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

extension ScrollBounceBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollBounceBehavior",
        title: "ScrollBounceBehavior",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollBounceBehavior",
            "View/scrollBounceBehavior(_:axes:)"
        ],
        blurb: "Configures how a scrollable view bounces when it reaches the end of its content. Set per-axis with scrollBounceBehavior to enable, suppress, or always-bounce on a ScrollView or List.",
        signature: "struct ScrollBounceBehavior",
        availability: "macOS 13.3+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollbouncebehavior.md",
        page: { AnyView(ScrollBounceBehaviorGalleryPage()) }
    )
}

#Preview {
    ScrollBounceBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
