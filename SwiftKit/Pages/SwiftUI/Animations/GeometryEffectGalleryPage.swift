import SwiftUI

struct GeometryEffectGalleryPage: View {
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

extension GeometryEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.geometryEffect",
        title: "GeometryEffect",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["GeometryEffect"],
        blurb: "An effect that changes the visual appearance of a view, largely without changing its ancestors or descendants. Conform to GeometryEffect to drive animatable transforms via a ProjectionTransform.",
        signature: "protocol GeometryEffect : Animatable, ViewModifier",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/geometryeffect.md",
        page: { AnyView(GeometryEffectGalleryPage()) }
    )
}

#Preview {
    GeometryEffectGalleryPage()
        .frame(width: 900, height: 700)
}
