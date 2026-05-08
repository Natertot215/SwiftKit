import SwiftUI

/// Gallery page scaffold for Searchable. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct SearchableGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "searchable(text:placement:prompt:)", api: nil) { Color.clear }
            VariantTile(name: "searchable(text:tokens:placement:prompt:token:)", api: nil) { Color.clear }
            VariantTile(name: "searchable(text:editableTokens:placement:prompt:token:)", api: nil) { Color.clear }
            VariantTile(name: "searchable(text:isPresented:placement:prompt:)", api: nil) { Color.clear }
            VariantTile(name: "searchScopes(_:scopes:)", api: nil) { Color.clear }
            VariantTile(name: "searchScopes(_:activation:_:)", api: nil) { Color.clear }
            VariantTile(name: "searchSuggestions(_:)", api: nil) { Color.clear }
            VariantTile(name: "searchSuggestions(_:for:)", api: nil) { Color.clear }
            VariantTile(name: "searchCompletion(_:)", api: nil) { Color.clear }
            VariantTile(name: "searchPresentationToolbarBehavior(_:)", api: nil) { Color.clear }
            VariantTile(name: "findNavigator(isPresented:)", api: nil) { Color.clear }
            VariantTile(name: "findDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "replaceDisabled(_:)", api: nil) { Color.clear }
            VariantTile(name: "SearchFieldPlacement", api: nil) { Color.clear }
            VariantTile(name: "SearchScopeActivation", api: nil) { Color.clear }
            VariantTile(name: "SearchSuggestionsPlacement", api: nil) { Color.clear }
            VariantTile(name: "SearchPresentationToolbarBehavior", api: nil) { Color.clear }
            VariantTile(name: "DismissSearchAction", api: nil) { Color.clear }
            VariantTile(name: "FindContext", api: nil) { Color.clear }
        }
    }
}

extension SearchableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.searchable",
        title: "Searchable",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: ["Searchable", "searchable"],
        blurb: "Searchable — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(SearchableGalleryPage()) }
    )
}
