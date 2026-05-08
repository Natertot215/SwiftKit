import SwiftUI

/// Gallery page scaffold for Sheet. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct SheetGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "sheet(isPresented:onDismiss:content:)", api: nil) { Color.clear }
            VariantTile(name: "sheet(item:onDismiss:content:)", api: nil) { Color.clear }
            VariantTile(name: "interactiveDismissDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationDetents(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationDetents(_:selection:)", api: nil) { Color.clear }
            VariantTile(name: "presentationDragIndicator(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationBackground(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationBackgroundInteraction(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationCornerRadius(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationSizing(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationContentInteraction(_:)", api: nil) { Color.clear }
            VariantTile(name: "presentationCompactAdaptation(_:)", api: nil) { Color.clear }
            VariantTile(name: "PresentationDetent", api: nil) { Color.clear }
            VariantTile(name: "CustomPresentationDetent", api: nil) { Color.clear }
            VariantTile(name: "PresentationSizing", api: nil) { Color.clear }
            VariantTile(name: "PresentationSizingContext", api: nil) { Color.clear }
            VariantTile(name: "PresentationSizingRoot", api: nil) { Color.clear }
            VariantTile(name: "PresentationAdaptation", api: nil) { Color.clear }
            VariantTile(name: "PresentationBackgroundInteraction", api: nil) { Color.clear }
            VariantTile(name: "PresentationContentInteraction", api: nil) { Color.clear }
            VariantTile(name: "dismissalConfirmationDialog(_:shouldPresent:actions:)", api: nil) { Color.clear }
            VariantTile(name: "AlertScene", api: nil) { Color.clear }
            VariantTile(name: "fullScreenCover(isPresented:onDismiss:content:)", api: nil) { Color.clear }
            VariantTile(name: "fullScreenCover(item:onDismiss:content:)", api: nil) { Color.clear }
        }
    }
}

extension SheetGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.presentation.sheet",
        title: "Sheet",
        folder: "Presentation",
        framework: .swiftUI,
        absorbedSymbols: ["Sheet", "interactiveDismissDisabled", "sheet"],
        blurb: "Sheet — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(SheetGalleryPage()) }
    )
}
