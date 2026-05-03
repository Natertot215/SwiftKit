import SwiftUI

// SwiftUI `View/listSectionSeparator(_:edges:)` reference page.
// Source: Documentation/SwiftUI/lists/listsectionseparator(_:edges:).md
// Single API:
//   func listSectionSeparator(_ visibility: Visibility, edges: VerticalEdge.Set = .all) -> some View
// macOS 13.0+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

struct ListSectionSeparatorPage: View {
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
            Text("listSectionSeparator(_:edges:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets whether to hide the separator associated with a list section.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionseparator(_:edges:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Section { … }.listSectionSeparator(.hidden, edges: .bottom)") {
            List {
                Section(header: Text("Colors")) {
                    Text("Blue"); Text("Red")
                }
                .listSectionSeparator(.hidden, edges: .bottom)
                Section(header: Text("Shapes")) {
                    Text("Square"); Text("Circle")
                }
                .listSectionSeparator(.hidden, edges: .bottom)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three Visibility values") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".automatic", api: ".listSectionSeparator(.automatic)") {
                        sectionedList(visibility: .automatic)
                    }
                    StateColumn(label: ".visible", api: ".listSectionSeparator(.visible)") {
                        sectionedList(visibility: .visible)
                    }
                    StateColumn(label: ".hidden", api: ".listSectionSeparator(.hidden)") {
                        sectionedList(visibility: .hidden)
                    }
                }
            }

            VariantBlock(title: "edges parameter — selectively hide top vs bottom") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Hide .top", api: ".listSectionSeparator(.hidden, edges: .top)") {
                        List {
                            Section(header: Text("A")) { Text("a1") }
                                .listSectionSeparator(.hidden, edges: .top)
                            Section(header: Text("B")) { Text("b1") }
                                .listSectionSeparator(.hidden, edges: .top)
                        }
                    }
                    StateColumn(label: "Hide .bottom", api: ".listSectionSeparator(.hidden, edges: .bottom)") {
                        List {
                            Section(header: Text("A")) { Text("a1") }
                                .listSectionSeparator(.hidden, edges: .bottom)
                            Section(header: Text("B")) { Text("b1") }
                                .listSectionSeparator(.hidden, edges: .bottom)
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
            VariantBlock(title: "Side-by-side — default vs hidden section separators") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default", api: "(no modifier)") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                        }
                    }
                    StateColumn(label: "All hidden", api: ".listSectionSeparator(.hidden)") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                                .listSectionSeparator(.hidden)
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                                .listSectionSeparator(.hidden)
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
        .init(title: "Visibility: .automatic / .visible / .hidden.",
              detail: ".automatic defers to the list style. .visible asks the style to draw. .hidden suppresses. The style is the final arbiter — some styles never draw certain edges.",
              symbol: "switch.2"),
        .init(title: "Apply to a Section, not the List.",
              detail: "Section separators are the rules above and below an entire group. Attach to the Section so the framework knows which group's separators to govern.",
              symbol: "rectangle.stack"),
        .init(title: "edges parameter — top vs bottom of the section.",
              detail: "VerticalEdge.Set defaults to .all. Pass .top or .bottom to govern just one. Useful for fully closing a list with a bottom rule on the last section while leaving the top free.",
              symbol: "square.dashed"),
        .init(title: "Sibling: .listSectionSeparatorTint for color.",
              detail: "Visibility and tint are orthogonal. .listSectionSeparator decides whether the rule draws. .listSectionSeparatorTint colors what does draw. Both are preferences subject to the active style.",
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

    private func sectionedList(visibility: Visibility) -> some View {
        List {
            Section(header: Text("Colors")) {
                Text("Blue"); Text("Red")
            }
            .listSectionSeparator(visibility)
            Section(header: Text("Shapes")) {
                Text("Square"); Text("Circle")
            }
            .listSectionSeparator(visibility)
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
    ListSectionSeparatorPage()
        .frame(width: 1100, height: 800)
}
