import SwiftUI

// SwiftUI `View/navigationSplitViewStyle(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsplitviewstyle(_:).md
// macOS 13.0+. Three documented styles:
//   .automatic         — system picks per platform
//   .balanced          — equal weight columns; detail moves over as columns appear
//   .prominentDetail   — detail stays full size; leading columns overlay
// The styles are conformers of `NavigationSplitViewStyle`. Apply via the modifier
// to any view containing a NavigationSplitView; nearest-ancestor wins.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 260

private struct NSVStyleSpecimen: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let specimens: [NSVStyleSpecimen] = [
    NSVStyleSpecimen(name: "Inbox",   symbol: "tray"),
    NSVStyleSpecimen(name: "Sent",    symbol: "paperplane"),
    NSVStyleSpecimen(name: "Drafts",  symbol: "doc.text"),
    NSVStyleSpecimen(name: "Archive", symbol: "archivebox")
]

struct NavigationSplitViewStyleGalleryPage: View {
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
            Text("View/navigationSplitViewStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for navigation split views within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsplitviewstyle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        StyleCard(title: ".automatic", api: ".navigationSplitViewStyle(.automatic)") {
            AnyView(stylableSplit.navigationSplitViewStyle(.automatic))
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("All three documented NavigationSplitViewStyle conformers, applied to identical three-column content.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StyleCard(title: ".automatic", api: ".navigationSplitViewStyle(.automatic)") {
                    AnyView(stylableSplit.navigationSplitViewStyle(.automatic))
                }
                StyleCard(title: ".balanced", api: ".navigationSplitViewStyle(.balanced)") {
                    AnyView(stylableSplit.navigationSplitViewStyle(.balanced))
                }
                StyleCard(title: ".prominentDetail", api: ".navigationSplitViewStyle(.prominentDetail)") {
                    AnyView(stylableSplit.navigationSplitViewStyle(.prominentDetail))
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("The same three styles, paired with .doubleColumn visibility so the leading column is hidden — useful for spotting the layout differences.")
                .font(.callout)
                .foregroundStyle(.secondary)

            HStack(alignment: .top, spacing: 24) {
                StyleCard(title: ".automatic + .doubleColumn", api: ".navigationSplitViewStyle(.automatic)") {
                    AnyView(collapsedSplit.navigationSplitViewStyle(.automatic))
                }
                StyleCard(title: ".balanced + .doubleColumn", api: ".navigationSplitViewStyle(.balanced)") {
                    AnyView(collapsedSplit.navigationSplitViewStyle(.balanced))
                }
                StyleCard(title: ".prominentDetail + .doubleColumn", api: ".navigationSplitViewStyle(.prominentDetail)") {
                    AnyView(collapsedSplit.navigationSplitViewStyle(.prominentDetail))
                }
            }
        }
    }

    private var stylableSplit: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            List(specimens) { item in
                Label(item.name, systemImage: item.symbol)
            }
        } content: {
            List(specimens.prefix(3)) { item in
                Text(item.name)
            }
        } detail: {
            placeholder("Detail")
        }
    }

    private var collapsedSplit: some View {
        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
            List(specimens) { item in
                Label(item.name, systemImage: item.symbol)
            }
        } content: {
            List(specimens.prefix(3)) { item in
                Text(item.name)
            }
        } detail: {
            placeholder("Detail")
        }
    }

    private func placeholder(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: Notes

    private struct NSVSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSVSNote] = [
        .init(title: "Three concrete styles — .automatic, .balanced, .prominentDetail.",
              detail: "All three conform to NavigationSplitViewStyle. .automatic delegates to the platform; .balanced gives the columns equal weight; .prominentDetail keeps the trailing column at full width and overlays the leading columns rather than pushing it.",
              symbol: "paintbrush"),
        .init(title: "Apply to any ancestor of the NavigationSplitView.",
              detail: "The modifier walks up to the nearest enclosing NavigationSplitView. You typically attach it directly on the split view itself or on the WindowGroup root scene's content.",
              symbol: "arrow.up"),
        .init(title: "macOS treats .automatic and .balanced similarly.",
              detail: "On macOS the visible difference between .automatic and .balanced is small in two- and three-column shells. The clearest contrast is .prominentDetail, which lets the detail column dominate while the leading columns slide in as overlays.",
              symbol: "macwindow"),
        .init(title: "Style is inherited; it does not bind state.",
              detail: "Unlike columnVisibility, style is a one-way environment value. Changing the binding on visibility writes back when the user toggles columns; changing style is a pure display directive.",
              symbol: "switch.2")
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

private struct StyleCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

extension NavigationSplitViewStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.navigationSplitViewStyle",
        title: "NavigationSplitViewStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: ["NavigationSplitViewStyle"],
        blurb: "A type that specifies the appearance and interaction of navigation split views within a view hierarchy. Apply with View/navigationSplitViewStyle(_:); built-in conformers include AutomaticNavigationSplitViewStyle, BalancedNavigationSplitViewStyle, and ProminentDetailNavigationSplitViewStyle.",
        signature: "@MainActor @preconcurrency protocol NavigationSplitViewStyle",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-styles/navigationsplitviewstyle.md",
        page: { AnyView(NavigationSplitViewStyleGalleryPage()) }
    )
}

#Preview {
    NavigationSplitViewStyleGalleryPage()
        .frame(width: 1200, height: 900)
}
