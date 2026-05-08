import SwiftUI

/// Gallery page scaffold for Alignment. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct AlignmentGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Alignment", api: nil) { Color.clear }
            VariantTile(name: "HorizontalAlignment", api: nil) { Color.clear }
            VariantTile(name: "VerticalAlignment", api: nil) { Color.clear }
            VariantTile(name: "Alignment3D", api: nil) { Color.clear }
            VariantTile(name: "DepthAlignment", api: nil) { Color.clear }
            VariantTile(name: "DepthAlignmentID", api: nil) { Color.clear }
            VariantTile(name: "AlignmentID", api: nil) { Color.clear }
            VariantTile(name: "ViewDimensions", api: nil) { Color.clear }
            VariantTile(name: "ViewDimensions3D", api: nil) { Color.clear }
            VariantTile(name: "alignmentGuide(_:computeValue:)", api: nil) { Color.clear }
            VariantTile(name: "LayoutDirection", api: nil) { Color.clear }
            VariantTile(name: "LayoutDirectionBehavior", api: nil) { Color.clear }
            VariantTile(name: "HorizontalEdge", api: nil) { Color.clear }
            VariantTile(name: "VerticalEdge", api: nil) { Color.clear }
            VariantTile(name: "Edge", api: nil) { Color.clear }
            VariantTile(name: "Edge3D", api: nil) { Color.clear }
            VariantTile(name: "UserInterfaceSizeClass", api: nil) { Color.clear }
            VariantTile(name: "layoutDirectionBehavior(_:)", api: nil) { Color.clear }
        }
    }
}

extension AlignmentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.alignment",
        title: "Alignment",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["Alignment", "HorizontalAlignment", "VerticalAlignment"],
        blurb: "Alignment — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(AlignmentGalleryPage()) }
    )
}
