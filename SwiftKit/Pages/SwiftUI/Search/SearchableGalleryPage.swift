import SwiftUI

struct SearchableGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension SearchableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.search.searchable",
        title: "Searchable",
        folder: "Search",
        framework: .swiftUI,
        absorbedSymbols: [
            "Adding a search interface to your app",
            "DismissSearchAction",
            "EnvironmentValues/dismissSearch",
            "EnvironmentValues/isSearching",
            "FindContext",
            "Managing search interface activation",
            "Performing a search operation",
            "Scoping a search operation",
            "SearchFieldPlacement",
            "SearchPresentationToolbarBehavior",
            "SearchScopeActivation",
            "SearchSuggestionsPlacement",
            "Suggesting search terms",
            "View/findDisabled(_:)",
            "View/findNavigator(isPresented:)",
            "View/replaceDisabled(_:)",
            "View/searchCompletion(_:)",
            "View/searchPresentationToolbarBehavior(_:)",
            "View/searchScopes(_:activation:_:)",
            "View/searchScopes(_:scopes:)",
            "View/searchSuggestions(_:)",
            "View/searchSuggestions(_:for:)",
            "View/searchable(text:editableTokens:isPresented:placement:prompt:token:)",
            "View/searchable(text:editableTokens:placement:prompt:token:)",
            "View/searchable(text:isPresented:placement:prompt:)",
            "View/searchable(text:placement:prompt:)",
            "View/searchable(text:tokens:isPresented:placement:prompt:token:)",
            "View/searchable(text:tokens:placement:prompt:token:)",
            "View/searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)",
            "View/searchable(text:tokens:suggestedTokens:placement:prompt:token:)"
        ],
        blurb: "The searchable family marks a view as searchable and configures the surrounding search experience: scopes, suggestions, completions, and the find-and-replace navigator. searchScopes, searchSuggestions, and the find/replace modifiers all share searchable's activation contract and can't be demoed standalone.",
        signature: "searchable \u{00b7} searchScopes \u{00b7} searchSuggestions \u{00b7} searchCompletion \u{00b7} findNavigator \u{00b7} findDisabled \u{00b7} replaceDisabled",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/search/searchable(text:placement:prompt:).md",
        page: { AnyView(SearchableGalleryPage()) }
    )
}

#Preview {
    SearchableGalleryPage()
        .frame(width: 900, height: 700)
}
