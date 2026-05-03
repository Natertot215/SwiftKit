import SwiftUI

// SwiftUI `View/listRowSeparatorTint(_:edges:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowseparatortint(_:edges:).md
// Single API:
//   func listRowSeparatorTint(_ color: Color?, edges: VerticalEdge.Set = .all) -> some View
// Apply per row to tint the row's separators. The list style is the final arbiter.
// macOS 13.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

private struct Car: Identifiable, Hashable {
    let model: String
    let brandColor: Color
    let id = UUID()
}

private let cars: [Car] = [
    Car(model: "Mustang",  brandColor: .blue),
    Car(model: "Camaro",   brandColor: .orange),
    Car(model: "Charger",  brandColor: .red),
    Car(model: "Corvette", brandColor: .yellow),
    Car(model: "Viper",    brandColor: .purple)
]

struct ListRowSeparatorTintPage: View {
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
            Text("listRowSeparatorTint(_:edges:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the tint color associated with a row.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowseparatortint(_:edges:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Text(...).listRowSeparatorTint(car.brandColor)") {
            List {
                ForEach(cars) { car in
                    Text(car.model)
                        .listRowSeparatorTint(car.brandColor)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Single uniform tint — all rows") {
                DemoCard(api: ".listRowSeparatorTint(.purple)") {
                    List {
                        ForEach(cars) { car in
                            Text(car.model)
                                .listRowSeparatorTint(.purple)
                        }
                    }
                }
            }

            VariantBlock(title: "edges parameter — top vs bottom") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".top edge only", api: ".listRowSeparatorTint(.red, edges: .top)") {
                        List {
                            ForEach(cars) { car in
                                Text(car.model)
                                    .listRowSeparatorTint(.red, edges: .top)
                            }
                        }
                    }
                    StateColumn(label: ".bottom edge only", api: ".listRowSeparatorTint(.blue, edges: .bottom)") {
                        List {
                            ForEach(cars) { car in
                                Text(car.model)
                                    .listRowSeparatorTint(.blue, edges: .bottom)
                            }
                        }
                    }
                }
            }

            VariantBlock(title: "Pass nil — restore the style's default tint") {
                DemoCard(api: ".listRowSeparatorTint(nil)") {
                    List {
                        ForEach(cars) { car in
                            Text(car.model)
                                .listRowSeparatorTint(nil)
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
            VariantBlock(title: "Side-by-side — default vs per-row brand color") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default separators", api: "(no modifier)") {
                        List {
                            ForEach(cars) { car in
                                Text(car.model)
                            }
                        }
                    }
                    StateColumn(label: "Per-row tint", api: ".listRowSeparatorTint(car.brandColor)") {
                        List {
                            ForEach(cars) { car in
                                Text(car.model)
                                    .listRowSeparatorTint(car.brandColor)
                            }
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
        .init(title: "List style is the final arbiter.",
              detail: "Per the doc: this modifier expresses a preference. The active list style decides whether and how to honor it. Some styles may suppress separators on certain edges (typically the top of the first row).",
              symbol: "exclamationmark.triangle"),
        .init(title: "edges parameter narrows the effect.",
              detail: "VerticalEdge.Set defaults to .all (top + bottom). Pass .top, .bottom, or [.top, .bottom] to apply tinting to only the chosen edges. Combine with separate .listRowSeparatorTint calls per edge for asymmetric tinting.",
              symbol: "square.dashed"),
        .init(title: "Pass nil to clear and inherit.",
              detail: "Color? accepts nil = use the style's default separator color. Useful in conditional code where some rows opt in to tinting and others stay default.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Sibling modifiers govern visibility, section separators.",
              detail: ".listRowSeparator(_:edges:) hides/shows row separators. .listSectionSeparatorTint and .listSectionSeparator do the same for section-level separators. Combine all four to fully control list rules.",
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
    ListRowSeparatorTintPage()
        .frame(width: 1100, height: 800)
}
