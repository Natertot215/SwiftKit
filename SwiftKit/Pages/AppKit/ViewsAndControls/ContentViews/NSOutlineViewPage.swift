import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSOutlineView (class, inherits NSTableView) — a row/column view that
// displays hierarchical data with indentation and disclosure triangles. Driven
// by NSOutlineViewDataSource (data) + NSOutlineViewDelegate (behavior).
// Source: Documentation/AppKit/views-and-controls/nsoutlineview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSOutlineView fed by a
// small static "Library" tree (Music/Movies/Books each with children) inside
// an NSScrollView. SwiftUI controls drive indentationPerLevel,
// indentationMarkerFollowsCell, autoresizesOutlineColumn, and floatsGroupRows.

// MARK: - Static tree model

private final class OutlineNode {
    let title: String
    let children: [OutlineNode]
    init(_ title: String, children: [OutlineNode] = []) {
        self.title = title
        self.children = children
    }
    var isExpandable: Bool { !children.isEmpty }
}

// MARK: - DataSource + Delegate

private final class OutlineCoordinator: NSObject, NSOutlineViewDataSource, NSOutlineViewDelegate {
    let root: OutlineNode

    init(root: OutlineNode) {
        self.root = root
    }

    // MARK: NSOutlineViewDataSource

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        node(item).children.count
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        node(item).children[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        (item as? OutlineNode)?.isExpandable ?? false
    }

    func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any? {
        node(item).title
    }

    // MARK: NSOutlineViewDelegate (view-based)

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier("OutlineCell")
        let view: NSTableCellView
        if let reused = outlineView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
            view = reused
        } else {
            view = NSTableCellView()
            view.identifier = identifier
            let field = NSTextField(labelWithString: "")
            field.translatesAutoresizingMaskIntoConstraints = false
            field.lineBreakMode = .byTruncatingTail
            view.addSubview(field)
            view.textField = field
            NSLayoutConstraint.activate([
                field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
                field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
                field.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
        if let node = item as? OutlineNode {
            view.textField?.stringValue = node.title
            view.textField?.font = node.isExpandable
                ? NSFont.preferredFont(forTextStyle: .body).withSymbolicTraits(.bold)
                : NSFont.preferredFont(forTextStyle: .body)
        }
        return view
    }

    private func node(_ item: Any?) -> OutlineNode {
        (item as? OutlineNode) ?? root
    }
}

private extension NSFont {
    func withSymbolicTraits(_ traits: NSFontDescriptor.SymbolicTraits) -> NSFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return NSFont(descriptor: descriptor, size: pointSize) ?? self
    }
}

// MARK: - Bridge

private struct NSOutlineViewDemo: NSViewRepresentable {
    var indentationPerLevel: CGFloat
    var indentationMarkerFollowsCell: Bool
    var autoresizesOutlineColumn: Bool
    var floatsGroupRows: Bool

    func makeCoordinator() -> OutlineCoordinator {
        let music = OutlineNode("Music", children: [
            OutlineNode("Albums"), OutlineNode("Artists"), OutlineNode("Playlists")
        ])
        let movies = OutlineNode("Movies", children: [
            OutlineNode("Recently Added"), OutlineNode("Genres")
        ])
        let books = OutlineNode("Books", children: [
            OutlineNode("Currently Reading"), OutlineNode("Want to Read"), OutlineNode("Finished")
        ])
        let root = OutlineNode("Library", children: [music, movies, books])
        return OutlineCoordinator(root: root)
    }

    func makeNSView(context: Context) -> NSScrollView {
        let outline = NSOutlineView()
        outline.translatesAutoresizingMaskIntoConstraints = false
        outline.style = .plain
        outline.headerView = nil
        outline.usesAlternatingRowBackgroundColors = false
        outline.dataSource = context.coordinator
        outline.delegate = context.coordinator

        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Title"))
        column.title = "Title"
        column.minWidth = 120
        column.width = 240
        outline.addTableColumn(column)
        outline.outlineTableColumn = column

        let scroll = NSScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.hasVerticalScroller = true
        scroll.documentView = outline
        scroll.borderType = .lineBorder

        outline.expandItem(nil, expandChildren: true)
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let outline = nsView.documentView as? NSOutlineView else { return }
        outline.indentationPerLevel = indentationPerLevel
        outline.indentationMarkerFollowsCell = indentationMarkerFollowsCell
        outline.autoresizesOutlineColumn = autoresizesOutlineColumn
        outline.floatsGroupRows = floatsGroupRows
    }
}

// MARK: - Page

