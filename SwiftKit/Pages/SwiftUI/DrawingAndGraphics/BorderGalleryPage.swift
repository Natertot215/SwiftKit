import SwiftUI

struct BorderGalleryPage: View {
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

extension BorderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.border",
        title: "Border",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["View/border(_:width:)"],
        blurb: "Adds a border around a view by stroking its frame with a given ShapeStyle and width — the simplest path to a stroked outline without composing a Shape.",
        signature: "func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/border(_:width:).md",
        page: { AnyView(BorderGalleryPage()) }
    )
}

#Preview {
    BorderGalleryPage()
        .frame(width: 900, height: 700)
}
