import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSCollectionView (class, inherits NSView) — an ordered collection
// of data items displayed in a customizable layout. The collection view itself
// is layout-agnostic; the layout object decides placement. Items are vended
// by an NSCollectionViewDataSource (or the diffable data source) as
// NSCollectionViewItem instances.
// Source: Documentation/AppKit/views-and-controls/nscollectionview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSCollectionView wrapped
// in an NSScrollView and configured with an NSCollectionViewFlowLayout. The
// data source vends a small static set of "Tile" items (number + colored
// square). SwiftUI controls drive itemSize, minimumLineSpacing, and the
// number of items to expose how the collection responds.

// MARK: - Tile item view

private final class TileItem: NSCollectionViewItem {
    private let label = NSTextField(labelWithString: "")
    private let swatch = NSView()

    override func loadView() {
        let root = NSView()
        root.wantsLayer = true
        root.layer?.cornerRadius = 6
        root.layer?.borderWidth = 1
        root.layer?.borderColor = NSColor.separatorColor.cgColor
        root.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor

        swatch.wantsLayer = true
        swatch.layer?.cornerRadius = 4
        swatch.translatesAutoresizingMaskIntoConstraints = false

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: NSFont.smallSystemFontSize, weight: .medium)
        label.textColor = .secondaryLabelColor

        root.addSubview(swatch)
        root.addSubview(label)

        NSLayoutConstraint.activate([
            swatch.topAnchor.constraint(equalTo: root.topAnchor, constant: 8),
            swatch.leadingAnchor.constraint(equalTo: root.leadingAnchor, constant: 8),
            swatch.trailingAnchor.constraint(equalTo: root.trailingAnchor, constant: -8),
            swatch.heightAnchor.constraint(equalToConstant: 28),

            label.topAnchor.constraint(equalTo: swatch.bottomAnchor, constant: 6),
            label.leadingAnchor.constraint(equalTo: root.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: root.trailingAnchor, constant: -8)
        ])

        self.view = root
    }

    func configure(index: Int) {
        label.stringValue = "Item \(index)"
        // Use the system accent and let alpha vary across the row so the
        // pattern is visible without committing a literal color spec.
        let alpha: CGFloat = 0.25 + (CGFloat(index % 8) / 8.0) * 0.6
        swatch.layer?.backgroundColor = NSColor.controlAccentColor
            .withAlphaComponent(alpha).cgColor
    }
}

// MARK: - DataSource coordinator

private final class CVDemoCoordinator: NSObject, NSCollectionViewDataSource {
    var count: Int = 24

    func collectionView(_ collectionView: NSCollectionView,
                        numberOfItemsInSection section: Int) -> Int { count }

    func numberOfSections(in collectionView: NSCollectionView) -> Int { 1 }

    func collectionView(_ collectionView: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: .tileItem, for: indexPath) as! TileItem
        item.configure(index: indexPath.item)
        return item
    }
}

private extension NSUserInterfaceItemIdentifier {
    static let tileItem = NSUserInterfaceItemIdentifier("TileItem")
}

// MARK: - Bridge

private struct NSCollectionViewDemo: NSViewRepresentable {
    var itemWidth: CGFloat
    var itemHeight: CGFloat
    var lineSpacing: CGFloat
    var itemCount: Int

    func makeCoordinator() -> CVDemoCoordinator { CVDemoCoordinator() }

    func makeNSView(context: Context) -> NSScrollView {
        let layout = NSCollectionViewFlowLayout()
        layout.itemSize = NSSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        let cv = NSCollectionView()
        cv.collectionViewLayout = layout
        cv.dataSource = context.coordinator
        cv.isSelectable = true
        cv.allowsMultipleSelection = true
        cv.backgroundColors = [.clear]
        cv.register(TileItem.self, forItemWithIdentifier: .tileItem)

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.drawsBackground = false
        scroll.documentView = cv
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let cv = nsView.documentView as? NSCollectionView,
              let layout = cv.collectionViewLayout as? NSCollectionViewFlowLayout else { return }
        layout.itemSize = NSSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = lineSpacing
        context.coordinator.count = itemCount
        cv.reloadData()
    }
}

// MARK: - Page

