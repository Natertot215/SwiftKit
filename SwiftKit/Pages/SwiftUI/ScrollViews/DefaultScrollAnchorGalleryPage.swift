import SwiftUI

struct DefaultScrollAnchorGalleryPage: View {
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

extension DefaultScrollAnchorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.defaultScrollAnchor",
        title: "DefaultScrollAnchor",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/defaultScrollAnchor(_:)",
            "View/defaultScrollAnchor(_:for:)",
            "ScrollAnchorRole"
        ],
        blurb: "Associates a UnitPoint anchor with a scroll view to control which part of the content is rendered initially and how the scroll view handles content size changes. Pair with ScrollAnchorRole to scope the anchor to specific behaviors.",
        signature: "func defaultScrollAnchor(_ anchor: UnitPoint?) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scroll-views/defaultscrollanchor(_:).md",
        page: { AnyView(DefaultScrollAnchorGalleryPage()) }
    )
}

#Preview {
    DefaultScrollAnchorGalleryPage()
        .frame(width: 900, height: 700)
}
