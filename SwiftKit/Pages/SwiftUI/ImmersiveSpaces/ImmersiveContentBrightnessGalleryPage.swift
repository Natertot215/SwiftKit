import SwiftUI

struct ImmersiveContentBrightnessGalleryPage: View {
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

extension ImmersiveContentBrightnessGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersiveContentBrightness",
        title: "ImmersiveContentBrightness",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "ImmersiveContentBrightness",
            "Scene/immersiveContentBrightness(_:)",
            "swiftui.immersive-spaces.immersivecontentbrightness",
            "swiftui.immersive-spaces.immersivecontentbrightness(_:)"
        ],
        blurb: "The content brightness of an immersive space. Pair with the immersiveContentBrightness(_:) scene modifier and choose between automatic, dim, dark, bright, or a custom linear ratio.",
        signature: "struct ImmersiveContentBrightness",
        availability: "visionOS 1.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersivecontentbrightness.md",
        page: { AnyView(ImmersiveContentBrightnessGalleryPage()) }
    )
}

#Preview {
    ImmersiveContentBrightnessGalleryPage()
        .frame(width: 900, height: 700)
}
