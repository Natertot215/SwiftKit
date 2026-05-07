import SwiftUI

struct PlaceholderContentViewGalleryPage: View {
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

extension PlaceholderContentViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.placeholderContentView",
        title: "PlaceholderContentView",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["PlaceholderContentView"],
        blurb: "A placeholder used to construct an inline modifier, transition, or other helper type. SwiftUI synthesizes this type on your behalf — you don't construct it directly.",
        signature: "struct PlaceholderContentView<Value>",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/placeholdercontentview.md",
        page: { AnyView(PlaceholderContentViewGalleryPage()) }
    )
}

#Preview {
    PlaceholderContentViewGalleryPage()
        .frame(width: 900, height: 700)
}
