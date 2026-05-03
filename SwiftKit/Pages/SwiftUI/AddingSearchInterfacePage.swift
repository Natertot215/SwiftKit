import SwiftUI

// "Adding a search interface to your app" — article-stub page.
// Source: Documentation/SwiftUI/search/adding-a-search-interface-to-your-app.md

struct AddingSearchInterfacePage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            Text("This is an article — see the linked SwiftUI pages for executable demos.")
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
            Text("Adding a search interface to your app")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple's overview of how the searchable family attaches a search field to a navigation container.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/adding-a-search-interface-to-your-app.md")
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
        .init(title: "Apply .searchable to a navigation container.",
              detail: "Either NavigationStack or NavigationSplitView, or a view inside one. macOS lifts the field into the toolbar; iOS / iPadOS column placement varies.",
              symbol: "magnifyingglass"),
        .init(title: "Three placement strategies.",
              detail: "Automatic (let the framework decide), structural (apply the modifier to a specific column), or programmatic (pass placement: .toolbar / .sidebar).",
              symbol: "rectangle.split.3x1"),
        .init(title: "Customize the prompt.",
              detail: "Pass a LocalizedStringKey, Text, or StringProtocol depending on the overload. Defaults to the localized \"Search\" placeholder.",
              symbol: "text.cursor"),
        .init(title: "Live demos in this folder.",
              detail: "See SearchableTextPage, SearchableTokensPage, SearchableEditableTokensPage, SearchableSuggestedTokensPage, and the *IsPresented* variants for executable examples of each searchable overload.",
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
    AddingSearchInterfacePage()
        .frame(width: 1100, height: 700)
}
