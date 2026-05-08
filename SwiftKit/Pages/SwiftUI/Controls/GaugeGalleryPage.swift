import SwiftUI

/// Gallery page scaffold for Gauge. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct GaugeGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Gauge", api: nil) { Color.clear }
            VariantTile(name: "GaugeStyle", api: nil) { Color.clear }
            VariantTile(name: "GaugeStyleConfiguration", api: nil) { Color.clear }
            VariantTile(name: "gaugeStyle(_:)", api: nil) { Color.clear }
        }
    }
}

extension GaugeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.gauge",
        title: "Gauge",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["Gauge", "GaugeStyle", "GaugeStyleConfiguration"],
        blurb: "Gauge — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(GaugeGalleryPage()) }
    )
}
