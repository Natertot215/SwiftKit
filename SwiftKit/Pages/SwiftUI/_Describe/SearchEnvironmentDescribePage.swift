import SwiftUI

// Describe-track page for Search Environment Values & Supporting Types.
// Source: Documentation/SwiftUI/search/
// macOS 12.0+. These types travel through the SwiftUI environment alongside
// .searchable(text:) — none are renderable views on their own.

struct SearchEnvironmentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Search Environment Values & Supporting Types",
            docPath: "Documentation/SwiftUI/search/",
            availability: "macOS 12.0+",
            blurb: """
            These supporting types travel through the environment alongside .searchable(text:). \
            isSearching is a Bool environment value that becomes true while the search field is \
            active — use it to adapt view content (e.g. show a results list). dismissSearch is an \
            environment action struct; calling dismissSearch() programmatically collapses the search \
            field. SearchSuggestionsPlacement controls where suggestion rows appear: .menu puts them \
            in a popover, .content replaces the view body. SearchScopeActivation determines when scope \
            buttons appear: .automatic is platform default, .onSearchActivation shows them when the \
            field activates, .onTextEntry delays until the user types. SearchPresentationToolbarBehavior \
            describes whether the toolbar minimizes when search is active. FindContext is an environment \
            value for custom TextEditor-like views that want to participate in the system Find & Replace \
            UI. None of these types are renderable views.
            """,
            signatures: [
                "@Environment(\\.isSearching) var isSearching: Bool",
                "@Environment(\\.dismissSearch) var dismissSearch: DismissSearchAction",
                "dismissSearch() — programmatically collapse the search field",
                "SearchSuggestionsPlacement — .automatic, .menu, .content",
                "SearchScopeActivation — .automatic, .onSearchActivation, .onTextEntry",
                "SearchPresentationToolbarBehavior — .automatic, .minimize",
                "FindContext — environment value for custom text editor Find integration"
            ],
            notes: [
                "isSearching and dismissSearch must be read inside a view that is a descendant of the searchable modifier, not the same view.",
                "FindContext is for custom text editor implementations — most apps do not need it.",
                "SearchSuggestionsPlacement.content replaces the entire view body with suggestions — use with care."
            ]
        )
    }
}

#Preview {
    SearchEnvironmentDescribePage()
        .frame(width: 900, height: 700)
}
