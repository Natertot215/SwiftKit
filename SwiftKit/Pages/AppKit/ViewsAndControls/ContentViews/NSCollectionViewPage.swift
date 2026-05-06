import SwiftUI
import AppKit

// AppKit Views and Controls / Content Views — NSCollectionView family reference page.
//
// Consolidates 38 catalog leaves into one dense page:
//   • NSCollectionView (parent — rendered demo)
//   • Item/cell types: NSCollectionViewItem, NSCollectionReusableView,
//     NSCollectionViewSectionHeaderView, NSCollectionViewElement
//   • Data protocols: NSCollectionViewDataSource, NSCollectionViewDelegate,
//     NSCollectionViewDelegateFlowLayout, NSCollectionViewDiffableDataSource,
//     NSDiffableDataSourceSnapshot
//   • Layout types: NSCollectionViewLayout, NSCollectionViewFlowLayout,
//     NSCollectionViewGridLayout, NSCollectionViewTransitionLayout,
//     NSCollectionViewLayoutAttributes
//   • Compositional layout DSL (describe-only): NSCollectionViewCompositionalLayout
//     + all NSCollectionLayout* value-type building blocks + invalidation types
//
// Source: Documentation/AppKit/views-and-controls/nscollectionview.md
// Availability: macOS 10.5 (NSCollectionView); compositional DSL macOS 10.15
// Per L-001/L-012: semantic tokens only; no hand-mixed colors or pixel literals.

// MARK: - Tile item (flow-layout demo)

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
        let alpha: CGFloat = 0.25 + (CGFloat(index % 8) / 8.0) * 0.6
        swatch.layer?.backgroundColor = NSColor.controlAccentColor
            .withAlphaComponent(alpha).cgColor
    }
}

// MARK: - Data source coordinator (flow demo)

private final class FlowDemoCoordinator: NSObject, NSCollectionViewDataSource {
    var count: Int = 24

    func collectionView(_ cv: NSCollectionView, numberOfItemsInSection section: Int) -> Int { count }
    func numberOfSections(in cv: NSCollectionView) -> Int { 1 }
    func collectionView(_ cv: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = cv.makeItem(withIdentifier: .tileItem, for: indexPath) as! TileItem
        item.configure(index: indexPath.item)
        return item
    }
}

private extension NSUserInterfaceItemIdentifier {
    static let tileItem = NSUserInterfaceItemIdentifier("TileItem")
}

// MARK: - Flow layout NSScrollView bridge

private struct FlowLayoutDemo: NSViewRepresentable {
    var itemWidth: CGFloat
    var itemHeight: CGFloat
    var lineSpacing: CGFloat
    var itemCount: Int

    func makeCoordinator() -> FlowDemoCoordinator { FlowDemoCoordinator() }

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
        layout.invalidateLayout()
        context.coordinator.count = itemCount
        cv.reloadData()
    }
}

// MARK: - Flow layout section demo (horizontal scroll direction)

private final class HorizontalFlowCoordinator: NSObject, NSCollectionViewDataSource {
    func collectionView(_ cv: NSCollectionView, numberOfItemsInSection section: Int) -> Int { 12 }
    func numberOfSections(in cv: NSCollectionView) -> Int { 1 }
    func collectionView(_ cv: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = cv.makeItem(withIdentifier: .tileItem, for: indexPath) as! TileItem
        item.configure(index: indexPath.item)
        return item
    }
}

private struct HorizontalFlowDemo: NSViewRepresentable {
    func makeCoordinator() -> HorizontalFlowCoordinator { HorizontalFlowCoordinator() }

