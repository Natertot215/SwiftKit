import SwiftUI

// SwiftUI `View/listStyle(_:)` reference page (companion to ListPage).
// Source: Documentation/SwiftUI/view-styles/liststyle(_:).md
// macOS 10.15+. Five of the nine documented styles render on macOS:
// .automatic, .bordered, .inset, .plain, .sidebar. The remaining four
// (.grouped, .insetGrouped, .carousel, .elliptical) are iOS/watchOS-only.

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 240

private struct LSMItem: Identifiable, Hashable {
    let id: Int
    let name: String
    let symbol: String
}

private let items: [LSMItem] = [
    LSMItem(id: 0, name: "Inbox",   symbol: "tray"),
    LSMItem(id: 1, name: "Sent",    symbol: "paperplane"),
    LSMItem(id: 2, name: "Drafts",  symbol: "doc.text"),
    LSMItem(id: 3, name: "Archive", symbol: "archivebox"),
    LSMItem(id: 4, name: "Trash",   symbol: "trash")
]

struct ListStyleModifierPage: View {
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
            Text("View/listStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for lists within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/liststyle(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LSMCard(title: ".automatic", api: ".listStyle(.automatic)") {
            sampleList.listStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Five list styles render on macOS, applied to identical content.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                LSMCard(title: ".automatic", api: ".listStyle(.automatic)") {
                    sampleList.listStyle(.automatic)
                }
                LSMCard(title: ".bordered", api: ".listStyle(.bordered)") {
                    sampleList.listStyle(.bordered)
                }
                LSMCard(title: ".inset", api: ".listStyle(.inset)") {
                    sampleList.listStyle(.inset)
                }
                LSMCard(title: ".plain", api: ".listStyle(.plain)") {
                    sampleList.listStyle(.plain)
                }
                LSMCard(title: ".sidebar", api: ".listStyle(.sidebar)") {
                    sampleList.listStyle(.sidebar)
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

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Inheritance — outer .listStyle wins for inner Lists")
                .font(.headline)
            Text("Apply .listStyle(_:) at any container level. The nearest enclosing modifier reaches each List in the subtree.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LSMCodeBlock(text:
                """
                NavigationStack {
                    List { … }
                }
                .listStyle(.sidebar)   // every List in this stack uses .sidebar
                """)
        }
    }

    private struct LSMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LSMNote] = [
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
        .init(title: ".plain strips chrome — no separators or insets.",
              detail: "Use when you're providing your own row backgrounds. Full control, no defaults to fight.",
              symbol: "rectangle.dashed")
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

private struct LSMCard<Content: View>: View {
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
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct LSMCodeBlock: View {
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
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    ListStyleModifierPage()
        .frame(width: 1200, height: 1100)
}
