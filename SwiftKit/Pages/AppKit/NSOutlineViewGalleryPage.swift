import SwiftUI
import AppKit

struct NSOutlineViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: NSOutlineView — live render

            VariantTile(
                name: "NSOutlineView",
                api: "let outline = NSOutlineView(); outline.dataSource = …; outline.delegate = …",
                height: 200
            ) {
                NSOutlineViewRepresentable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            // MARK: Reference tiles

            ReferenceTile(
                name: "NSOutlineViewDataSource",
                signature: "protocol NSOutlineViewDataSource : NSObjectProtocol",
                note: "Supply the outline view's data — return child count, child items, and expandability. outlineView(_:numberOfChildrenOfItem:) and outlineView(_:child:ofItem:) are the minimum required methods."
            )

            ReferenceTile(
                name: "NSOutlineViewDelegate",
                signature: "protocol NSOutlineViewDelegate : NSTableViewDelegate",
                note: "Optional customization of cells, row heights, and selection behavior. Implement outlineView(_:viewFor:item:) to return the cell view for each column and item."
            )
        }
    }
}

extension NSOutlineViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsOutlineView.nsOutlineView",
        title: "NSOutlineView",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSOutlineView", "NSOutlineViewDataSource", "NSOutlineViewDelegate"],
        blurb: "A view that uses a row-and-column format to display hierarchical data like directories and files that can be expanded and collapsed.",
        signature: "@MainActor class NSOutlineView : NSTableView",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nsoutlineview.md",
        page: { AnyView(NSOutlineViewGalleryPage()) }
    )
}

// MARK: - NSViewRepresentable bridge

@MainActor
private final class OutlineDataSource: NSObject, NSOutlineViewDataSource, NSOutlineViewDelegate {
    let roots: [String] = ["Applications", "Documents", "Downloads", "Music", "Pictures"]
    let children: [String: [String]] = [
        "Applications": ["Xcode.app", "Safari.app", "Notes.app"],
        "Documents":    ["Resume.pdf", "Notes.txt"],
        "Music":        ["Favorites.m3u"]
    ]

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        guard let key = item as? String else { return roots.count }
        return children[key]?.count ?? 0
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        guard let key = item as? String, let kids = children[key] else { return roots[index] }
        return kids[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        guard let key = item as? String else { return false }
        return !(children[key]?.isEmpty ?? true)
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let label = NSTextField(labelWithString: (item as? String) ?? "")
        label.font = .systemFont(ofSize: NSFont.systemFontSize)
        return label
    }
}

private struct NSOutlineViewRepresentable: NSViewRepresentable {
    func makeCoordinator() -> OutlineDataSource { OutlineDataSource() }

    func makeNSView(context: Context) -> NSScrollView {
        let outline = NSOutlineView()
        outline.headerView = nil

        let col = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("main"))
        col.title = "Name"
        outline.addTableColumn(col)
        outline.outlineTableColumn = col

        outline.dataSource = context.coordinator
        outline.delegate = context.coordinator
        outline.indentationPerLevel = 14
        outline.rowHeight = 22
        outline.reloadData()

        let scroll = NSScrollView()
        scroll.documentView = outline
        scroll.hasVerticalScroller = true
        scroll.autohidesScrollers = true
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {}
}
