import SwiftUI

// SwiftUI `ListStyle` family — merged page covering:
//   1. View/listStyle(_:) modifier
//   2. ListStyle protocol and its built-in conformers
// Source: Documentation/SwiftUI/view-styles/liststyle(_:).md, liststyle.md
// macOS 10.15+. Five styles render on macOS: .automatic, .bordered, .inset, .plain, .sidebar.

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 240

private struct LSItem: Identifiable, Hashable {
    let id: Int
    let name: String
    let symbol: String
}

private let items: [LSItem] = [
    LSItem(id: 0, name: "Inbox",   symbol: "tray"),
    LSItem(id: 1, name: "Sent",    symbol: "paperplane"),
    LSItem(id: 2, name: "Drafts",  symbol: "doc.text"),
    LSItem(id: 3, name: "Archive", symbol: "archivebox"),
    LSItem(id: 4, name: "Trash",   symbol: "trash")
]

struct ListStyleGalleryPage: View {
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
            Text("listStyle(_:) + ListStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The modifier that sets a list's appearance, and the protocol that built-in style conformers implement.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/liststyle(_:).md, liststyle.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        LSCard(title: ".automatic", api: ".listStyle(.automatic)") {
            sampleList.listStyle(.automatic)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 40) {

            // Section 1: listStyle(_:) modifier — live demos
            Group {
                Text("View/listStyle(_:)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("Sets the style for lists within this view. Five list styles render on macOS, applied to identical content.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("func listStyle<S: ListStyle>(_ style: S) -> some View")
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
                    ], alignment: .leading, spacing: 24) {
                        LSCard(title: ".automatic", api: ".listStyle(.automatic)") {
                            sampleList.listStyle(.automatic)
                        }
                        LSCard(title: ".bordered", api: ".listStyle(.bordered)") {
                            sampleList.listStyle(.bordered)
                        }
                        LSCard(title: ".inset", api: ".listStyle(.inset)") {
                            sampleList.listStyle(.inset)
                        }
                        LSCard(title: ".plain", api: ".listStyle(.plain)") {
                            sampleList.listStyle(.plain)
                        }
                        LSCard(title: ".sidebar", api: ".listStyle(.sidebar)") {
                            sampleList.listStyle(.sidebar)
                        }
                    }
                }
            }

            // Section 2: ListStyle protocol
            Group {
                Text("ListStyle")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                Divider()
                VStack(alignment: .leading, spacing: 12) {
                    Text("A protocol that describes the behavior and appearance of a list. A marker protocol — required members are SPI. SwiftKit documents the built-in conformers and does not author custom ones.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    LSCodeBlock(text:
                        """
                        @MainActor protocol ListStyle {
                            // Required members are SPI.
                            // Use the built-in conformers via literal style values.
                        }

                        // Apply via:
                        // List { … }.listStyle(.sidebar)
                        """)

                    Text("Built-in conformers on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    LSCodeBlock(text:
                        """
                        .automatic       — DefaultListStyle
                        .bordered        — BorderedListStyle
                        .inset           — InsetListStyle
                        .plain           — PlainListStyle
                        .sidebar         — SidebarListStyle
                        """)

                    Text("Four additional values exist for iOS/watchOS but fall back silently on macOS:")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    LSCodeBlock(text:
                        """
                        .grouped         — iOS-only (silent fallback on macOS)
                        .insetGrouped    — iOS-only
                        .carousel        — watchOS-only
                        .elliptical      — watchOS-only
                        """)
                }
            }
        }
    }

    private var sampleList: some View {
        List {
            Section(header: Text("Mailboxes")) {
                ForEach(items) { item in
                    Label(item.name, systemImage: item.symbol)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Inheritance — outer .listStyle wins for inner Lists")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Apply .listStyle(_:) at any container level. The nearest enclosing modifier wins for each List in the subtree.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LSCodeBlock(text:
                """
                NavigationStack {
                    List { … }
                }
                .listStyle(.sidebar)   // every List in this stack uses .sidebar

                List { … }             // .bordered (nearest override wins)
                    .listStyle(.bordered)
                """)
        }
    }

    // MARK: Notes

    private struct LSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LSNote] = [
        .init(title: "Five styles on macOS, four iOS/watchOS-only.",
              detail: "macOS supports .automatic, .bordered, .inset, .plain, .sidebar. .grouped, .insetGrouped, .carousel, .elliptical fall back to the default style on macOS.",
              symbol: "list.bullet"),
        .init(title: ".sidebar pairs with NavigationSplitView's sidebar column.",
              detail: "Outside NavigationSplitView .sidebar still renders the translucent material and source-list row metrics, but loses window-chrome integration.",
              symbol: "sidebar.left"),
        .init(title: ".bordered draws the macOS-classic table outline.",
              detail: "Best for inspector panes and forms where the list is a content table, not a navigation source list.",
              symbol: "tablecells"),
        .init(title: ".inset tucks rows in from the leading edge.",
              detail: "Subtler than .bordered. Good for embedded lists inside cards or panels.",
              symbol: "rectangle.inset.filled"),
        .init(title: "Marker protocol — public conformance is impractical.",
              detail: "Required members are private SPI. You don't reference DefaultListStyle / SidebarListStyle / etc. directly — use the literal .automatic / .sidebar values which resolve to the appropriate conformer.",
              symbol: "lock")
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

// MARK: - Page-local demo helpers

private struct LSCard<Content: View>: View {
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct LSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

extension ListStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.listStyle",
        title: "ListStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "ListStyle",
            "View/listStyle(_:)"
        ],
        blurb: "A protocol that describes the behavior and appearance of a list. Conforming types include DefaultListStyle, BorderedListStyle, InsetListStyle, PlainListStyle, GroupedListStyle, InsetGroupedListStyle, and SidebarListStyle.",
        signature: "protocol ListStyle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-styles/liststyle.md",
        page: { AnyView(ListStyleGalleryPage()) }
    )
}

#Preview {
    ListStyleGalleryPage()
        .frame(width: 1200, height: 1200)
}
