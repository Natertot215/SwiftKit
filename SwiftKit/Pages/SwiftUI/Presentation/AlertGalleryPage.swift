import SwiftUI

/// Gallery page scaffold for Alert. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct AlertGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "alert(_:isPresented:actions:)", api: nil) { Color.clear }
            VariantTile(name: "alert(_:isPresented:actions:message:)", api: nil) { Color.clear }
            VariantTile(name: "alert(_:isPresented:presenting:actions:)", api: nil) { Color.clear }
            VariantTile(name: "alert(isPresented:error:actions:)", api: nil) { Color.clear }
            VariantTile(name: "Alert", api: nil) { Color.clear }
            VariantTile(name: "ActionSheet", api: nil) { Color.clear }
            VariantTile(name: "dialogSeverity(_:)", api: nil) { Color.clear }
            VariantTile(name: "dialogIcon(_:)", api: nil) { Color.clear }
            VariantTile(name: "dialogSuppressionToggle(_:isSuppressed:)", api: nil) { Color.clear }
            VariantTile(name: "DialogSeverity", api: nil) { Color.clear }
        }
    }
}

extension AlertGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.presentation.alert",
        title: "Alert",
        folder: "Presentation",
        framework: .swiftUI,
        absorbedSymbols: ["Alert", "alert"],
        blurb: "Alert — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(AlertGalleryPage()) }
    )
}
