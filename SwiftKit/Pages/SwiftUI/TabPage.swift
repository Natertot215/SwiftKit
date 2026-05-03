import SwiftUI

// SwiftUI `Tab` reference page.
// Source: Documentation/SwiftUI/navigation/tab.md
// macOS 15.0+. The content for a tab and the tab's associated tab item in a tab view.
// Many initializers — categorized by label form (string/system-image/image/view-builder)
// and by selection form (no value, value:, role:, value:role:).

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum TabPageSection: Hashable {
    case home, browse, search, settings
}

struct TabPage: View {
    @State private var selection: TabPageSection = .home

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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Tab")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The content for a tab and the tab's associated tab item in a tab view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tab.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Tab(\"Home\", systemImage: \"house\") { … }") {
            TabView {
                Tab("Home", systemImage: "house") { pane("Home") }
                Tab("Browse", systemImage: "list.bullet") { pane("Browse") }
                Tab("Settings", systemImage: "gear") { pane("Settings") }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(_:systemImage:content:) — string label + SF Symbol") {
                DemoCard(api: "Tab(\"Home\", systemImage: \"house\") { … }") {
                    TabView {
                        Tab("Home",     systemImage: "house")        { pane("Home") }
                        Tab("Browse",   systemImage: "list.bullet")  { pane("Browse") }
                        Tab("Settings", systemImage: "gear")         { pane("Settings") }
                    }
                }
            }

            VariantBlock(title: "init(_:systemImage:value:content:) — adds a Hashable value for selection") {
                DemoCard(api: "Tab(\"Home\", systemImage: \"house\", value: .home) { … }") {
                    TabView(selection: $selection) {
                        Tab("Home",     systemImage: "house",       value: TabPageSection.home)     { pane("Home") }
                        Tab("Browse",   systemImage: "list.bullet", value: TabPageSection.browse)   { pane("Browse") }
                        Tab("Settings", systemImage: "gear",        value: TabPageSection.settings) { pane("Settings") }
                    }
                }
            }

            VariantBlock(title: "init(value:role:content:label:) — search role + custom label") {
                DemoCard(api: "Tab(value: .search, role: .search) { … } label: { Label(\"Search\", systemImage: \"magnifyingglass\") }") {
                    TabView(selection: $selection) {
                        Tab("Home", systemImage: "house", value: TabPageSection.home) { pane("Home") }
                        Tab(value: TabPageSection.search, role: .search) {
                            pane("Search")
                        } label: {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    }
                }
            }

            VariantBlock(title: "init(content:label:) — view-builder label, no value") {
                DemoCard(api: "Tab { … } label: { Label(\"Browse\", systemImage:) }") {
                    TabView {
                        Tab { pane("Home") } label: {
                            Label("Home", systemImage: "house")
                        }
                        Tab { pane("Browse") } label: {
                            Label("Browse", systemImage: "list.bullet")
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Programmatic switch — buttons drive the bound selection") {
                DemoCard(api: "selection = .home / .browse / .search / .settings") {
                    TabView(selection: $selection) {
                        Tab("Home",     systemImage: "house",         value: TabPageSection.home)     { pane("Home") }
                        Tab("Browse",   systemImage: "list.bullet",   value: TabPageSection.browse)   { pane("Browse") }
                        Tab("Settings", systemImage: "gear",          value: TabPageSection.settings) { pane("Settings") }
                        Tab(value: TabPageSection.search, role: .search) {
                            pane("Search")
                        } label: {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    }
                }
                HStack(spacing: 8) {
                    Button("Home")     { selection = .home }
                    Button("Browse")   { selection = .browse }
                    Button("Search")   { selection = .search }
                    Button("Settings") { selection = .settings }
                    Spacer()
                    Text("selection = \(String(describing: selection))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private func pane(_ title: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "rectangle.stack")
                .font(.system(size: 36))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes

    private struct TabNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TabNote] = [
        .init(title: "Many initializers — labels × selection × role.",
              detail: "The Topics section in Apple's docs groups them: with system image, with image, with view-builder label. Each has a value-less variant, a value: variant, a role: variant, and a value:role: variant — twelve total.",
              symbol: "switch.2"),
        .init(title: "value: makes the tab selectable programmatically.",
              detail: "Pass a Hashable as `value:` to pair with TabView(selection:). Without a value, the tab is still rendered and selectable by the user — but you can't drive selection from code.",
              symbol: "cursorarrow.click.2"),
        .init(title: "TabRole.search is the documented role.",
              detail: "Pass `role: .search` for the dedicated search tab. It surfaces with system search affordances on supported platforms; on macOS the role doesn't change the tab's chrome dramatically but still flags it as a search target.",
              symbol: "magnifyingglass"),
        .init(title: "Apply Tab modifiers with .badge(_:), .customizationID(_:), etc.",
              detail: "Tab conforms to TabContent — meaning the modifiers in TabContent's documentation apply to it directly: .badge, .customizationID, .defaultVisibility, .customizationBehavior, .accessibilityLabel, etc.",
              symbol: "circle.dashed"),
        .init(title: "Tabs live inside a TabView.",
              detail: "Don't try to use Tab outside of a TabView's content closure — it conforms to TabContent (a `TabView` builder protocol), not to View. Embedding it elsewhere produces a compile error.",
              symbol: "exclamationmark.triangle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
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

// MARK: - Page-local helpers

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
    TabPage()
        .frame(width: 1100, height: 900)
}
