import SwiftUI

// SwiftUI `View/listSectionSeparatorTint(_:edges:)` reference page.
// Source: Documentation/SwiftUI/lists/listsectionseparatortint(_:edges:).md
// Single API:
//   func listSectionSeparatorTint(_ color: Color?, edges: VerticalEdge.Set = .all) -> some View
// Apply per Section to tint section separators. List style is the arbiter.
// macOS 13.0+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

struct ListSectionSeparatorTintPage: View {
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
            Text("listSectionSeparatorTint(_:edges:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the tint color associated with a section.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listsectionseparatortint(_:edges:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Section { … }.listSectionSeparatorTint(.indigo, edges: .bottom)") {
            List {
                Section(header: Text("Colors")) {
                    Text("Blue"); Text("Red")
                }
                .listSectionSeparatorTint(.indigo, edges: .bottom)
                Section(header: Text("Shapes")) {
                    Text("Square"); Text("Circle")
                }
                .listSectionSeparatorTint(.indigo, edges: .bottom)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Tint applied uniformly to .all edges") {
                DemoCard(api: ".listSectionSeparatorTint(.purple)") {
                    List {
                        Section(header: Text("A")) {
                            Text("a1"); Text("a2")
                        }
                        .listSectionSeparatorTint(.purple)
                        Section(header: Text("B")) {
                            Text("b1"); Text("b2")
                        }
                        .listSectionSeparatorTint(.purple)
                    }
                }
            }

            VariantBlock(title: "Per-edge tinting") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".top only", api: "edges: .top, color: .red") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                                .listSectionSeparatorTint(.red, edges: .top)
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                                .listSectionSeparatorTint(.red, edges: .top)
                        }
                    }
                    StateColumn(label: ".bottom only", api: "edges: .bottom, color: .blue") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                                .listSectionSeparatorTint(.blue, edges: .bottom)
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                                .listSectionSeparatorTint(.blue, edges: .bottom)
                        }
                    }
                }
            }

            VariantBlock(title: "Pass nil — restore the style's default") {
                DemoCard(api: ".listSectionSeparatorTint(nil)") {
                    List {
                        Section(header: Text("A")) { Text("a1"); Text("a2") }
                            .listSectionSeparatorTint(nil)
                        Section(header: Text("B")) { Text("b1"); Text("b2") }
                            .listSectionSeparatorTint(nil)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — default vs per-section tint") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default", api: "(no modifier)") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                        }
                    }
                    StateColumn(label: "Per-section tint", api: ".listSectionSeparatorTint(...)") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                                .listSectionSeparatorTint(.green)
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                                .listSectionSeparatorTint(.orange)
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
        .init(title: "Apply to a Section, not the List.",
              detail: "Section separators sit above and below an entire group. Attach the modifier to the Section so the framework knows which group's separators to tint.",
              symbol: "rectangle.stack"),
        .init(title: "List style is the final arbiter.",
              detail: "The tint is a preference. The active style may suppress section separators on some edges entirely — most common is the top edge of the first section. Test against your target style.",
              symbol: "exclamationmark.triangle"),
        .init(title: "edges parameter narrows the effect.",
              detail: "VerticalEdge.Set defaults to .all. Pass .top, .bottom, or both via brackets to apply tinting only to the chosen edges. Use this when you want the bottom rule of a section to mark a transition without touching the top.",
              symbol: "square.dashed"),
        .init(title: "Pairs with .listRowSeparatorTint, .listSectionSeparator, .listRowSeparator.",
              detail: "All four combine. Section-level wins inside its scope; row-level applies to individual row dividers. Visibility (.listRowSeparator / .listSectionSeparator) governs whether anything draws at all.",
              symbol: "rectangle.split.3x1")
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
                .frame(width: 280, height: demoFrameHeight)
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
    ListSectionSeparatorTintPage()
        .frame(width: 1100, height: 800)
}
