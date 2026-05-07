import SwiftUI

struct ScrollClipDisabledGalleryPage: View {
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

extension ScrollClipDisabledGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollClipDisabled",
        title: "ScrollClipDisabled",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scrollClipDisabled(_:)"
        ],
        blurb: "Disables the clipping that a scroll view normally applies to its content. Use to let decorations like shadows or hover effects extend beyond the scrollable region's bounds.",
        signature: "func scrollClipDisabled(_ disabled: Bool = true) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollclipdisabled(_:).md",
        page: { AnyView(ScrollClipDisabledGalleryPage()) }
    )
}

#Preview {
    ScrollClipDisabledGalleryPage()
        .frame(width: 900, height: 700)
}
