import SwiftUI

struct AddRichGraphicsGalleryPage: View {
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

extension AddRichGraphicsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.addRichGraphics",
        title: "Add Rich Graphics",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["AddRichGraphics"],
        blurb: "Sample-code companion to SwiftUI's drawing and graphics APIs — combines materials, vibrancy, custom graphics, and animations.",
        signature: nil,
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/add-rich-graphics-to-your-swiftui-app.md",
        page: { AnyView(AddRichGraphicsGalleryPage()) }
    )
}

#Preview {
    AddRichGraphicsGalleryPage()
        .frame(width: 900, height: 700)
}
