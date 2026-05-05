import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSCollectionViewCompositionalLayout (class, inherits NSCollectionViewLayout)
// — a layout object that lets you compose item / group / section trees into
// any visual arrangement. The DSL primitives (NSCollectionLayoutItem,
// NSCollectionLayoutGroup, NSCollectionLayoutSection, NSCollectionLayoutSize,
// NSCollectionLayoutDimension, ...) describe how things are sized and spaced;
// the compositional layout assembles them into a full layout.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewcompositionallayout.md
//
// Renderable demo: an NSViewRepresentable hosts an NSCollectionView using a
// compositional layout that produces a horizontally-flowing band of fractional
// items in each section, with a per-section header. SwiftUI controls swap
// between three preset layouts (basic list, two-column grid, badged columns)
// so the difference between simple and composed layouts is visible.

private final class CompTileItem: NSCollectionViewItem {
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
        label.font = .systemFont(ofSize: NSFont.smallSystemFontSize, weight: .semibold)
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

private final class CompHeaderView: NSView, NSCollectionViewElement {
    let label = NSTextField(labelWithString: "Section")
    override init(frame: NSRect) {
        super.init(frame: frame)
        wantsLayer = true
        layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: NSFont.smallSystemFontSize, weight: .semibold)
        label.textColor = .secondaryLabelColor
        addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) { nil }
}

private final class CompDataSource: NSObject, NSCollectionViewDataSource {
    let sectionCount = 3
    let perSection = 8

    func numberOfSections(in cv: NSCollectionView) -> Int { sectionCount }
    func collectionView(_ cv: NSCollectionView, numberOfItemsInSection s: Int) -> Int { perSection }
    func collectionView(_ cv: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let it = cv.makeItem(withIdentifier: .compTile, for: indexPath) as! CompTileItem
        it.configure(indexPath.section * perSection + indexPath.item)
        return it
    }
    func collectionView(_ cv: NSCollectionView,
                        viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind,
                        at indexPath: IndexPath) -> NSView {
        let header = cv.makeSupplementaryView(ofKind: kind,
                                              withIdentifier: .compHeader,
                                              for: indexPath) as! CompHeaderView
        header.label.stringValue = "Section \(indexPath.section + 1)"
        return header
    }
}

private extension NSUserInterfaceItemIdentifier {
    static let compTile = NSUserInterfaceItemIdentifier("CompTile")
    static let compHeader = NSUserInterfaceItemIdentifier("CompHeader")
}

private enum CompositionalPreset: String, CaseIterable, Identifiable {
    case list, twoColumn, threeColumn
    var id: String { rawValue }
    var label: String {
        switch self {
        case .list: return "list (1 col)"
        case .twoColumn: return "2-column grid"
        case .threeColumn: return "3-column grid"
        }
    }
}

private struct CompositionalDemo: NSViewRepresentable {
    var preset: CompositionalPreset

    func makeCoordinator() -> CompDataSource { CompDataSource() }

    func makeNSView(context: Context) -> NSScrollView {
        let cv = NSCollectionView()
        cv.collectionViewLayout = layout(for: preset)
        cv.dataSource = context.coordinator
        cv.isSelectable = true
        cv.backgroundColors = [.clear]
        cv.register(CompTileItem.self, forItemWithIdentifier: .compTile)
        cv.register(CompHeaderView.self,
                    forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader,
                    withIdentifier: .compHeader)

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.drawsBackground = false
        scroll.documentView = cv
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let cv = nsView.documentView as? NSCollectionView else { return }
        cv.collectionViewLayout = layout(for: preset)
        cv.reloadData()
    }

    private func layout(for preset: CompositionalPreset) -> NSCollectionViewLayout {
        let columns: CGFloat
        let height: CGFloat
        switch preset {
        case .list: columns = 1; height = 44
        case .twoColumn: columns = 2; height = 80
        case .threeColumn: columns = 3; height = 80
        }
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / columns),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(24))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: NSCollectionView.elementKindSectionHeader,
            alignment: .top)
        header.pinToVisibleBounds = true

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 12, trailing: 4)

        return NSCollectionViewCompositionalLayout(section: section)
    }
}

struct NSCollectionViewCompositionalLayoutPage: View {
    @State private var preset: CompositionalPreset = .twoColumn

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
            Text("NSCollectionViewCompositionalLayout")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A layout object that lets you combine items in highly adaptive and flexible visual arrangements.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSCollectionViewLayout \u{00b7} macOS 10.15+ \u{00b7} Documentation/AppKit/views-and-controls/nscollectionviewcompositionallayout.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "item / group / section composed live; pinned section headers") {
            VStack(alignment: .leading, spacing: 12) {
                CompositionalDemo(preset: preset)
                    .frame(height: 320)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Picker("preset", selection: $preset) {
                    ForEach(CompositionalPreset.allCases) { p in
                        Text(p.label).tag(p)
                    }
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 380)

                APICallout("let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))")
                APICallout("let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)), subitems: [item])")
                APICallout("let layout = NSCollectionViewCompositionalLayout(section: NSCollectionLayoutSection(group: group))")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Per-section layouts via section provider") {
                snippet("""
                let layout = NSCollectionViewCompositionalLayout { sectionIndex, env in
                    let columns: CGFloat = sectionIndex == 0 ? 2 : 4
                    let item = NSCollectionLayoutItem(layoutSize:
                        .init(widthDimension: .fractionalWidth(1.0 / columns),
                              heightDimension: .fractionalHeight(1.0)))
                    let group = NSCollectionLayoutGroup.horizontal(
                        layoutSize: .init(widthDimension: .fractionalWidth(1),
                                          heightDimension: .absolute(80)),
                        subitems: [item])
                    return NSCollectionLayoutSection(group: group)
                }
                """)
            }
            Block(title: "Boundary supplementary headers and footers") {
                snippet("""
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                      heightDimension: .estimated(44)),
                    elementKind: NSCollectionView.elementKindSectionHeader,
                    alignment: .top)
                header.pinToVisibleBounds = true
                section.boundarySupplementaryItems = [header]
                """)
            }
            Block(title: "Orthogonal scrolling sections") {
                snippet("""
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                """)
            }
            Block(title: "Decoration items") {
                snippet("""
                let bg = NSCollectionLayoutDecorationItem.background(
                    elementKind: \"section-bg\")
                section.decorationItems = [bg]
                layout.register(SectionBackgroundView.self,
                                forDecorationViewOfKind: \"section-bg\")
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Configuration") {
                snippet("""
                let config = NSCollectionViewCompositionalLayoutConfiguration()
                config.scrollDirection = .vertical
                config.interSectionSpacing = 16
                layout.configuration = config
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSCollectionViewLayout. Composes a tree: NSCollectionLayoutItem inside NSCollectionLayoutGroup inside NSCollectionLayoutSection.")
            noteRow("rectangle.3.group", "Two construction modes: a single-section initializer and a section-provider closure for per-section variation.")
            noteRow("link", "Ships with NSCollectionViewCompositionalLayoutConfiguration for scroll direction, inter-section spacing, and global headers/footers.")
            noteRow("clock", "macOS 10.15 vintage. The compositional family is the modern recommended layout for non-uniform sections.")
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
    NSCollectionViewCompositionalLayoutPage().frame(width: 1100, height: 900)
}
