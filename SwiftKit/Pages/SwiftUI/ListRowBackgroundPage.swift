import SwiftUI

// SwiftUI `View/listRowBackground(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowbackground(_:).md
// Single API:
//   func listRowBackground<V: View>(_ view: V?) -> some View
// Replaces the row's background with a custom view (any View, not just a Color).
// macOS 10.15+.
//
// L-012 caveat — see Notes section. SwiftKit's sidebar uses NO row-background
// overrides because they introduce grouping chrome on macOS 26 source lists.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

struct ListRowBackgroundPage: View {
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
            Text("listRowBackground(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Places a custom background view behind a list row item.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowbackground(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".listRowBackground(Color.accentColor.opacity(0.2))") {
            List {
                Text("Vanilla")
                    .listRowBackground(Color.accentColor.opacity(0.2))
                Text("Chocolate")
                    .listRowBackground(Color.accentColor.opacity(0.2))
                Text("Strawberry")
                    .listRowBackground(Color.accentColor.opacity(0.2))
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Plain semantic Color background") {
                DemoCard(api: ".listRowBackground(Color(.controlBackgroundColor))") {
                    List {
                        Text("One").listRowBackground(Color(.controlBackgroundColor))
                        Text("Two").listRowBackground(Color(.controlBackgroundColor))
                        Text("Three").listRowBackground(Color(.controlBackgroundColor))
                    }
                }
            }

            VariantBlock(title: "Shape background — Ellipse with tint") {
                DemoCard(api: ".listRowBackground(Ellipse().fill(.tint.opacity(0.2)))") {
                    List {
                        Text("Vanilla")
                            .listRowBackground(Ellipse().fill(.tint.opacity(0.2)))
                        Text("Chocolate")
                            .listRowBackground(Ellipse().fill(.tint.opacity(0.2)))
                        Text("Strawberry")
                            .listRowBackground(Ellipse().fill(.tint.opacity(0.2)))
                    }
                }
            }

            VariantBlock(title: "Pass nil — restore the default") {
                DemoCard(api: ".listRowBackground(nil as Color?)") {
                    List {
                        Text("One").listRowBackground(nil as Color?)
                        Text("Two").listRowBackground(nil as Color?)
                        Text("Three").listRowBackground(nil as Color?)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — default vs custom") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default", api: "(no modifier)") {
                        List {
                            Text("Pacific")
                            Text("Atlantic")
                            Text("Indian")
                        }
                    }
                    StateColumn(label: "Translucent fill", api: ".listRowBackground(.tint.opacity(0.15))") {
                        List {
                            Text("Pacific").listRowBackground(Color.accentColor.opacity(0.15))
                            Text("Atlantic").listRowBackground(Color.accentColor.opacity(0.15))
                            Text("Indian").listRowBackground(Color.accentColor.opacity(0.15))
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
        .init(title: "Accepts any View — Color, Shape, Image, custom layout.",
              detail: "The signature is generic over View, not Color. You can pass an Ellipse, an Image with a tint, or any composed view. The framework places it under the row's content view.",
              symbol: "rectangle.fill"),
        .init(title: "Pass nil to clear and inherit.",
              detail: "Optional<View>; the literal nil typically needs a type hint (`nil as Color?`). Useful in conditional code where some rows opt into a background and others stay default.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Combines with .alternatingRowBackgrounds — per-row wins.",
              detail: "Per the alternatingRowBackgrounds doc: applying .listRowBackground to a specific row overrides the alternating background for that row. Other rows keep alternating per the list-level setting.",
              symbol: "rectangle.split.2x1"),
        .init(title: "L-012 caveat — SwiftKit's sidebar avoids this modifier.",
              detail: "On macOS 26 source lists, .listRowBackground introduces additional grouping chrome on top of the framework's own selection rendering. SwiftKit's SidebarView uses NO row-background overrides for that reason. See .claude/sidebar-plan.md and L-012 in .claude/lessons.md.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Use semantic tokens for the background view.",
              detail: ".tint, .background.secondary, Color(.controlBackgroundColor), Color.accentColor — all valid. Avoid hex literals or raw RGB; the semantic tokens adapt to dark mode and accent color changes.",
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
    ListRowBackgroundPage()
        .frame(width: 1100, height: 800)
}
