import SwiftUI

// View/searchable(text:tokens:placement:prompt:token:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:tokens:placement:prompt:token:).md
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

private struct Product: Identifiable, Hashable {
    let name: String
    let kind: FruitToken
    let id = UUID()
}

private let products: [Product] = [
    Product(name: "Apple — Honeycrisp",  kind: .apple),
    Product(name: "Apple — Granny Smith", kind: .apple),
    Product(name: "Pear — Bartlett",      kind: .pear),
    Product(name: "Banana — Cavendish",   kind: .banana),
    Product(name: "Mango — Ataulfo",      kind: .mango),
    Product(name: "Orange — Navel",       kind: .orange),
    Product(name: "Orange — Blood",       kind: .orange)
]

private func filtered(_ source: [Product], text: String, tokens: [FruitToken]) -> [Product] {
    source.filter { product in
        let matchesText = text.isEmpty || product.name.localizedCaseInsensitiveContains(text)
        let matchesTokens = tokens.isEmpty || tokens.contains(product.kind)
        return matchesText && matchesTokens
    }
}

struct SearchableTokensPage: View {
    @State private var defaultText: String = ""
    @State private var defaultTokens: [FruitToken] = []
    @State private var promptText: String = ""
    @State private var promptTokens: [FruitToken] = [.apple]

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
            Text("View/searchable(text:tokens:placement:prompt:token:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks this view as searchable with text and tokens.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:tokens:placement:prompt:token:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text: $text, tokens: $tokens) { token in Text(…) }") {
            NavigationStack {
                List(filtered(products, text: defaultText, tokens: defaultTokens)) { product in
                    Text(product.name)
                }
                .searchable(text: $defaultText, tokens: $defaultTokens, prompt: "Search products") { token in
                    Text(token.label)
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Pre-populated tokens via @State default") {
                DemoCard(api: ".searchable(text: $text, tokens: $tokens, prompt: \"Search products\") { … }") {
                    NavigationStack {
                        List(filtered(products, text: promptText, tokens: promptTokens)) { product in
                            Text(product.name)
                        }
                        .searchable(text: $promptText, tokens: $promptTokens, prompt: "Search products") { token in
                            Text(token.label)
                        }
                    }
                }
                HStack(spacing: 8) {
                    ForEach(FruitToken.allCases) { token in
                        Button(token.label) {
                            if !promptTokens.contains(token) { promptTokens.append(token) }
                        }
                    }
                    Button("Clear", role: .destructive) { promptTokens.removeAll() }
                }
                .controlSize(.small)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Live binding readout") {
                let tokensList = defaultTokens.map(\.label).joined(separator: ", ")
                let count = filtered(products, text: defaultText, tokens: defaultTokens).count
                Text("text = \"\(defaultText)\" · tokens = [\(tokensList)] · \(count) result(s)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Tokens are Identifiable values that appear as chips.",
              detail: "The collection type is RandomAccessCollection + RangeReplaceableCollection. Most apps use [SomeIdentifiable] backed by @State.",
              symbol: "tag"),
        .init(title: "The token closure renders each chip.",
              detail: "Return a Text or Label per token. macOS shows them inline before any plain text in the field. People remove tokens with the field's built-in chip controls.",
              symbol: "rectangle.stack"),
        .init(title: "You filter on (text + tokens).",
              detail: "SwiftUI does not auto-filter — read both the text binding and the tokens binding to compute results. The tokens binding is stable across submission and field focus.",
              symbol: "line.3.horizontal.decrease.circle")
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
    SearchableTokensPage()
        .frame(width: 1100, height: 900)
}
