import SwiftUI

struct ScrollVisibilityGalleryPage: View {
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

extension ScrollVisibilityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollVisibility",
        title: "ScrollVisibility",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onScrollVisibilityChange(threshold:_:)",
            "View/onScrollTargetVisibilityChange(idType:threshold:_:)"
        ],
        blurb: "Observe when views in a scroll view cross a visibility threshold. onScrollVisibilityChange fires for the modified view; onScrollTargetVisibilityChange (paired with scrollTargetLayout) reports the set of currently-visible target identifiers.",
        signature: "func onScrollVisibilityChange(threshold: Double = 0.5, _ action: @escaping (Bool) -> Void) -> some View",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/scroll-views/onscrollvisibilitychange(threshold:_:).md",
        page: { AnyView(ScrollVisibilityGalleryPage()) }
    )
}

#Preview {
    ScrollVisibilityGalleryPage()
        .frame(width: 900, height: 700)
}
