import SwiftUI

// SwiftUI `DefaultToolbarItem` reference page.
// Source: Documentation/SwiftUI/toolbars/defaulttoolbaritem.md
// macOS 26.0+. Place this in your toolbar to control where a system-provided
// item (like search) is positioned. init(kind:placement:).

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct DefaultToolbarItemPage: View {
    @State private var query = ""

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
            Text("DefaultToolbarItem")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A toolbar item that represents a system component. Use it to control where a system-provided item (e.g. search, sidebar toggle, title) appears.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/defaulttoolbaritem.md \u{00b7} macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "DefaultToolbarItem(kind: .search, placement: .primaryAction)") {
            NavigationStack {
                Text("System-provided search item, placed via DefaultToolbarItem")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .searchable(text: $query)
                    .toolbar {
                        DefaultToolbarItem(kind: .search, placement: .primaryAction)
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "kind: .search \u{2014} explicitly position the .searchable field") {
                DemoFrame(api: "DefaultToolbarItem(kind: .search, placement: .primaryAction)") {
                    NavigationStack {
                        Text("query = \"\(query)\"")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .searchable(text: $query)
                            .toolbar {
                                DefaultToolbarItem(kind: .search, placement: .primaryAction)
                            }
                    }
                }
            }

            VariantBlock(title: "kind: .title \u{2014} position the navigation title item") {
                DemoFrame(api: "DefaultToolbarItem(kind: .title, placement: .principal)") {
                    NavigationStack {
                        Text("Title placed via DefaultToolbarItem")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .navigationTitle("Document")
                            .toolbar {
                                DefaultToolbarItem(kind: .title, placement: .principal)
                            }
                    }
                }
            }

            VariantBlock(title: "kind: .sidebarToggle \u{2014} position the NavigationSplitView toggle") {
                DemoFrame(api: "DefaultToolbarItem(kind: .sidebarToggle, placement: .navigation)") {
                    NavigationSplitView {
                        Text("Sidebar")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } detail: {
                        Text("Detail \u{2014} sidebar toggle pinned to .navigation")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                DefaultToolbarItem(kind: .sidebarToggle, placement: .navigation)
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Why this exists") {
                Text("Without DefaultToolbarItem, a system-provided item like the .searchable field is placed at the system default location. By inserting a DefaultToolbarItem of the matching kind in your .toolbar { } closure, you control its order relative to your custom items.")
                    .font(.callout)
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
        .init(title: "macOS 26+ only.",
              detail: "Earlier macOS releases position system-provided items at fixed slots; you couldn't reorder them around your custom items.",
              symbol: "calendar"),
        .init(title: "Use ToolbarDefaultItemKind for the kind: argument.",
              detail: "Currently exposed kinds: .search, .title, .sidebarToggle. (Same enum used by .toolbar(removing:).) Pair the kind with the appropriate ToolbarItemPlacement.",
              symbol: "tag"),
        .init(title: "Conforms to ToolbarContent (not Customizable).",
              detail: "Lives in .toolbar { } but does not surface in .toolbar(id:) Customize\u{2026} panel as a user-rearrangeable item.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Pairs with .toolbar(removing:) when you want to omit, not reposition.",
              detail: "Use .toolbar(removing: .sidebarToggle) to delete the default item entirely; use DefaultToolbarItem(kind: .sidebarToggle, placement: \u{2026}) to keep it but choose its slot.",
              symbol: "arrow.triangle.swap")
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
    DefaultToolbarItemPage()
        .frame(width: 1100, height: 900)
}
