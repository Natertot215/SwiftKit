import SwiftUI
import AppKit

// AppKit Views and Controls / Content views — dense reference page.
// Covers: NSTableView (class : NSControl) and its full family:
//   NSTableColumn, NSTableViewRowAction, NSTableViewDataSource (protocol),
//   NSTableViewDelegate (protocol), NSTableViewDiffableDataSource (class),
//   NSTableCellView (class : NSView), NSTableRowView (class : NSView).
// Source: Documentation/AppKit/views-and-controls/nstableview.md
//
// Renderable demo: NSViewControllerRepresentable wraps an NSTableView
// inside an NSScrollView with three columns and five static rows.
// SwiftUI controls drive alternatingRows, gridStyleMask, style, and
// selectionHighlightStyle so the full configurable surface is exercised.

// MARK: - Data model

private struct TeamRow: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let status: String
}

private let sampleRows: [TeamRow] = [
    .init(name: "Aiko",    role: "Designer",    status: "Online"),
    .init(name: "Brendan", role: "Engineer",    status: "Idle"),
    .init(name: "Chen",    role: "Manager",     status: "Online"),
    .init(name: "Dasha",   role: "Engineer",    status: "Offline"),
    .init(name: "Eli",     role: "Researcher",  status: "Online"),
]

// MARK: - Coordinator (DataSource + Delegate)

private final class TableCoordinator: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    var rows: [TeamRow] = sampleRows

    // NSTableViewDataSource — required
    func numberOfRows(in tableView: NSTableView) -> Int { rows.count }

    // NSTableViewDelegate — view-based cell provider
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let column = tableColumn else { return nil }
        let identifier = NSUserInterfaceItemIdentifier("Cell-\(column.identifier.rawValue)")
        let cell: NSTableCellView
        if let reused = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
            cell = reused
        } else {
            cell = NSTableCellView()
            cell.identifier = identifier
            let field = NSTextField(labelWithString: "")
            field.translatesAutoresizingMaskIntoConstraints = false
            field.lineBreakMode = .byTruncatingTail
            cell.addSubview(field)
            cell.textField = field
            NSLayoutConstraint.activate([
                field.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 4),
                field.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -4),
                field.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            ])
        }
        let r = rows[row]
        switch column.identifier.rawValue {
        case "name":   cell.textField?.stringValue = r.name
        case "role":   cell.textField?.stringValue = r.role
        case "status": cell.textField?.stringValue = r.status
        default:       cell.textField?.stringValue = ""
        }
        return cell
    }
}

// MARK: - NSViewControllerRepresentable bridge

private struct NSTableViewDemo: NSViewControllerRepresentable {
    var alternatesRows: Bool
    var gridMask: NSTableView.GridLineStyle
    var style: NSTableView.Style

    func makeCoordinator() -> TableCoordinator { TableCoordinator() }

    func makeNSViewController(context: Context) -> NSViewController {
        let vc = NSViewController()
        let table = NSTableView()
        table.dataSource = context.coordinator
        table.delegate = context.coordinator
        table.allowsColumnResizing = true
        table.allowsColumnReordering = true
        table.headerView = NSTableHeaderView()

        for (id, title, width) in [("name", "Name", 120.0), ("role", "Role", 140.0), ("status", "Status", 100.0)] {
            let col = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(id))
            col.title = title
            col.width = width
            col.minWidth = 60
            table.addTableColumn(col)
        }

        let scroll = NSScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.hasVerticalScroller = true
        scroll.borderType = .lineBorder
        scroll.documentView = table
        vc.view = scroll
        return vc
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {
        guard let scroll = nsViewController.view as? NSScrollView,
              let table = scroll.documentView as? NSTableView else { return }
        table.usesAlternatingRowBackgroundColors = alternatesRows
        table.gridStyleMask = gridMask
        table.style = style
        table.reloadData()
    }
}

// MARK: - Page

struct NSTableViewPage: View {
    @State private var alternatesRows: Bool = true
    @State private var gridChoice: GridChoice = .none
    @State private var styleChoice: StyleChoice = .automatic

    enum GridChoice: String, CaseIterable, Identifiable {
        case none, horizontal, vertical, both
        var id: String { rawValue }
        var mask: NSTableView.GridLineStyle {
            switch self {
            case .none:       return []
            case .horizontal: return .solidHorizontalGridLineMask
            case .vertical:   return .solidVerticalGridLineMask
            case .both:       return [.solidHorizontalGridLineMask, .solidVerticalGridLineMask]
            }
        }
    }

