import SwiftUI

// SwiftUI `View/navigationSplitViewColumnWidth(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsplitviewcolumnwidth(_:).md
// macOS 13.0+. Fixed-width form. Apply to the column's root content view (often a List).
// For a flexible width with min/ideal/max, use the (min:ideal:max:) overload — its own page.

private let demoFrameHeight: CGFloat = 240

private struct NSVCWChip: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let chips: [NSVCWChip] = [
    NSVCWChip(name: "Inbox",   symbol: "tray"),
    NSVCWChip(name: "Sent",    symbol: "paperplane"),
    NSVCWChip(name: "Drafts",  symbol: "doc.text"),
    NSVCWChip(name: "Archive", symbol: "archivebox")
]

struct NavigationSplitViewColumnWidthPage: View {
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
            Text("View/navigationSplitViewColumnWidth(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a fixed, preferred width for the column containing this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsplitviewcolumnwidth(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        ColumnDemo(api: ".navigationSplitViewColumnWidth(180) — sidebar pinned to 180pt") {
            NavigationSplitView {
                List(chips) { chip in
                    Label(chip.name, systemImage: chip.symbol)
                }
                .navigationSplitViewColumnWidth(180)
            } detail: {
                Text("Detail")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Narrow sidebar — width 140") {
                ColumnDemo(api: ".navigationSplitViewColumnWidth(140)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(140)
                    } detail: {
                        placeholder("Detail")
                    }
                }
            }

            VariantBlock(title: "Wide sidebar — width 260") {
                ColumnDemo(api: ".navigationSplitViewColumnWidth(260)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(260)
                    } detail: {
                        placeholder("Detail")
                    }
                }
            }

            VariantBlock(title: "Three-column — sidebar 140, content 200") {
                ColumnDemo(api: "Apply .navigationSplitViewColumnWidth(_:) on each column's root") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(140)
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                            .navigationSplitViewColumnWidth(200)
                    } detail: {
                        placeholder("Detail")
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Side-by-side — same content, different fixed sidebar widths.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StateColumn(label: "120pt", api: ".navigationSplitViewColumnWidth(120)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(120)
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: "180pt", api: ".navigationSplitViewColumnWidth(180)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(180)
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: "240pt", api: ".navigationSplitViewColumnWidth(240)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(240)
                    } detail: { placeholder("Detail") }
                }
            }
        }
    }

    private func placeholder(_ text: String) -> some View {
        Text(text)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes

    private struct NSVCWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSVCWNote] = [
        .init(title: "Apply on the column's root view, not on the NavigationSplitView.",
              detail: "Place .navigationSplitViewColumnWidth(_:) inside the closure for the column you want to size — typically directly on the List that fills the column. Applying it on the NavigationSplitView itself has no effect.",
              symbol: "arrow.left.and.right"),
        .init(title: "Fixed vs flexible.",
              detail: "This overload pins the column to a single value (subject to platform limits). Use .navigationSplitViewColumnWidth(min:ideal:max:) when you want the user to be able to resize within a range.",
              symbol: "rectangle.split.3x1"),
        .init(title: "macOS users can drag the divider; the modifier supplies the preferred width.",
              detail: "On macOS the system honors the value as the column's preferred width, but the user can still resize by dragging the divider. SwiftUI may silently clamp the value if it falls outside what the current presentation supports.",
              symbol: "arrow.up.and.down.and.arrow.left.and.right"),
        .init(title: "Combines naturally with .navigationSplitViewStyle(_:).",
              detail: "The style chooses the layout strategy (.balanced, .prominentDetail, …); the column widths set per-column targets. The two modifiers are independent and stack."
              , symbol: "paintbrush")
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

private struct ColumnDemo<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: 560, height: demoFrameHeight)
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
                .frame(width: 360, height: demoFrameHeight)
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
    NavigationSplitViewColumnWidthPage()
        .frame(width: 1200, height: 900)
}
