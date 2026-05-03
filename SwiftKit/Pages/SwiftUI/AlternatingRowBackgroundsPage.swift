import SwiftUI

// SwiftUI `View/alternatingRowBackgrounds(_:)` reference page.
// Source: Documentation/SwiftUI/lists/alternatingrowbackgrounds(_:).md
// Single API:
//   func alternatingRowBackgrounds(_ behavior: AlternatingRowBackgroundBehavior = .enabled) -> some View
// Toggles the alternating-row "zebra" backgrounds on Lists / Tables.
// macOS 14.0+. No-effect on .sidebar style.
//
// L-012 caveat — see Notes section.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

private struct Ingredient: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private let ingredients: [Ingredient] = [
    Ingredient(name: "Flour"),
    Ingredient(name: "Sugar"),
    Ingredient(name: "Butter"),
    Ingredient(name: "Eggs"),
    Ingredient(name: "Vanilla"),
    Ingredient(name: "Salt"),
    Ingredient(name: "Baking powder")
]

struct AlternatingRowBackgroundsPage: View {
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
            Text("alternatingRowBackgrounds(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Overrides whether lists and tables in this view have alternating row backgrounds.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/alternatingrowbackgrounds(_:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "List(...).listStyle(.bordered).alternatingRowBackgrounds()") {
            List(ingredients) { item in
                Text(item.name)
            }
            .listStyle(.bordered)
            .alternatingRowBackgrounds()
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three behavior values — side by side") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".automatic", api: ".alternatingRowBackgrounds(.automatic)") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.bordered)
                            .alternatingRowBackgrounds(.automatic)
                    }
                    StateColumn(label: ".enabled", api: ".alternatingRowBackgrounds(.enabled)") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.bordered)
                            .alternatingRowBackgrounds(.enabled)
                    }
                    StateColumn(label: ".disabled", api: ".alternatingRowBackgrounds(.disabled)") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.bordered)
                            .alternatingRowBackgrounds(.disabled)
                    }
                }
            }

            VariantBlock(title: "List style matters — .sidebar ignores this modifier") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".bordered + .enabled", api: ".listStyle(.bordered).alternatingRowBackgrounds(.enabled)") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.bordered)
                            .alternatingRowBackgrounds(.enabled)
                    }
                    StateColumn(label: ".sidebar + .enabled", api: ".listStyle(.sidebar).alternatingRowBackgrounds(.enabled)") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.sidebar)
                            .alternatingRowBackgrounds(.enabled)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — default vs explicit enable") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default (.bordered)", api: "(no modifier)") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.bordered)
                    }
                    StateColumn(label: "Enabled", api: ".alternatingRowBackgrounds()") {
                        List(ingredients) { Text($0.name) }
                            .listStyle(.bordered)
                            .alternatingRowBackgrounds()
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Three behavior values: .automatic / .enabled / .disabled.",
              detail: "Default is .enabled (bare-call form). .automatic defers to the list style's default behavior. .disabled forces the alternating fill off. AlternatingRowBackgroundBehavior is the named type.",
              symbol: "switch.2"),
        .init(title: "Has no effect on .sidebar style.",
              detail: "Per the doc: 'The only list style this has no effect on is .sidebar.' That style uses source-list metrics and has its own selection rendering — alternating rows would conflict.",
              symbol: "sidebar.left"),
        .init(title: "Combines with .scrollContentBackground.",
              detail: "Per the doc: alternating row backgrounds layer on top of the overall list/table background. Use .scrollContentBackground(_:) to control the underlying surface, then .alternatingRowBackgrounds(_:) for the per-row fill.",
              symbol: "rectangle.stack"),
        .init(title: ".listRowBackground overrides per-row.",
              detail: "If a specific row has .listRowBackground, that row's alternating fill is replaced. Other rows in the list continue alternating. Useful for marking a single row without disabling the pattern globally.",
              symbol: "rectangle.fill"),
        .init(title: "L-012 caveat — SwiftKit's sidebar uses no row-background overrides.",
              detail: "On macOS 26 source lists, alternating row backgrounds combined with selection chrome can produce additional grouping. SwiftKit's SidebarView avoids this modifier (and is on .sidebar style anyway, where it's no-op). See .claude/sidebar-plan.md and L-012 in .claude/lessons.md.",
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

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height)
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

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 220, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    AlternatingRowBackgroundsPage()
        .frame(width: 1100, height: 800)
}
