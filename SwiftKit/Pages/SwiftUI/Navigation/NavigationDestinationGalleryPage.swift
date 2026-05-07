import SwiftUI

struct NavigationDestinationGalleryPage: View {
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

extension NavigationDestinationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationDestination",
        title: "NavigationDestination",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/navigationDestination(for:destination:)",
            "View/navigationDestination(isPresented:destination:)",
            "View/navigationDestination(item:destination:)"
        ],
        blurb: "Associates a destination view with a presented data type, an explicit isPresented binding, or an optional bound item — the modifier wired into NavigationStack-based navigation.",
        signature: "func navigationDestination<D, C>(for data: D.Type, @ViewBuilder destination: @escaping (D) -> C) -> some View where D : Hashable, C : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationdestination(for:destination:).md",
        page: { AnyView(NavigationDestinationGalleryPage()) }
    )
}

#Preview {
    NavigationDestinationGalleryPage()
        .frame(width: 900, height: 700)
}
