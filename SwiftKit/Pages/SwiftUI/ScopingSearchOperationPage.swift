import SwiftUI

// "Scoping a search operation" — article-stub page.
// Source: Documentation/SwiftUI/search/scoping-a-search-operation.md

struct ScopingSearchOperationPage: View {
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
            Text("Scoping a search operation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("How to break the search space into broad categories using .searchScopes — surfaces a Picker beneath the field.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/scoping-a-search-operation.md")
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
        .init(title: "Define a Hashable scope type.",
              detail: "Typically an enum (e.g. ProductScope { fruit, vegetable }). Store the current scope as @State and bind into .searchScopes($scope) { … }.",
              symbol: "scope"),
        .init(title: "Each scope view needs a matching .tag.",
              detail: "The Picker maps tags back to the scope binding. Tag types must equal the scope binding's type — mismatches silently break selection.",
              symbol: "tag"),
        .init(title: "Pick activation explicitly when defaults aren't right.",
              detail: ".onSearchPresentation (macOS default) shows the picker as soon as the field is active; .onTextEntry waits for the first keystroke.",
              symbol: "switch.2"),
        .init(title: "Live demos in this folder.",
              detail: "See SearchScopesPage and SearchScopeActivationPage for executable examples of both overloads and all activation modes.",
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
    ScopingSearchOperationPage()
        .frame(width: 1100, height: 700)
}
