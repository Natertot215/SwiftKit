import SwiftUI

// View/searchable(text:tokens:isPresented:placement:prompt:token:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:tokens:ispresented:placement:prompt:token:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum FruitToken: String, Identifiable, Hashable, CaseIterable {
    case apple, pear, banana, mango
    var id: Self { self }
    var label: String { rawValue.capitalized }
}

struct SearchableTokensIsPresentedPage: View {
    @State private var text: String = ""
    @State private var tokens: [FruitToken] = []
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
            Text("View/searchable(text:tokens:isPresented:placement:prompt:token:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks this view as searchable with text and tokens, plus programmatic presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:tokens:ispresented:placement:prompt:token:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text:, tokens:, isPresented:, prompt:) { token in Text(…) }") {
            NavigationStack {
                List(tokens) { token in
                    Text(token.label)
                }
                .searchable(text: $text, tokens: $tokens, isPresented: $isPresented, prompt: "Search products") { token in
                    Text(token.label)
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Toggle field via external control") {
                Toggle("Presented", isOn: $isPresented)
                    .toggleStyle(.switch)
                HStack(spacing: 8) {
                    ForEach(FruitToken.allCases) { token in
                        Button(token.label) {
                            if !tokens.contains(token) { tokens.append(token) }
                        }
                    }
                    Button("Clear", role: .destructive) { tokens.removeAll() }
                }
                .controlSize(.small)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        let list = tokens.map(\.label).joined(separator: ", ")
        VStack(alignment: .leading, spacing: 8) {
            Text("isPresented = \(isPresented.description) · tokens = [\(list)] · text = \"\(text)\"")
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
        .init(title: "Combines tokens with programmatic presentation.",
              detail: "Lets you both control whether the field shows AND surface chips inside it. Useful for find/filter UIs that activate on a keyboard shortcut and start with a default token applied.",
              symbol: "tag.circle"),
        .init(title: "isPresented is bidirectional.",
              detail: "Setting it shows the field and focuses it; user dismissal sets it back to false. The tokens binding survives presentation toggles — chips are not cleared when isPresented flips.",
              symbol: "arrow.triangle.2.circlepath")
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
    SearchableTokensIsPresentedPage()
        .frame(width: 1100, height: 900)
}
