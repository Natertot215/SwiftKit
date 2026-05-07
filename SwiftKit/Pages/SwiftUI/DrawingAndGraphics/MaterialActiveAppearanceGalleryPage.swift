import SwiftUI

struct MaterialActiveAppearanceGalleryPage: View {
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

extension MaterialActiveAppearanceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.materialActiveAppearance",
        title: "MaterialActiveAppearance",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["MaterialActiveAppearance", "View/materialActiveAppearance(_:)"],
        blurb: "Controls how a material adapts when its host window's active state changes — pair the modifier with the appearance enum to override default vibrancy.",
        signature: "struct MaterialActiveAppearance",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/materialactiveappearance.md",
        page: { AnyView(MaterialActiveAppearanceGalleryPage()) }
    )
}

#Preview {
    MaterialActiveAppearanceGalleryPage()
        .frame(width: 900, height: 700)
}
