import SwiftUI

// SwiftUI .toolbar(removing:) + ToolbarDefaultItemKind reference page.
// Sources:
//   Documentation/SwiftUI/toolbars/toolbar(removing:).md
//   Documentation/SwiftUI/toolbars/toolbardefaultitemkind.md
// macOS 14.0+. Use to remove a default toolbar item provided by another View
// (e.g. NavigationSplitView's sidebar toggle).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct ToolbarRemovingPage: View {
    @State private var searchQuery = ""

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
            Text("View/toolbar(removing:) + ToolbarDefaultItemKind")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Removes a toolbar item another View adds by default. Pair the modifier with a ToolbarDefaultItemKind value (.sidebarToggle, .search, .title).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbar(removing:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "Sidebar.toolbar(removing: .sidebarToggle)") {
            NavigationSplitView {
                Text("Sidebar")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar(removing: .sidebarToggle)
            } detail: {
                Text("Detail \u{2014} sidebar toggle removed from chrome")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".sidebarToggle \u{2014} drop the NavigationSplitView toggle button") {
                DemoFrame(api: ".toolbar(removing: .sidebarToggle)") {
                    NavigationSplitView {
                        Text("Sidebar")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(removing: .sidebarToggle)
                    } detail: {
                        Text("Detail (no sidebar toggle)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }

            VariantBlock(title: ".search \u{2014} drop the system-provided search item") {
                DemoFrame(api: ".toolbar(removing: .search)") {
                    NavigationStack {
                        Text(".searchable provided, but the toolbar search item is removed")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .searchable(text: $searchQuery)
                            .toolbar(removing: .search)
                    }
                }
            }

            VariantBlock(title: ".title \u{2014} drop the navigation title item") {
                DemoFrame(api: ".toolbar(removing: .title)") {
                    NavigationStack {
                        Text("navigationTitle set, but the title item is removed from the toolbar")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbar(removing: .title)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "ToolbarDefaultItemKind \u{2014} the kinds you can remove") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".sidebarToggle \u{2014} added by NavigationSplitView", systemImage: "sidebar.left")
                    Label(".search \u{2014} added by .searchable when hoisted to the toolbar", systemImage: "magnifyingglass")
                    Label(".title \u{2014} the navigation title item", systemImage: "textformat")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }

            VariantBlock(title: "Pass nil to no-op") {
                APICallout(".toolbar(removing: nil) \u{2014} no-op; useful for dynamic decisions")
                Text("The parameter is ToolbarDefaultItemKind?, so a nil value means \"don't remove anything\". Use this if a property determines whether to drop a default item.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Removes \u{2014} doesn't reposition.",
              detail: "If you want to keep the item but place it explicitly, use DefaultToolbarItem(kind:placement:) (macOS 26+) instead.",
              symbol: "arrow.triangle.swap"),
        .init(title: "Apply on the View that owns the default item.",
              detail: "For .sidebarToggle, the default item is contributed by NavigationSplitView's sidebar column \u{2014} put .toolbar(removing: .sidebarToggle) on the sidebar's root view.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Doc-author hook: surface ToolbarDefaultItemKind cases for your own Views.",
              detail: "Apple's docs note: \"Documentation on the View placing the default item should reference the ToolbarDefaultItemKind used to remove the item.\" If you build a reusable View that plants a default item, document the kind clients must pass to drop it.",
              symbol: "doc.text"),
        .init(title: "Three kinds today: .sidebarToggle, .search, .title.",
              detail: "Two are static type properties (.search, .title); .sidebarToggle is the canonical one shown in Apple's example.",
              symbol: "list.bullet")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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

#Preview {
    ToolbarRemovingPage()
        .frame(width: 1100, height: 900)
}
