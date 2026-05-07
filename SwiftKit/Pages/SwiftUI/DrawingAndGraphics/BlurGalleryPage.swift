import SwiftUI

struct BlurGalleryPage: View {
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

extension BlurGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.blur",
        title: "Blur",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["View/blur(radius:opaque:)"],
        blurb: "Applies a Gaussian blur to a view by a given radius, optionally treating the input as opaque to skip alpha-channel sampling.",
        signature: "func blur(radius: CGFloat, opaque: Bool = false) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/blur(radius:opaque:).md",
        page: { AnyView(BlurGalleryPage()) }
    )
}

#Preview {
    BlurGalleryPage()
        .frame(width: 900, height: 700)
}
