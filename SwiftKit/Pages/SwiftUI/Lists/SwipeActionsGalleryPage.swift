import SwiftUI

struct SwipeActionsGalleryPage: View {
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

extension SwipeActionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.swipeActions",
        title: "SwipeActions",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/swipeActions(edge:allowsFullSwipe:content:)"
        ],
        blurb: "Adds custom swipe actions to a row in a list. Each action is a Button placed at the leading or trailing edge.",
        signature: "func swipeActions<T>(edge: HorizontalEdge = .trailing, allowsFullSwipe: Bool = true, @ViewBuilder content: () -> T) -> some View where T : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/lists/swipeactions(edge:allowsfullswipe:content:).md",
        page: { AnyView(SwipeActionsGalleryPage()) }
    )
}

#Preview {
    SwipeActionsGalleryPage()
        .frame(width: 900, height: 700)
}
