import SwiftUI

struct ScaleEffectGalleryPage: View {
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

extension ScaleEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.scaleEffect",
        title: "ScaleEffect",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scaleEffect(_:anchor:)",
            "View/scaleEffect(x:y:anchor:)",
            "View/scaleEffect(x:y:z:anchor:)",
            "View/scaledToFit()",
            "View/scaledToFill()",
            "View/aspectRatio(_:contentMode:)",
            "ContentMode"
        ],
        blurb: "Modifiers that resize a view's rendered output — uniform and per-axis scale, scaled-to-fit, scaled-to-fill, and aspect-ratio constraints driven by the ContentMode enum.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/scaleeffect(_:anchor:).md",
        page: { AnyView(ScaleEffectGalleryPage()) }
    )
}

#Preview {
    ScaleEffectGalleryPage()
        .frame(width: 900, height: 700)
}
