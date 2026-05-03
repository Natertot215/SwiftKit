import SwiftUI

// SwiftUI `View/navigationSplitViewColumnWidth(min:ideal:max:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsplitviewcolumnwidth(min:ideal:max:).md
// macOS 13.0+. Flexible-width form: ideal is required; min/max are optional.
// Apple's example pairs a fixed sidebar (width 150) with a flexible content column
// constrained between 150 and 400, ideal 200.

private let demoFrameHeight: CGFloat = 240

private struct NSVCWFChip: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let chips: [NSVCWFChip] = [
    NSVCWFChip(name: "Inbox",   symbol: "tray"),
    NSVCWFChip(name: "Sent",    symbol: "paperplane"),
    NSVCWFChip(name: "Drafts",  symbol: "doc.text"),
    NSVCWFChip(name: "Archive", symbol: "archivebox")
]

struct NavigationSplitViewColumnWidthFlexiblePage: View {
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
            Text("View/navigationSplitViewColumnWidth(min:ideal:max:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a flexible, preferred width for the column containing this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsplitviewcolumnwidth(min:ideal:max:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        ColumnDemo(api: ".navigationSplitViewColumnWidth(min: 140, ideal: 180, max: 240)") {
            NavigationSplitView {
                List(chips) { Label($0.name, systemImage: $0.symbol) }
                    .navigationSplitViewColumnWidth(min: 140, ideal: 180, max: 240)
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
            VariantBlock(title: "ideal only") {
                ColumnDemo(api: ".navigationSplitViewColumnWidth(ideal: 200)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(ideal: 200)
                    } detail: {
                        placeholder("Detail")
                    }
                }
            }

            VariantBlock(title: "min + ideal (no upper bound)") {
                ColumnDemo(api: ".navigationSplitViewColumnWidth(min: 160, ideal: 200)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(min: 160, ideal: 200)
                    } detail: {
                        placeholder("Detail")
                    }
                }
            }

            VariantBlock(title: "Three-column — Apple's reference shape") {
                ColumnDemo(api: "Sidebar fixed 150 · content min 150 / ideal 200 / max 400 · detail flexible") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(150)
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                            .navigationSplitViewColumnWidth(min: 150, ideal: 200, max: 400)
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
            Text("Side-by-side — three flexible-range configurations on the sidebar.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StateColumn(label: "120…180 (ideal 150)",
                            api: ".navigationSplitViewColumnWidth(min: 120, ideal: 150, max: 180)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(min: 120, ideal: 150, max: 180)
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: "160…240 (ideal 200)",
                            api: ".navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 240)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 240)
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: "200…320 (ideal 260)",
                            api: ".navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)
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

    private struct NSVCWFNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSVCWFNote] = [
        .init(title: "ideal is required; min and max are optional.",
              detail: "The signature is (min: CGFloat? = nil, ideal: CGFloat, max: CGFloat? = nil). Pass only ideal for an unconstrained-but-preferred width; supply bounds when you want to clamp the user's resize range.",
              symbol: "ruler"),
        .init(title: "Apply on the column's root view, not the NavigationSplitView.",
              detail: "Like the fixed overload, this modifier walks no further than the column it lives in. Attach it to the List (or whichever view fills the column) inside the column's closure.",
              symbol: "arrow.left.and.right"),
        .init(title: "Pair with the fixed overload across columns when sizes differ.",
              detail: "It's idiomatic to pin one column with .navigationSplitViewColumnWidth(_:) and let an adjacent column flex with this modifier. Apple's reference example does exactly this for sidebar + content.",
              symbol: "rectangle.split.3x1"),
        .init(title: "macOS honors the range when the user drags the divider.",
              detail: "On macOS the user can resize between min and max with the divider; outside macOS the modifier still describes a preferred shape but resize affordances vary by platform.",
              symbol: "arrow.up.and.down.and.arrow.left.and.right")
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
    NavigationSplitViewColumnWidthFlexiblePage()
        .frame(width: 1200, height: 900)
}
