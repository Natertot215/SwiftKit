import SwiftUI
import AppKit

// AppKit Views and Controls / Container views reference page.
// Covers: NSScrollView (class, inherits NSView) — the central coordinator for
// AppKit's scrolling machinery. Hosts a documentView, manages an NSClipView,
// optional NSScrollers and NSRulerViews, magnification, and content-insets.
// Source: Documentation/AppKit/views-and-controls/nsscrollview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSScrollView whose document
// view is a tall NSView with stacked colored rows. SwiftUI controls drive
// hasVerticalScroller, autohidesScrollers, drawsBackground, and rulersVisible.

// MARK: - Bridge

private struct NSScrollViewDemo: NSViewRepresentable {
    var hasVertical: Bool
    var hasHorizontal: Bool
    var autohides: Bool
    var drawsBackground: Bool
    var rulersVisible: Bool

    func makeNSView(context: Context) -> NSScrollView {
        let scroll = NSScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.hasHorizontalRuler = true
        scroll.hasVerticalRuler = true
        scroll.borderType = .lineBorder

        let doc = NSView(frame: NSRect(x: 0, y: 0, width: 480, height: 800))
        doc.wantsLayer = true
        let palette: [NSColor] = [.systemBlue, .systemPurple, .systemTeal, .systemPink, .systemIndigo,
                                  .systemMint, .systemOrange, .systemYellow, .systemGreen, .systemBrown]
        for i in 0..<10 {
            let row = NSView(frame: NSRect(x: 0, y: CGFloat(i) * 80, width: 480, height: 70))
            row.wantsLayer = true
            row.layer?.backgroundColor = palette[i % palette.count].withAlphaComponent(0.18).cgColor
            row.layer?.cornerRadius = 6

            let label = NSTextField(labelWithString: "Row \(i + 1)")
            label.translatesAutoresizingMaskIntoConstraints = false
            row.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: row.leadingAnchor, constant: 12),
                label.centerYAnchor.constraint(equalTo: row.centerYAnchor)
            ])
            doc.addSubview(row)
        }

        scroll.documentView = doc
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        nsView.hasVerticalScroller = hasVertical
        nsView.hasHorizontalScroller = hasHorizontal
        nsView.autohidesScrollers = autohides
        nsView.drawsBackground = drawsBackground
        nsView.rulersVisible = rulersVisible
    }
}

// MARK: - Page

