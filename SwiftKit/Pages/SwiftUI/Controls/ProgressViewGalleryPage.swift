import SwiftUI

/// Gallery page scaffold for ProgressView. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct ProgressViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "ProgressView", api: nil) { Color.clear }
            VariantTile(name: "ProgressViewStyle", api: nil) { Color.clear }
            VariantTile(name: "ProgressViewStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "progressViewStyle(_:)", api: nil) { Color.clear }
            VariantTile(name: "ContentUnavailableView", api: nil) { Color.clear }
        }
    }
}

extension ProgressViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.progressView",
        title: "ProgressView",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["ProgressView", "ProgressViewStyle", "ProgressViewStyleConfiguration"],
        blurb: "ProgressView — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(ProgressViewGalleryPage()) }
    )
}
