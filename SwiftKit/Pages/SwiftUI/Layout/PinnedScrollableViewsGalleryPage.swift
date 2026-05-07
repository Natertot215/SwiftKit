import SwiftUI

struct PinnedScrollableViewsGalleryPage: View {
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

extension PinnedScrollableViewsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.pinnedScrollableViews",
        title: "PinnedScrollableViews",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "PinnedScrollableViews",
        ],
        blurb: "An option-set that controls which Section headers and footers stick to the visible bounds while their lazy stack scrolls. Pass it as the pinnedViews parameter on LazyVStack, LazyHStack, LazyVGrid, or LazyHGrid.",
        signature: "@frozen struct PinnedScrollableViews : OptionSet",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/pinnedscrollableviews.md",
        page: { AnyView(PinnedScrollableViewsGalleryPage()) }
    )
}

#Preview {
    PinnedScrollableViewsGalleryPage()
        .frame(width: 900, height: 700)
}