struct NSCollectionViewPage: View {
    @State private var itemWidth: CGFloat = 110
    @State private var itemHeight: CGFloat = 80
    @State private var lineSpacing: CGFloat = 10
    @State private var itemCount: Int = 24

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
            Text("NSCollectionView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("An ordered collection of data items displayed in a customizable layout.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nscollectionview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "data-source-driven tile grid in an NSScrollView (flow layout)") {
            VStack(alignment: .leading, spacing: 12) {
                NSCollectionViewDemo(
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                    lineSpacing: lineSpacing,
                    itemCount: itemCount
                )
                .frame(height: 320)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Stepper("itemCount: \(itemCount)", value: $itemCount, in: 0...96, step: 4)
                    Stepper("lineSpacing: \(Int(lineSpacing))", value: $lineSpacing, in: 0...32, step: 2)
                }
                HStack(spacing: 12) {
                    Stepper("itemWidth: \(Int(itemWidth))", value: $itemWidth, in: 60...220, step: 10)
                    Stepper("itemHeight: \(Int(itemHeight))", value: $itemHeight, in: 50...160, step: 5)
                }

                APICallout("let cv = NSCollectionView(); cv.collectionViewLayout = NSCollectionViewFlowLayout(); cv.dataSource = self")
                APICallout("// register: cv.register(TileItem.self, forItemWithIdentifier: .tileItem)")
                APICallout("// scroll host: let scroll = NSScrollView(); scroll.documentView = cv")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Layout objects") {
                snippet("""
                cv.collectionViewLayout = NSCollectionViewFlowLayout()      // line/column flow
                cv.collectionViewLayout = NSCollectionViewGridLayout()      // fixed grid (legacy look)
                cv.collectionViewLayout = NSCollectionViewCompositionalLayout { _, _ in
                    /* return NSCollectionLayoutSection */
                    NSCollectionLayoutSection(group: NSCollectionLayoutGroup.horizontal(
                        layoutSize: .init(widthDimension: .fractionalWidth(1),
                                          heightDimension: .absolute(80)),
                        subitems: [NSCollectionLayoutItem(layoutSize:
                            .init(widthDimension: .fractionalWidth(0.25),
                                  heightDimension: .fractionalHeight(1)))]
                    ))
                }
                """)
            }

            Block(title: "Data sources") {
                snippet("""
                // Classic protocol
                func collectionView(_ cv: NSCollectionView,
                                    numberOfItemsInSection section: Int) -> Int { items.count }
                func collectionView(_ cv: NSCollectionView,
                                    itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem { ... }

                // Modern diffable
                let ds = NSCollectionViewDiffableDataSource<Section, Item>(collectionView: cv) { ... }
                var snap = NSDiffableDataSourceSnapshot<Section, Item>()
                snap.appendSections([.main]); snap.appendItems(items)
                ds.apply(snap, animatingDifferences: true)
                """)
            }

            Block(title: "Item registration") {
                snippet("""
                cv.register(TileItem.self, forItemWithIdentifier: .tileItem)
                cv.register(NSNib(...), forItemWithIdentifier: .tileItem)
                cv.makeItem(withIdentifier: .tileItem, for: indexPath)
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Selection") {
                snippet("""
                cv.isSelectable = true
                cv.allowsMultipleSelection = true
                cv.allowsEmptySelection = true
                cv.selectionIndexes                    // -> IndexSet
                cv.selectionIndexPaths                 // -> Set<IndexPath>
                cv.selectAll(self)
                cv.deselectAll(self)
                """)
            }
            Block(title: "Reload / update") {
                snippet("""
                cv.reloadData()
                cv.reloadItems(at: [IndexPath(item: 0, section: 0)])
                cv.reloadSections(IndexSet(integer: 0))
                cv.animator().performBatchUpdates({
                    cv.insertItems(at: [IndexPath(item: 0, section: 0)])
                }, completionHandler: nil)
                """)
            }
            Block(title: "Background / chrome") {
                snippet("""
                cv.backgroundColors = [.clear]
                cv.backgroundView = NSVisualEffectView()
                cv.backgroundViewScrollsWithContent = false
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. Layout-agnostic — the layout object (NSCollectionViewLayout subclass) decides placement.")
            noteRow("rectangle.grid.2x2", "Items are NSCollectionViewItem instances (view controllers). Section headers can adopt NSCollectionViewSectionHeaderView for collapse-button support.")
            noteRow("link", "Data path: NSCollectionViewDataSource (classic) or NSCollectionViewDiffableDataSource<Section, Item> (modern). Behavior path: NSCollectionViewDelegate.")
            noteRow("info.circle", "Always wrap in NSScrollView for scrollable content. Set scroll.documentView = cv.")
            noteRow("clock", "macOS 10.5 vintage. The compositional-layout DSL (NSCollectionLayoutItem, etc.) was added in macOS 10.15.")
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
    NSCollectionViewPage().frame(width: 1100, height: 900)
}
