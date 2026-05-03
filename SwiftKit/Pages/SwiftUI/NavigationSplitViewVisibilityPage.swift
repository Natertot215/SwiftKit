import SwiftUI

// SwiftUI `NavigationSplitViewVisibility` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsplitviewvisibility.md
// macOS 13.0+. Four cases: .all, .doubleColumn, .detailOnly, .automatic.
// Used as the type for NavigationSplitView(columnVisibility:) bindings.
// Conforms to Equatable, Codable, Sendable.

private let demoFrameHeight: CGFloat = 240

private struct NSVVChip: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let chips: [NSVVChip] = [
    NSVVChip(name: "Inbox",   symbol: "tray"),
    NSVVChip(name: "Sent",    symbol: "paperplane"),
    NSVVChip(name: "Drafts",  symbol: "doc.text"),
    NSVVChip(name: "Archive", symbol: "archivebox")
]

struct NavigationSplitViewVisibilityPage: View {
    @State private var visibility: NavigationSplitViewVisibility = .all

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
            Text("NavigationSplitViewVisibility")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The visibility of the leading columns in a navigation split view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsplitviewvisibility.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            ColumnDemo(api: "NavigationSplitView(columnVisibility: $visibility) { … }") {
                NavigationSplitView(columnVisibility: $visibility) {
                    List(chips) { Label($0.name, systemImage: $0.symbol) }
                } content: {
                    List(chips.prefix(3)) { Text($0.name) }
                } detail: {
                    placeholder("Detail")
                }
            }
            HStack(spacing: 8) {
                Button(".all")        { visibility = .all }
                Button(".doubleColumn") { visibility = .doubleColumn }
                Button(".detailOnly") { visibility = .detailOnly }
                Button(".automatic")  { visibility = .automatic }
                Spacer()
                Text("visibility = \(label(for: visibility))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("All four enum cases as fixed bindings, side-by-side. macOS may not honor every case (the content column always renders).")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StateColumn(label: ".all", api: ".constant(.all)") {
                    NavigationSplitView(columnVisibility: .constant(.all)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: ".doubleColumn", api: ".constant(.doubleColumn)") {
                    NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: ".detailOnly", api: ".constant(.detailOnly)") {
                    NavigationSplitView(columnVisibility: .constant(.detailOnly)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: { placeholder("Detail only") }
                }
                StateColumn(label: ".automatic", api: ".constant(.automatic)") {
                    NavigationSplitView(columnVisibility: .constant(.automatic)) {
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
        VStack(alignment: .leading, spacing: 16) {
            Text("Two-column form responds the same way: .all shows the sidebar, .detailOnly hides it, .automatic delegates to the platform.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StateColumn(label: ".all (two-column)", api: ".constant(.all)") {
                    NavigationSplitView(columnVisibility: .constant(.all)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } detail: { placeholder("Detail") }
                }
                StateColumn(label: ".detailOnly (two-column)", api: ".constant(.detailOnly)") {
                    NavigationSplitView(columnVisibility: .constant(.detailOnly)) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } detail: { placeholder("Detail only") }
                }
                StateColumn(label: ".automatic (two-column)", api: ".constant(.automatic)") {
                    NavigationSplitView(columnVisibility: .constant(.automatic)) {
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

    private func label(for visibility: NavigationSplitViewVisibility) -> String {
        switch visibility {
        case .all:          return ".all"
        case .doubleColumn: return ".doubleColumn"
        case .detailOnly:   return ".detailOnly"
        case .automatic:    return ".automatic"
        default:            return String(describing: visibility)
        }
    }

    // MARK: Notes

    private struct NSVVNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSVVNote] = [
        .init(title: "Four cases — .all, .doubleColumn, .detailOnly, .automatic.",
              detail: ".all shows every column. .doubleColumn hides only the leading column of a three-column split. .detailOnly collapses everything except the trailing column. .automatic asks the platform to choose.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Use as a binding to drive NavigationSplitView programmatically.",
              detail: "Declare a @State of this type and pass `.init(columnVisibility:sidebar:detail:)` (two-column) or `.init(columnVisibility:sidebar:content:detail:)` (three-column). The framework writes back when the user toggles columns via the toolbar.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "macOS always shows the content column.",
              detail: "Apple's docs explicitly warn that some platforms ignore some cases — macOS keeps the content column visible even when you bind to .doubleColumn. Use the leading-column toggle in the toolbar to confirm what your shell actually honors.",
              symbol: "macwindow"),
        .init(title: "Codable + Equatable + Sendable.",
              detail: "Conformance to Decodable / Encodable means you can persist the value in @AppStorage or scene-restoration data. Equatable / Hashable conformance lets it drive .onChange(of:).",
              symbol: "externaldrive")
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
    NavigationSplitViewVisibilityPage()
        .frame(width: 1200, height: 900)
}