    enum StyleChoice: String, CaseIterable, Identifiable {
        case automatic, fullWidth, inset, sourceList, plain
        var id: String { rawValue }
        var nsValue: NSTableView.Style {
            switch self {
            case .automatic:  return .automatic
            case .fullWidth:  return .fullWidth
            case .inset:      return .inset
            case .sourceList: return .sourceList
            case .plain:      return .plain
            }
        }
    }

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            referenceSection
        } states: {
            patternsSection
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSTableView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A set of related records displayed in rows (individual records) and columns (attributes). Driven by NSTableViewDataSource and NSTableViewDelegate.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nstableview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default demo

    private var defaultDemo: some View {
        Block(title: "Three columns, five rows — style + grid controls") {
            VStack(alignment: .leading, spacing: 12) {
                NSTableViewDemo(
                    alternatesRows: alternatesRows,
                    gridMask: gridChoice.mask,
                    style: styleChoice.nsValue
                )
                .frame(height: 200)
                .frame(maxWidth: 560)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Toggle("usesAlternatingRowBackgroundColors", isOn: $alternatesRows).toggleStyle(.checkbox)

                HStack(spacing: 12) {
                    Text("gridStyleMask").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $gridChoice) {
                        ForEach(GridChoice.allCases) { Text($0.rawValue).tag($0) }
                    }.labelsHidden().pickerStyle(.segmented).fixedSize()
                }
                HStack(spacing: 12) {
                    Text("style").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $styleChoice) {
                        ForEach(StyleChoice.allCases) { Text($0.rawValue).tag($0) }
                    }.labelsHidden().pickerStyle(.segmented).fixedSize()
                }

                APICallout("let table = NSTableView(); table.dataSource = ds; table.delegate = del")
                APICallout("let scroll = NSScrollView(); scroll.documentView = table")
            }
        }
    }

    // MARK: Reference section (Variants tab)

    @ViewBuilder
    private var referenceSection: some View {
        VStack(alignment: .leading, spacing: 24) {

            // NSTableColumn
            Block(title: "Reference — NSTableColumn") {
                snippet("""
                // class NSTableColumn : NSObject
                let col = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("name"))
                col.title = "Name"
                col.width = 140; col.minWidth = 60; col.maxWidth = 320
                col.resizingMask = [.userResizingMask, .autoresizingMask]
                col.sortDescriptorPrototype = NSSortDescriptor(key: "name", ascending: true)
                col.headerCell                             // NSTableHeaderCell
                table.addTableColumn(col)
                table.tableColumns                         // [NSTableColumn]
                table.column(withIdentifier: col.identifier)
                table.moveColumn(0, toColumn: 2)
                """)
            }

            // NSTableViewRowAction
            Block(title: "Reference — NSTableViewRowAction (macOS 10.11+)") {
                snippet("""
                // class NSTableViewRowAction : NSObject
                let action = NSTableViewRowAction(
                    style: .destructive,                   // .regular / .destructive
                    title: "Delete"
                ) { action, row in
                    // perform delete at row
                }
                action.backgroundColor = .systemRed        // semantic color token
                action.image = NSImage(systemSymbolName: "trash", accessibilityDescription: nil)
                // Return from delegate:
                func tableView(_ tv: NSTableView,
                               rowActionsForRow row: Int,
                               edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction]
                """)
            }

            // NSTableViewDataSource
            Block(title: "Reference — NSTableViewDataSource protocol") {
                snippet("""
                // protocol NSTableViewDataSource : NSObjectProtocol
                // Required:
                func numberOfRows(in tableView: NSTableView) -> Int

                // Optional (cell-based tables):
                func tableView(_ tv: NSTableView,
                               objectValueFor col: NSTableColumn?,
                               row: Int) -> Any?

                // Optional (drag-and-drop):
                func tableView(_ tv: NSTableView,
                               writeRowsWith rowIndexes: IndexSet,
                               to pboard: NSPasteboard) -> Bool
                func tableView(_ tv: NSTableView,
                               validateDrop info: NSDraggingInfo,
                               proposedRow row: Int,
                               proposedDropOperation op: NSTableView.DropOperation) -> NSDragOperation
                func tableView(_ tv: NSTableView, acceptDrop info: NSDraggingInfo,
                               row: Int, dropOperation op: NSTableView.DropOperation) -> Bool

                // Optional (sorting):
                func tableView(_ tv: NSTableView,
                               sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor])
                """)
            }

            // NSTableViewDelegate
            Block(title: "Reference — NSTableViewDelegate protocol") {
                snippet("""
                // protocol NSTableViewDelegate : NSControlTextEditingDelegate
                // View-based (modern):
                func tableView(_ tv: NSTableView,
                               viewFor col: NSTableColumn?,
                               row: Int) -> NSView?
                func tableView(_ tv: NSTableView, rowViewForRow row: Int) -> NSTableRowView?

                // Row sizing:
                func tableView(_ tv: NSTableView, heightOfRow row: Int) -> CGFloat

                // Selection policy:
                func tableView(_ tv: NSTableView, shouldSelectRow row: Int) -> Bool
                func tableView(_ tv: NSTableView,
                               selectionIndexesForProposedSelection proposed: IndexSet) -> IndexSet
                func tableViewSelectionDidChange(_ notification: Notification)

                // Appearance:
                func tableView(_ tv: NSTableView,
                               willDisplayCell cell: Any,
                               for col: NSTableColumn?,
                               row: Int)                  // cell-based legacy
                func tableView(_ tv: NSTableView,
                               isGroupRow row: Int) -> Bool
                """)
            }

            // NSTableViewDiffableDataSource
            Block(title: "Reference — NSTableViewDiffableDataSource (macOS 11+)") {
                snippet("""
                // class NSTableViewDiffableDataSource<SectionID, ItemID> : NSObject,
                //       NSTableViewDataSource
                //   where SectionID : Hashable, ItemID : Hashable
                let ds = NSTableViewDiffableDataSource<String, UUID>(tableView: table) {
                    tableView, column, row, itemID -> NSView? in
                    // return cell view
                }
                table.dataSource = ds

                // Apply changes via snapshot — no manual reloadData/beginUpdates:
                var snapshot = NSDiffableDataSourceSnapshot<String, UUID>()
                snapshot.appendSections(["main"])
                snapshot.appendItems(myItems.map { $0.id }, toSection: "main")
                ds.apply(snapshot, animatingDifferences: true)

                // Incremental update:
                var snap = ds.snapshot()
                snap.deleteItems([deletedID])
                snap.appendItems([newID], toSection: "main")
                ds.apply(snap, animatingDifferences: true)
                """)
            }
        }
    }

    // MARK: Patterns section (States tab)

    @ViewBuilder
    private var patternsSection: some View {
        VStack(alignment: .leading, spacing: 24) {

            // NSTableCellView + NSTableRowView
            Block(title: "NSTableCellView + NSTableRowView") {
                snippet("""
                // NSTableCellView — class : NSView  (macOS 10.7+)
                // Container for one cell's content in view-based tables.
                // Key outlets: textField (NSTextField?), imageView (NSImageView?)
                func tableView(_ tv: NSTableView, viewFor col: NSTableColumn?, row: Int) -> NSView? {
                    let id = NSUserInterfaceItemIdentifier("MyCellID")
                    if let cell = tv.makeView(withIdentifier: id, owner: nil) as? NSTableCellView {
                        cell.textField?.stringValue = data[row].name
                        return cell
                    }
                    let cell = NSTableCellView()
                    cell.identifier = id
                    // … add textField, imageView, configure layout …
                    return cell
                }

                // NSTableRowView — class : NSView  (macOS 10.7+)
                // Manages the entire row background and selection chrome.
                func tableView(_ tv: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
                    let rv = NSTableRowView()
                    // rv.backgroundColor — set to NSColor.windowBackgroundColor or leave nil
                    return rv
                }
                // Override draw methods for custom row background / selection:
                // override func drawBackground(in dirtyRect: NSRect)
                // override func drawSelection(in dirtyRect: NSRect)
                """)
            }

            // DataSource vs DiffableDataSource
            Block(title: "Data Source Pattern — classic vs. diffable") {
                snippet("""
                // Classic NSTableViewDataSource:
                // • implement numberOfRows(in:) + objectValueFor:row: (or viewFor:row: via delegate)
                // • call table.reloadData() to refresh all rows
                // • use table.beginUpdates() / insertRows / removeRows / endUpdates() for animation

                // NSTableViewDiffableDataSource (macOS 11+):
                // • NSDiffableDataSourceSnapshot drives all mutations
                // • ds.apply(snapshot, animatingDifferences: true) handles inserts/deletes/moves
                // • No reloadData, no beginUpdates/endUpdates — the snapshot IS the source of truth
                // • ItemID must be Hashable; stable identity avoids full reloads
                """)
            }

            // Delegate hooks
            Block(title: "Delegate Hooks") {
                snippet("""
                // Variable row height:
                func tableView(_ tv: NSTableView, heightOfRow row: Int) -> CGFloat {
                    return data[row].isExpanded ? 64 : 28
                }
                table.noteHeightOfRows(withIndexesChanged: IndexSet([changedRow]))

                // Row actions (trailing swipe):
                func tableView(_ tv: NSTableView,
                               rowActionsForRow row: Int,
                               edge: NSTableView.RowActionEdge) -> [NSTableViewRowAction] {
                    guard edge == .trailing else { return [] }
                    return [NSTableViewRowAction(style: .destructive, title: "Delete") { _, _ in … }]
                }

                // Group rows (non-selectable section headers):
                func tableView(_ tv: NSTableView, isGroupRow row: Int) -> Bool {
                    return data[row].isSection
                }
                """)
            }

            // Sort descriptors
            Block(title: "Sort Descriptors") {
                snippet("""
                // Attach a sort descriptor prototype to each column:
                nameColumn.sortDescriptorPrototype = NSSortDescriptor(key: "name", ascending: true)
                roleColumn.sortDescriptorPrototype = NSSortDescriptor(key: "role", ascending: true)

                // Receive in data source:
                func tableView(_ tv: NSTableView,
                               sortDescriptorsDidChange old: [NSSortDescriptor]) {
                    data.sort(using: tv.sortDescriptors)
                    tv.reloadData()
                }

                // Programmatic initial sort:
                table.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
                """)
            }

            // Selection
            Block(title: "Selection") {
                snippet("""
                table.allowsMultipleSelection = true
                table.allowsEmptySelection = true
                table.allowsColumnSelection = false

                // Sidebar / source-list selection chrome:
                // table.style = .sourceList   ← preferred over deprecated SelectionHighlightStyle.sourceList

                // Programmatic selection:
                table.selectRowIndexes(IndexSet([0, 2]), byExtendingSelection: false)
                table.deselectAll(nil)
                table.selectedRow                          // Int (-1 if none)
                table.selectedRowIndexes                   // IndexSet

                // Respond in delegate:
                func tableViewSelectionDidChange(_ notification: Notification) {
                    let selected = table.selectedRowIndexes
                }

                // Notifications:
                // NSTableView.selectionDidChangeNotification
                // NSTableView.selectionIsChangingNotification
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "NSTableView inherits NSControl. It must always live inside an NSScrollView — use NSTableView.scrollableTableView() for a pre-wired pair, or wrap manually via scroll.documentView = table.")
            noteRow("arrow.triangle.branch", "View-based tables (NSTableCellView from tableView(_:viewFor:row:)) are the modern path. Cell-based tables (NSCell-driven tableView(_:objectValueFor:row:)) are legacy — avoid for new code.")
            noteRow("bolt", "NSTableViewDiffableDataSource (macOS 11+) replaces manual reloadData / beginUpdates / endUpdates choreography. Use NSDiffableDataSourceSnapshot.apply(_:animatingDifferences:) for all mutations.")
            noteRow("rectangle.3.group", "NSOutlineView subclasses NSTableView — every API documented here is available on outline views too.")
            noteRow("paintbrush", "Row style controls selection chrome. table.style = .sourceList produces the sidebar look. The deprecated SelectionHighlightStyle.sourceList predates the style API — don't use it.")
            noteRow("square.and.arrow.down", "NSTableViewRowAction requires NSTableViewDelegate.tableView(_:rowActionsForRow:edge:). Only the trailing edge is guaranteed on macOS — check the edge parameter before returning actions.")
        }
    }

    // MARK: Helpers

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
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

// MARK: - Block helper

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
    NSTableViewPage().frame(width: 1100, height: 900)
}
