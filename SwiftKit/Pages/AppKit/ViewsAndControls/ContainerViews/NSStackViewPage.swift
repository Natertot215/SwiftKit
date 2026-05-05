import SwiftUI
import AppKit

// AppKit Views and Controls / Container views reference page.
// Covers: NSStackView (class, inherits NSView) — Auto Layout-driven horizontal
// or vertical stack of arranged views with configurable orientation, spacing,
// alignment, edge insets, distribution, and detachment behavior.
// Source: Documentation/AppKit/views-and-controls/nsstackview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSStackView with three
// labeled colored panels; SwiftUI controls drive orientation, spacing,
// alignment, and distribution.

// MARK: - Bridge

private struct NSStackViewDemo: NSViewRepresentable {
    var orientation: NSUserInterfaceLayoutOrientation
    var spacing: CGFloat
    var alignment: NSLayoutConstraint.Attribute
    var distribution: NSStackView.Distribution

    func makeNSView(context: Context) -> NSStackView {
        let stack = NSStackView(views: [
            panel("One", color: .systemBlue, intrinsicWidth: 80),
            panel("Two", color: .systemPurple, intrinsicWidth: 100),
            panel("Three", color: .systemTeal, intrinsicWidth: 90)
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }

    func updateNSView(_ nsView: NSStackView, context: Context) {
        nsView.orientation = orientation
        nsView.spacing = spacing
        nsView.alignment = alignment
        nsView.distribution = distribution
    }

    private func panel(_ title: String, color: NSColor, intrinsicWidth: CGFloat) -> NSView {
        let v = NSView()
        v.wantsLayer = true
        v.layer?.backgroundColor = color.withAlphaComponent(0.20).cgColor
        v.layer?.cornerRadius = 6
        v.translatesAutoresizingMaskIntoConstraints = false
        v.widthAnchor.constraint(greaterThanOrEqualToConstant: intrinsicWidth).isActive = true
        v.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true

        let text = NSTextField(labelWithString: title)
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

struct NSStackViewPage: View {
    @State private var orientation: NSUserInterfaceLayoutOrientation = .horizontal
    @State private var spacing: CGFloat = 12
    @State private var alignment: NSLayoutConstraint.Attribute = .centerY
    @State private var distribution: NSStackView.Distribution = .fill

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
            Text("NSStackView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that arranges an array of views horizontally or vertically and updates their placement and sizing when the window size changes.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nsstackview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init(views:) — three arranged subviews with live spacing / alignment") {
            VStack(alignment: .leading, spacing: 12) {
                NSStackViewDemo(
                    orientation: orientation,
                    spacing: spacing,
                    alignment: alignment,
                    distribution: distribution
                )
                .frame(height: 140)
                .frame(maxWidth: 480)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("orientation").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $orientation) {
                        Text(".horizontal").tag(NSUserInterfaceLayoutOrientation.horizontal)
                        Text(".vertical").tag(NSUserInterfaceLayoutOrientation.vertical)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 240)
                }

                HStack(spacing: 12) {
                    Text("spacing").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $spacing, in: 0...32)
                        .frame(width: 160)
                    Text(String(format: "%.0fpt", spacing))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Text("alignment").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $alignment) {
                        Text(".centerY").tag(NSLayoutConstraint.Attribute.centerY)
                        Text(".top").tag(NSLayoutConstraint.Attribute.top)
                        Text(".bottom").tag(NSLayoutConstraint.Attribute.bottom)
                        Text(".firstBaseline").tag(NSLayoutConstraint.Attribute.firstBaseline)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 360)
                }

                HStack(spacing: 12) {
                    Text("distribution").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $distribution) {
                        Text(".fill").tag(NSStackView.Distribution.fill)
                        Text(".fillEqually").tag(NSStackView.Distribution.fillEqually)
                        Text(".equalSpacing").tag(NSStackView.Distribution.equalSpacing)
                        Text(".gravityAreas").tag(NSStackView.Distribution.gravityAreas)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 420)
                }

                APICallout("let stack = NSStackView(views: [a, b, c])")
                APICallout("stack.orientation = .horizontal; stack.spacing = 12; stack.alignment = .centerY")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Adding views — arranged vs gravity-area APIs") {
                snippet("""
                stack.addArrangedSubview(view)              // append to the trailing edge
                stack.insertArrangedSubview(view, at: 0)
                stack.removeArrangedSubview(view)           // detaches; view stays in memory
                stack.arrangedSubviews                      // [NSView]: arranged order

                // Legacy gravity-area API (still supported, useful for three-section layouts):
                stack.addView(leadingItem,  in: .leading)
                stack.addView(centerItem,   in: .center)
                stack.addView(trailingItem, in: .trailing)
                """)
                Text("Prefer addArrangedSubview / arrangedSubviews for new code. The gravity-area API (addView(_:in:)) maps to the leading / center / trailing slots and pairs naturally with distribution = .gravityAreas.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Orientation, spacing, alignment, distribution") {
                snippet("""
                stack.orientation = .horizontal              // .horizontal or .vertical
                stack.spacing = 12                           // gap between arranged subviews
                stack.alignment = .centerY                   // perpendicular-axis alignment
                stack.distribution = .fillEqually            // .fill, .fillEqually, .fillProportionally,
                                                             //  .equalSpacing, .equalCentering, .gravityAreas
                """)
                Text("alignment uses NSLayoutConstraint.Attribute for the cross-axis. distribution governs how extra space along the main axis is divided.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Edge insets and per-subview spacing") {
                snippet("""
                stack.edgeInsets = NSEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

                stack.setCustomSpacing(20, after: middleView)
                stack.customSpacing(after: middleView)        // -> CGFloat (NSStackView.useDefaultSpacing if unset)
                """)
            }

            Block(title: "Visibility priority and detachment") {
                snippet("""
                stack.setVisibilityPriority(.notVisible, for: optionalView)
                stack.visibilityPriority(for: optionalView)   // -> NSStackView.VisibilityPriority

                // Lower clipping resistance lets views detach when there isn't enough room:
                stack.setClippingResistancePriority(.defaultLow, for: .horizontal)
                """)
                Text("Visibility priority cases: .mustHold, .detachOnlyIfNecessary, .notVisible. Stack views automatically detach lower-priority views first when space is tight.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Hugging and compression resistance") {
                snippet("""
                stack.setHuggingPriority(.defaultLow, for: .horizontal)
                stack.setHuggingPriority(.defaultHigh, for: .vertical)
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Hidden vs detached arranged subview") {
                snippet("""
                someView.isHidden = true                     // stays in the layout, takes no space
                stack.removeArrangedSubview(someView)        // detaches; view object remains in memory
                """)
                Text("isHidden keeps the view in the arrangedSubviews array but hides it visually and removes its layout participation. removeArrangedSubview detaches it; you can re-insert later.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Delegate notifications") {
                snippet("""
                final class Delegate: NSObject, NSStackViewDelegate {
                    func stackView(_ stackView: NSStackView, didReattach views: [NSView]) {}
                    func stackView(_ stackView: NSStackView, willDetach  views: [NSView]) {}
                }
                stack.delegate = Delegate()
                """)
                Text("NSStackViewDelegate fires when the stack detaches or reattaches arranged subviews in response to layout pressure.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. Built on Auto Layout — the stack manages its own constraints, you don't pin arranged subviews directly.")
            noteRow("rectangle.split.3x1", "Three gravity areas: leading, center, trailing. Default orientation is horizontal; switch to .vertical for column layouts.")
            noteRow("link", "See companion article: Organize Your User Interface with a Stack View — covers stack-view-in-scroll-view + disclosable sections.")
            noteRow("info.circle", "Per Apple: do not add views or constraints to a stack view's private views. Use the arranged-subviews API; private views may change between OS versions.")
            noteRow("eye.slash", "Stack views support detaching arranged subviews under layout pressure when clippingResistance is below required.")
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
    NSStackViewPage().frame(width: 1100, height: 900)
}
