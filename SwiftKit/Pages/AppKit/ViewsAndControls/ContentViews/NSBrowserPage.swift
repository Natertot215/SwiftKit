import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSBrowser (class, inherits NSControl) — a column-based hierarchical
// browser. Each successive column shows the next level down in a tree, with
// rows drawn by NSBrowserCell instances supplied by an NSBrowserDelegate.
// Source: Documentation/AppKit/views-and-controls/nsbrowser.md
//
// Renderable demo: an NSViewRepresentable hosts an NSBrowser fed by a small
// static "Animals" tree (Mammals/Birds/Reptiles each with children). SwiftUI
// controls drive maxVisibleColumns, separatesColumns, allowsMultipleSelection,
// and allowsEmptySelection so the layout responses are visibly exercised.

// MARK: - Static tree model

private final class BrowserNode {
    let title: String
    let children: [BrowserNode]
    init(_ title: String, children: [BrowserNode] = []) {
        self.title = title
        self.children = children
    }
    var isLeaf: Bool { children.isEmpty }
}

// Coordinator is the NSBrowserDelegate. It walks a static tree by path —
// representedObject(forPath:) decodes the column path into a BrowserNode.
private final class BrowserCoordinator: NSObject, NSBrowserDelegate {
    let root: BrowserNode

    init(root: BrowserNode) {
        self.root = root
    }

    func rootItem(for browser: NSBrowser) -> Any? { root }

    func browser(_ browser: NSBrowser, numberOfChildrenOfItem item: Any?) -> Int {
        node(item).children.count
    }

    func browser(_ browser: NSBrowser, child index: Int, ofItem item: Any?) -> Any {
        node(item).children[index]
    }

    func browser(_ browser: NSBrowser, isLeafItem item: Any?) -> Bool {
        node(item).isLeaf
    }

    func browser(_ browser: NSBrowser, objectValueForItem item: Any?) -> Any? {
        node(item).title
    }

    private func node(_ item: Any?) -> BrowserNode {
        (item as? BrowserNode) ?? root
    }
}

// MARK: - Bridge

private struct NSBrowserDemo: NSViewRepresentable {
    var maxVisibleColumns: Int
    var separatesColumns: Bool
    var allowsMultiple: Bool
    var allowsEmpty: Bool

    func makeCoordinator() -> BrowserCoordinator {
        let mammals = BrowserNode("Mammals", children: [
            BrowserNode("Cat"), BrowserNode("Dog"), BrowserNode("Otter"), BrowserNode("Whale")
        ])
        let birds = BrowserNode("Birds", children: [
            BrowserNode("Falcon"), BrowserNode("Owl"), BrowserNode("Sparrow")
        ])
        let reptiles = BrowserNode("Reptiles", children: [
            BrowserNode("Gecko"), BrowserNode("Iguana"), BrowserNode("Tortoise")
        ])
        let root = BrowserNode("Animals", children: [mammals, birds, reptiles])
        return BrowserCoordinator(root: root)
    }

    func makeNSView(context: Context) -> NSBrowser {
        let browser = NSBrowser()
        browser.delegate = context.coordinator
        browser.translatesAutoresizingMaskIntoConstraints = false
        browser.hasHorizontalScroller = true
        browser.minColumnWidth = 140
        browser.loadColumnZero()
        return browser
    }

    func updateNSView(_ nsView: NSBrowser, context: Context) {
        nsView.maxVisibleColumns = maxVisibleColumns
        nsView.separatesColumns = separatesColumns
        nsView.allowsMultipleSelection = allowsMultiple
        nsView.allowsEmptySelection = allowsEmpty
    }
}

// MARK: - Page

