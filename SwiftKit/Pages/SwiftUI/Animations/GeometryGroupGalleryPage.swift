import SwiftUI

struct GeometryGroupGalleryPage: View {
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

extension GeometryGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.geometryGroup",
        title: "GeometryGroup",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["View/geometryGroup()"],
        blurb: "Isolates the geometry (e.g. position and size) of the view from its parent view. Useful when interpolating layout-dependent transitions so child geometry animates as a unit.",
        signature: "func geometryGroup() -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/geometrygroup().md",
        page: { AnyView(GeometryGroupGalleryPage()) }
    )
}

#Preview {
    GeometryGroupGalleryPage()
        .frame(width: 900, height: 700)
}
