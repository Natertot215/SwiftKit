import SwiftUI
import AppKit

// AppKit Views and Controls / Container views reference page.
// Covers: NSSplitView (class, inherits NSView) — arranges two or more views in
// a linear stack with draggable dividers between them. Configurable orientation
// (isVertical), divider style, and per-pane holding priority that controls
// which pane absorbs window resize events.
// Source: Documentation/AppKit/views-and-controls/nssplitview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSSplitView with three
// arranged panes; SwiftUI controls drive isVertical and dividerStyle.

// MARK: - Bridge

private struct NSSplitViewDemo: NSViewRepresentable {
    var isVertical: Bool
    var dividerStyle: NSSplitView.DividerStyle

    final class Coordinator {
        var lastIsVertical: Bool? = nil
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeNSView(context: Context) -> NSSplitView {
        let split = NSSplitView()
        split.translatesAutoresizingMaskIntoConstraints = false
        split.addArrangedSubview(panel(label: "Pane 1", color: .systemBlue))
        split.addArrangedSubview(panel(label: "Pane 2", color: .systemPurple))
        split.addArrangedSubview(panel(label: "Pane 3", color: .systemTeal))
        return split
    }

    func updateNSView(_ nsView: NSSplitView, context: Context) {
        // Re-snap divider positions only when orientation actually changes — not on
        // every redraw — so a user dragging the divider doesn't snap back instantly.
        let orientationChanged = (context.coordinator.lastIsVertical != isVertical)
        nsView.isVertical = isVertical
        nsView.dividerStyle = dividerStyle
        if orientationChanged {
            DispatchQueue.main.async {
                let extent = isVertical ? nsView.bounds.width : nsView.bounds.height
                guard extent > 0 else { return }
                nsView.setPosition(extent / 3,        ofDividerAt: 0)
                nsView.setPosition(2 * extent / 3,    ofDividerAt: 1)
            }
            context.coordinator.lastIsVertical = isVertical
        }
    }

    private func panel(label: String, color: NSColor) -> NSView {
        let v = NSView()
        v.wantsLayer = true
        v.layer?.backgroundColor = color.withAlphaComponent(0.18).cgColor
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        v.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        let text = NSTextField(labelWithString: label)
        text.textColor = NSColor.labelColor
        text.font = NSFont.preferredFont(forTextStyle: .body)
        text.translatesAutoresizingMaskIntoConstraints = false
        v.addSubview(text)
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: v.centerYAnchor)
        ])
        return v
    }
}

// MARK: - Page

struct NSSplitViewPage: View {
    @State private var isVertical: Bool = true
    @State private var dividerStyle: NSSplitView.DividerStyle = .thin

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
            Text("NSSplitView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that arranges two or more views in a linear stack running horizontally or vertically.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nssplitview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "addArrangedSubview — three panes with draggable dividers") {
            VStack(alignment: .leading, spacing: 12) {
                NSSplitViewDemo(isVertical: isVertical, dividerStyle: dividerStyle)
                    .frame(height: 200)
                    .frame(maxWidth: 480)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("isVertical").font(.caption).foregroundStyle(.secondary)
                    Toggle("vertical dividers (panes side-by-side)", isOn: $isVertical)
                        .toggleStyle(.checkbox)
                }

                HStack(spacing: 12) {
                    Text("dividerStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $dividerStyle) {
                        Text(".thin").tag(NSSplitView.DividerStyle.thin)
                        Text(".thick").tag(NSSplitView.DividerStyle.thick)
                        Text(".paneSplitter").tag(NSSplitView.DividerStyle.paneSplitter)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                }

                APICallout("let split = NSSplitView(); split.isVertical = true; split.dividerStyle = .thin")
                APICallout("split.addArrangedSubview(pane1); split.addArrangedSubview(pane2)")
                Text("Drag the divider in the demo above to resize the panes.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Arranging subviews — addArrangedSubview vs addSubview") {
                snippet("""
                split.addArrangedSubview(pane1)        // adds and arranges the view as a pane
                split.insertArrangedSubview(pane2, at: 0)
                split.removeArrangedSubview(pane3)     // detaches but keeps the view
                split.arrangedSubviews                 // [NSView]: the panes in order
                split.arrangesAllSubviews              // default true; if false, manage panes manually
                """)
                Text("Use addArrangedSubview for the modern arranged-subviews API. The split view manages dividers automatically; addSubview alone won't make a view a pane.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Orientation and divider style") {
                snippet("""
                split.isVertical = true                // dividers are vertical lines; panes side-by-side
                split.isVertical = false               // dividers are horizontal; panes stacked top-to-bottom

                split.dividerStyle = .thin             // 1pt, the default
                split.dividerStyle = .thick            // 9pt, more grabbable
                split.dividerStyle = .paneSplitter     // legacy "groove" pane splitter look
                """)
            }

            Block(title: "Holding priority — which pane absorbs window resizes") {
                snippet("""
                split.setHoldingPriority(.defaultHigh, forSubviewAt: 0)  // pane 0 keeps its size
                split.holdingPriorityForSubview(at: 0)                   // -> NSLayoutConstraint.Priority
                """)
                Text("Higher holding priority means the pane resists growing or shrinking when the window resizes — the lower-priority pane absorbs the change. NSSplitViewController exposes the same idea via NSSplitViewItem.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Programmatic divider position") {
                snippet("""
                split.setPosition(240, ofDividerAt: 0)                     // moves the first divider to x=240
                let minX = split.minPossiblePositionOfDivider(at: 0)       // CGFloat
                let maxX = split.maxPossiblePositionOfDivider(at: 0)
                split.adjustSubviews()                                     // re-resolve layout
                """)
            }

            Block(title: "Autosave and notifications") {
                snippet("""
                split.autosaveName = "MainSplit"                            // persists divider positions

                NotificationCenter.default.addObserver(
                    forName: NSSplitView.didResizeSubviewsNotification,
                    object: split,
                    queue: .main
                ) { _ in /* after a resize completes */ }
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Collapsed pane") {
                snippet("""
                split.isSubviewCollapsed(pane1)       // -> Bool
                // Collapsing a pane requires NSSplitViewDelegate.splitView(_:canCollapseSubview:) to return true.
                """)
                Text("NSSplitView itself doesn't collapse panes automatically — the delegate decides. NSSplitViewController + NSSplitViewItem implement the standard collapse-and-hide behavior.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Drag tracking") {
                snippet("""
                final class Delegate: NSObject, NSSplitViewDelegate {
                    func splitView(_ splitView: NSSplitView, canCollapseSubview subview: NSView) -> Bool { true }
                    func splitView(_ splitView: NSSplitView, constrainSplitPosition proposedPosition: CGFloat,
                                   ofSubviewAt dividerIndex: Int) -> CGFloat {
                        max(160, min(proposedPosition, 480))   // clamp the user's drag
                    }
                }
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. SwiftUI's NavigationSplitView is the modern equivalent for sidebar/content/detail layouts.")
            noteRow("rectangle.split.2x1", "Default isVertical = false: dividers run horizontally, panes stack top-to-bottom. Set isVertical = true for side-by-side panes.")
            noteRow("ruler", "Divider indices are zero-based. With isVertical = false the top divider has index 0; with isVertical = true the leading divider has index 0.")
            noteRow("link", "Pair with NSSplitViewController + NSSplitViewItem for the standard collapse/sidebar behavior — NSSplitView alone is the lower-level building block.")
            noteRow("info.circle", "autosaveName persists divider positions across launches. Set it on the split view, not the controller.")
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
    NSSplitViewPage().frame(width: 1100, height: 900)
}
