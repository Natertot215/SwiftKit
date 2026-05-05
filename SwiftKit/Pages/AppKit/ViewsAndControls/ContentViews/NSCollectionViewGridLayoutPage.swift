import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSCollectionViewGridLayout (class, inherits NSCollectionViewLayout)
// — a single-section grid layout that exposes maximumNumberOfRows / maximum
// NumberOfColumns and minimum/maximum item size. Provides the legacy "old
// NSCollectionView" appearance while still benefiting from modern CV features.
// Supplementary and decoration views are NOT supported by the grid layout.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewgridlayout.md

private final class GridTileItem: NSCollectionViewItem {
    private let label = NSTextField(labelWithString: "")

    override func loadView() {
        let root = NSView()
        root.wantsLayer = true
        root.layer?.cornerRadius = 6
        root.layer?.backgroundColor = NSColor.controlAccentColor
            .withAlphaComponent(0.30).cgColor
        root.layer?.borderWidth = 1
        root.layer?.borderColor = NSColor.separatorColor.cgColor

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: NSFont.systemFontSize, weight: .semibold)
        label.textColor = .labelColor
        label.alignment = .center
        root.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: root.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: root.centerYAnchor)
        ])
        self.view = root
    }

    func configure(_ index: Int) { label.stringValue = "\(index + 1)" }
}

private final class GridDataSource: NSObject, NSCollectionViewDataSource {
    var count: Int = 12
    func collectionView(_ cv: NSCollectionView, numberOfItemsInSection s: Int) -> Int { count }
    func collectionView(_ cv: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let it = cv.makeItem(withIdentifier: .gridTile, for: indexPath) as! GridTileItem
        it.configure(indexPath.item)
        return it
    }
}

private extension NSUserInterfaceItemIdentifier {
    static let gridTile = NSUserInterfaceItemIdentifier("GridTile")
}

private struct GridDemo: NSViewRepresentable {
    var maxColumns: Int
    var maxRows: Int
    var count: Int
    var minItemSize: CGFloat
    var maxItemSize: CGFloat

    func makeCoordinator() -> GridDataSource { GridDataSource() }

    func makeNSView(context: Context) -> NSScrollView {
        let layout = NSCollectionViewGridLayout()
        let cv = NSCollectionView()
        cv.collectionViewLayout = layout
        cv.dataSource = context.coordinator
        cv.isSelectable = true
        cv.backgroundColors = [.clear]
        cv.register(GridTileItem.self, forItemWithIdentifier: .gridTile)

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.drawsBackground = false
        scroll.documentView = cv
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let cv = nsView.documentView as? NSCollectionView,
              let layout = cv.collectionViewLayout as? NSCollectionViewGridLayout else { return }
        layout.maximumNumberOfRows = maxRows
        layout.maximumNumberOfColumns = maxColumns
        layout.minimumItemSize = NSSize(width: minItemSize, height: minItemSize)
        layout.maximumItemSize = NSSize(width: maxItemSize, height: maxItemSize)
        layout.minimumInteritemSpacing = 8
        layout.margins = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        context.coordinator.count = count
        cv.reloadData()
    }
}

struct NSCollectionViewGridLayoutPage: View {
    @State private var maxColumns: Int = 4
    @State private var maxRows: Int = 0   // 0 = unlimited
    @State private var count: Int = 12
    @State private var minItemSize: CGFloat = 60
    @State private var maxItemSize: CGFloat = 100

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
            Text("NSCollectionViewGridLayout")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A layout that displays a single section of items in a row and column grid.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSCollectionViewLayout \u{00b7} macOS 10.11+ \u{00b7} Documentation/AppKit/views-and-controls/nscollectionviewgridlayout.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "fixed-grid placement constrained by max columns/rows and item size") {
            VStack(alignment: .leading, spacing: 12) {
                GridDemo(maxColumns: maxColumns,
                         maxRows: maxRows,
                         count: count,
                         minItemSize: minItemSize,
                         maxItemSize: maxItemSize)
                .frame(height: 320)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Stepper("maxColumns: \(maxColumns)", value: $maxColumns, in: 1...8)
                    Stepper("maxRows (0=∞): \(maxRows)", value: $maxRows, in: 0...8)
                }
                HStack(spacing: 12) {
                    Stepper("count: \(count)", value: $count, in: 1...32)
                    Stepper("minItemSize: \(Int(minItemSize))", value: $minItemSize, in: 40...120, step: 4)
                    Stepper("maxItemSize: \(Int(maxItemSize))", value: $maxItemSize, in: 60...200, step: 4)
                }

                APICallout("let layout = NSCollectionViewGridLayout()")
                APICallout("layout.maximumNumberOfColumns = 4; layout.maximumNumberOfRows = 0")
                APICallout("layout.minimumItemSize = NSSize(width: 60, height: 60); layout.maximumItemSize = NSSize(width: 100, height: 100)")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Bounding the grid") {
                snippet("""
                layout.maximumNumberOfRows = 0          // 0 == unlimited
                layout.maximumNumberOfColumns = 4
                layout.minimumItemSize = NSSize(width: 60, height: 60)
                layout.maximumItemSize = NSSize(width: 100, height: 100)
                layout.minimumInteritemSpacing = 8
                layout.margins = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                """)
            }
            Block(title: "When to choose grid vs flow") {
                snippet("""
                // Grid: legacy fixed-grid look, single section, no headers/footers,
                //       no supplementary or decoration views.
                // Flow: variable item sizing per section, headers/footers, multiple sections.
                // Compositional: anything beyond a flow — orthogonal scrolling, badges,
                //                per-section layout, decoration views.
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Single-section limit") {
                snippet("""
                // NSCollectionViewGridLayout displays only items.
                // It does NOT display supplementary or decoration views.
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSCollectionViewLayout. Single-section grid only.")
            noteRow("rectangle.split.3x3", "Sized by minimumItemSize / maximumItemSize and bounded by maximumNumberOfRows / maximumNumberOfColumns.")
            noteRow("xmark.circle", "Does not support supplementary or decoration views — use Flow or Compositional for those.")
            noteRow("clock", "macOS 10.11 vintage. Provides the legacy collection-view appearance from before macOS 10.11.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code).font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
            .textSelection(.enabled).padding(12)
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
    NSCollectionViewGridLayoutPage().frame(width: 1100, height: 900)
}
