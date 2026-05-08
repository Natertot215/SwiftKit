import SwiftUI

/// Gallery page scaffold for NavigationStack. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct NavigationStackGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "NavigationStack", api: nil) { Color.clear }
            VariantTile(name: "NavigationView", api: nil) { Color.clear }
            VariantTile(name: "NavigationLink", api: nil) { Color.clear }
            VariantTile(name: "NavigationPath", api: nil) { Color.clear }
            VariantTile(name: "NavigationBarItem", api: nil) { Color.clear }
            VariantTile(name: "navigationDestination(for:destination:)", api: nil) { Color.clear }
            VariantTile(name: "navigationDestination(isPresented:destination:)", api: nil) { Color.clear }
            VariantTile(name: "navigationDestination(item:destination:)", api: nil) { Color.clear }
            VariantTile(name: "navigationTitle(_:)", api: nil) { Color.clear }
            VariantTile(name: "navigationSubtitle(_:)", api: nil) { Color.clear }
            VariantTile(name: "navigationDocument(_:)", api: nil) { Color.clear }
            VariantTile(name: "navigationBarBackButtonHidden(_:)", api: nil) { Color.clear }
            VariantTile(name: "navigationBarTitleDisplayMode(_:)", api: nil) { Color.clear }
        }
    }
}

extension NavigationStackGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationStack",
        title: "NavigationStack",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: ["NavigationLink", "NavigationStack", "NavigationView"],
        blurb: "NavigationStack — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(NavigationStackGalleryPage()) }
    )
}
