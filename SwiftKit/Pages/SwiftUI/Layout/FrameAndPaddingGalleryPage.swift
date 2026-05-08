import SwiftUI

/// Gallery page scaffold for Frame and Padding. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct FrameAndPaddingGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "frame(width:height:alignment:)", api: nil) { Color.clear }
            VariantTile(name: "frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)", api: nil) { Color.clear }
            VariantTile(name: "padding(_:)", api: nil) { Color.clear }
            VariantTile(name: "padding(_:_:)", api: nil) { Color.clear }
            VariantTile(name: "fixedSize()", api: nil) { Color.clear }
            VariantTile(name: "fixedSize(horizontal:vertical:)", api: nil) { Color.clear }
            VariantTile(name: "offset(_:)", api: nil) { Color.clear }
            VariantTile(name: "offset(x:y:)", api: nil) { Color.clear }
            VariantTile(name: "position(_:)", api: nil) { Color.clear }
            VariantTile(name: "position(x:y:)", api: nil) { Color.clear }
            VariantTile(name: "containerRelativeFrame(_:alignment:)", api: nil) { Color.clear }
            VariantTile(name: "containerRelativeFrame(_:count:span:spacing:alignment:)", api: nil) { Color.clear }
            VariantTile(name: "scenePadding(_:)", api: nil) { Color.clear }
            VariantTile(name: "safeAreaInset(edge:alignment:spacing:content:)", api: nil) { Color.clear }
            VariantTile(name: "safeAreaPadding(_:)", api: nil) { Color.clear }
            VariantTile(name: "ignoresSafeArea(_:edges:)", api: nil) { Color.clear }
            VariantTile(name: "layoutPriority(_:)", api: nil) { Color.clear }
            VariantTile(name: "EdgeInsets", api: nil) { Color.clear }
            VariantTile(name: "SafeAreaRegions", api: nil) { Color.clear }
            VariantTile(name: "ScenePadding", api: nil) { Color.clear }
            VariantTile(name: "ContentMarginPlacement", api: nil) { Color.clear }
        }
    }
}

extension FrameAndPaddingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.frameAndPadding",
        title: "Frame and Padding",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["FrameandPadding", "frame", "padding"],
        blurb: "Frame and Padding — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(FrameAndPaddingGalleryPage()) }
    )
}
