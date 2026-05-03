import SwiftUI

// "Performing a search operation" — article-stub page.
// Source: Documentation/SwiftUI/search/performing-a-search-operation.md

struct PerformingSearchOperationPage: View {
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
            Text("Performing a search operation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("How to drive a live search from a text binding (and optional tokens collection) provided to a searchable modifier.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/performing-a-search-operation.md")
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
        .init(title: "You own the storage.",
              detail: "@State var searchText: String = \"\" or a published property in a model — pass a $-binding into .searchable and observe it to drive results.",
              symbol: "internaldrive"),
        .init(title: "Tokens require Identifiable.",
              detail: "Define an enum or struct conforming to Identifiable + Hashable, store a [Token] as @State, and pass it to a tokens-flavoured searchable overload along with a token view builder.",
              symbol: "tag"),
        .init(title: "Editable tokens use a Binding closure.",
              detail: "The token closure receives Binding<C.Element> so you can mutate the token in place — typically with a Picker. Useful for tag + operator combinations.",
              symbol: "slider.horizontal.3"),
        .init(title: "Filtering is your job.",
              detail: "SwiftUI doesn't automatically filter. Read text + tokens + scope and compute a filtered collection. For expensive searches, debounce or wait for .onSubmit(of: .search).",
              symbol: "line.3.horizontal.decrease.circle"),
        .init(title: "See SearchableTokensPage / SearchableEditableTokensPage / SearchableSuggestedTokensPage.",
              detail: "Each one demonstrates one stage of token usage. Combine with SearchScopesPage and the *IsPresented variants for the full toolkit.",
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
    PerformingSearchOperationPage()
        .frame(width: 1100, height: 700)
}
