import SwiftUI

struct NavigationTitleGalleryPage: View {
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

extension NavigationTitleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationTitle",
        title: "NavigationTitle",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/navigationTitle(_:)",
            "View/navigationSubtitle(_:)",
            "View/navigationDocument(_:)",
            "View/navigationDocument(_:preview:)"
        ],
        blurb: "Configures the navigation chrome of a stack or split view: window/title bar text via navigationTitle, secondary navigationSubtitle, and document-bound title metadata via navigationDocument.",
        signature: "func navigationTitle(_ titleKey: LocalizedStringKey) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationtitle(_:).md",
        page: { AnyView(NavigationTitleGalleryPage()) }
    )
}

#Preview {
    NavigationTitleGalleryPage()
        .frame(width: 900, height: 700)
}
