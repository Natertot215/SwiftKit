import SwiftUI

struct StacksGalleryPage: View {
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

extension StacksGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.stacks",
        title: "Stacks",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Stacks",
            "HStack",
            "VStack",
            "ZStack",
            "View/zIndex(_:)",
            "Picking container views for your content",
            "Building layouts with stack views",
            "swiftui.layout-fundamentals.picking-container-views-for-your-content",
            "swiftui.layout-fundamentals.building-layouts-with-stack-views",
        ],
        blurb: "Arrange views in horizontal, vertical, or layered stacks. SwiftUI's HStack, VStack, and ZStack render their subviews eagerly along an axis (or front-to-back), with zIndex(_:) controlling overlap order.",
        signature: "@frozen struct HStack<Content> · @frozen struct VStack<Content> · @frozen struct ZStack<Content>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/hstack.md",
        page: { AnyView(StacksGalleryPage()) }
    )
}

#Preview {
    StacksGalleryPage()
        .frame(width: 900, height: 700)
}
