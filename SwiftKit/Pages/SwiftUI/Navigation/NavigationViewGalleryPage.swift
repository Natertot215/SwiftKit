import SwiftUI

struct NavigationViewGalleryPage: View {
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

extension NavigationViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationView",
        title: "NavigationView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationView",
            "Migrating to new navigation types"
        ],
        blurb: "Deprecated container for stack-based navigation; replaced by NavigationStack and NavigationSplitView. Surfaced for migration reference.",
        signature: "struct NavigationView<Content> where Content : View",
        availability: "macOS 10.15+ (deprecated)",
        docPath: "Documentation/SwiftUI/navigation/navigationview.md",
        page: { AnyView(NavigationViewGalleryPage()) }
    )
}

#Preview {
    NavigationViewGalleryPage()
        .frame(width: 900, height: 700)
}
