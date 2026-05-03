import SwiftUI

// SearchSuggestionsPlacement reference page.
// Source: Documentation/SwiftUI/search/searchsuggestionsplacement.md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct SearchSuggestionsPlacementPage: View {
    @State private var allText: String = ""
    @State private var menuText: String = ""
    @State private var contentText: String = ""

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
            Text("SearchSuggestionsPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The ways that SwiftUI can display search suggestions — used as the second argument to .searchSuggestions(_:for:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchsuggestionsplacement.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchSuggestions(.visible, for: .menu)") {
            NavigationStack {
                List { Text("default — show in menu only") }
                    .searchable(text: $allText)
                    .searchSuggestions {
                        Text("🍎 Apple").searchCompletion("apple")
                        Text("🍌 Banana").searchCompletion("banana")
                    }
                    .searchSuggestions(.visible, for: .menu)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "[.menu, .content] — both placements via OptionSet") {
                DemoCard(api: ".searchSuggestions(.visible, for: [.menu, .content])") {
                    NavigationStack {
                        List { Text("Both placements visible") }
                            .searchable(text: $allText)
                            .searchSuggestions {
                                Text("🍎 Apple").searchCompletion("apple")
                            }
                            .searchSuggestions(.visible, for: [.menu, .content])
                    }
                }
            }

            VariantBlock(title: ".menu — pop-down menu under the field") {
                DemoCard(api: ".searchSuggestions(.visible, for: .menu)") {
                    NavigationStack {
                        List { Text("Menu only") }
                            .searchable(text: $menuText)
                            .searchSuggestions {
                                Text("🍎 Apple").searchCompletion("apple")
                            }
                            .searchSuggestions(.visible, for: .menu)
                    }
                }
            }

            VariantBlock(title: ".content — inline alongside results, hide the menu") {
                DemoCard(api: ".searchSuggestions(.hidden, for: .menu)") {
                    NavigationStack {
                        List { Text("Inline content suggestions") }
                            .searchable(text: $contentText)
                            .searchSuggestions {
                                Text("🍎 Apple").searchCompletion("apple")
                            }
                            .searchSuggestions(.hidden, for: .menu)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Text("SearchSuggestionsPlacement.Set is an OptionSet of placements; build with array literals like [.menu, .content] or via .union. Use Visibility (.automatic / .visible / .hidden) for each placement.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Three placements: .automatic, .menu, .content.",
              detail: "Use .menu for the dropdown attached to the field; .content for inline rendering inside the searched view; .automatic to defer to the framework.",
              symbol: "list.bullet.rectangle"),
        .init(title: "Pair with Visibility, not boolean.",
              detail: ".searchSuggestions(_:for:) takes a Visibility — .automatic / .visible / .hidden — so you can defer to the system's heuristics by default and force-show or hide per-placement.",
              symbol: "eye"),
        .init(title: "Read EnvironmentValues/searchSuggestionsPlacement inside a suggestion.",
              detail: "Lets a single suggestion view adapt its layout depending on whether it's drawn in the menu vs. inline in content.",
              symbol: "leaf")
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
    SearchSuggestionsPlacementPage()
        .frame(width: 1100, height: 900)
}
