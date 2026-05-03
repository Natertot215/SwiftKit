import SwiftUI

// SwiftUI `NavigationSplitViewColumn` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsplitviewcolumn.md
// macOS 14.0+. Three cases: .sidebar, .content, .detail.
// Used with the preferredCompactColumn parameter of NavigationSplitView to control
// which column appears on top when the split collapses to a single stack
// (e.g. iPhone, narrow Catalyst windows). On macOS the value is rarely consulted
// because the split form rarely collapses.

private let demoFrameHeight: CGFloat = 240

private struct NSVColChip: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let chips: [NSVColChip] = [
    NSVColChip(name: "Inbox",   symbol: "tray"),
    NSVColChip(name: "Sent",    symbol: "paperplane"),
    NSVColChip(name: "Drafts",  symbol: "doc.text"),
    NSVColChip(name: "Archive", symbol: "archivebox")
]

struct NavigationSplitViewColumnPage: View {
    @State private var compactColumn: NavigationSplitViewColumn = .sidebar

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
            Text("NavigationSplitViewColumn")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that represents a column in a navigation split view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsplitviewcolumn.md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            ColumnDemo(api: "NavigationSplitView(preferredCompactColumn: $compactColumn) { … }") {
                NavigationSplitView(preferredCompactColumn: $compactColumn) {
                    List(chips) { Label($0.name, systemImage: $0.symbol) }
                } content: {
                    List(chips.prefix(3)) { Text($0.name) }
                } detail: {
                    placeholder("Detail")
                }
            }
            HStack(spacing: 8) {
                Button(".sidebar") { compactColumn = .sidebar }
                Button(".content") { compactColumn = .content }
                Button(".detail")  { compactColumn = .detail }
                Spacer()
                Text("preferredCompactColumn = \(label(for: compactColumn))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("All three NavigationSplitViewColumn cases supplied as a fixed binding. macOS rarely collapses, so the bound value mostly affects iPhone / Catalyst.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StateColumn(label: ".sidebar", api: ".constant(.sidebar)") {
                    NavigationSplitView(preferredCompactColumn: .constant(.sidebar)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: ".content", api: ".constant(.content)") {
                    NavigationSplitView(preferredCompactColumn: .constant(.content)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: ".detail", api: ".constant(.detail)") {
                    NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: { placeholder("Detail") }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Two-column form — preferredCompactColumn is also accepted, with the same .sidebar / .detail meanings.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StateColumn(label: "two-column · .sidebar",
                            api: "NavigationSplitView(preferredCompactColumn: .constant(.sidebar)) { … } detail: { … }") {
                    NavigationSplitView(preferredCompactColumn: .constant(.sidebar)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: "two-column · .detail",
                            api: "NavigationSplitView(preferredCompactColumn: .constant(.detail)) { … } detail: { … }") {
                    NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } detail: { placeholder("Detail") }
                }
            }
        }
    }

    private func placeholder(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func label(for column: NavigationSplitViewColumn) -> String {
        switch column {
        case .sidebar: return ".sidebar"
        case .content: return ".content"
        case .detail:  return ".detail"
        default:       return String(describing: column)
        }
    }

    // MARK: Notes

    private struct NSVColNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSVColNote] = [
        .init(title: "Three cases — .sidebar, .content, .detail.",
              detail: "Each case names a column position in NavigationSplitView. The type is Equatable, Hashable, Sendable — fine for state, set comparisons, and onChange.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Drives preferredCompactColumn, not visibility.",
              detail: "Pass a Binding<NavigationSplitViewColumn> via the preferredCompactColumn parameter. The split view consults it only when the split has to collapse to a single stack (iPhone, narrow Catalyst). For show/hide control, use NavigationSplitViewVisibility instead.",
              symbol: "iphone"),
        .init(title: "macOS rarely collapses.",
              detail: "Standard Mac windows present the split as multiple columns, so the preferred-compact-column value almost never takes effect. The binding still round-trips correctly; it's just visually inert.",
              symbol: "macwindow"),
        .init(title: "Available macOS 14+.",
              detail: "NavigationSplitViewColumn first shipped in macOS 14.0 / iOS 17.0 alongside the preferredCompactColumn parameter on NavigationSplitView. Older targets need to omit the parameter entirely.",
              symbol: "calendar")
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
                .frame(width: 320, height: demoFrameHeight)
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
    NavigationSplitViewColumnPage()
        .frame(width: 1200, height: 900)
}
