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
            "Transition",
            "View/transition(_:)",
            "TransitionProperties",
            "TransitionPhase",
            "AsymmetricTransition"
        ],
        blurb: "A description of view changes to apply when a view is added to or removed from the view hierarchy. Conform to Transition for symmetric phase-driven effects, or AsymmetricTransition for distinct insertion/removal behavior.",
        signature: "@MainActor @preconcurrency protocol Transition",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/transition.md",
        page: { AnyView(TransitionGalleryPage()) }
    )
}

#Preview {
    TransitionGalleryPage()
        .frame(width: 900, height: 700)
}
