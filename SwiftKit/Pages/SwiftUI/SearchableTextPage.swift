import SwiftUI

// View/searchable(text:placement:prompt:) reference page.
// Source: Documentation/SwiftUI/search/searchable(text:placement:prompt:).md
// Apple primitive only — never compose a search bar from TextField + magnifier.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private struct Fruit: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private let fruits: [Fruit] = [
    Fruit(name: "Apple"),
    Fruit(name: "Apricot"),
    Fruit(name: "Banana"),
    Fruit(name: "Blueberry"),
    Fruit(name: "Cherry"),
    Fruit(name: "Date"),
    Fruit(name: "Elderberry"),
    Fruit(name: "Fig"),
    Fruit(name: "Grape"),
    Fruit(name: "Mango"),
    Fruit(name: "Orange"),
    Fruit(name: "Pear")
]

private func filtered(_ source: [Fruit], _ query: String) -> [Fruit] {
    guard !query.isEmpty else { return source }
    return source.filter { $0.name.localizedCaseInsensitiveContains(query) }
}

struct SearchableTextPage: View {
    @State private var defaultText: String = ""
    @State private var promptText: String = ""
    @State private var automaticText: String = ""
    @State private var toolbarText: String = ""
    @State private var sidebarText: String = ""

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
            Text("View/searchable(text:placement:prompt:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Marks this view as searchable, which configures the display of a search field.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchable(text:placement:prompt:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchable(text: $text)") {
            NavigationStack {
                List(filtered(fruits, defaultText)) { fruit in
                    Text(fruit.name)
                }
                .searchable(text: $defaultText)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "With prompt — LocalizedStringKey") {
                DemoCard(api: ".searchable(text: $text, prompt: \"Search fruits\")") {
                    NavigationStack {
                        List(filtered(fruits, promptText)) { fruit in
                            Text(fruit.name)
                        }
                        .searchable(text: $promptText, prompt: "Search fruits")
                    }
                }
            }

            VariantBlock(title: "Placement — .automatic (default)") {
                DemoCard(api: ".searchable(text: $text, placement: .automatic)") {
                    NavigationStack {
                        List(filtered(fruits, automaticText)) { fruit in
                            Text(fruit.name)
                        }
                        .searchable(text: $automaticText, placement: .automatic)
                    }
                }
            }

            VariantBlock(title: "Placement — .toolbar") {
                DemoCard(api: ".searchable(text: $text, placement: .toolbar)") {
                    NavigationStack {
                        List(filtered(fruits, toolbarText)) { fruit in
                            Text(fruit.name)
                        }
                        .searchable(text: $toolbarText, placement: .toolbar)
                    }
                }
            }

            VariantBlock(title: "Placement — .sidebar (within NavigationSplitView)") {
                DemoCard(api: ".searchable(text: $text, placement: .sidebar)") {
                    NavigationSplitView {
                        List(filtered(fruits, sidebarText)) { fruit in
                            Text(fruit.name)
                        }
                    } detail: {
                        Text("Select a fruit")
                            .foregroundStyle(.secondary)
                    }
                    .searchable(text: $sidebarText, placement: .sidebar)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Live filtered count") {
                DemoCard(api: "List(filtered(fruits, text)) { … }") {
                    NavigationStack {
                        List(filtered(fruits, defaultText)) { fruit in
                            Text(fruit.name)
                        }
                        .searchable(text: $defaultText)
                    }
                }
                Text("query = \"\(defaultText)\" · \(filtered(fruits, defaultText).count) result(s)")
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
        .init(title: "The simplest searchable form.",
              detail: "Pass only a text binding and the framework handles placement, prompt, and the search affordance. Apply to a navigation container (NavigationStack / NavigationSplitView) or a view inside one.",
              symbol: "magnifyingglass"),
        .init(title: "macOS lifts the field into the toolbar by default.",
              detail: "On macOS the field appears on the trailing edge of the navigation toolbar with .automatic placement. Inside NavigationSplitView, use placement: .sidebar to dock the field into the sidebar column.",
              symbol: "macwindow"),
        .init(title: "You filter the data — SwiftUI doesn't.",
              detail: "The framework only renders and binds the field. Drive your visible collection from the binding (List(filtered(items, text))) for the live result feel.",
              symbol: "line.3.horizontal.decrease.circle"),
        .init(title: "prompt accepts LocalizedStringKey or a Text view.",
              detail: "The text-only overload here takes a LocalizedStringKey. Other overloads accept Text or any StringProtocol — pick whichever localizes cleanly in your app.",
              symbol: "text.cursor")
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
    var width: CGFloat = demoFrameWidth
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: width, height: height)
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
    SearchableTextPage()
        .frame(width: 1100, height: 900)
}
