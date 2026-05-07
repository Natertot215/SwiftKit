import SwiftUI

struct NavigationLinkGalleryPage: View {
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

extension NavigationLinkGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationLink",
        title: "NavigationLink",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationLink"
        ],
        blurb: "A view that controls a navigation presentation. People click or tap a navigation link to present a view inside a NavigationStack or NavigationSplitView.",
        signature: "struct NavigationLink<Label, Destination> where Label : View, Destination : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/navigationlink.md",
        page: { AnyView(NavigationLinkGalleryPage()) }
    )
}

#Preview {
    NavigationLinkGalleryPage()
        .frame(width: 900, height: 700)
}
