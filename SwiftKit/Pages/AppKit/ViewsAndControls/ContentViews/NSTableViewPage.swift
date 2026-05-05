import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSTableView (class, inherits NSControl) — a row/column view that
// displays records as rows and attributes as columns. Driven by
// NSTableViewDataSource (data) + NSTableViewDelegate (behavior).
// Source: Documentation/AppKit/views-and-controls/nstableview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSTableView with three
// columns (Name / Role / Status) and five rows of static data inside an
// NSScrollView. SwiftUI controls drive usesAlternatingRowBackgroundColors,
// gridStyleMask, style, and selectionHighlightStyle.

// MARK: - Static row model

private struct TableRow {
    let name: String
    let role: String
    let status: String
}

// MARK: - DataSource + Delegate

private final class TableCoordinator: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    let rows: [TableRow]

    init(rows: [TableRow]) {
        self.rows = rows
    }

    // MARK: NSTableViewDataSource

    func numberOfRows(in tableView: NSTableView) -> Int { rows.count }

    // MARK: NSTableViewDelegate (view-based)

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let column = tableColumn else { return nil }
        let identifier = NSUserInterfaceItemIdentifier("Cell-\(column.identifier.rawValue)")
        let view: NSTableCellView
        if let reused = tableView.makeView(withIdentifier: identifier, owner: nil) as? NSTableCellView {
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
        let r = rows[row]
        switch column.identifier.rawValue {
        case "name":   view.textField?.stringValue = r.name
        case "role":   view.textField?.stringValue = r.role
        case "status": view.textField?.stringValue = r.status
        default:       view.textField?.stringValue = ""
        }
        return view
    }
}

// MARK: - Bridge

private struct NSTableViewDemo: NSViewRepresentable {
    var alternatesRows: Bool
    var gridMask: NSTableView.GridLineStyle
    var style: NSTableView.Style

    func makeCoordinator() -> TableCoordinator {
        TableCoordinator(rows: [
            TableRow(name: "Aiko",     role: "Designer",  status: "Online"),
            TableRow(name: "Brendan",  role: "Engineer",  status: "Idle"),
            TableRow(name: "Chen",     role: "Manager",   status: "Online"),
            TableRow(name: "Dasha",    role: "Engineer",  status: "Offline"),
            TableRow(name: "Eli",      role: "Researcher", status: "Online")
        ])
    }

    func makeNSView(context: Context) -> NSScrollView {
        let table = NSTableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = context.coordinator
        table.delegate = context.coordinator
        table.usesAlternatingRowBackgroundColors = alternatesRows
        table.allowsColumnResizing = true
        table.allowsColumnReordering = true
        table.headerView = NSTableHeaderView()

        addColumn(to: table, id: "name",   title: "Name",   width: 120)
        addColumn(to: table, id: "role",   title: "Role",   width: 140)
        addColumn(to: table, id: "status", title: "Status", width: 100)

        let scroll = NSScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.hasVerticalScroller = true
        scroll.borderType = .lineBorder
        scroll.documentView = table
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let table = nsView.documentView as? NSTableView else { return }
        table.usesAlternatingRowBackgroundColors = alternatesRows
        table.gridStyleMask = gridMask
        table.style = style
    }

    private func addColumn(to table: NSTableView, id: String, title: String, width: CGFloat) {
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(id))
        column.title = title
        column.width = width
        column.minWidth = 60
        table.addTableColumn(column)
    }
}

// MARK: - Page

