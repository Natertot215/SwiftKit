import SwiftUI

/// Gallery page scaffold for GeometryReader. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct GeometryReaderGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "GeometryReader", api: nil) { Color.clear }
            VariantTile(name: "GeometryProxy", api: nil) { Color.clear }
            VariantTile(name: "GeometryProxy3D", api: nil) { Color.clear }
            VariantTile(name: "GeometryReader3D", api: nil) { Color.clear }
            VariantTile(name: "GeometryProxyCoordinateSpace3D", api: nil) { Color.clear }
            VariantTile(name: "CoordinateSpace", api: nil) { Color.clear }
            VariantTile(name: "CoordinateSpaceProtocol", api: nil) { Color.clear }
            VariantTile(name: "Anchor", api: nil) { Color.clear }
            VariantTile(name: "UnitPoint", api: nil) { Color.clear }
            VariantTile(name: "UnitPoint3D", api: nil) { Color.clear }
            VariantTile(name: "onGeometryChange(for:of:action:)", api: nil) { Color.clear }
            VariantTile(name: "coordinateSpace(_:)", api: nil) { Color.clear }
        }
    }
}

extension GeometryReaderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.geometryReader",
        title: "GeometryReader",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["GeometryProxy", "GeometryProxy3D", "GeometryReader"],
        blurb: "GeometryReader — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(GeometryReaderGalleryPage()) }
    )
}
