import SwiftUI

struct AnimatableModifierGalleryPage: View {
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

extension AnimatableModifierGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.animatableModifier",
        title: "AnimatableModifier",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["AnimatableModifier"],
        blurb: "A modifier that can create another modifier with animation. Deprecated in favor of conforming a ViewModifier to Animatable directly.",
        signature: "protocol AnimatableModifier : Animatable, ViewModifier",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/animatablemodifier.md",
        page: { AnyView(AnimatableModifierGalleryPage()) }
    )
}

#Preview {
    AnimatableModifierGalleryPage()
        .frame(width: 900, height: 700)
}
