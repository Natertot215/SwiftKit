import SwiftUI

// View/searchable(text:editableTokens:placement:prompt:token:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:editabletokens:placement:prompt:token:).md
// Apple primitive only — the token closure receives Binding<C.Element>.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private struct EditableFruitToken: Identifiable, Hashable {
    enum Kind: String, Hashable, CaseIterable, Identifiable {
        case apple, pear, banana, mango
        var id: Self { self }
        var label: String { rawValue.capitalized }
    }
    enum Hydration: String, Hashable, CaseIterable, Identifiable {
        case hydrated, dehydrated
        var id: Self { self }
        var label: String { rawValue.capitalized }
    }
    let id = UUID()
    var kind: Kind
    var hydration: Hydration = .hydrated
}

struct SearchableEditableTokensPage: View {
    @State private var text: String = ""
    @State private var tokens: [EditableFruitToken] = [
        EditableFruitToken(kind: .apple),
        EditableFruitToken(kind: .pear, hydration: .dehydrated)
    ]

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
            Text("View/searchable(text:editableTokens:placement:prompt:token:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks this view as searchable, with tokens whose state can be mutated in place.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:editabletokens:placement:prompt:token:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text: $text, editableTokens: $tokens) { $token in Picker(…) }") {
            NavigationStack {
                List(tokens) { token in
                    Text("\(token.kind.label) · \(token.hydration.label)")
                }
                .searchable(text: $text, editableTokens: $tokens, prompt: "Search products") { $token in
                    Picker(selection: $token.hydration) {
                        ForEach(EditableFruitToken.Hydration.allCases) { hydration in
                            Text(hydration.label).tag(hydration)
                        }
                    } label: {
                        Text(token.kind.label)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Add tokens programmatically") {
                HStack(spacing: 8) {
                    ForEach(EditableFruitToken.Kind.allCases) { kind in
                        Button(kind.label) {
                            tokens.append(EditableFruitToken(kind: kind))
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
        VStack(alignment: .leading, spacing: 12) {
            Text("Bound tokens (live):")
                .font(.headline)
            ForEach(tokens) { token in
                Text("• \(token.kind.label) — \(token.hydration.label)")
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
        .init(title: "Token closure receives a Binding to each element.",
              detail: "Use $token to mutate properties in place — Picker(selection: $token.kind) is the canonical example. The same chip stays in the field while its inner value changes.",
              symbol: "slider.horizontal.3"),
        .init(title: "Use when a token has a sub-axis.",
              detail: "Editable tokens fit cases like a tag with a comparison operator (\"price > $20\") or a kind with a modifier (\"fruit · dehydrated\"). For pure removal/addition, prefer the non-editable tokens overload.",
              symbol: "tag.circle"),
        .init(title: "Token chips become controls.",
              detail: "Because the token's view contains a Picker (or other interactive control), the chip itself responds to clicks. Keep the inner control compact — chip height is fixed.",
              symbol: "rectangle.stack")
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
    SearchableEditableTokensPage()
        .frame(width: 1100, height: 900)
}
