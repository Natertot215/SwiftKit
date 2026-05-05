import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSCollectionViewFlowLayout (class, inherits NSCollectionViewLayout)
// — a layout that organizes items into a flexible flow. The first item sits
// at the top-leading corner; items wrap horizontally or vertically based on
// the scroll direction. The flow layout exposes itemSize, scrollDirection,
// minimumLineSpacing, minimumInteritemSpacing, sectionInset, and supports
// per-section header/footer supplementary views.
// Source: Documentation/AppKit/views-and-controls/nscollectionviewflowlayout.md
//
// Renderable demo: an NSViewRepresentable hosts an NSCollectionView using a
// flow layout. SwiftUI controls drive scrollDirection, itemSize,
// minimumLineSpacing, and minimumInteritemSpacing so the flow response is
// visibly exercised.

private final class FlowTileItem: NSCollectionViewItem {
    private let label = NSTextField(labelWithString: "")

    override func loadView() {
        let root = NSView()
        root.wantsLayer = true
        root.layer?.cornerRadius = 6
        root.layer?.backgroundColor = NSColor.controlAccentColor
            .withAlphaComponent(0.35).cgColor
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

    func configure(index: Int) { label.stringValue = "\(index)" }
}

private final class FlowDataSource: NSObject, NSCollectionViewDataSource {
    var count: Int = 32
    func collectionView(_ cv: NSCollectionView, numberOfItemsInSection s: Int) -> Int { count }
    func collectionView(_ cv: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let it = cv.makeItem(withIdentifier: .flowTile, for: indexPath) as! FlowTileItem
        it.configure(index: indexPath.item)
        return it
    }
}

private extension NSUserInterfaceItemIdentifier {
    static let flowTile = NSUserInterfaceItemIdentifier("FlowTile")
}

private struct FlowDemo: NSViewRepresentable {
    var horizontal: Bool
    var itemSize: CGFloat
    var lineSpacing: CGFloat
    var interitem: CGFloat

    func makeCoordinator() -> FlowDataSource { FlowDataSource() }

    func makeNSView(context: Context) -> NSScrollView {
        let layout = NSCollectionViewFlowLayout()
        let cv = NSCollectionView()
        cv.collectionViewLayout = layout
        cv.dataSource = context.coordinator
        cv.isSelectable = true
        cv.backgroundColors = [.clear]
        cv.register(FlowTileItem.self, forItemWithIdentifier: .flowTile)

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.hasHorizontalScroller = true
        scroll.drawsBackground = false
        scroll.documentView = cv
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let cv = nsView.documentView as? NSCollectionView,
              let layout = cv.collectionViewLayout as? NSCollectionViewFlowLayout else { return }
        layout.scrollDirection = horizontal ? .horizontal : .vertical
        layout.itemSize = NSSize(width: itemSize, height: itemSize)
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interitem
        layout.sectionInset = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        cv.reloadData()
    }
}

struct NSCollectionViewFlowLayoutPage: View {
    @State private var horizontal: Bool = false
    @State private var itemSize: CGFloat = 64
    @State private var lineSpacing: CGFloat = 8
    @State private var interitem: CGFloat = 8

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
            Text("NSCollectionViewFlowLayout")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A layout that organizes items into a flexible and configurable flow arrangement.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSCollectionViewLayout \u{00b7} macOS 10.11+ \u{00b7} Documentation/AppKit/views-and-controls/nscollectionviewflowlayout.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "scrollDirection / itemSize / spacing exercised live") {
            VStack(alignment: .leading, spacing: 12) {
                FlowDemo(horizontal: horizontal,
                         itemSize: itemSize,
                         lineSpacing: lineSpacing,
                         interitem: interitem)
                .frame(height: 320)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Toggle("scrollDirection: horizontal", isOn: $horizontal).toggleStyle(.checkbox)
                    Stepper("itemSize: \(Int(itemSize))", value: $itemSize, in: 32...140, step: 4)
                }
                HStack(spacing: 12) {
                    Stepper("minimumLineSpacing: \(Int(lineSpacing))", value: $lineSpacing, in: 0...32, step: 2)
                    Stepper("minimumInteritemSpacing: \(Int(interitem))", value: $interitem, in: 0...32, step: 2)
                }

                APICallout("let layout = NSCollectionViewFlowLayout(); layout.scrollDirection = .vertical")
                APICallout("layout.itemSize = NSSize(width: 64, height: 64)")
                APICallout("layout.minimumLineSpacing = 8; layout.minimumInteritemSpacing = 8")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Per-section sizing via delegate") {
                snippet("""
                // Adopt NSCollectionViewDelegateFlowLayout on the cv.delegate
                func collectionView(_ cv: NSCollectionView,
                                    layout: NSCollectionViewLayout,
                                    sizeForItemAt indexPath: IndexPath) -> NSSize {
                    indexPath.item == 0 ? NSSize(width: 140, height: 80)
                                        : NSSize(width: 80, height: 80)
                }
                func collectionView(_ cv: NSCollectionView,
                                    layout: NSCollectionViewLayout,
                                    insetForSectionAt section: Int) -> NSEdgeInsets {
                    NSEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
                }
                """)
            }
            Block(title: "Headers and footers") {
                snippet("""
                layout.headerReferenceSize = NSSize(width: 0, height: 28)
                layout.footerReferenceSize = NSSize(width: 0, height: 20)
                layout.sectionHeadersPinToVisibleBounds = true
                layout.sectionFootersPinToVisibleBounds = false
                """)
            }
            Block(title: "Section collapse") {
                snippet("""
                // A section header view conforming to NSCollectionViewSectionHeaderView
                // can drive a collapse button connected to sectionCollapseButton.
                cv.collectionViewLayout?.invalidateLayout()
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Estimated sizing") {
                snippet("""
                layout.estimatedItemSize = NSSize(width: 100, height: 60)
                // Enables self-sizing items via auto layout / preferredLayoutAttributesFitting.
                """)
            }
            Block(title: "Invalidation") {
                snippet("""
                let ctx = NSCollectionViewFlowLayoutInvalidationContext()
                ctx.invalidateFlowLayoutDelegateMetrics = true
                ctx.invalidateFlowLayoutAttributes = true
                layout.invalidateLayout(with: ctx)
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSCollectionViewLayout. Default flow: items wrap horizontally then vertically (scrollDirection = .vertical).")
            noteRow("arrow.left.and.right", "Per-item sizes via NSCollectionViewDelegateFlowLayout — implement collectionView(_:layout:sizeForItemAt:).")
            noteRow("rectangle.topthird.inset.filled", "Header/footer supplementary views supported via headerReferenceSize and footerReferenceSize.")
            noteRow("clock", "macOS 10.11 vintage. The compositional-layout family (NSCollectionViewCompositionalLayout) is the modern alternative for non-uniform sections.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code).font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
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
    NSCollectionViewFlowLayoutPage().frame(width: 1100, height: 900)
}
