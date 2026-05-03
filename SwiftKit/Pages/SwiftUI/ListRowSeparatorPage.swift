import SwiftUI

// SwiftUI `View/listRowSeparator(_:edges:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowseparator(_:edges:).md
// Single API:
//   func listRowSeparator(_ visibility: Visibility, edges: VerticalEdge.Set = .all) -> some View
// Visibility: .visible / .hidden / .automatic.
// macOS 13.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

struct ListRowSeparatorPage: View {
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
            Text("listRowSeparator(_:edges:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the display mode for the separator associated with this specific row.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowseparator(_:edges:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Text(...).listRowSeparator(.hidden)") {
            List {
                Text("One")
                    .listRowSeparator(.hidden)
                Text("Two")
                    .listRowSeparator(.hidden)
                Text("Three")
                    .listRowSeparator(.hidden)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three Visibility values") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".automatic", api: ".listRowSeparator(.automatic)") {
                        rowList(visibility: .automatic)
                    }
                    StateColumn(label: ".visible", api: ".listRowSeparator(.visible)") {
                        rowList(visibility: .visible)
                    }
                    StateColumn(label: ".hidden", api: ".listRowSeparator(.hidden)") {
                        rowList(visibility: .hidden)
                    }
                }
            }

            VariantBlock(title: "edges parameter — top vs bottom") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Hide .top", api: ".listRowSeparator(.hidden, edges: .top)") {
                        List {
                            Text("One").listRowSeparator(.hidden, edges: .top)
                            Text("Two").listRowSeparator(.hidden, edges: .top)
                            Text("Three").listRowSeparator(.hidden, edges: .top)
                        }
                    }
                    StateColumn(label: "Hide .bottom", api: ".listRowSeparator(.hidden, edges: .bottom)") {
                        List {
                            Text("One").listRowSeparator(.hidden, edges: .bottom)
                            Text("Two").listRowSeparator(.hidden, edges: .bottom)
                            Text("Three").listRowSeparator(.hidden, edges: .bottom)
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — default vs hidden") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default", api: "(no modifier)") {
                        List {
                            Text("Pacific")
                            Text("Atlantic")
                            Text("Indian")
                        }
                    }
                    StateColumn(label: "All hidden", api: ".listRowSeparator(.hidden)") {
                        List {
                            Text("Pacific").listRowSeparator(.hidden)
                            Text("Atlantic").listRowSeparator(.hidden)
                            Text("Indian").listRowSeparator(.hidden)
                        }
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
        .init(title: "Visibility values: .automatic / .visible / .hidden.",
              detail: ".automatic defers to the list style. .visible forces a separator to draw. .hidden suppresses it. The list style is still the final arbiter — some styles refuse to draw certain edges.",
              symbol: "switch.2"),
        .init(title: "Apply per row, not to the List.",
              detail: "Each row decides its own separator visibility. To suppress all separators uniformly, apply the modifier in a ForEach row builder so it lands on every row.",
              symbol: "rectangle.split.1x2"),
        .init(title: "edges parameter selects which separator(s) to govern.",
              detail: "VerticalEdge.Set defaults to .all (top + bottom). Pass .top or .bottom to control just one — useful for hiding the separator above the first row or below the last.",
              symbol: "square.dashed"),
        .init(title: "Pair with .listRowSeparatorTint to color what you keep visible.",
              detail: "Visibility and tint are orthogonal modifiers. Set visibility first to decide if a separator draws; set tint to color it. Both are preferences the style can override.",
              symbol: "paintpalette")
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

    // MARK: Helpers

    private func rowList(visibility: Visibility) -> some View {
        List {
            Text("One").listRowSeparator(visibility)
            Text("Two").listRowSeparator(visibility)
            Text("Three").listRowSeparator(visibility)
            Text("Four").listRowSeparator(visibility)
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
    ListRowSeparatorPage()
        .frame(width: 1100, height: 800)
}