struct NSTableViewPage: View {
    @State private var alternatesRows: Bool = true
    @State private var gridMask: GridChoice = .none
    @State private var style: StyleChoice = .automatic

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
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSTableView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A set of related records, displayed in rows that represent individual records and columns that represent the attributes of those records.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nstableview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "Three columns, five rows of static data") {
            VStack(alignment: .leading, spacing: 12) {
                NSTableViewDemo(
                    alternatesRows: alternatesRows,
                    gridMask: gridMask.mask,
                    style: style.nsValue
                )
                .frame(height: 240)
                .frame(maxWidth: 560)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Toggle("usesAlternatingRowBackgroundColors", isOn: $alternatesRows).toggleStyle(.checkbox)

                HStack(spacing: 12) {
                    Picker("gridStyleMask", selection: $gridMask) {
                        ForEach(GridChoice.allCases) { Text($0.rawValue).tag($0) }
                    }
                    .pickerStyle(.segmented).fixedSize()
                }
                HStack(spacing: 12) {
                    Picker("style", selection: $style) {
                        ForEach(StyleChoice.allCases) { Text($0.rawValue).tag($0) }
                    }
                    .pickerStyle(.segmented).fixedSize()
                }

                APICallout("let table = NSTableView(); table.dataSource = ds; table.delegate = del; table.addTableColumn(column)")
                APICallout("// NSScrollView wraps the table: scroll.documentView = table — or use NSTableView.scrollableTableView()")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Columns") {
                snippet("""
                let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(\"name\"))
                column.title = \"Name\"
                column.width = 140; column.minWidth = 60; column.maxWidth = 320
                column.resizingMask = [.userResizingMask, .autoresizingMask]
                table.addTableColumn(column)
                table.tableColumns                          // -> [NSTableColumn]
                table.column(withIdentifier: column.identifier)
                """)
            }

            Block(title: "Style + look") {
                snippet("""
                table.style = .inset                        // .automatic, .fullWidth, .inset, .sourceList, .plain
                table.effectiveStyle                        // -> NSTableView.Style (the resolved value)
                table.usesAlternatingRowBackgroundColors = true
                table.gridStyleMask = [.solidHorizontalGridLineMask, .solidVerticalGridLineMask]
                table.gridColor = NSColor.gridColor
                table.intercellSpacing = NSSize(width: 4, height: 2)
                table.rowSizeStyle = .default               // .small, .medium, .large
                """)
            }

            Block(title: "Selection") {
                snippet("""
                table.allowsMultipleSelection = true
                table.allowsEmptySelection = true
                table.allowsColumnSelection = false
                // Sidebar / source-list look comes from table.style = .sourceList,
                // not from the deprecated SelectionHighlightStyle.sourceList.
                table.selectRowIndexes(IndexSet([0,2]), byExtendingSelection: false)
                table.selectedRow                            // -> Int (-1 if none)
                table.selectedRowIndexes                     // -> IndexSet
                """)
            }

            Block(title: "Header / corner views") {
                snippet("""
                table.headerView = NSTableHeaderView()       // nil hides headers
                table.cornerView = nil                       // top-right corner above scroller
                table.highlightedTableColumn                 // visual sort emphasis
                """)
            }

            Block(title: "Sorting") {
                snippet("""
                column.sortDescriptorPrototype = NSSortDescriptor(key: \"name\", ascending: true)
                table.sortDescriptors = [NSSortDescriptor(key: \"name\", ascending: true)]
                // Data source receives:
                func tableView(_ table: NSTableView, sortDescriptorsDidChange old: [NSSortDescriptor])
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Reload + animated updates") {
                snippet("""
                table.reloadData()
                table.reloadData(forRowIndexes: IndexSet([0]), columnIndexes: IndexSet([1]))
                table.beginUpdates()
                table.insertRows(at: IndexSet([0]), withAnimation: .effectFade)
                table.removeRows(at: IndexSet([3]), withAnimation: .slideUp)
                table.moveRow(at: 0, to: 1)
                table.endUpdates()
                table.noteHeightOfRows(withIndexesChanged: IndexSet([2]))
                """)
            }

            Block(title: "Hide and show rows (macOS 10.11+)") {
                snippet("""
                table.hideRows(at: IndexSet([0,2]), withAnimation: .slideUp)
                table.unhideRows(at: IndexSet([0,2]), withAnimation: .slideDown)
                table.hiddenRowIndexes                       // -> IndexSet
                """)
            }

            Block(title: "Scrolling") {
                snippet("""
                table.scrollRowToVisible(0)
                table.scrollColumnToVisible(2)
                table.usesAutomaticRowHeights = false        // true: each row sizes to content
                """)
            }

            Block(title: "Notifications") {
                snippet("""
                NSTableView.selectionDidChangeNotification
                NSTableView.selectionIsChangingNotification
                NSTableView.columnDidMoveNotification
                NSTableView.columnDidResizeNotification
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSControl. Always lives inside an NSScrollView — use NSTableView.scrollableTableView() for a pre-wired pair.")
            noteRow("link", "Driven by NSTableViewDataSource (numberOfRows(in:), objectValueFor:row:) and NSTableViewDelegate (viewFor:row:, sizing, selection policy). Apple does not recommend subclassing NSTableView.")
            noteRow("rectangle.center.inset.filled", "View-based tables (NSTableCellView returned from tableView(_:viewFor:row:)) are the modern path. Cell-based tables and NSCell-driven rendering are legacy.")
            noteRow("info.circle", "NSOutlineView inherits NSTableView — every API listed here is also available on outline views.")
            noteRow("bolt", "For macOS 11+, NSTableViewDiffableDataSource handles inserts/removes/moves with snapshots — no manual reloadData / beginUpdates / endUpdates choreography.")
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
    NSTableViewPage().frame(width: 1100, height: 900)
}
