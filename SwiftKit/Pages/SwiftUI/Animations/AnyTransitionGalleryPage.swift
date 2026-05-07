import SwiftUI

struct AnyTransitionGalleryPage: View {
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

extension AnyTransitionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.anyTransition",
        title: "AnyTransition",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "AnyTransition",
            "AnyTransition/slide",
            "AnyTransition/scale"
        ],
        blurb: "A type-erased transition. Use the built-in AnyTransition values — slide, scale, opacity, move, push, and friends — or wrap a custom Transition for use with view/transition(_:).",
        signature: "@frozen struct AnyTransition",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/anytransition.md",
        page: { AnyView(AnyTransitionGalleryPage()) }
    )
}

#Preview {
    AnyTransitionGalleryPage()
        .frame(width: 900, height: 700)
}
