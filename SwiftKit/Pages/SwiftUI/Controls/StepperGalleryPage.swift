import SwiftUI

/// Gallery page scaffold for Stepper. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct StepperGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "Stepper", api: nil) { Color.clear }
        }
    }
}

extension StepperGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controls.stepper",
        title: "Stepper",
        folder: "Controls",
        framework: .swiftUI,
        absorbedSymbols: ["Stepper"],
        blurb: "Stepper — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(StepperGalleryPage()) }
    )
}