struct NSOutlineViewPage: View {
    @State private var indentationPerLevel: CGFloat = 16
    @State private var indentationMarkerFollowsCell: Bool = true
    @State private var autoresizesOutlineColumn: Bool = true
    @State private var floatsGroupRows: Bool = false

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
            Text("NSOutlineView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that uses a row-and-column format to display hierarchical data, with disclosure triangles for expand and collapse.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSTableView \u{00b7} Documentation/AppKit/views-and-controls/nsoutlineview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "Library tree — disclosure triangles, indentation, view-based rows") {
            VStack(alignment: .leading, spacing: 12) {
                NSOutlineViewDemo(
                    indentationPerLevel: indentationPerLevel,
                    indentationMarkerFollowsCell: indentationMarkerFollowsCell,
                    autoresizesOutlineColumn: autoresizesOutlineColumn,
                    floatsGroupRows: floatsGroupRows
                )
                .frame(height: 300)
                .frame(maxWidth: 480)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Stepper("indentationPerLevel: \(Int(indentationPerLevel))", value: $indentationPerLevel, in: 0...40, step: 2)
                }
                HStack(spacing: 12) {
                    Toggle("indentationMarkerFollowsCell", isOn: $indentationMarkerFollowsCell).toggleStyle(.checkbox)
                    Toggle("autoresizesOutlineColumn", isOn: $autoresizesOutlineColumn).toggleStyle(.checkbox)
                    Toggle("floatsGroupRows", isOn: $floatsGroupRows).toggleStyle(.checkbox)
                }

                APICallout("let outline = NSOutlineView(); outline.dataSource = ds; outline.delegate = del; outline.outlineTableColumn = column")
                APICallout("// NSScrollView wraps the outline view: scroll.documentView = outline")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Outline column + indentation") {
                snippet("""
                outline.outlineTableColumn = column          // column that draws disclosure triangles
                outline.indentationPerLevel = 16             // points of indent per depth level
                outline.indentationMarkerFollowsCell = true  // triangle moves with indented row
                outline.autoresizesOutlineColumn = true      // outline column reflows on expand
                outline.level(forItem: item)                 // -> Int (depth)
                outline.level(forRow: 3)                     // -> Int
                """)
            }

            Block(title: "Expand / collapse") {
                snippet("""
                outline.isExpandable(item)
                outline.isItemExpanded(item)
                outline.expandItem(item)
                outline.expandItem(item, expandChildren: true)
                outline.collapseItem(item)
                outline.collapseItem(item, collapseChildren: true)
                outline.autosaveExpandedItems = true         // remember expansion across launches
                """)
            }

            Block(title: "Items / rows mapping") {
                snippet("""
                outline.item(atRow: 3)                       // -> Any?
                outline.row(forItem: item)                   // -> Int
                outline.parent(forItem: item)                // -> Any?
                outline.child(0, ofItem: item)               // -> Any?
                outline.numberOfChildren(ofItem: item)       // -> Int
                outline.childIndex(forItem: item)            // -> Int
                """)
            }

            Block(title: "Reload / animate updates") {
                snippet("""
                outline.reloadData()
                outline.reloadItem(item)
                outline.reloadItem(item, reloadChildren: true)
                outline.insertItems(at: IndexSet(integer: 0), inParent: item, withAnimation: .effectFade)
                outline.removeItems(at: IndexSet(integer: 2), inParent: item, withAnimation: .slideUp)
                outline.moveItem(at: 0, inParent: item, to: 1, inParent: item)
                """)
            }

            Block(title: "Inherited from NSTableView") {
                snippet("""
                // Selection, sorting, group rows, alternating backgrounds —
                // all from NSTableView and work identically:
                outline.allowsMultipleSelection = false
                outline.usesAlternatingRowBackgroundColors = true
                outline.style = .sourceList               // sidebar look
                outline.floatsGroupRows = true
                outline.sortDescriptors = [NSSortDescriptor(key: \"title\", ascending: true)]
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Notifications") {
                snippet("""
                NSOutlineView.itemWillExpandNotification
                NSOutlineView.itemDidExpandNotification
                NSOutlineView.itemWillCollapseNotification
                NSOutlineView.itemDidCollapseNotification
                NSOutlineView.selectionDidChangeNotification
                NSOutlineView.columnDidMoveNotification
                NSOutlineView.columnDidResizeNotification
                """)
            }

            Block(title: "Drag-and-drop hooks") {
                snippet("""
                outline.setDropItem(item, dropChildIndex: 0)
                outline.shouldCollapseAutoExpandedItems(forDeposited: true)

                // On the data source:
                func outlineView(_ outline: NSOutlineView,
                                 validateDrop info: NSDraggingInfo,
                                 proposedItem item: Any?,
                                 proposedChildIndex index: Int) -> NSDragOperation
                func outlineView(_ outline: NSOutlineView,
                                 acceptDrop info: NSDraggingInfo,
                                 item: Any?, childIndex: Int) -> Bool
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSTableView. Adds disclosure triangles, indentation per level, expand/collapse, and an outline column on top of the row/column rendering surface.")
            noteRow("link", "Driven by NSOutlineViewDataSource (tree shape) + NSOutlineViewDelegate (per-row view + behavior). Apple does not recommend subclassing NSOutlineView itself.")
            noteRow("rectangle.center.inset.filled", "Always live inside an NSScrollView — the outline expects vertical scrolling. The renderable demo wires that up via scroll.documentView = outline.")
            noteRow("info.circle", "Each item must keep stable identity across reloads (pointer or NSObject.isEqual sameness) — otherwise expand/collapse state and selection cannot be preserved.")
            noteRow("clock", "View-based rows (NSTableCellView returned from outlineView(_:viewFor:item:)) are the modern path. Cell-based outlines and NSMatrix-era APIs are legacy.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSOutlineViewPage().frame(width: 1100, height: 900)
}
