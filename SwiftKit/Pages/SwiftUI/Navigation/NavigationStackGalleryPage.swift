import SwiftUI

struct NavigationStackGalleryPage: View {
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

extension NavigationStackGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationStack",
        title: "NavigationStack",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationStack",
            "Understanding the navigation stack",
            "Bringing robust navigation structure to your SwiftUI app"
        ],
        blurb: "A view that displays a root view and enables you to present additional views over the root view. Pair with NavigationLink and navigationDestination to drive a stack-based navigation hierarchy.",
        signature: "@MainActor @preconcurrency struct NavigationStack<Data, Root> where Root : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationstack.md",
        page: { AnyView(NavigationStackGalleryPage()) }
    )
}

#Preview {
    NavigationStackGalleryPage()
        .frame(width: 900, height: 700)
}
