import SwiftUI

struct NavigationPathGalleryPage: View {
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

extension NavigationPathGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationPath",
        title: "NavigationPath",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationPath"
        ],
        blurb: "A type-erased list of data representing the content of a navigation stack. Use to manage heterogeneous navigation state for a NavigationStack.",
        signature: "struct NavigationPath",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationpath.md",
        page: { AnyView(NavigationPathGalleryPage()) }
    )
}

#Preview {
    NavigationPathGalleryPage()
        .frame(width: 900, height: 700)
}
