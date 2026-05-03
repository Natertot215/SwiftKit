import SwiftUI

/// Sidebar for SwiftKit's 2-column NavigationSplitView shell.
///
/// 3-tier disclosure shape (Nathan 2026-05-02 terminology):
///   toggle heading (Reference / SwiftUI / AppKit)
///     → label/folder (Modal presentations / Images / Controls / …)
///       → item (the leaves)
///
/// Selection chrome is the `List(.sidebar)` framework default — rounded-rect fill in
/// `NSColor.unemphasizedSelectedContentBackgroundColor` + accent text + accent icon. Per L-012,
/// do NOT add `.listRowBackground`, `.background`, `.tint`, custom row containers, or any chrome
/// painting — the framework handles it correctly when nothing overrides it.
///
/// AppKit's `Subheading` catalog tier flattens into the parent Folder's item list — it is not
/// surfaced as a 4th disclosure level, per the 2026-05-02 architecture decision.
struct SidebarView: View {
    @Binding var selection: CatalogNode.ID?

    var body: some View {
        List(selection: $selection) {
            ForEach(GalleryCatalog.allNodes, id: \.id) { node in
                SidebarNodeRow(node: node, selection: selection)
            }
        }
        .listStyle(.sidebar)
        .navigationSplitViewColumnWidth(min: 240, ideal: 280, max: 360)
    }
}

private struct SidebarNodeRow: View {
    let node: CatalogNode
    let selection: CatalogNode.ID?

    private var isSelected: Bool { node.id == selection }

    var body: some View {
        switch node {
        case .section(let section):
            DisclosureGroup {
                ForEach(section.children, id: \.id) { child in
                    SidebarNodeRow(node: child, selection: selection)
                }
            } label: {
                rowLabel(title: section.title, systemImage: section.symbolName ?? "folder")
                    .tag(node.id)
            }

        case .folder(let folder):
            DisclosureGroup {
                ForEach(folder.children, id: \.id) { child in
                    SidebarNodeRow(node: child, selection: selection)
                }
            } label: {
                rowLabel(title: folder.title, systemImage: folder.symbolName)
                    .tag(node.id)
            }

        case .subheading(let subheading):
            ForEach(subheading.children, id: \.id) { child in
                SidebarNodeRow(node: child, selection: selection)
            }

        case .leaf(let leaf):
            rowLabel(title: leaf.displayName, systemImage: leafSymbolName(for: leaf))
                .tag(node.id)
        }
    }

    /// Simplest form — `Label(_, systemImage:)` with no per-element styling. Selection chrome
    /// (background + foreground colors) comes from the framework. If accent text/icon coloring
    /// is needed, it has to come back via a different mechanism (separate from rowLabel) — the
    /// explicit Label builder + foregroundStyle was breaking click-to-select on macOS 26.
    private func rowLabel(title: String, systemImage: String) -> some View {
        Label(title, systemImage: systemImage)
            .lineLimit(1)
            .truncationMode(.middle)
    }

    private func leafSymbolName(for leaf: Leaf) -> String {
        switch leaf.framework {
        case .swiftUI: return "swift"
        case .appKit:  return "square.grid.2x2"
        }
    }
}

