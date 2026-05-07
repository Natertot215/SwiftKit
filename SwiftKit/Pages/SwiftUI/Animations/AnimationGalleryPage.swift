import SwiftUI

struct AnimationGalleryPage: View {
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

extension AnimationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.animation",
        title: "Animation",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "Animation",
            "View/animation(_:)",
            "View/animation(_:value:)",
            "View/animation(_:body:)",
            "Binding/animation(_:)",
            "withAnimation(_:_:)",
            "withAnimation(_:completionCriteria:_:completion:)",
            "AnimationCompletionCriteria",
            "swiftui.animations.controlling-the-timing-and-movements-of-your-animations"
        ],
        blurb: "The way a view changes over time to create a smooth visual transition from one state to another. Apply via the animation(_:value:) modifier or imperatively with withAnimation.",
        signature: "@frozen struct Animation",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/animation.md",
        page: { AnyView(AnimationGalleryPage()) }
    )
}

#Preview {
    AnimationGalleryPage()
        .frame(width: 900, height: 700)
}
