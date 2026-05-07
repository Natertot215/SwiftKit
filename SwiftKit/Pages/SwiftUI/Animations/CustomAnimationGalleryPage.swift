import SwiftUI

struct CustomAnimationGalleryPage: View {
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

extension CustomAnimationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.customAnimation",
        title: "CustomAnimation",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.animations.customanimation",
            "AnimationContext",
            "AnimationState",
            "AnimationStateKey"
        ],
        blurb: "A type that defines how an animatable value changes over time. Implement CustomAnimation to drive bespoke timing, interpolation, or per-frame state, with AnimationContext and AnimationState carrying the cross-frame storage.",
        signature: "@preconcurrency protocol CustomAnimation : Hashable, Sendable",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/customanimation.md",
        page: { AnyView(CustomAnimationGalleryPage()) }
    )
}

#Preview {
    CustomAnimationGalleryPage()
        .frame(width: 900, height: 700)
}
