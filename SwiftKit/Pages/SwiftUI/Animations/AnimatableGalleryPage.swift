import SwiftUI

struct AnimatableGalleryPage: View {
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

extension AnimatableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.animatable",
        title: "Animatable",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.animations.animatable",
            "AnimatableValues",
            "AnimatablePair",
            "swiftui.animations.vectorarithmetic",
            "EmptyAnimatableData"
        ],
        blurb: "A type that describes how to animate a property of a view. Conform to Animatable to expose interpolated state to SwiftUI; combine values with AnimatablePair, AnimatableValues, or VectorArithmetic helpers.",
        signature: "protocol Animatable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/animatable.md",
        page: { AnyView(AnimatableGalleryPage()) }
    )
}

#Preview {
    AnimatableGalleryPage()
        .frame(width: 900, height: 700)
}
