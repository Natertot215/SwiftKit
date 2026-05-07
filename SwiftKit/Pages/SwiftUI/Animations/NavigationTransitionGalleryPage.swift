import SwiftUI

struct NavigationTransitionGalleryPage: View {
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

extension NavigationTransitionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.navigationTransition",
        title: "NavigationTransition",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationTransition",
            "View/navigationTransition(_:)"
        ],
        blurb: "A type that defines the transition to use when navigating to a view. Apply via view/navigationTransition(_:) inside a NavigationStack to override the system push animation.",
        signature: "protocol NavigationTransition",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/animations/navigationtransition.md",
        page: { AnyView(NavigationTransitionGalleryPage()) }
    )
}

#Preview {
    NavigationTransitionGalleryPage()
        .frame(width: 900, height: 700)
}
