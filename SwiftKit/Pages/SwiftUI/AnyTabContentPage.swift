import SwiftUI

// SwiftUI `AnyTabContent` reference page.
// Source: Documentation/SwiftUI/navigation/anytabcontent.md
// macOS 15.0+. Type-erased TabContent. Use when a function or property must
// return TabContent without exposing the concrete type — e.g. when conditional
// branches produce different Tab shapes.
// Initializer: AnyTabContent(_ content: some TabContent<SelectionValue>)

private let demoFrameWidth: CGFloat = 540
private let demoFrameHeight: CGFloat = 360

private enum ATCPSection: Hashable {
    case home, browse, settings, search
}

struct AnyTabContentPage: View {
    @State private var selection: ATCPSection = .home
    @State private var includeSearch = true

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
            Text("AnyTabContent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Type-erased tab content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/anytabcontent.md · macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            DemoCard(api: "AnyTabContent(Tab(...))  — wraps any TabContent into a uniform return type") {
                TabView(selection: $selection) {
                    AnyTabContent(Tab("Home", systemImage: "house", value: ATCPSection.home) { pane("Home") })
                    AnyTabContent(Tab("Browse", systemImage: "list.bullet", value: ATCPSection.browse) { pane("Browse") })
                    if includeSearch {
                        AnyTabContent(
                            Tab(value: ATCPSection.search, role: .search) {
                                pane("Search")
                            } label: {
                                Label("Search", systemImage: "magnifyingglass")
                            }
                        )
                    }
                }
            }
            HStack {
                Toggle("Include search tab (rebuilt as AnyTabContent)", isOn: $includeSearch)
                Spacer()
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Returning TabContent from a helper") {
                APICallout("private func makeHomeTab() -> AnyTabContent<ATCPSection> {")
                APICallout("    AnyTabContent(Tab(\"Home\", systemImage: \"house\", value: .home) { … })")
                APICallout("}")
                Text("AnyTabContent gives you a single return type when the helper might return different concrete Tab shapes (e.g. role: .search vs not).")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            VariantBlock(title: "Storing heterogeneous tabs in an array") {
                APICallout("let tabs: [AnyTabContent<ATCPSection>] = [")
                APICallout("    AnyTabContent(Tab(\"Home\", systemImage: \"house\", value: .home) { … }),")
                APICallout("    AnyTabContent(Tab(\"Browse\", systemImage: \"list.bullet\", value: .browse) { … })")
                APICallout("]")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Button("Home")     { selection = .home }
                Button("Browse")   { selection = .browse }
                Button("Search")   { selection = .search }
                Spacer()
                Text("selection = \(String(describing: selection))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            APICallout("AnyTabContent<SelectionValue>(_:)  // wraps any TabContent with the matching TabValue")
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

    private struct ATCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ATCNote] = [
        .init(title: "Type-erased — use when concrete TabContent type can't be exposed.",
              detail: "Functions or properties that conditionally produce different Tab shapes return AnyTabContent so the call site doesn't need to thread an opaque generic type.",
              symbol: "shuffle"),
        .init(title: "Generic over the SelectionValue.",
              detail: "AnyTabContent<SelectionValue> erases the concrete TabContent type but retains the Hashable selection type. All tabs in one TabView still need to agree on this generic parameter.",
              symbol: "circle.dashed"),
        .init(title: "Single initializer — wraps a TabContent value.",
              detail: "init(_:) is the only public initializer. Pass a Tab, TabSection, ForEach, Group, or another AnyTabContent — anything that conforms to TabContent with the matching SelectionValue.",
              symbol: "switch.2"),
        .init(title: "Don't reach for it unless you need it.",
              detail: "Like AnyView, AnyTabContent is an escape hatch. The TabContentBuilder handles the typical cases — conditionals, ForEach, ten-children blocks — without you needing to erase. Reach for AnyTabContent when generic plumbing forces it.",
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
    AnyTabContentPage()
        .frame(width: 1200, height: 900)
}
