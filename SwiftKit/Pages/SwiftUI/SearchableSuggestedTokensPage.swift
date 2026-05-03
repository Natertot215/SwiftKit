import SwiftUI

// View/searchable(text:tokens:suggestedTokens:placement:prompt:token:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:tokens:suggestedtokens:placement:prompt:token:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum FruitToken: String, Identifiable, Hashable, CaseIterable {
    case apple, pear, banana, mango, orange
    var id: Self { self }
    var label: String {
        switch self {
        case .apple:  return "Apple"
        case .pear:   return "Pear"
        case .banana: return "Banana"
        case .mango:  return "Mango"
        case .orange: return "Orange"
        }
    }
}

struct SearchableSuggestedTokensPage: View {
    @State private var text: String = ""
    @State private var tokens: [FruitToken] = []
    @State private var suggestions: [FruitToken] = FruitToken.allCases

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
            Text("View/searchable(text:tokens:suggestedTokens:placement:prompt:token:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks this view as searchable with text, tokens, and a separate collection of suggested tokens.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:tokens:suggestedtokens:placement:prompt:token:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text:, tokens:, suggestedTokens:, prompt:) { token in Text(…) }") {
            NavigationStack {
                List(tokens) { token in
                    Text(token.label)
                }
                .searchable(
                    text: $text,
                    tokens: $tokens,
                    suggestedTokens: $suggestions,
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
            VariantBlock(title: "Manage the suggestions array") {
                HStack(spacing: 8) {
                    Button("All") { suggestions = FruitToken.allCases }
                    Button("Just Apple") { suggestions = [.apple] }
                    Button("Empty") { suggestions = [] }
                }
                .controlSize(.small)
                let list = suggestions.map(\.label).joined(separator: ", ")
                Text("suggestions = [\(list)]")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        let list = tokens.map(\.label).joined(separator: ", ")
        let display = list.isEmpty ? "—" : list
        VStack(alignment: .leading, spacing: 12) {
            Text("Active tokens: \(display)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("text = \"\(text)\"")
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
        .init(title: "One token closure renders both the chip and the suggestion row.",
              detail: "Apple's overload reuses your token view both inside the field and inside the suggestion menu. Keep the view compact and recognisable in both contexts.",
              symbol: "rectangle.stack"),
        .init(title: "suggestedTokens is a binding, not a static array.",
              detail: "You can update the binding as users type or as your model changes. Set it to [] to hide the suggestion menu, or to FruitToken.allCases for the static-list shortcut.",
              symbol: "list.bullet.indent"),
        .init(title: "Tapping a suggestion appends to tokens.",
              detail: "SwiftUI moves the chosen value from suggestedTokens (visually) to tokens. Both arrays are bindings — observe tokens to drive your search.",
              symbol: "plus.app")
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
    SearchableSuggestedTokensPage()
        .frame(width: 1100, height: 900)
}