struct NSBrowserPage: View {
    @State private var maxVisibleColumns: Int = 3
    @State private var separatesColumns: Bool = true
    @State private var allowsMultiple: Bool = false
    @State private var allowsEmpty: Bool = true

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
            Text("NSBrowser")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("An interface that displays a hierarchically organized list of data items that can be navigated and selected.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nsbrowser.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "delegate-driven Animals tree — click a row to descend") {
            VStack(alignment: .leading, spacing: 12) {
                NSBrowserDemo(
                    maxVisibleColumns: maxVisibleColumns,
                    separatesColumns: separatesColumns,
                    allowsMultiple: allowsMultiple,
                    allowsEmpty: allowsEmpty
                )
                .frame(height: 280)
                .frame(maxWidth: 560)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Stepper("maxVisibleColumns: \(maxVisibleColumns)", value: $maxVisibleColumns, in: 1...4)
                    Toggle("separatesColumns", isOn: $separatesColumns).toggleStyle(.checkbox)
                }
                HStack(spacing: 12) {
                    Toggle("allowsMultipleSelection", isOn: $allowsMultiple).toggleStyle(.checkbox)
                    Toggle("allowsEmptySelection", isOn: $allowsEmpty).toggleStyle(.checkbox)
                }

                APICallout("let browser = NSBrowser(); browser.delegate = self; browser.loadColumnZero()")
                APICallout("// NSBrowserDelegate: rootItem(for:), numberOfChildrenOfItem:, child:ofItem:, isLeafItem:, objectValueForItem:")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Configuring columns") {
                snippet("""
                browser.maxVisibleColumns = 3
                browser.minColumnWidth = 140
                browser.separatesColumns = true            // visible gutters between columns
                browser.takesTitleFromPreviousColumn = true
                browser.reusesColumns = true               // recycle column views as the user navigates
                browser.autohidesScroller = true
                """)
            }

            Block(title: "Column titles") {
                snippet("""
                browser.isTitled = true
                browser.title(ofColumn: 0)                 // -> String
                browser.setTitle(\"Categories\", ofColumn: 0)
                browser.titleHeight                        // -> CGFloat
                browser.titleFrame(ofColumn: 0)            // -> NSRect
                """)
            }

            Block(title: "Path API") {
                snippet("""
                browser.pathSeparator = \"/\"
                browser.path()                             // \"/Animals/Mammals/Otter\"
                browser.setPath(\"/Animals/Birds/Owl\")    // -> Bool, restores selection by path
                browser.path(toColumn: 1)                  // \"/Animals\"
                """)
            }

            Block(title: "Resizing") {
                snippet("""
                browser.columnResizingType = .userColumnResizing
                browser.prefersAllColumnUserResizing = false
                browser.width(ofColumn: 0)
                browser.setWidth(180, ofColumn: 0)
                browser.columnsAutosaveName = \"AnimalsBrowser\"
                """)
            }

            Block(title: "Action / events") {
                snippet("""
                browser.target = self
                browser.action = #selector(browserClicked(_:))
                browser.doubleAction = #selector(browserDoubleClicked(_:))
                browser.sendsActionOnArrowKeys = true
                browser.clickedRow                         // most recent click row
                browser.clickedColumn                      // most recent click column
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Selection") {
                snippet("""
                browser.allowsMultipleSelection = false
                browser.allowsEmptySelection = true
                browser.allowsBranchSelection = true       // allow non-leaf rows to be selected
                browser.allowsTypeSelect = true            // type-to-select
                browser.selectedCell(inColumn: 0)
                browser.selectedRow(inColumn: 0)
                browser.selectionIndexPath               // -> IndexPath?
                browser.selectionIndexPaths              // -> [IndexPath]
                browser.selectRowIndexes(IndexSet(integer: 2), inColumn: 1)
                """)
            }

            Block(title: "Reload / update") {
                snippet("""
                browser.loadColumnZero()                   // initial population
                browser.reloadColumn(1)                    // refetch from delegate for column 1
                browser.reloadData(forRowIndexes: IndexSet([0,2]), inColumn: 1)
                browser.validateVisibleColumns()
                browser.noteHeightOfRowsWithIndexesChanged(IndexSet(integer: 0), inColumn: 0)
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSControl. The visible control in the Browser View family; backed by NSBrowserCell rows and an NSBrowserDelegate for data + behavior.")
            noteRow("rectangle.split.3x1", "Each column is internally an NSScrollView wrapping an NSMatrix of NSBrowserCell instances. Most apps don't reach into that machinery.")
            noteRow("link", "Delegate-driven. Implement rootItem(for:), numberOfChildrenOfItem:, child:ofItem:, isLeafItem:, and objectValueForItem: at minimum for a navigable tree.")
            noteRow("info.circle", "Modern alternatives for a tree UI: NSOutlineView (single indented list) or SwiftUI's NavigationSplitView. Reach for NSBrowser when the Finder column-view metaphor is the point.")
            noteRow("clock", "macOS 10.0 vintage. The class is fully supported on macOS 26 — the feature set is stable rather than evolving.")
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
    NSBrowserPage().frame(width: 1100, height: 900)
}
