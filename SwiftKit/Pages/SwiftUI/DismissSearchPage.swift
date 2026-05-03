import SwiftUI

// EnvironmentValues/dismissSearch reference page.
// Source: Documentation/SwiftUI/search/dismisssearch.md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct DismissSearchPage: View {
    @State private var text: String = ""

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("EnvironmentValues/dismissSearch")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An action that ends the current search interaction — clears text, removes focus, sets isSearching to false.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/dismisssearch.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "@Environment(\\.dismissSearch) var dismissSearch") {
            NavigationStack {
                DismissDemo()
                    .searchable(text: $text)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pair with isSearching for the full activation cycle") {
                DemoCard(api: "if isSearching { Button(\"Cancel\") { dismissSearch() } }") {
                    NavigationStack {
                        IsSearchingDismiss()
                            .searchable(text: $text)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("Calling dismissSearch() while the user isn't interacting with the field is a no-op.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Three things happen on call.",
              detail: "isSearching becomes false, the search field's text is cleared, and the field loses focus. If the user wasn't searching, nothing happens.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Read from inside the searched subtree.",
              detail: "Like isSearching, the action only exists below the .searchable modifier. Capturing it from a parent view returns a no-op action.",
              symbol: "scope"),
        .init(title: "Useful from sheets / details that wrap the search.",
              detail: "Capture the action and pass it into a presented sheet so the sheet's primary action can both dismiss itself AND end the search interaction (see Apple's example in the doc).",
              symbol: "rectangle.portrait.and.arrow.right")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(pageNotes, id: \.title) { note in
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

private struct DismissDemo: View {
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
        List {
            Button("Dismiss search") { dismissSearch() }
        }
    }
}

private struct IsSearchingDismiss: View {
    @Environment(\.isSearching) private var isSearching
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View {
        List {
            Text(isSearching ? "Searching…" : "Click the field above")
                .foregroundStyle(isSearching ? .primary : .secondary)
            if isSearching {
                Button("Cancel & clear", role: .destructive) {
                    dismissSearch()
                }
            }
        }
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    DismissSearchPage()
        .frame(width: 1100, height: 900)
}
