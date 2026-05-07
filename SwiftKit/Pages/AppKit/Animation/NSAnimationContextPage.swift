import SwiftUI
import AppKit

// AppKit Animation reference page.
// Covers: NSAnimationContext (class) — grouping API for implicit animations
// driven through the animator() proxy on any NSAnimatablePropertyContainer
// conformer.
// Source: Documentation/AppKit/animation/nsanimationcontext.md

// MARK: - Default demo bridge — simple frame animation

private struct AnimatedTileView: NSViewRepresentable {
    var expanded: Bool
    var duration: Double

    func makeNSView(context: Context) -> NSView {
        let container = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 80))
        let tile = NSView(frame: NSRect(x: 0, y: 16, width: 48, height: 48))
        tile.wantsLayer = true
        tile.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        tile.layer?.cornerRadius = 8
        tile.identifier = NSUserInterfaceItemIdentifier("tile")
        container.addSubview(tile)
        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let tile = nsView.subviews.first(where: { $0.identifier?.rawValue == "tile" }) else { return }
        let containerWidth = nsView.bounds.width.isFinite && nsView.bounds.width > 0 ? nsView.bounds.width : 320
        let targetX: CGFloat = expanded ? max(containerWidth - 48, 0) : 0
        let targetFrame = NSRect(x: targetX, y: 16, width: 48, height: 48)

        // Skip work if we're already at the target — avoids redundant runAnimationGroup
        // calls during initial layout passes and bounds-only redraws.
        if tile.frame == targetFrame { return }

        NSAnimationContext.runAnimationGroup { ctx in
            ctx.duration = duration
            ctx.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            ctx.allowsImplicitAnimation = true
            tile.animator().frame = targetFrame
        }
    }
}

// MARK: - Variants demo bridge — nested groupings + alpha

private struct NestedGroupingsDemoView: NSViewRepresentable {
    var trigger: Int

    func makeNSView(context: Context) -> NSView {
        let container = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 80))
        for i in 0..<3 {
            let dot = NSView(frame: NSRect(x: CGFloat(i) * 64 + 24, y: 16, width: 48, height: 48))
            dot.wantsLayer = true
            dot.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
            dot.layer?.cornerRadius = 24
            dot.identifier = NSUserInterfaceItemIdentifier("dot-\(i)")
            container.addSubview(dot)
        }
        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard trigger > 0 else { return }   // skip the initial layout pass — no visible state change
        let dots = nsView.subviews
        guard dots.count == 3 else { return }
        let toggled = (trigger % 2) == 1

        NSAnimationContext.beginGrouping()
        NSAnimationContext.current.duration = 0.6
        NSAnimationContext.current.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        NSAnimationContext.current.allowsImplicitAnimation = true
        for (i, dot) in dots.enumerated() {
            let baseX = CGFloat(i) * 64 + 24
            dot.animator().frame = NSRect(x: baseX, y: toggled ? 4 : 28, width: 48, height: 48)
        }

        // Inner grouping: shorter duration controlling alpha only.
        NSAnimationContext.beginGrouping()
        NSAnimationContext.current.duration = 0.25
        NSAnimationContext.current.allowsImplicitAnimation = true
        for dot in dots {
            dot.animator().alphaValue = toggled ? 0.5 : 1.0
        }
        NSAnimationContext.endGrouping()

        NSAnimationContext.endGrouping()
    }
}

// MARK: - Page

