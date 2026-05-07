import SwiftUI

struct BackgroundOverlayGalleryPage: View {
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

extension BackgroundOverlayGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.backgroundOverlay",
        title: "BackgroundOverlay",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/background(alignment:content:)",
            "View/background(_:ignoresSafeAreaEdges:)",
            "View/background(_:in:fillStyle:)",
            "View/background(in:fillStyle:)",
            "View/background(ignoresSafeAreaEdges:)",
            "View/overlay(alignment:content:)",
            "View/overlay(_:ignoresSafeAreaEdges:)",
            "View/overlay(_:in:fillStyle:)",
            "View/containerBackground(_:for:)",
            "View/containerBackground(for:alignment:content:)",
            "ContainerBackgroundPlacement",
            "BackgroundMaterial",
            "Adding a background to your view",
        ],
        blurb: "Layer a fill, image, or arbitrary view behind or in front of another view. background and overlay accept either a ShapeStyle in a clipping shape or a fully custom @ViewBuilder content closure; containerBackground attaches a fill to the enclosing scene.",
        signature: "func background<S>(_ style: S, ignoresSafeAreaEdges: Edge.Set = .all) -> some View where S : ShapeStyle",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/layout-fundamentals/background.md",
        page: { AnyView(BackgroundOverlayGalleryPage()) }
    )
}

#Preview {
    BackgroundOverlayGalleryPage()
        .frame(width: 900, height: 700)
}
