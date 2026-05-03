import SwiftUI

// View/searchSuggestions(_:) + View/searchSuggestions(_:for:) reference page.
// Sources:
//   Documentation/SwiftUI/search/searchsuggestions(_:).md
//   Documentation/SwiftUI/search/searchsuggestions(_:for:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private struct Fruit: Identifiable, Hashable {
    let name: String
    let symbol: String
    let id = UUID()
}

private let fruits: [Fruit] = [
    Fruit(name: "Apple",     symbol: "🍎"),
    Fruit(name: "Pear",      symbol: "🍐"),
    Fruit(name: "Banana",    symbol: "🍌"),
    Fruit(name: "Mango",     symbol: "🥭"),
    Fruit(name: "Orange",    symbol: "🍊"),
    Fruit(name: "Strawberry",symbol: "🍓")
]

struct SearchSuggestionsPage: View {
    @State private var simpleText: String = ""
    @State private var dynamicText: String = ""
    @State private var sectionedText: String = ""
    @State private var menuOnlyText: String = ""

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
            Text("View/searchSuggestions(_:) & (_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Provide rendered suggestion views for the active searchable field — and constrain where they appear.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchsuggestions(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchSuggestions { Text(\"…\").searchCompletion(\"…\") }") {
            NavigationStack {
                List { Text("Type to see suggestions") }
                    .searchable(text: $simpleText)
                    .searchSuggestions {
                        Text("🍎 Apple").searchCompletion("apple")
                        Text("🍐 Pear").searchCompletion("pear")
                        Text("🍌 Banana").searchCompletion("banana")
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Dynamic suggestions — driven by search text") {
                DemoCard(api: ".searchSuggestions { ForEach(matches) { … } }") {
                    NavigationStack {
                        List { Text("Type 'a', 'b', etc.") }
                            .searchable(text: $dynamicText)
                            .searchSuggestions {
                                ForEach(matches(for: dynamicText)) { fruit in
                                    Text("\(fruit.symbol) \(fruit.name)")
                                        .searchCompletion(fruit.name.lowercased())
                                }
                            }
                    }
                }
            }

            VariantBlock(title: "Sectioned — group with Section headers") {
                DemoCard(api: "Section { … }; Section { … } inside .searchSuggestions") {
                    NavigationStack {
                        List { Text("Sectioned suggestions") }
                            .searchable(text: $sectionedText)
                            .searchSuggestions {
                                Section("Fruits") {
                                    Text("🍎 Apple").searchCompletion("apple")
                                    Text("🍌 Banana").searchCompletion("banana")
                                }
                                Section("Recent") {
                                    Text("🥭 Mango").searchCompletion("mango")
                                }
                            }
                    }
                }
            }

            VariantBlock(title: ".searchSuggestions(_:for:) — restrict visibility per placement") {
                DemoCard(api: ".searchSuggestions(.hidden, for: .content)") {
                    NavigationStack {
                        List { Text("Suggestions show only in the menu") }
                            .searchable(text: $menuOnlyText)
                            .searchSuggestions {
                                Text("🍎 Apple").searchCompletion("apple")
                                Text("🍌 Banana").searchCompletion("banana")
                            }
                            .searchSuggestions(.hidden, for: .content)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("default text = \"\(simpleText)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("dynamic text = \"\(dynamicText)\" · matches = \(matches(for: dynamicText).count)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }

    private func matches(for query: String) -> [Fruit] {
        guard !query.isEmpty else { return fruits }
        return fruits.filter { $0.name.localizedStandardRange(of: query)?.lowerBound == $0.name.startIndex }
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Suggestions are arbitrary views.",
              detail: "Use Text, Label, or any custom view. Pair each with .searchCompletion(_:) to make tapping the row replace the field's text. Without .searchCompletion the row is visible but inert.",
              symbol: "list.bullet.rectangle"),
        .init(title: "Update suggestions live as the user types.",
              detail: "Read the search text @State and recompute the rendered suggestions. The framework redraws the menu on each binding change.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: ".searchSuggestions(_:for:) constrains visibility.",
              detail: "Pass a Visibility (.automatic/.visible/.hidden) and a SearchSuggestionsPlacement.Set (.menu, .content, .all). Use this to hide menu suggestions while keeping inline-content suggestions, or vice versa.",
              symbol: "eye.slash")
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
    SearchSuggestionsPage()
        .frame(width: 1100, height: 900)
}
