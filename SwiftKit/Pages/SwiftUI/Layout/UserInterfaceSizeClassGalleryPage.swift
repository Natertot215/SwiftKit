import SwiftUI

struct UserInterfaceSizeClassGalleryPage: View {
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

extension UserInterfaceSizeClassGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.userInterfaceSizeClass",
        title: "UserInterfaceSizeClass",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "UserInterfaceSizeClass",
            "swiftui.layout-adjustments.userinterfacesizeclass",
        ],
        blurb: "An indication of the system's height- and width-based size class, surfaced via the horizontalSizeClass and verticalSizeClass environment values. macOS windows are typically .regular, but the type is useful for cross-platform views.",
        signature: "@frozen enum UserInterfaceSizeClass : Hashable, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/userinterfacesizeclass.md",
        page: { AnyView(UserInterfaceSizeClassGalleryPage()) }
    )
}

#Preview {
    UserInterfaceSizeClassGalleryPage()
        .frame(width: 900, height: 700)
}
