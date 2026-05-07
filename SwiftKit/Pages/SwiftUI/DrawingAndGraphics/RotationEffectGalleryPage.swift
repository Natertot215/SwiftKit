import SwiftUI

struct RotationEffectGalleryPage: View {
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

extension RotationEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.rotationEffect",
        title: "RotationEffect",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/rotationEffect(_:anchor:)",
            "View/rotation3DEffect(_:anchor:)",
            "View/rotation3DEffect(_:axis:anchor:)",
            "View/rotation3DEffect(_:axis:anchor:anchorZ:perspective:)",
            "View/perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)"
        ],
        blurb: "Rotates a view's rendered output around an anchor — flat 2D rotation by Angle, plus 3D rotation overloads with axis and perspective controls.",
        signature: nil,
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/rotationeffect(_:anchor:).md",
        page: { AnyView(RotationEffectGalleryPage()) }
    )
}

#Preview {
    RotationEffectGalleryPage()
        .frame(width: 900, height: 700)
}
