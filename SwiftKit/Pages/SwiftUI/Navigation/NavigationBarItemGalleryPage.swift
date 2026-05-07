import SwiftUI

struct NavigationBarItemGalleryPage: View {
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

extension NavigationBarItemGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationBarItem",
        title: "NavigationBarItem",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationBarItem",
            "View/navigationBarTitleDisplayMode(_:)",
            "View/navigationBarBackButtonHidden(_:)"
        ],
        blurb: "iOS-only navigation bar configuration: title display mode and back-button hiding. Surfaced for cross-platform reference; on macOS these are no-ops.",
        signature: "struct NavigationBarItem",
        availability: "iOS 13.0+ (no-op on macOS)",
        docPath: "Documentation/SwiftUI/navigation/navigationbaritem.md",
        page: { AnyView(NavigationBarItemGalleryPage()) }
    )
}

#Preview {
    NavigationBarItemGalleryPage()
        .frame(width: 900, height: 700)
}
