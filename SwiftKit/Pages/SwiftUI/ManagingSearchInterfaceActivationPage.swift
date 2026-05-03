import SwiftUI

// "Managing search interface activation" — article-stub page.
// Source: Documentation/SwiftUI/search/managing-search-interface-activation.md

struct ManagingSearchInterfaceActivationPage: View {
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
            Text("Managing search interface activation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Programmatically present, detect, and dismiss the search interface — and react to submission via onSubmit(of: .search).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/managing-search-interface-activation.md")
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
        .init(title: "Four primitives.",
              detail: "isPresented binding for programmatic show/hide, .isSearching environment for detection, .dismissSearch action for imperative end, and .onSubmit(of: .search) for the Return-key event.",
              symbol: "switch.2"),
        .init(title: "Read environment values inside the searched subtree.",
              detail: "Both isSearching and dismissSearch live in the environment of the view the .searchable modifier is applied to. Reading them outside that subtree returns false / a no-op action.",
              symbol: "scope"),
        .init(title: "Submission is opt-in.",
              detail: "If you observe text changes you have a live search; bind to .onSubmit(of: .search) when the search is expensive and should wait for an explicit Return key press.",
              symbol: "return"),
        .init(title: "Live demos in this folder.",
              detail: "See SearchableIsPresentedPage, IsSearchingPage, DismissSearchPage, and DismissSearchActionPage for executable examples.",
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
    ManagingSearchInterfaceActivationPage()
        .frame(width: 1100, height: 700)
}
