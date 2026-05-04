import SwiftUI

// Symbol variants reference page.
// Covers: symbolVariant(_:), SymbolVariants
// Source: Documentation/SwiftUI/images/symbolvariant.md
// macOS 12.0+

struct SymbolVariantsPage: View {
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
            Text("symbolVariant")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apply a variant style to all SF Symbols in a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/symbolVariant(_:) · SymbolVariants · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SVCard(api: ".symbolVariant(.fill)") {
            Image(systemName: "star")
                .symbolVariant(.fill)
                .font(.largeTitle)
                .foregroundStyle(.tint)
        }
    }

    private let symbols = ["star", "heart", "bookmark", "bell", "circle", "square"]
    private let variants: [(String, SymbolVariants)] = [
        ("none", .none),
        ("circle", .circle),
        ("square", .square),
        ("rectangle", .rectangle),
        ("fill", .fill),
        ("slash", .slash),
    ]

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SVVariant(title: "SymbolVariants — all built-in variants") {
                SVCard(api: ".symbolVariant(…)") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 16)], spacing: 16) {
                        ForEach(variants, id: \.0) { name, variant in
                            VStack(spacing: 6) {
                                HStack(spacing: 8) {
                                    ForEach(["star", "heart", "bookmark"], id: \.self) { sym in
                                        Image(systemName: sym)
                                            .symbolVariant(variant)
                                            .font(.title3)
                                    }
                                }
                                Text(".\(name)")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }

            SVVariant(title: "Combining variants") {
                SVCard(api: ".symbolVariant(.fill.circle)  — fill inside circle") {
                    HStack(spacing: 16) {
                        Image(systemName: "star").symbolVariant(.fill.circle).font(.title)
                        Image(systemName: "heart").symbolVariant(.fill.circle).font(.title)
                        Image(systemName: "bell").symbolVariant(.fill.circle).font(.title)
                    }
                    .foregroundStyle(.tint)
                }
            }

            SVVariant(title: "Container cascade") {
                SVCard(api: "VStack { Image(…) }.symbolVariant(.fill)") {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            ForEach(symbols, id: \.self) { sym in
                                Image(systemName: sym).font(.title2)
                            }
                        }
                        .symbolVariant(.fill)
                        Text(".fill applied to all via parent container")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SVVariant(title: "Tab bar / list row pattern") {
                SVCard(api: "Selected item: .symbolVariant(.fill), others: .none") {
                    HStack(spacing: 24) {
                        ForEach(Array(zip(symbols.prefix(4), [true, false, false, false])), id: \.0) { sym, isSelected in
                            Image(systemName: sym)
                                .symbolVariant(isSelected ? .fill : .none)
                                .font(.title2)
                                .foregroundStyle(isSelected ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(Color.secondary))
                        }
                    }
                }
            }
        }
    }

    private struct SVNote { let title: String; let detail: String; let symbol: String }
    private let notes: [SVNote] = [
        .init(title: "Not all symbols support all variants.", detail: "SF Symbol availability of a given variant depends on the symbol. If a variant doesn't exist, the symbol falls back to its default form.", symbol: "questionmark.circle"),
        .init(title: "Variants compose: .fill.circle, .fill.square, etc.", detail: "SymbolVariants supports chaining: .fill.circle renders the filled symbol inside a circle outline. The order in the chain doesn't matter.", symbol: "plus.circle"),
        .init(title: "symbolVariant cascades from parent to children.", detail: "Apply it once to a container (List, HStack, Tab) and all Image(systemName:) descendants receive the variant. Individual images can override.", symbol: "arrow.triangle.branch"),
        .init(title: ".slash creates a slash-through style.", detail: ".symbolVariant(.slash) overlays a diagonal slash — useful for 'disabled', 'off', or 'not allowed' states. Compose with .circle for bell.slash.circle.", symbol: "nosign"),
    ]

    @ViewBuilder private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct SVCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 200, minHeight: 72, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct SVVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    SymbolVariantsPage().frame(width: 900, height: 900)
}
