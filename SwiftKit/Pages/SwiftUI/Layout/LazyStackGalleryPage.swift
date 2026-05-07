import SwiftUI

struct LazyStackGalleryPage: View {
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

extension LazyStackGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.lazyStack",
        title: "LazyStack",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "LazyVStack",
            "LazyHStack",
            "Grouping data with lazy stack views",
            "Creating performant scrollable stacks",
        ],
        blurb: "A view that arranges its subviews lazily along an axis, instantiating subviews only as they're needed for display. Use LazyVStack and LazyHStack inside ScrollView for large collections to avoid building offscreen content.",
        signature: "struct LazyVStack<Content> where Content : View · struct LazyHStack<Content> where Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/lazyvstack.md",
        page: { AnyView(LazyStackGalleryPage()) }
    )
}

#Preview {
    LazyStackGalleryPage()
        .frame(width: 900, height: 700)
}
