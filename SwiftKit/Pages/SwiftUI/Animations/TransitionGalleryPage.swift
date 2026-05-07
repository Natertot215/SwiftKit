import SwiftUI

struct TransitionGalleryPage: View {
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

extension TransitionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.transition",
        title: "Transition",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "AnyTransition",
            "AnyTransition/scale",
            "AnyTransition/slide",
            "AsymmetricTransition",
            "ContentTransition",
            "EnvironmentValues/contentTransition",
            "EnvironmentValues/contentTransitionAddsDrawingGroup",
            "NavigationTransition",
            "Transition",
            "TransitionPhase",
            "TransitionProperties",
            "View/contentTransition(_:)",
            "View/navigationTransition(_:)",
            "View/transition(_:)"
        ],
        blurb: "A description of view changes to apply when a view is added to or removed from the view hierarchy. The Transition family covers the protocol itself plus AnyTransition (type-erased values like slide and scale), ContentTransition (in-place content swaps such as numericText), and NavigationTransition (NavigationStack push variants).",
        signature: "Transition \u{00b7} AnyTransition \u{00b7} ContentTransition \u{00b7} NavigationTransition \u{00b7} AsymmetricTransition \u{00b7} TransitionPhase \u{00b7} TransitionProperties",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/transition.md",
        page: { AnyView(TransitionGalleryPage()) }
    )
}

#Preview {
    TransitionGalleryPage()
        .frame(width: 900, height: 700)
}
