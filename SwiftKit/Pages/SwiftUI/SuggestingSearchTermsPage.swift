import SwiftUI

// "Suggesting search terms" — article-stub page.
// Source: Documentation/SwiftUI/search/suggesting-search-terms.md

struct SuggestingSearchTermsPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            Text("This is an article — see the linked pages for executable demos.")
                .font(.callout)
                .foregroundStyle(.secondary)
        } variants: {
            EmptyView()
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Suggesting search terms")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("How to surface search suggestions — text completions, token suggestions, or grouped/sectioned hints.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/suggesting-search-terms.md")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private struct ArticleNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let articleNotes: [ArticleNote] = [
        .init(title: "Three approaches.",
              detail: "Static list, recent-search list, or dynamic list keyed off the current search text. Combine via Section blocks for grouped suggestions.",
              symbol: "list.bullet.rectangle"),
        .init(title: "Each suggestion is a SwiftUI view.",
              detail: "Use Text, Label, or any view. Add .searchCompletion(_:) to make tapping the row replace the search text. Without it, the row is visible but inert.",
              symbol: "rectangle.stack"),
        .init(title: "Token suggestions use the same closure.",
              detail: "Pair .searchSuggestions { Text(…).searchCompletion(token) } with a tokens-flavoured searchable overload. Or use suggestedTokens for a streamlined static list.",
              symbol: "tag"),
        .init(title: "Live demos in this folder.",
              detail: "See SearchSuggestionsPage, SearchCompletionPage, SearchSuggestionsPlacementPage, and SearchableSuggestedTokensPage.",
              symbol: "folder")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(articleNotes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

#Preview {
    SuggestingSearchTermsPage()
        .frame(width: 1100, height: 700)
}
