import SwiftUI

/// Gallery page scaffold for Stacks. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct StacksGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "VStack", api: nil) { Color.clear }
            VariantTile(name: "HStack", api: nil) { Color.clear }
            VariantTile(name: "ZStack", api: nil) { Color.clear }
            VariantTile(name: "LazyVStack", api: nil) { Color.clear }
            VariantTile(name: "LazyHStack", api: nil) { Color.clear }
            VariantTile(name: "Spacer", api: nil) { Color.clear }
            VariantTile(name: "ViewThatFits", api: nil) { Color.clear }
        }
    }
}

extension StacksGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.stacks",
        title: "Stacks",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: ["HStack", "Stacks", "VStack", "ZStack"],
        blurb: "Stacks — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(StacksGalleryPage()) }
    )
}
