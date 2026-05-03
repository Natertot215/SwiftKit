import SwiftUI

// SwiftUI `View/listItemTint(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listitemtint(_:).md
// Two overloads exist:
//   func listItemTint(_ tint: Color?) -> some View
//   func listItemTint(_ tint: ListItemTint?) -> some View
// On macOS sidebars: applied to Label icons, overriding the accent color.
// macOS 11.0+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 240

private struct TintFolder: Identifiable, Hashable {
    let name: String
    let symbol: String
    let tint: Color
    let id = UUID()
}

private let folders: [TintFolder] = [
    TintFolder(name: "Inbox",   symbol: "tray",                tint: .blue),
    TintFolder(name: "Drafts",  symbol: "doc.text",            tint: .orange),
    TintFolder(name: "Sent",    symbol: "paperplane",          tint: .green),
    TintFolder(name: "Junk",    symbol: "xmark.bin",           tint: .red),
    TintFolder(name: "Archive", symbol: "archivebox",          tint: .gray)
]

struct ListItemTintPage: View {
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
            Text("listItemTint(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a fixed tint color for content in a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listitemtint(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Label(...).listItemTint(folder.tint)") {
            List {
                ForEach(folders) { folder in
                    Label(folder.name, systemImage: folder.symbol)
                        .listItemTint(folder.tint)
                }
            }
            .listStyle(.sidebar)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Color overload — direct color tint") {
                DemoCard(api: ".listItemTint(.purple)") {
                    List {
                        ForEach(folders) { folder in
                            Label(folder.name, systemImage: folder.symbol)
                                .listItemTint(.purple)
                        }
                    }
                    .listStyle(.sidebar)
                }
            }

            VariantBlock(title: "ListItemTint enum — .fixed vs .preferred vs .monochrome") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".fixed(.blue)", api: ".listItemTint(.fixed(.blue))") {
                        List {
                            ForEach(folders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(.fixed(.blue))
                            }
                        }
                        .listStyle(.sidebar)
                    }
                    StateColumn(label: ".preferred(.green)", api: ".listItemTint(.preferred(.green))") {
                        List {
                            ForEach(folders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(.preferred(.green))
                            }
                        }
                        .listStyle(.sidebar)
                    }
                    StateColumn(label: ".monochrome", api: ".listItemTint(.monochrome)") {
                        List {
                            ForEach(folders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(.monochrome)
                            }
                        }
                        .listStyle(.sidebar)
                    }
                }
            }

            VariantBlock(title: "nil — inherit (don't override)") {
                DemoCard(api: ".listItemTint(nil)") {
                    List {
                        ForEach(folders) { folder in
                            Label(folder.name, systemImage: folder.symbol)
                                .listItemTint(nil as Color?)
                        }
                    }
                    .listStyle(.sidebar)
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — accent color (default) vs per-row tint") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "No tint (accent color)", api: "(no modifier)") {
                        List {
                            ForEach(folders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                            }
                        }
                        .listStyle(.sidebar)
                    }
                    StateColumn(label: "Per-row tint", api: ".listItemTint(folder.tint)") {
                        List {
                            ForEach(folders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(folder.tint)
                            }
                        }
                        .listStyle(.sidebar)
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
        .init(title: "Sidebar Labels are the typical surface on macOS.",
              detail: "On macOS .sidebar lists, .listItemTint replaces the accent color for the row's Label icon. On other styles it has no visible effect — the modifier compiles either way.",
              symbol: "sidebar.left"),
        .init(title: "Color overload is shorthand for .fixed(_:).",
              detail: "Per the doc note: .listItemTint(.purple) is equivalent to .listItemTint(.fixed(.purple)). Use the ListItemTint enum directly when you need .preferred (yields to higher-priority tinting) or .monochrome.",
              symbol: "switch.2"),
        .init(title: ".preferred yields to higher-priority context tints.",
              detail: ".fixed(_:) wins over context. .preferred(_:) is a hint — the list style and surrounding context can override it. Use .preferred when the row's tint is a default that other code may want to replace.",
              symbol: "paintpalette"),
        .init(title: "Pass nil to clear and inherit.",
              detail: "Color? and ListItemTint? both accept nil = no override; inherit from the surrounding context. Use this in conditional code paths that need to revert.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Per L-012, semantic accent is the default for sidebar icons.",
              detail: "Use .listItemTint when content semantically demands a fixed color (mailbox category color, calendar source). For 'I want this row to look interesting' — let the accent color drive it instead.",
              symbol: "exclamationmark.triangle")
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
                .frame(width: 220, height: demoFrameHeight)
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
    ListItemTintPage()
        .frame(width: 1100, height: 800)
}
