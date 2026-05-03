import SwiftUI

// SwiftUI `ListItemTint` (struct) reference page.
// Source: Documentation/SwiftUI/lists/listitemtint.md
// Three documented values:
//   .monochrome      — no chromatic tint, monochrome appearance
//   .fixed(_:)       — explicit color, wins over context
//   .preferred(_:)   — explicit color, yields to higher-priority context tinting
// Used as the argument to .listItemTint(_:). macOS 11.0+.

private let demoFrameWidth: CGFloat = 220
private let demoFrameHeight: CGFloat = 220

private struct TintTypeFolder: Identifiable, Hashable {
    let name: String
    let symbol: String
    let id = UUID()
}

private let folders: [TintTypeFolder] = [
    TintTypeFolder(name: "Inbox",   symbol: "tray"),
    TintTypeFolder(name: "Drafts",  symbol: "doc.text"),
    TintTypeFolder(name: "Sent",    symbol: "paperplane"),
    TintTypeFolder(name: "Archive", symbol: "archivebox")
]

struct ListItemTintTypePage: View {
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
            Text("ListItemTint")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A tint effect configuration that you can apply to content in a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listitemtint.md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".listItemTint(.fixed(.indigo))") {
            List {
                ForEach(folders) { folder in
                    Label(folder.name, systemImage: folder.symbol)
                        .listItemTint(.fixed(.indigo))
                }
            }
            .listStyle(.sidebar)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Three documented values — side by side") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".fixed(.blue)", api: ".listItemTint(.fixed(.blue))") {
                        sidebarList(tint: .fixed(.blue))
                    }
                    StateColumn(label: ".preferred(.orange)", api: ".listItemTint(.preferred(.orange))") {
                        sidebarList(tint: .preferred(.orange))
                    }
                    StateColumn(label: ".monochrome", api: ".listItemTint(.monochrome)") {
                        sidebarList(tint: .monochrome)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("ListItemTint is a value type with three named cases. There are no per-instance states — see the variants above.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "Used as the argument to .listItemTint(_:).",
              detail: "Two modifier overloads exist — one takes Color, the other takes ListItemTint. Use this struct's static members when you need .preferred or .monochrome behavior, not just a fixed color.",
              symbol: "function"),
        .init(title: ".fixed(_:) wins over context.",
              detail: "A fixed tint cannot be overridden by surrounding code. Use when the color carries semantic meaning (calendar source, mailbox category) that should never be replaced.",
              symbol: "lock"),
        .init(title: ".preferred(_:) yields to higher-priority tinting.",
              detail: "A preferred tint is a hint — the list style or other context can override it. Use when the color is a default but the surrounding context may know better.",
              symbol: "wand.and.rays"),
        .init(title: ".monochrome removes chromatic tinting entirely.",
              detail: "Useful when an icon should render in the secondary text style without color. Pairs with sidebar lists where some rows are 'system' (monochrome) and others are 'colored' (fixed).",
              symbol: "circle.lefthalf.filled")
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

    // MARK: Helpers

    private func sidebarList(tint: ListItemTint) -> some View {
        List {
            ForEach(folders) { folder in
                Label(folder.name, systemImage: folder.symbol)
                    .listItemTint(tint)
            }
        }
        .listStyle(.sidebar)
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
                .frame(width: 360, height: height)
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

#Preview {
    ListItemTintTypePage()
        .frame(width: 1100, height: 800)
}
