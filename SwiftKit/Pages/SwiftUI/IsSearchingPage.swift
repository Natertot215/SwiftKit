import SwiftUI

// EnvironmentValues/isSearching reference page.
// Source: Documentation/SwiftUI/search/issearching.md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct IsSearchingPage: View {
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
            Text("EnvironmentValues/isSearching")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A Boolean environment value that becomes true while the user is interacting with a searchable field.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/issearching.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "@Environment(\\.isSearching) var isSearching") {
            NavigationStack {
                SearchedReadout()
                    .searchable(text: $text)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Visibility tied to isSearching") {
                DemoCard(api: "if isSearching { … } else { … }") {
                    NavigationStack {
                        SearchedConditional(text: text)
                            .searchable(text: $text)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("text = \"\(text)\"")
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.secondary)
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Read inside the searched view, not its parent.",
              detail: "SwiftUI sets the value in the environment of the view that the .searchable modifier is applied to. Outside that subtree the value is always false.",
              symbol: "scope"),
        .init(title: "Goes true on first interaction.",
              detail: "On macOS this means clicking into the field. It returns to false when the user cancels the search or you call dismissSearch.",
              symbol: "cursorarrow.click"),
        .init(title: "Pair with dismissSearch for end-to-end control.",
              detail: "isSearching tells you the state; dismissSearch resets it imperatively. Together they let you build search-driven sheets and toolbars that clean up properly.",
              symbol: "arrow.uturn.backward")
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

private struct SearchedReadout: View {
    @Environment(\.isSearching) private var isSearching

    var body: some View {
        List {
            Label(isSearching ? "Searching…" : "Not searching", systemImage: isSearching ? "magnifyingglass" : "minus.circle")
                .foregroundStyle(isSearching ? .primary : .secondary)
        }
    }
}

private struct SearchedConditional: View {
    let text: String
    @Environment(\.isSearching) private var isSearching

    var body: some View {
        List {
            if isSearching {
                Section("Active query") {
                    Text(text.isEmpty ? "(empty)" : text)
                }
            } else {
                Text("Click the field to begin")
                    .foregroundStyle(.secondary)
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
    IsSearchingPage()
        .frame(width: 1100, height: 900)
}
