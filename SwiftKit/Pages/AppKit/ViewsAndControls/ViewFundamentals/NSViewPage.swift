import SwiftUI
import AppKit

// AppKit Views and Controls / View fundamentals reference page.
// Covers: NSView (class, inherits NSResponder) — the rectangular drawing and
// event-handling primitive that every visible AppKit object descends from.
// Source: Documentation/AppKit/views-and-controls/nsview.md
//
// Renderable demo: an NSViewRepresentable hosts a parent NSView containing a
// child NSView whose frame, layer-backing, and corner radius are driven from
// SwiftUI controls so the geometry / drawing surfaces are visibly exercised.

// MARK: - Bridge

private struct NSViewDemoView: NSViewRepresentable {
    var size: CGFloat
    var cornerRadius: CGFloat
    var wantsLayer: Bool
    var needsDisplayTrigger: Int

    func makeNSView(context: Context) -> NSView {
        let container = NSView(frame: NSRect(x: 0, y: 0, width: 360, height: 160))
        container.wantsLayer = true

        let child = NSView()
        child.identifier = NSUserInterfaceItemIdentifier("child")
        child.wantsLayer = true
        child.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        container.addSubview(child)

        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let child = nsView.subviews.first(where: { $0.identifier?.rawValue == "child" }) else { return }

        let containerBounds = nsView.bounds
        let centeredOrigin = NSPoint(
            x: max(0, (containerBounds.width  - size) / 2),
            y: max(0, (containerBounds.height - size) / 2)
        )
        // Drive .frame directly — NSView geometry is configured here.
        child.frame = NSRect(origin: centeredOrigin, size: NSSize(width: size, height: size))

        // .wantsLayer toggles layer-backed drawing on/off.
        child.wantsLayer = wantsLayer
        if wantsLayer {
            child.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
            child.layer?.cornerRadius = cornerRadius
        }

        // Mark the parent for redraw whenever the trigger advances — exercises
        // the needsDisplay property documented on NSView.
        nsView.needsDisplay = true
        _ = needsDisplayTrigger
    }
}

// MARK: - Page

struct NSViewPage: View {
    @State private var size: CGFloat = 96
    @State private var cornerRadius: CGFloat = 12
    @State private var wantsLayer: Bool = true
    @State private var redrawTick: Int = 0

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
            Text("NSView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("The infrastructure for drawing, printing, and handling events in an app.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSResponder \u{00b7} Documentation/AppKit/views-and-controls/nsview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "frame, wantsLayer, layer.cornerRadius — geometry and layer-backed drawing") {
            VStack(alignment: .leading, spacing: 12) {
                NSViewDemoView(
                    size: size,
                    cornerRadius: cornerRadius,
                    wantsLayer: wantsLayer,
                    needsDisplayTrigger: redrawTick
                )
                .frame(height: 160)
                .frame(maxWidth: 360)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("size").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $size, in: 32...140)
                        .frame(width: 160)
                    Text(String(format: "%.0fpt", size))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Text("cornerRadius").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $cornerRadius, in: 0...48)
                        .frame(width: 160)
                    Text(String(format: "%.0fpt", cornerRadius))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Toggle("wantsLayer", isOn: $wantsLayer)
                        .toggleStyle(.checkbox)
                        .controlSize(.regular)
                    Button("needsDisplay = true") { redrawTick += 1 }
                        .controlSize(.regular)
                }

                APICallout("let view = NSView(frame: NSRect(x: 0, y: 0, width: 96, height: 96))")
                APICallout("view.wantsLayer = true; view.layer?.cornerRadius = 12")
                Text("The hosted NSViewRepresentable manages a parent NSView with one child NSView; the controls above drive the child's frame, wantsLayer flag, and layer.cornerRadius. Each value maps directly to a property documented on NSView.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Geometry — frame and bounds") {
                snippet("""
                view.frame   // location and size in the superview's coordinate space
                view.bounds  // internal origin and size in the view's own coordinates
                view.frame = NSRect(x: 0, y: 0, width: 200, height: 120)
                """)
                Text("frame is the rectangle the view occupies inside its superview. bounds is the rectangle in the view's own coordinate system; modifying bounds.origin scrolls or translates the drawn content without moving the frame.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Display — needsDisplay and draw(_:)") {
                snippet("""
                view.needsDisplay = true   // request a redraw on the next display pass
                override func draw(_ dirtyRect: NSRect) {
                    // Custom Core Graphics drawing — rarely invoked directly.
                    // Layer-backed views may override updateLayer() instead.
                }
                """)
                Text("Set needsDisplay to mark the view for redrawing; AppKit calls draw(_:) during the next display cycle. For layer-backed views the alternative is to update layer contents directly via updateLayer().")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Hierarchy — addSubview, window, superview") {
                snippet("""
                container.addSubview(child)        // attach a subview
                child.removeFromSuperview()        // detach
                child.window                       // the NSWindow currently hosting this view
                child.superview                    // the parent NSView (nil when detached)
                """)
            }

            Block(title: "Layer-backed drawing — wantsLayer") {
                snippet("""
                view.wantsLayer = true             // opt into a backing CALayer
                view.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
                view.layer?.cornerRadius = 12
                view.layer?.masksToBounds = true
                """)
                Text("Setting wantsLayer to true gives the view its own CALayer for compositing and effects. Most modern AppKit code uses layer-backed views for masking, rounding, shadows, and Core Animation transitions.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Hidden vs visible") {
                snippet("""
                view.isHidden = true     // removes the view from display without detaching
                view.alphaValue = 0.5    // 50% transparent; 0.0 is fully transparent
                """)
            }

            Block(title: "Hit testing — isHidden and userInteractionEnabled equivalents") {
                snippet("""
                view.hitTest(point)                         // returns the deepest view at point
                view.acceptsFirstResponder                  // override to true to receive key events
                view.becomeFirstResponder()                 // request key-window focus
                """)
                Text("NSView inherits its event-handling chain from NSResponder. To handle mouse or key events, override mouseDown(with:), keyDown(with:), etc. — Apple's docs warn against calling super in these overrides since the default behavior is to pass events up the responder chain.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Animation proxy — animator()") {
                snippet("""
                NSAnimationContext.runAnimationGroup { context in
                    context.duration = 0.3
                    view.animator().frame = NSRect(x: 200, y: 0, width: 96, height: 96)
                    view.animator().alphaValue = 0.0
                }
                """)
                Text("NSView conforms to NSAnimatablePropertyContainer. Setting properties through the animator() proxy inside an NSAnimationContext block animates them implicitly.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "NSView is rarely instantiated directly — most user-interface objects descend from NSView (NSControl, NSButton, NSTextField, NSScrollView, NSStackView, etc.).")
            noteRow("hand.draw", "Default coordinate system is bottom-up (origin in the lower-left corner). Override isFlipped to true for a top-down system that matches SwiftUI / iOS conventions.")
            noteRow("rectangle.3.offgrid", "addSubview attaches a child; the child's frame is interpreted in the parent's coordinate system.")
            noteRow("paintbrush", "Custom drawing goes in draw(_:); layer-backed updates can use updateLayer() as an alternative when wantsLayer is true.")
            noteRow("link", "Conforms to NSAnimatablePropertyContainer, NSAccessibilityProtocol, NSDraggingDestination, NSAppearanceCustomization, and many more.")
            noteRow("info.circle", "Bridges into SwiftUI via NSViewRepresentable / NSViewControllerRepresentable when SwiftUI doesn't expose the AppKit surface you need.")
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
    NSViewPage().frame(width: 1100, height: 900)
}
