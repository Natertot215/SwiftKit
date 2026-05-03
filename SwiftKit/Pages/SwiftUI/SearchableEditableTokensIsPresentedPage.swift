import SwiftUI

// View/searchable(text:editableTokens:isPresented:placement:prompt:token:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:editabletokens:ispresented:placement:prompt:token:).md
// Apple primitive only.

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

struct SearchableEditableTokensIsPresentedPage: View {
    @State private var text: String = ""
    @State private var tokens: [EditableFruitToken] = [EditableFruitToken(kind: .apple)]
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
            Text("View/searchable(text:editableTokens:isPresented:placement:prompt:token:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Editable-token searchable with programmatic presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:editabletokens:ispresented:placement:prompt:token:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text:, editableTokens:, isPresented:, prompt:) { $token in Picker(…) }") {
            NavigationStack {
                List(tokens) { token in
                    Text("\(token.kind.label) · \(token.hydration.label)")
                }
                .searchable(
                    text: $text,
                    editableTokens: $tokens,
                    isPresented: $isPresented,
                    prompt: "Search products"
                ) { $token in
                    Picker(selection: $token.hydration) {
                        ForEach(EditableFruitToken.Hydration.allCases) { h in
                            Text(h.label).tag(h)
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
            VariantBlock(title: "Programmatic field present + add tokens") {
                Toggle("Presented", isOn: $isPresented)
                    .toggleStyle(.switch)
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
        VStack(alignment: .leading, spacing: 8) {
            Text("isPresented = \(isPresented.description) · text = \"\(text)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
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
        .init(title: "Editable tokens + isPresented combine the two activation tools.",
              detail: "Use this when chips need an inline picker AND your app surfaces the field via a button or shortcut rather than the toolbar.",
              symbol: "slider.horizontal.3"),
        .init(title: "Token closure receives Binding<C.Element>.",
              detail: "Use $token in the closure to mutate properties; the chip identity is stable across edits because Identifiable.id is stable.",
              symbol: "tag.circle")
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
    SearchableEditableTokensIsPresentedPage()
        .frame(width: 1100, height: 900)
}
