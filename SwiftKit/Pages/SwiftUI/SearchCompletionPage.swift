import SwiftUI

// View/searchCompletion(_:) reference page.
// Source: Documentation/SwiftUI/search/searchcompletion(_:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

struct SearchCompletionPage: View {
    @State private var stringText: String = ""
    @State private var labelText: String = ""

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
            Text("View/searchCompletion(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Associates a fully formed completion string with a suggestion view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchcompletion(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: "Text(\"🍎\").searchCompletion(\"apple\")") {
            NavigationStack {
                List { Text("text = \"\(stringText)\"") }
                    .searchable(text: $stringText)
                    .searchSuggestions {
                        Text("🍎").searchCompletion("apple")
                        Text("🍐").searchCompletion("pear")
                        Text("🍌").searchCompletion("banana")
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Custom suggestion view, completion replaces text") {
                DemoCard(api: "Label(\"Apple\", systemImage: \"…\").searchCompletion(\"apple\")") {
                    NavigationStack {
                        List { Text("text = \"\(labelText)\"") }
                            .searchable(text: $labelText)
                            .searchSuggestions {
                                Label("Apple",  systemImage: "leaf").searchCompletion("apple")
                                Label("Pear",   systemImage: "leaf").searchCompletion("pear")
                                Label("Banana", systemImage: "leaf").searchCompletion("banana")
                            }
                    }
                }
            }

            VariantBlock(title: "Inert suggestion — no completion attached") {
                DemoCard(api: "Text(\"Headline\")") {
                    NavigationStack {
                        List { Text("Headline rows are visible but inert") }
                            .searchable(text: $stringText)
                            .searchSuggestions {
                                Text("Recent").font(.caption).foregroundStyle(.secondary)
                                Text("🍎 Apple").searchCompletion("apple")
                                Text("🍌 Banana").searchCompletion("banana")
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("string-completion text  = \"\(stringText)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("label-completion text   = \"\(labelText)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Replaces the search field text on selection.",
              detail: "Tapping/clicking a row with .searchCompletion(_:) writes the completion string into the searchable text binding. The field then drives whatever filtering you've wired up.",
              symbol: "text.cursor"),
        .init(title: "Without it, suggestion rows are inert.",
              detail: "Visible but non-interactive. Use this for section headers / dividers inside a .searchSuggestions block.",
              symbol: "minus.circle"),
        .init(title: "There's also a token-flavoured overload.",
              detail: ".searchCompletion(token) (where token is Identifiable) lets a suggestion add a token to the field instead of replacing text. Documented under SearchableSuggestedTokensPage.",
              symbol: "tag")
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
    SearchCompletionPage()
        .frame(width: 1100, height: 900)
}
