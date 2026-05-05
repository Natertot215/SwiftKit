import SwiftUI
import AppKit

// AppKit Views and Controls / Container views reference page.
// Covers: NSTabView (class, inherits NSView) — a multipage interface that
// displays one page at a time. Pages are NSTabViewItem objects, each carrying
// an identifier, label, and view. Tab visuals are configurable via tabViewType
// and tabPosition.
// Source: Documentation/AppKit/views-and-controls/nstabview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSTabView with three
// labeled tab items; SwiftUI controls drive tabViewType and tabPosition.

// MARK: - Bridge

private struct NSTabViewDemo: NSViewRepresentable {
    var tabType: NSTabView.TabType
    var tabPosition: NSTabView.TabPosition

    func makeNSView(context: Context) -> NSTabView {
        let tabs = NSTabView()
        tabs.translatesAutoresizingMaskIntoConstraints = false
        tabs.addTabViewItem(item(label: "General",  body: "General settings"))
        tabs.addTabViewItem(item(label: "Privacy",  body: "Privacy controls"))
        tabs.addTabViewItem(item(label: "Advanced", body: "Advanced options"))
        return tabs
    }

    func updateNSView(_ nsView: NSTabView, context: Context) {
        nsView.tabViewType = tabType
        nsView.tabPosition = tabPosition
    }

    private func item(label: String, body: String) -> NSTabViewItem {
        let item = NSTabViewItem(identifier: label as NSString)
        item.label = label
        let v = NSView()
        let text = NSTextField(labelWithString: body)
        text.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(text)
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: v.centerYAnchor)
        ])
        item.view = v
        return item
    }
}

// MARK: - Page

struct NSTabViewPage: View {
    @State private var tabType: NSTabView.TabType = .topTabsBezelBorder
    @State private var tabPosition: NSTabView.TabPosition = .top

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
            Text("NSTabView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A multipage interface that displays one page at a time.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nstabview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "addTabViewItem — three tabs with labels") {
            VStack(alignment: .leading, spacing: 12) {
                NSTabViewDemo(tabType: tabType, tabPosition: tabPosition)
                    .frame(height: 220)
                    .frame(maxWidth: 480)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("tabViewType").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $tabType) {
                        Text(".topTabsBezelBorder").tag(NSTabView.TabType.topTabsBezelBorder)
                        Text(".leftTabsBezelBorder").tag(NSTabView.TabType.leftTabsBezelBorder)
                        Text(".bottomTabsBezelBorder").tag(NSTabView.TabType.bottomTabsBezelBorder)
                        Text(".rightTabsBezelBorder").tag(NSTabView.TabType.rightTabsBezelBorder)
                        Text(".noTabsBezelBorder").tag(NSTabView.TabType.noTabsBezelBorder)
                        Text(".noTabsLineBorder").tag(NSTabView.TabType.noTabsLineBorder)
                        Text(".noTabsNoBorder").tag(NSTabView.TabType.noTabsNoBorder)
                    }
                    .labelsHidden()
                    .frame(width: 240)
                }

                APICallout("let tabs = NSTabView()")
                APICallout("let item = NSTabViewItem(identifier: \"General\"); item.label = \"General\"; item.view = pane")
                APICallout("tabs.addTabViewItem(item)")
                Text("Click a tab in the demo above to switch pages. Use the picker to flip between Apple's documented tab-view types.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Adding and removing tabs") {
                snippet("""
                let item = NSTabViewItem(identifier: "general" as NSString)
                item.label = "General"
                item.view = generalPane
                tabs.addTabViewItem(item)
                tabs.insertTabViewItem(item2, at: 0)
                tabs.removeTabViewItem(item)
                tabs.tabViewItems                                  // [NSTabViewItem]
                tabs.numberOfTabViewItems                          // Int
                """)
            }

            Block(title: "Selection") {
                snippet("""
                tabs.selectTabViewItem(item)
                tabs.selectTabViewItem(at: 0)
                tabs.selectTabViewItem(withIdentifier: "general" as NSString)
                tabs.selectFirstTabViewItem(nil)
                tabs.selectNextTabViewItem(nil)
                tabs.selectPreviousTabViewItem(nil)
                tabs.selectedTabViewItem                            // NSTabViewItem?
                """)
            }

            Block(title: "Tab visuals — TabType and TabPosition") {
                snippet("""
                // TabType: where the tab bar lives, plus border style:
                tabs.tabViewType = .topTabsBezelBorder              // also: .leftTabsBezelBorder,
                                                                     //  .bottomTabsBezelBorder, .rightTabsBezelBorder,
                                                                     //  .noTabsBezelBorder, .noTabsLineBorder,
                                                                     //  .noTabsNoBorder

                tabs.tabPosition = .top                              // .none, .top, .left, .bottom, .right
                tabs.tabViewBorderType = .line                       // .none, .line, .bezel
                tabs.font = NSFont.preferredFont(forTextStyle: .body)
                """)
                Text("tabViewType + tabPosition together control the visual style. The .noTabs… variants hide the tab bar entirely — useful when an external NSSegmentedControl drives selection.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Truncation, sizing, and background") {
                snippet("""
                tabs.allowsTruncatedLabels = true
                tabs.controlSize = .regular                          // .mini, .small, .regular, .large
                tabs.minimumSize                                     // CGSize
                tabs.contentRect                                     // NSRect
                tabs.drawsBackground = true                          // only meaningful for .noTabsNoBorder
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Delegate hooks") {
                snippet("""
                final class Delegate: NSObject, NSTabViewDelegate {
                    func tabView(_ tabView: NSTabView, shouldSelect tabViewItem: NSTabViewItem?) -> Bool { true }
                    func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?) {}
                    func tabView(_ tabView: NSTabView, didSelect  tabViewItem: NSTabViewItem?) {}
                    func tabViewDidChangeNumberOfTabViewItems(_ tabView: NSTabView) {}
                }
                tabs.delegate = Delegate()
                """)
            }

            Block(title: "Hit testing tabs at a point") {
                snippet("""
                let hit = tabs.tabViewItem(at: pointInTabView)       // -> NSTabViewItem?
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. SwiftUI's TabView is the modern equivalent for top-level tabbed apps; NSTabView remains useful inside dialogs and inspectors.")
            noteRow("rectangle.split.3x1", "Each page is an NSTabViewItem with identifier, label, and view. The tab view manages page swapping and tab drawing.")
            noteRow("link", "Higher-level container: NSTabViewController + NSTabViewItem (in view-management) wraps NSTabView with a view-controller container.")
            noteRow("info.circle", "controlTint is deprecated — use tint via the standard system accent color flow (NSColor.controlAccentColor).")
            noteRow("paintbrush", "Choose .noTabsNoBorder + an external NSSegmentedControl for app-style multi-pane interfaces (e.g. System Settings panes, Xcode inspectors).")
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
    NSTabViewPage().frame(width: 1100, height: 900)
}
