import SwiftUI

struct PaddingGalleryPage: View {
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

extension PaddingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.padding",
        title: "Padding",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Padding",
            "View/padding(_:)",
            "View/padding(_:_:)",
            "View/padding3D(_:)",
            "View/padding3D(_:_:)",
            "View/scenePadding(_:)",
            "View/scenePadding(_:edges:)",
            "ScenePadding",
            "View/contentMargins(_:_:for:)",
            "View/contentMargins(_:for:)",
            "ContentMarginPlacement",
            "swiftui.layout-adjustments.padding3d(_:)",
            "swiftui.layout-adjustments.padding3d(_:_:)",
            "swiftui.layout-adjustments.contentmarginplacement",
        ],
        blurb: "Add space around a view's content along selected edges. Padding accepts a fixed length, an EdgeInsets, or scene-derived metrics; contentMargins extends padding into scrolled-content regions and ContentMarginPlacement scopes the placement.",
        signature: "func padding(_ insets: EdgeInsets) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/padding(_:).md",
        page: { AnyView(PaddingGalleryPage()) }
    )
}

#Preview {
    PaddingGalleryPage()
        .frame(width: 900, height: 700)
}
