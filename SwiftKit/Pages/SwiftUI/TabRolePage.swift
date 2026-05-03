import SwiftUI

// SwiftUI `TabRole` reference page.
// Source: Documentation/SwiftUI/navigation/tabrole.md
// macOS 15.0+. Documented type properties:
//   .search   — flags the tab as a search target
// (Apple's Topics section currently lists only .search; future roles will surface
// here.) Use via Tab(... role: .search) to opt into the search-tab semantics.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum TRPSection: Hashable {
    case home, browse, search
}

struct TabRolePage: View {
    @State private var selection: TRPSection = .home

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
            Text("TabRole")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A value that defines the purpose of the tab.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/tabrole.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Tab(value: .search, role: .search) { … } label: { Label(\"Search\", systemImage:) }") {
            TabView(selection: $selection) {
                Tab("Home",   systemImage: "house",       value: TRPSection.home)   { pane("Home") }
                Tab("Browse", systemImage: "list.bullet", value: TRPSection.browse) { pane("Browse") }
                Tab(value: TRPSection.search, role: .search) {
                    pane("Search")
                } label: {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Search role + .sidebarAdaptable") {
                DemoCard(api: "TabView { …; Tab(value:, role: .search) { … } } .tabViewStyle(.sidebarAdaptable)") {
                    TabView(selection: $selection) {
                        Tab("Home",   systemImage: "house",       value: TRPSection.home)   { pane("Home") }
                        Tab("Browse", systemImage: "list.bullet", value: TRPSection.browse) { pane("Browse") }
                        Tab(value: TRPSection.search, role: .search) {
                            pane("Search")
                        } label: {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    }
                    .tabViewStyle(.sidebarAdaptable)
                }
            }

            VariantBlock(title: "Without a role — same Tab, default semantics") {
                DemoCard(api: "Tab(\"Search\", systemImage: \"magnifyingglass\", value: .search) { … }") {
                    TabView(selection: $selection) {
                        Tab("Home",   systemImage: "house",          value: TRPSection.home)   { pane("Home") }
                        Tab("Browse", systemImage: "list.bullet",    value: TRPSection.browse) { pane("Browse") }
                        Tab("Search", systemImage: "magnifyingglass", value: TRPSection.search) { pane("Search") }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Button("Home")   { selection = .home }
                Button("Browse") { selection = .browse }
                Button("Search") { selection = .search }
                Spacer()
                Text("selection = \(String(describing: selection))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            APICallout("TabRole conforms to Equatable, Hashable, Sendable — usable in keys, sets, comparisons.")
        }
    }

    private func pane(_ title: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "rectangle.stack")
                .font(.system(size: 32))
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes

    private struct TRNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TRNote] = [
        .init(title: "Documented role — .search.",
              detail: "Apple lists `search` as the only public type property of TabRole. Pass `role: .search` to a Tab initializer to flag that tab as the system search target. Additional roles may appear in future SDKs.",
              symbol: "magnifyingglass"),
        .init(title: "Apply via the Tab(... role:) initializers.",
              detail: "Three Tab init shapes accept `role:` — init(role:content:), init(value:role:content:), and the label-builder variants. Pass `.search` (or omit `role:` entirely for the default).",
              symbol: "switch.2"),
        .init(title: "macOS chrome change is subtle.",
              detail: "On iOS / iPadOS the search role surfaces a dedicated search affordance. On macOS the visible difference is subtler — the role is still recorded for accessibility and search-bar semantics, but the tab still renders like any other tab.",
              symbol: "macwindow"),
        .init(title: "Equatable + Hashable + Sendable.",
              detail: "TabRole's relationships make it safe to compare, store in sets, and pass across actor boundaries. There's no failable constructor — only the documented type properties exist.",
              symbol: "circle.dashed")
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
    TabRolePage()
        .frame(width: 1100, height: 800)
}