struct NSAnimationContextPage: View {
    @State private var expanded = false
    @State private var duration: Double = 0.45
    @State private var nestedTrigger: Int = 0

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
            Text("NSAnimationContext")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Grouping API for implicit animations driven through animator() proxies.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.5+ \u{00b7} class")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "runAnimationGroup — animate an NSView's frame via the animator() proxy") {
            VStack(alignment: .leading, spacing: 12) {
                AnimatedTileView(expanded: expanded, duration: duration)
                    .frame(height: 80)
                    .frame(maxWidth: 320)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Button(expanded ? "Animate Back" : "Animate Frame") {
                        expanded.toggle()
                    }
                    .controlSize(.regular)

                    HStack(spacing: 6) {
                        Text("duration").font(.caption).foregroundStyle(.secondary)
                        Slider(value: $duration, in: 0.1...1.5)
                            .frame(width: 160)
                        Text(String(format: "%.2fs", duration))
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }

                APICallout("NSAnimationContext.runAnimationGroup { ctx in ctx.duration = 0.45; tile.animator().frame = newFrame }")
                Text("The blue tile is an NSView inside an NSViewRepresentable. Each toggle re-runs runAnimationGroup, which sets ctx.duration / timingFunction / allowsImplicitAnimation and then assigns a new frame through the animator() proxy.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Nested groupings — independent durations on the same animation pass") {
                VStack(alignment: .leading, spacing: 12) {
                    NestedGroupingsDemoView(trigger: nestedTrigger)
                        .frame(height: 80)
                        .frame(maxWidth: 320)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                    Button("Toggle Nested Animations") { nestedTrigger += 1 }

                    snippet("""
                    NSAnimationContext.beginGrouping()
                    NSAnimationContext.current.duration = 0.6     // outer: frame change
                    for dot in dots {
                        dot.animator().frame = newFrame
                    }
                    NSAnimationContext.beginGrouping()
                    NSAnimationContext.current.duration = 0.25    // inner: alpha only
                    for dot in dots {
                        dot.animator().alphaValue = 0.5
                    }
                    NSAnimationContext.endGrouping()
                    NSAnimationContext.endGrouping()
                    """)
                    Text("Each thread maintains its own stack of NSAnimationContext instances. New contexts inherit from the one below; nested groupings let alpha animate at one duration while frame animates at another.")
                        .font(.footnote).foregroundStyle(.secondary)
                }
            }

            Block(title: "runAnimationGroup variants") {
                snippet("""
                // 1) Closure form — implicit begin/end:
                NSAnimationContext.runAnimationGroup { ctx in
                    ctx.duration = 0.3
                    view.animator().frame = newFrame
                }

                // 2) Closure + completion:
                NSAnimationContext.runAnimationGroup({ ctx in
                    ctx.duration = 0.3
                    view.animator().alphaValue = 0
                }, completionHandler: {
                    view.removeFromSuperview()
                })

                // 3) Manual begin/end:
                NSAnimationContext.beginGrouping()
                NSAnimationContext.current.duration = 0.3
                view.animator().frame = newFrame
                NSAnimationContext.endGrouping()
                """)
            }

            Block(title: "Implicit animations on SwiftUI-internal AppKit views") {
                snippet("""
                // allowsImplicitAnimation lets layout-driven property changes
                // animate without going through the animator() proxy:
                NSAnimationContext.runAnimationGroup { ctx in
                    ctx.duration = 0.3
                    ctx.allowsImplicitAnimation = true
                    view.frame = newFrame   // animates without .animator()
                }
                """)
                Text("allowsImplicitAnimation is opt-in. By default only sends through animator() animate; with this flag set, any property setter inside the grouping participates.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Configuring the timing curve") {
                snippet("""
                NSAnimationContext.runAnimationGroup { ctx in
                    ctx.duration = 0.4
                    ctx.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                    // Other names: .linear, .easeIn, .easeOut, .default
                    ctx.allowsImplicitAnimation = true
                    panel.animator().frame = expanded
                }
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Stack semantics — current vs. nested") {
                snippet("""
                NSAnimationContext.current        // → topmost context on this thread's stack
                NSAnimationContext.beginGrouping()
                NSAnimationContext.current        // → newly pushed context
                NSAnimationContext.endGrouping()  // pops it back

                // Each new instance is initialized as a copy of the one below,
                // so nested code can override duration without changing the parent's.
                """)
            }

            Block(title: "Cancelling an in-flight animation") {
                snippet("""
                // Setting a property inside a duration:0 grouping snaps to the
                // new value without animation — useful to cancel an in-flight
                // animator() animation:
                NSAnimationContext.runAnimationGroup { ctx in
                    ctx.duration = 0
                    view.animator().frame = stableFrame
                }
                """)
            }

            Block(title: "SwiftUI bridge — NSAnimationContext.animate") {
                snippet("""
                // macOS 14.0+: drive AppKit animations from a SwiftUI Animation:
                NSAnimationContext.animate(.spring(response: 0.4)) {
                    view.animator().frame = newFrame
                } completion: {
                    // ran when the spring settles
                }
                """)
                Text("Brings SwiftUI's animation timing model (spring, ease, custom curves) into AppKit's animator() pipeline.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("rectangle.stack", "NSAnimationContext is analogous to CATransaction. Each thread keeps its own stack; nested groupings inherit and override.")
            noteRow("hand.tap", "Animations only fire when properties are set on the animator() proxy — unless allowsImplicitAnimation is true, in which case any setter inside the grouping participates.")
            noteRow("clock", "completionHandler on a grouping fires after the longest-running animation in that grouping settles.")
            noteRow("arrow.uturn.backward", "Cancel an in-flight animation by setting the property again inside a duration:0 grouping.")
            noteRow("link", "See also: NSViewAnimation (frame/fade animation objects), NSAnimatablePropertyContainer (the animator() protocol).")
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

extension NSAnimationContextPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.animation.nsAnimationContext",
        title: "NSAnimationContext",
        folder: "Animation",
        framework: .appKit,
        absorbedSymbols: [
            "NSAnimationContext"
        ],
        blurb: "Grouping API for implicit animations driven through the animator() proxy on any NSAnimatablePropertyContainer conformer. Supports nested groupings, duration, and timing functions.",
        signature: "class NSAnimationContext : NSObject",
        availability: "macOS 10.5+",
        docPath: "Documentation/AppKit/animation/nsanimationcontext.md",
        page: { AnyView(NSAnimationContextPage()) }
    )
}

#Preview {
    NSAnimationContextPage().frame(width: 1100, height: 900)
}
