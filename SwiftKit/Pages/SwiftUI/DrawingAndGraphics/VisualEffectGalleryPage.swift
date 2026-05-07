import SwiftUI

struct VisualEffectGalleryPage: View {
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

extension VisualEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.visualEffect",
        title: "VisualEffect",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "VisualEffect",
            "EmptyVisualEffect",
            "View/visualEffect(_:)",
            "View/visualEffect3D(_:)"
        ],
        blurb: "Visual effects change a view's appearance without affecting layout — apply 2D and 3D effects via the visualEffect modifiers, with EmptyVisualEffect as the no-op identity.",
        signature: "protocol VisualEffect : Sendable, Animatable",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/visualeffect.md",
        page: { AnyView(VisualEffectGalleryPage()) }
    )
}

#Preview {
    VisualEffectGalleryPage()
        .frame(width: 900, height: 700)
}
