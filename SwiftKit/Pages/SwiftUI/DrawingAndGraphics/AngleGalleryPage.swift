import SwiftUI

struct AngleGalleryPage: View {
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

extension AngleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.angle",
        title: "Angle",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Angle"],
        blurb: "A geometric angle whose value can be read in either radians or degrees — the canonical angle type for SwiftUI rotation, gradient, and gesture APIs.",
        signature: "@frozen struct Angle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/angle.md",
        page: { AnyView(AngleGalleryPage()) }
    )
}

#Preview {
    AngleGalleryPage()
        .frame(width: 900, height: 700)
}
