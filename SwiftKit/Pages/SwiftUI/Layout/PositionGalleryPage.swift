import SwiftUI

struct PositionGalleryPage: View {
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

extension PositionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.position",
        title: "Position",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/position(_:)",
            "View/position(x:y:)",
            "swiftui.layout-adjustments.position(_:)",
            "swiftui.layout-adjustments.position(x:y:)",
        ],
        blurb: "Place a view's center at a specified point in its parent's coordinate space. position fixes a view absolutely in its parent, breaking it out of the regular layout flow.",
        signature: "func position(x: CGFloat = 0, y: CGFloat = 0) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/position(x:y:).md",
        page: { AnyView(PositionGalleryPage()) }
    )
}

#Preview {
    PositionGalleryPage()
        .frame(width: 900, height: 700)
}
