import SwiftUI

/// Gallery page scaffold for Environment. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct EnvironmentGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "EnvironmentValues", api: nil) { Color.clear }
            VariantTile(name: "Environment", api: nil) { Color.clear }
            VariantTile(name: "EnvironmentKey", api: nil) { Color.clear }
        }
    }
}

extension EnvironmentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appStructure.environment",
        title: "Environment",
        folder: "App Structure",
        framework: .swiftUI,
        absorbedSymbols: ["Environment", "EnvironmentKey", "EnvironmentValues"],
        blurb: "Environment — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(EnvironmentGalleryPage()) }
    )
}