    func makeNSView(context: Context) -> NSScrollView {
        let layout = NSCollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = NSSize(width: 90, height: 70)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = NSEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

        let cv = NSCollectionView()
        cv.collectionViewLayout = layout
        cv.dataSource = context.coordinator
        cv.isSelectable = true
        cv.backgroundColors = [.clear]
        cv.register(TileItem.self, forItemWithIdentifier: .tileItem)

        let scroll = NSScrollView()
        scroll.hasHorizontalScroller = true
        scroll.hasVerticalScroller = false
        scroll.drawsBackground = false
        scroll.documentView = cv
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {}
}

// MARK: - Page

struct NSCollectionViewPage: View {
    @State private var itemWidth: CGFloat = 110
    @State private var itemHeight: CGFloat = 80
    @State private var lineSpacing: CGFloat = 10
    @State private var itemCount: Int = 24

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                itemCellSection
                dataProtocolsSection
                layoutTypesSection
                compositionalDSLSection
                defaultDemoSection
                flowLayoutDemoSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Section 1 — Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSCollectionView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("An ordered collection of data items displayed in a customizable, pluggable layout.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit · class : NSView · macOS 10.5 · Documentation/AppKit/views-and-controls/nscollectionview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Section 2 — Item and Cell Types

    private var itemCellSection: some View {
        PageSection("Item and Cell Types",
                    subtitle: "NSCollectionViewItem, NSCollectionReusableView, NSCollectionViewSectionHeaderView, NSCollectionViewElement") {
            VStack(alignment: .leading, spacing: 16) {
                typeRow(
                    name: "NSCollectionViewItem",
                    availability: "macOS 10.5",
                    role: "View controller vended by the data source for each data item. Manages an NSView cell.",
                    snippet: """
                    class TileItem: NSCollectionViewItem {
                        override func loadView() { self.view = MyTileView() }
                    }
                    cv.register(TileItem.self, forItemWithIdentifier: .myTile)
                    let item = cv.makeItem(withIdentifier: .myTile, for: indexPath) as! TileItem
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionReusableView",
                    availability: "macOS 10.11",
                    role: "Base class for supplementary views (headers, footers). Subclass and override prepareForReuse().",
                    snippet: """
                    class HeaderView: NSCollectionReusableView {
                        override func prepareForReuse() { super.prepareForReuse(); label.stringValue = "" }
                    }
                    cv.register(HeaderView.self,
                        forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader,
                        withIdentifier: .header)
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewSectionHeaderView",
                    availability: "macOS 10.11",
                    role: "Supplementary view with built-in collapse/expand button support via sectionCollapseButton.",
                    snippet: """
                    class MySectionHeader: NSCollectionViewSectionHeaderView {
                        // sectionCollapseButton is automatically wired by the collection view
                        // when isCollapsed property is toggled.
                    }
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewElement",
                    availability: "macOS 10.11",
                    role: "Protocol adopted by both NSCollectionViewItem and supplementary views. Provides apply(layoutAttributes:) and prepareForReuse().",
                    snippet: """
                    // Protocol — no direct instantiation. Adopted by:
                    //   NSCollectionViewItem          (item cells)
                    //   NSCollectionReusableView      (supplementary views)
                    // Key method: func apply(_ layoutAttributes: NSCollectionViewLayoutAttributes)
                    """
                )
            }
        }
    }

    // MARK: Section 3 — Data Protocols

    private var dataProtocolsSection: some View {
        PageSection("Data Protocols",
                    subtitle: "NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDelegateFlowLayout, NSCollectionViewDiffableDataSource, NSDiffableDataSourceSnapshot") {
            VStack(alignment: .leading, spacing: 16) {
                typeRow(
                    name: "NSCollectionViewDataSource",
                    availability: "macOS 10.11",
                    role: "Protocol providing item count and item views. Minimum required implementation.",
                    snippet: """
                    class MyDS: NSObject, NSCollectionViewDataSource {
                        func collectionView(_ cv: NSCollectionView,
                                            numberOfItemsInSection section: Int) -> Int { items.count }
                        func collectionView(_ cv: NSCollectionView,
                                            itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
                            let cell = cv.makeItem(withIdentifier: .myCell, for: indexPath) as! MyItem
                            cell.configure(items[indexPath.item])
                            return cell
                        }
                    }
                    cv.dataSource = myDS
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewDelegate",
                    availability: "macOS 10.11",
                    role: "Optional protocol for selection changes, highlighting, drag-and-drop, and context menus.",
                    snippet: """
                    // Key optional methods:
                    func collectionView(_ cv: NSCollectionView,
                                        didSelectItemsAt indexPaths: Set<IndexPath>)
                    func collectionView(_ cv: NSCollectionView,
                                        didDeselectItemsAt indexPaths: Set<IndexPath>)
                    func collectionView(_ cv: NSCollectionView,
                                        willDisplay item: NSCollectionViewItem,
                                        forRepresentedObjectAt indexPath: IndexPath)
                    cv.delegate = myDelegate
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewDelegateFlowLayout",
                    availability: "macOS 10.11",
                    role: "Optional refinement of NSCollectionViewDelegate for per-item size and spacing overrides with NSCollectionViewFlowLayout.",
                    snippet: """
                    // Refines NSCollectionViewDelegate for flow-layout specifics:
                    func collectionView(_ cv: NSCollectionView,
                                        layout: NSCollectionViewLayout,
                                        sizeForItemAt indexPath: IndexPath) -> NSSize
                    func collectionView(_ cv: NSCollectionView,
                                        layout: NSCollectionViewLayout,
                                        insetForSectionAt section: Int) -> NSEdgeInsets
                    func collectionView(_ cv: NSCollectionView,
                                        layout: NSCollectionViewLayout,
                                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewDiffableDataSource<SectionType, ItemType>",
                    availability: "macOS 10.15.1",
                    role: "Type-safe, snapshot-driven data source. Eliminates manual insert/delete bookkeeping; drives animated diffs automatically.",
                    snippet: """
                    // Setup:
                    let ds = NSCollectionViewDiffableDataSource<Section, Item>(
                        collectionView: cv
                    ) { cv, indexPath, item in
                        let cell = cv.makeItem(withIdentifier: .myCell, for: indexPath) as! MyItem
                        cell.configure(item)
                        return cell
                    }

                    // Apply snapshot:
                    var snap = NSDiffableDataSourceSnapshot<Section, Item>()
                    snap.appendSections([.main])
                    snap.appendItems(myItems, toSection: .main)
                    ds.apply(snap, animatingDifferences: true)
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSDiffableDataSourceSnapshot<SectionType, ItemType>",
                    availability: "macOS 10.15.1",
                    role: "Value-type snapshot of the current data state. Passed to apply(_:animatingDifferences:) to update the collection view.",
                    snippet: """
                    var snap = NSDiffableDataSourceSnapshot<Section, Item>()
                    snap.appendSections([.main, .secondary])
                    snap.appendItems(items1, toSection: .main)
                    snap.appendItems(items2, toSection: .secondary)
                    snap.deleteItems([staleItem])
                    snap.moveItem(itemA, afterItem: itemB)
                    // sectionIdentifiers: [Section] — ordered section list
                    // itemIdentifiers: [Item]       — ordered item list across all sections
                    """
                )
            }
        }
    }

    // MARK: Section 4 — Layout Types

    private var layoutTypesSection: some View {
        PageSection("Layout Types",
                    subtitle: "NSCollectionViewLayout (abstract), NSCollectionViewFlowLayout, NSCollectionViewGridLayout, NSCollectionViewTransitionLayout, NSCollectionViewLayoutAttributes") {
            VStack(alignment: .leading, spacing: 16) {
                typeRow(
                    name: "NSCollectionViewLayout",
                    availability: "macOS 10.11",
                    role: "Abstract base. Subclass and override prepare(), layoutAttributesForElements(in:), collectionViewContentSize.",
                    snippet: """
                    // Assign via:
                    cv.collectionViewLayout = myLayout
                    // Invalidate on data change:
                    cv.collectionViewLayout?.invalidateLayout()
                    // Animated layout swap:
                    cv.animator().collectionViewLayout = newLayout
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewFlowLayout",
                    availability: "macOS 10.11",
                    role: "Line-wrapping flow — items fill rows (vertical) or columns (horizontal), wrapping as needed.",
                    snippet: """
                    let flow = NSCollectionViewFlowLayout()
                    flow.itemSize = NSSize(width: 110, height: 80)
                    flow.minimumLineSpacing = 10
                    flow.minimumInteritemSpacing = 8
                    flow.sectionInset = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                    flow.scrollDirection = .vertical   // or .horizontal
                    flow.headerReferenceSize = NSSize(width: 0, height: 28)  // 0 = none
                    flow.footerReferenceSize = .zero
                    cv.collectionViewLayout = flow
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewGridLayout",
                    availability: "macOS 10.11",
                    role: "Fixed-column grid — legacy look (pre-flow API). Simpler setup for uniform tile grids.",
                    snippet: """
                    let grid = NSCollectionViewGridLayout()
                    grid.minimumItemSize = NSSize(width: 80, height: 80)
                    grid.maximumItemSize = NSSize(width: 120, height: 120)
                    grid.minimumLineSpacing = 4
                    grid.minimumInteritemSpacing = 4
                    cv.collectionViewLayout = grid
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewTransitionLayout",
                    availability: "macOS 10.11",
                    role: "Animates the transition between two layout objects. Returned by startInteractiveTransition(to:completion:).",
                    snippet: """
                    // Begin interactive layout transition:
                    let tl = cv.startInteractiveTransition(to: newLayout) { finished, completed in
                        print("transition done, completed: \\(completed)")
                    }
                    // Drive with gesture recognizer progress (0.0–1.0):
                    tl.transitionProgress = gestureProgress
                    // Finish or cancel:
                    cv.finishInteractiveTransition()
                    // cv.cancelInteractiveTransition()
                    """
                )
                Divider().opacity(0.4)
                typeRow(
                    name: "NSCollectionViewLayoutAttributes",
                    availability: "macOS 10.11",
                    role: "Carries position, size, alpha, zIndex, and hidden state for a single item or supplementary view.",
                    snippet: """
                    // Created by layout objects; consumed by NSCollectionViewElement:
                    let attrs = NSCollectionViewLayoutAttributes(forItemWith: indexPath)
                    attrs.frame = CGRect(x: 0, y: 0, width: 110, height: 80)
                    attrs.alpha = 1.0
                    attrs.zIndex = 0
                    attrs.isHidden = false
                    // Applied automatically; override apply(_ layoutAttributes:) to animate.
                    """
                )
            }
        }
    }

    // MARK: Section 5 — Compositional Layout DSL

    private var compositionalDSLSection: some View {
        PageSection("Compositional Layout DSL",
                    subtitle: "Describe-only — value-type building blocks with no direct visual rendering. macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                describeNote("NSCollectionViewCompositionalLayout, NSCollectionViewCompositionalLayoutConfiguration, and NSCollectionViewCompositionalLayoutSectionProvider are the entry points. All NSCollectionLayout* types are value-type building blocks composed into a section provider closure. No direct rendering — set cv.collectionViewLayout = NSCollectionViewCompositionalLayout { sectionIndex, env in … }.")

                // Container types
                dslGroup("Container", types: [
                    ("NSCollectionViewCompositionalLayout", "macOS 10.15",
                     "init(sectionProvider: NSCollectionViewCompositionalLayoutSectionProvider)\ninit(section: NSCollectionLayoutSection)\ninit(sectionProvider:configuration:)"),
                    ("NSCollectionViewCompositionalLayoutConfiguration", "macOS 10.15",
                     "var scrollDirection: NSCollectionView.ScrollDirection\nvar interSectionSpacing: CGFloat\nvar boundarySupplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]"),
                    ("NSCollectionViewCompositionalLayoutSectionProvider", "macOS 10.15",
                     "typealias (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?")
                ])

                dslGroup("Core DSL", types: [
                    ("NSCollectionLayoutItem", "macOS 10.15",
                     "init(layoutSize: NSCollectionLayoutSize)\nvar contentInsets: NSDirectionalEdgeInsets\nvar edgeSpacing: NSCollectionLayoutEdgeSpacing?\nvar supplementaryItems: [NSCollectionLayoutSupplementaryItem]"),
                    ("NSCollectionLayoutGroup", "macOS 10.15",
                     "class func horizontal(layoutSize:subitems:) -> NSCollectionLayoutGroup\nclass func vertical(layoutSize:subitems:) -> NSCollectionLayoutGroup\nclass func custom(layoutSize:itemProvider:) -> NSCollectionLayoutGroup\nvar interItemSpacing: NSCollectionLayoutSpacing?"),
                    ("NSCollectionLayoutSection", "macOS 10.15",
                     "init(group: NSCollectionLayoutGroup)\nvar contentInsets: NSDirectionalEdgeInsets\nvar interGroupSpacing: CGFloat\nvar orthogonalScrollingBehavior: NSCollectionLayoutSectionOrthogonalScrollingBehavior\nvar boundarySupplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]\nvar visibleItemsInvalidationHandler: NSCollectionLayoutSectionVisibleItemsInvalidationHandler?"),
                    ("NSCollectionLayoutDimension", "macOS 10.15",
                     "class func fractionalWidth(_ f: CGFloat) -> NSCollectionLayoutDimension\nclass func fractionalHeight(_ f: CGFloat) -> NSCollectionLayoutDimension\nclass func absolute(_ p: CGFloat) -> NSCollectionLayoutDimension\nclass func estimated(_ p: CGFloat) -> NSCollectionLayoutDimension"),
                    ("NSCollectionLayoutSize", "macOS 10.15",
                     "init(widthDimension: NSCollectionLayoutDimension,\n     heightDimension: NSCollectionLayoutDimension)")
                ])

                dslGroup("Spacing", types: [
                    ("NSCollectionLayoutSpacing", "macOS 10.15",
                     "class func fixed(_ spacing: CGFloat) -> NSCollectionLayoutSpacing\nclass func flexible(_ minSpacing: CGFloat) -> NSCollectionLayoutSpacing"),
                    ("NSCollectionLayoutEdgeSpacing", "macOS 10.15",
                     "init(leading: NSCollectionLayoutSpacing?,\n     top: NSCollectionLayoutSpacing?,\n     trailing: NSCollectionLayoutSpacing?,\n     bottom: NSCollectionLayoutSpacing?)")
                ])

                dslGroup("Supplementary and Decoration", types: [
                    ("NSCollectionLayoutBoundarySupplementaryItem", "macOS 10.15",
                     "init(layoutSize:elementKind:alignment:)\nvar pinToVisibleBounds: Bool\nvar extendsBoundary: Bool\nvar zIndex: Int"),
                    ("NSCollectionLayoutSupplementaryItem", "macOS 10.15",
                     "init(layoutSize:elementKind:containerAnchor:)\nvar zIndex: Int"),
                    ("NSCollectionLayoutDecorationItem", "macOS 10.15",
                     "class func background(elementKind:) -> NSCollectionLayoutDecorationItem\nvar zIndex: Int\nvar contentInsets: NSDirectionalEdgeInsets"),
                    ("NSCollectionLayoutAnchor", "macOS 10.15",
                     "init(edges: NSDirectionalRectEdge)\ninit(edges:absoluteOffset:)\ninit(edges:fractionalOffset:)\nvar edges: NSDirectionalRectEdge")
                ])

                dslGroup("Custom Group", types: [
                    ("NSCollectionLayoutGroupCustomItem", "macOS 10.15",
                     "init(frame: CGRect)\ninit(frame:zIndex:)\nvar frame: CGRect\nvar zIndex: Int"),
                    ("NSCollectionLayoutGroupCustomItemProvider", "macOS 10.15",
                     "typealias (NSCollectionLayoutEnvironment) -> [NSCollectionLayoutGroupCustomItem]")
                ])

                dslGroup("Environment and Scroll", types: [
                    ("NSCollectionLayoutContainer", "macOS 10.15",
                     "protocol NSCollectionLayoutContainer\nvar contentSize: CGSize { get }\nvar effectiveContentSize: CGSize { get }\nvar contentInsets: NSDirectionalEdgeInsets { get }\nvar effectiveContentInsets: NSDirectionalEdgeInsets { get }"),
                    ("NSCollectionLayoutEnvironment", "macOS 10.15",
                     "protocol NSCollectionLayoutEnvironment\nvar container: NSCollectionLayoutContainer { get }"),
                    ("NSCollectionLayoutVisibleItem", "macOS 10.15",
                     "protocol NSCollectionLayoutVisibleItem : NSCollectionLayoutItem\nvar name: String { get }\nvar indexPath: IndexPath { get }\nvar frame: CGRect { get set }\nvar alpha: CGFloat { get set }\nvar zIndex: Int { get set }"),
                    ("NSCollectionLayoutSectionOrthogonalScrollingBehavior", "macOS 10.15",
                     "enum cases:\n  .none          // default, no orthogonal scrolling\n  .continuous    // continuous panning\n  .continuousGroupLeadingBoundary\n  .paging\n  .groupPaging\n  .groupPagingCentered"),
                    ("NSCollectionLayoutSectionVisibleItemsInvalidationHandler", "macOS 10.15",
                     "typealias ([NSCollectionLayoutVisibleItem], CGPoint, NSCollectionLayoutEnvironment) -> Void\n// Assigned to section.visibleItemsInvalidationHandler\n// Called on every scroll event for parallax/animation effects")
                ])

                dslGroup("Invalidation", types: [
                    ("NSCollectionViewUpdateItem", "macOS 10.11",
                     "var indexPathBeforeUpdate: IndexPath?\nvar indexPathAfterUpdate: IndexPath?\nvar updateAction: NSCollectionViewUpdateItem.Action\n// Actions: .insert, .delete, .reload, .move, .none"),
                    ("NSCollectionViewLayoutInvalidationContext", "macOS 10.11",
                     "var invalidateEverything: Bool\nvar invalidateDataSourceCounts: Bool\nfunc invalidateItems(at: Set<IndexPath>)\nfunc invalidateSupplementaryElements(ofKind:at:)\nfunc invalidateDecorationElements(ofKind:at:)"),
                    ("NSCollectionViewFlowLayoutInvalidationContext", "macOS 10.11",
                     "Subclass of NSCollectionViewLayoutInvalidationContext.\nvar invalidateFlowLayoutDelegateMetrics: Bool\nvar invalidateFlowLayoutAttributes: Bool")
                ])

                // Full compositional assembly example
                codeBlock(title: "Compositional layout — full assembly example", code: """
                let layout = NSCollectionViewCompositionalLayout { sectionIndex, env in
                    // Item — 25% of group width, full group height
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.25),
                        heightDimension: .fractionalHeight(1.0))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

                    // Group — full section width, absolute 80pt tall
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(80))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

                    // Section
                    let section = NSCollectionLayoutSection(group: group)
                    section.interGroupSpacing = 8
                    section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

                    // Optional header
                    let headerSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(32))
                    let header = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: NSCollectionView.elementKindSectionHeader,
                        alignment: .top)
                    section.boundarySupplementaryItems = [header]
                    return section
                }
                cv.collectionViewLayout = layout
                """)
            }
        }
    }

    // MARK: Section 6 — Default NSCollectionView Demo

    private var defaultDemoSection: some View {
        PageSection("Default NSCollectionView",
                    subtitle: "NSViewRepresentable bridge — data-source-driven tile grid in an NSScrollView with NSCollectionViewFlowLayout") {
            VStack(alignment: .leading, spacing: 12) {
                FlowLayoutDemo(
                    itemWidth: itemWidth,
                    itemHeight: itemHeight,
                    lineSpacing: lineSpacing,
                    itemCount: itemCount
                )
                .frame(height: 300)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 16) {
                    Stepper("itemCount: \(itemCount)", value: $itemCount, in: 0...96, step: 4)
                    Stepper("lineSpacing: \(Int(lineSpacing))", value: $lineSpacing, in: 0...32, step: 2)
                }
                HStack(spacing: 16) {
                    Stepper("itemWidth: \(Int(itemWidth))", value: $itemWidth, in: 60...220, step: 10)
                    Stepper("itemHeight: \(Int(itemHeight))", value: $itemHeight, in: 50...160, step: 5)
                }

                codeBlock(code: """
                let cv = NSCollectionView()
                cv.collectionViewLayout = NSCollectionViewFlowLayout()
                cv.dataSource = myDataSource
                cv.register(TileItem.self, forItemWithIdentifier: .tileItem)
                let scroll = NSScrollView()
                scroll.documentView = cv
                """)
            }
        }
    }

