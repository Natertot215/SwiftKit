import SwiftUI

// View/searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:tokens:suggestedtokens:ispresented:placement:prompt:token:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum FruitToken: String, Identifiable, Hashable, CaseIterable {
    case apple, pear, banana, mango, orange
    var id: Self { self }
    var label: String { rawValue.capitalized }
}

struct SearchableSuggestedTokensIsPresentedPage: View {
    @State private var text: String = ""
    @State private var tokens: [FruitToken] = []
    @State private var suggestions: [FruitToken] = FruitToken.allCases
    @State private var isPresented: Bool = true

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
            Text("View/searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Searchable with text, tokens, suggested tokens, and programmatic presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:tokens:suggestedtokens:ispresented:placement:prompt:token:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text:, tokens:, suggestedTokens:, isPresented:, prompt:) { … }") {
            NavigationStack {
                List(tokens) { token in
                    Text(token.label)
                }
                .searchable(
                    text: $text,
                    tokens: $tokens,
                    suggestedTokens: $suggestions,
                    isPresented: $isPresented,
                    prompt: "Search products"
                ) { token in
                    Text(token.label)
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Externally control field + suggestions") {
                Toggle("Presented", isOn: $isPresented)
                    .toggleStyle(.switch)
                HStack(spacing: 8) {
                    Button("All suggestions") { suggestions = FruitToken.allCases }
                    Button("Just Apple") { suggestions = [.apple] }
                    Button("Empty", role: .destructive) { suggestions = [] }
                }
                .controlSize(.small)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        let activeList = tokens.map(\.label).joined(separator: ", ")
        let suggestList = suggestions.map(\.label).joined(separator: ", ")
        VStack(alignment: .leading, spacing: 8) {
            Text("isPresented = \(isPresented.description)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("active = [\(activeList)]")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("suggested = [\(suggestList)]")
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
        .init(title: "All four bindings working in concert.",
              detail: "text, tokens, suggestedTokens, isPresented — pick whichever combinations your search interface needs. The token closure renders both chips and suggestion rows.",
              symbol: "rectangle.stack"),
        .init(title: "Suggested-tokens binding swaps as users type.",
              detail: "If you trim suggestions in response to typed text, the menu updates live. Setting suggestions to [] hides the suggestions menu but keeps the field active.",
              symbol: "list.bullet.indent")
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
    SearchableSuggestedTokensIsPresentedPage()
        .frame(width: 1100, height: 900)
}
