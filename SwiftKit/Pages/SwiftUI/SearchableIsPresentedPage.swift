import SwiftUI

// View/searchable(text:isPresented:placement:prompt:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:ispresented:placement:prompt:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private struct Item: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private let items: [Item] = (1...20).map { Item(name: "Item \($0)") }

private func filtered(_ source: [Item], _ query: String) -> [Item] {
    guard !query.isEmpty else { return source }
    return source.filter { $0.name.localizedCaseInsensitiveContains(query) }
}

struct SearchableIsPresentedPage: View {
    @State private var text: String = ""
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
            Text("View/searchable(text:isPresented:placement:prompt:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks this view as searchable with programmatic presentation of the search field.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:ispresented:placement:prompt:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text: $text, isPresented: $isPresented)") {
            NavigationStack {
                List(filtered(items, text)) { item in
                    Text(item.name)
                }
                .searchable(text: $text, isPresented: $isPresented)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Toggle field via external control") {
                HStack(spacing: 12) {
                    Toggle("Presented", isOn: $isPresented)
                        .toggleStyle(.switch)
                    Text("isPresented = \(isPresented.description)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "With prompt") {
                DemoCard(api: ".searchable(text: $text, isPresented: $isPresented, prompt: \"Filter\")") {
                    NavigationStack {
                        List(filtered(items, text)) { item in
                            Text(item.name)
                        }
                        .searchable(text: $text, isPresented: $isPresented, prompt: "Filter")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("text = \"\(text)\" · isPresented = \(isPresented.description)")
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
        .init(title: "isPresented controls field visibility.",
              detail: "Set the binding to true to show the search field; false hides it. The binding is two-way: SwiftUI writes back when the user dismisses search via the system controls or escape key.",
              symbol: "eye"),
        .init(title: "Use to surface search from outside the toolbar.",
              detail: "Lets you wire any control — a button, menu item, command — to focus the field. Pair with .keyboardShortcut(\"f\", modifiers: .command) on a Toggle for a Find affordance.",
              symbol: "command"),
        .init(title: "macOS focuses the field on present.",
              detail: "When isPresented flips to true, the field receives keyboard focus automatically. The field can lose focus while still presented (e.g. user clicks elsewhere) — that's normal.",
              symbol: "cursorarrow.click")
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
    SearchableIsPresentedPage()
        .frame(width: 1100, height: 900)
}