    // MARK: Section 7 — Flow Layout Demo

    private var flowLayoutDemoSection: some View {
        PageSection("Flow Layout — Horizontal Scroll Direction",
                    subtitle: "NSCollectionViewFlowLayout with scrollDirection = .horizontal") {
            VStack(alignment: .leading, spacing: 12) {
                HorizontalFlowDemo()
                    .frame(height: 100)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                codeBlock(code: """
                let flow = NSCollectionViewFlowLayout()
                flow.scrollDirection = .horizontal
                flow.itemSize = NSSize(width: 90, height: 70)
                flow.minimumLineSpacing = 10
                flow.sectionInset = NSEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

                // Key NSCollectionViewFlowLayout properties:
                flow.headerReferenceSize = NSSize(width: 0, height: 28)   // 0 = no header
                flow.footerReferenceSize = .zero
                flow.estimatedItemSize = .zero                             // use itemSize; set nonzero for self-sizing
                flow.sectionHeadersPinToVisibleBounds = true              // sticky headers (macOS 10.12+)
                """)
            }
        }
    }

    // MARK: Section 8 — Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("scroll.content", "Always wrap NSCollectionView in NSScrollView. Set scroll.documentView = cv. The view itself does not scroll.")
                noteRow("rectangle.grid.2x2", "Items are NSCollectionViewItem instances (view controllers). Register with cv.register(_:forItemWithIdentifier:) before the first data-source call.")
                noteRow("arrow.triangle.branch", "Data path: NSCollectionViewDataSource (legacy) or NSCollectionViewDiffableDataSource (modern, macOS 10.15.1+). Prefer diffable — animated diffs are free.")
                noteRow("slider.horizontal.3", "Layout path: NSCollectionViewFlowLayout for most grids; NSCollectionViewGridLayout for legacy icon grids; NSCollectionViewCompositionalLayout for complex multi-section layouts (macOS 10.15+).")
                noteRow("arrow.2.squarepath", "Batch updates: cv.animator().performBatchUpdates({ insertItems/deleteItems/reloadItems }) for animated data changes with the classic data source. With diffable, call ds.apply(snapshot, animatingDifferences: true).")
                noteRow("paintbrush", "Background: cv.backgroundColors = [.clear] removes the default white fill. cv.backgroundView = NSVisualEffectView() for vibrancy. cv.backgroundViewScrollsWithContent controls parallax behavior.")
                noteRow("clock", "macOS 10.5 vintage for NSCollectionView. NSCollectionViewFlowLayout and the delegate/element protocol were added in macOS 10.11. Compositional layout DSL requires macOS 10.15.")
            }
        }
    }

    // MARK: - Helpers

    private func typeRow(name: String, availability: String, role: String, snippet: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(name)
                    .font(.headline).fontDesign(.monospaced).foregroundStyle(.primary)
                Text(availability)
                    .font(.caption).foregroundStyle(.tertiary)
                    .padding(.horizontal, 6).padding(.vertical, 2)
                    .background(.quaternary, in: Capsule())
            }
            Text(role)
                .font(.callout).foregroundStyle(.secondary)
            codeBlock(code: snippet)
        }
    }

    private func dslGroup(_ groupTitle: String, types: [(String, String, String)]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(groupTitle)
                .font(.subheadline).fontWeight(.semibold).foregroundStyle(.secondary)
            VStack(alignment: .leading, spacing: 10) {
                ForEach(types, id: \.0) { (name, avail, sig) in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
                            Text(name)
                                .font(.caption).fontWeight(.semibold).fontDesign(.monospaced)
                                .foregroundStyle(.primary)
                            Text(avail)
                                .font(.caption2).foregroundStyle(.tertiary)
                        }
                        Text(sig)
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            .textSelection(.enabled)
                            .padding(.horizontal, 10).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func codeBlock(title: String? = nil, code: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title {
                Text(title)
                    .font(.caption).fontWeight(.medium).foregroundStyle(.secondary)
            }
            Text(code)
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func describeNote(_ text: String) -> some View {
        Text(text)
            .font(.callout).foregroundStyle(.secondary)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
            .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator.opacity(0.5), lineWidth: 1))
    }
}

#Preview {
    NSCollectionViewPage()
        .frame(width: 1100, height: 1000)
}