struct NSScrollViewPage: View {
    @State private var hasVertical: Bool = true
    @State private var hasHorizontal: Bool = false
    @State private var autohides: Bool = true
    @State private var drawsBackground: Bool = true
    @State private var rulersVisible: Bool = false

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
            Text("NSScrollView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that displays a portion of a document view and provides scroll bars.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nsscrollview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "documentView — scroll a tall column of colored rows") {
            VStack(alignment: .leading, spacing: 12) {
                NSScrollViewDemo(
                    hasVertical: hasVertical,
                    hasHorizontal: hasHorizontal,
                    autohides: autohides,
                    drawsBackground: drawsBackground,
                    rulersVisible: rulersVisible
                )
                .frame(height: 240)
                .frame(maxWidth: 480)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Toggle("hasVerticalScroller", isOn: $hasVertical).toggleStyle(.checkbox)
                    Toggle("hasHorizontalScroller", isOn: $hasHorizontal).toggleStyle(.checkbox)
                }
                HStack(spacing: 12) {
                    Toggle("autohidesScrollers", isOn: $autohides).toggleStyle(.checkbox)
                    Toggle("drawsBackground", isOn: $drawsBackground).toggleStyle(.checkbox)
                    Toggle("rulersVisible", isOn: $rulersVisible).toggleStyle(.checkbox)
                }

                APICallout("let scroll = NSScrollView(); scroll.documentView = bigContentView")
                APICallout("scroll.hasVerticalScroller = true; scroll.autohidesScrollers = true")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Document and clip views") {
                snippet("""
                scroll.documentView = bigContentView          // the content being scrolled
                scroll.contentView                            // the NSClipView clipping documentView
                scroll.addFloatingSubview(badge, for: .vertical)   // a subview that stays put while scrolling
                """)
                Text("documentView is the content. contentView is an NSClipView the scroll view manages — you rarely touch it directly.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Scrollers") {
                snippet("""
                scroll.hasVerticalScroller = true
                scroll.hasHorizontalScroller = false
                scroll.autohidesScrollers = true              // overlay scrollers fade out when idle
                scroll.verticalScroller                       // -> NSScroller?
                scroll.horizontalScroller                     // -> NSScroller?
                """)
            }

            Block(title: "Borders and background") {
                snippet("""
                scroll.borderType = .lineBorder               // .noBorder, .lineBorder, .bezelBorder, .grooveBorder
                scroll.drawsBackground = true
                scroll.backgroundColor = NSColor.textBackgroundColor
                """)
            }

            Block(title: "Magnification") {
                snippet("""
                scroll.allowsMagnification = true
                scroll.minMagnification = 0.25
                scroll.maxMagnification = 4.0
                scroll.magnification = 1.0
                scroll.magnify(toFit: targetRectInDocumentView)
                scroll.setMagnification(1.5, centeredAt: NSPoint(x: 200, y: 200))
                """)
            }

            Block(title: "Rulers") {
                snippet("""
                scroll.hasHorizontalRuler = true
                scroll.hasVerticalRuler = true
                scroll.rulersVisible = true
                scroll.horizontalRulerView                  // -> NSRulerView?
                scroll.verticalRulerView                    // -> NSRulerView?
                """)
                Text("Rulers attach automatically once the corresponding hasXRuler is true; flipping rulersVisible toggles their on-screen presence.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Scrolling behavior") {
                snippet("""
                scroll.lineScroll = 16                       // px per arrow keypress
                scroll.pageScroll = 240                      // px to keep visible on Page Down
                scroll.scrollsDynamically = true             // redraw while scrolling, not just at end
                scroll.contentInsets = NSEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Scroller style") {
                snippet("""
                NSScroller.preferredScrollerStyle             // .legacy or .overlay
                NSScroller.isCompatibleWithOverlayScrollers   // -> Bool

                // Observe system-wide changes:
                NotificationCenter.default.addObserver(
                    forName: NSScroller.preferredScrollerStyleDidChangeNotification,
                    object: nil,
                    queue: .main
                ) { _ in /* the user toggled "Show scroll bars" in Settings */ }
                """)
            }

            Block(title: "Wrapping NSTextView / NSTableView / NSCollectionView") {
                snippet("""
                let textView = NSTextView()
                textView.autoresizingMask = [.width]
                let scroll = NSScrollView()
                scroll.hasVerticalScroller = true
                scroll.documentView = textView

                // NSTableView ships with NSScrollView wrapping baked in:
                let scrollHostingTable = NSTableView.scrollableTableView()
                """)
                Text("Big AppKit content views (NSTextView, NSTableView, NSCollectionView, NSOutlineView) are designed to live inside an NSScrollView. Several have factory helpers — NSTableView.scrollableTableView() returns an NSScrollView pre-wired with the table.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. The central coordinator of AppKit scrolling — owns the clip view, scrollers, and optional rulers.")
            noteRow("rectangle.center.inset.filled", "documentView is the content; contentView is the NSClipView; horizontalScroller/verticalScroller are NSScroller instances. NSScrollView wires them together.")
            noteRow("link", "Pair with NSTextView, NSTableView, NSCollectionView, NSOutlineView — these expect to live inside an NSScrollView.")
            noteRow("info.circle", "Apple's docs say: when using NSClipView inside NSScrollView (the usual config), set background-related properties on the scroll view, not the clip view.")
            noteRow("magnifyingglass", "Magnification supports trackpad pinch and programmatic zoom; bound by minMagnification / maxMagnification.")
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
    NSScrollViewPage().frame(width: 1100, height: 900)
}
