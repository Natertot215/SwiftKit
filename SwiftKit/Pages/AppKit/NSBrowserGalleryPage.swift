import SwiftUI
import AppKit

struct NSBrowserGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: NSBrowser — live render

            VariantTile(
                name: "NSBrowser",
                api: "let browser = NSBrowser(); browser.delegate = …; browser.reloadColumn(0)",
                height: 200
            ) {
                NSBrowserRepresentable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            // MARK: Reference tiles

            ReferenceTile(
                name: "NSBrowserDelegate",
                signature: "protocol NSBrowserDelegate : NSObjectProtocol",
                note: "Supply each column's row count and cell content. Implement browser(_:numberOfRowsInColumn:) and browser(_:willDisplayCell:atRow:column:) for a cell-based browser, or the item-based equivalents for an item-based browser."
            )

            ReferenceTile(
                name: "NSBrowserCell",
                signature: "@MainActor class NSBrowserCell : NSCell",
                note: "The default cell type used to draw browser rows. Displays a text label and an optional branch arrow for expandable items. Swap the cell class via NSBrowser.setCellClass(_:)."
            )

            ReferenceTile(
                name: "NSBrowser.ColumnResizingType",
                signature: "enum NSBrowser.ColumnResizingType : UInt",
                note: "Controls column-resizing behavior: .noColumnResizing, .userColumnResizing, .autoColumnResizing. Set via browser.columnResizingType."
            )

            ReferenceTile(
                name: "NSBrowser.DropOperation",
                signature: "enum NSBrowser.DropOperation : UInt",
                note: "Specifies whether a drop targets a row (.on) or the gap between rows (.above). Return the appropriate case from browser(_:validateDrop:proposedRow:column:dropOperation:)."
            )
        }
    }
}

extension NSBrowserGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsBrowser.nsBrowser",
        title: "NSBrowser",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSBrowser", "NSBrowserDelegate", "NSBrowserCell", "NSBrowser.ColumnResizingType", "NSBrowser.DropOperation"],
        blurb: "An interface that displays a hierarchically organized list of data items that can be navigated and selected.",
        signature: "@MainActor class NSBrowser : NSControl",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nsbrowser.md",
        page: { AnyView(NSBrowserGalleryPage()) }
    )
}

// MARK: - NSViewRepresentable bridge

@MainActor
private final class BrowserDelegate: NSObject, NSBrowserDelegate {
    let columns: [[String]] = [
        ["Applications", "Developer", "Documents", "Downloads", "Library", "Music"],
        ["Xcode.app", "Instruments.app", "Simulator.app"],
        ["Xcode 16.3", "Xcode 15.4"]
    ]

    func browser(_ browser: NSBrowser, numberOfRowsInColumn column: Int) -> Int {
        guard column < columns.count else { return 0 }
        return columns[column].count
    }

    func browser(_ browser: NSBrowser, willDisplayCell cell: Any, atRow row: Int, column: Int) {
        guard let c = cell as? NSBrowserCell,
              column < columns.count,
              row < columns[column].count else { return }
        c.title = columns[column][row]
        c.isLeaf = column >= columns.count - 1
    }
}

private struct NSBrowserRepresentable: NSViewRepresentable {
    func makeCoordinator() -> BrowserDelegate { BrowserDelegate() }

    func makeNSView(context: Context) -> NSBrowser {
        let browser = NSBrowser()
        browser.delegate = context.coordinator
        browser.maxVisibleColumns = 3
        browser.separatesColumns = true
        browser.hasHorizontalScroller = false
        browser.autohidesScroller = true
        browser.reloadColumn(0)
        return browser
    }

    func updateNSView(_ nsView: NSBrowser, context: Context) {}
}
