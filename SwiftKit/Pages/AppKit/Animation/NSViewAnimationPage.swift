import SwiftUI
import AppKit

// AppKit Animation reference page.
// Covers: NSViewAnimation (class, inherits NSAnimation) — animation object that
// takes an array of view-animation dictionaries describing target objects,
// start/end frames, and fade effects. Configurable duration, animation curve,
// frame rate, and blocking mode; supports progress marks and a delegate.
// Source: Documentation/AppKit/animation/nsviewanimation.md

// MARK: - Bridge

private struct NSViewAnimationDemoView: NSViewRepresentable {
    var trigger: Int
    var duration: TimeInterval
    var curve: NSAnimation.Curve
    var fade: Bool

    final class Coordinator {
        var animation: NSViewAnimation?
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeNSView(context: Context) -> NSView {
        let container = NSView(frame: NSRect(x: 0, y: 0, width: 360, height: 100))
        let target = NSView(frame: NSRect(x: 0, y: 26, width: 48, height: 48))
        target.wantsLayer = true
        target.layer?.backgroundColor = NSColor.controlAccentColor.cgColor
        target.layer?.cornerRadius = 8
        target.identifier = NSUserInterfaceItemIdentifier("target")
        container.addSubview(target)
        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard trigger > 0 else { return }
        guard let target = nsView.subviews.first(where: { $0.identifier?.rawValue == "target" }) else { return }

        // Stop any in-flight animation.
        context.coordinator.animation?.stop()

        let containerWidth = nsView.bounds.width.isFinite && nsView.bounds.width > 0 ? nsView.bounds.width : 360
        let atRight = (trigger % 2) == 1
        let startFrame = target.frame
        let endFrame = NSRect(
            x: atRight ? max(containerWidth - 48, 0) : 0,
            y: 26,
            width: 48,
            height: 48
        )

        // Build the view-animation dictionary.
        var dict: [NSViewAnimation.Key: Any] = [
            .target: target,
            .startFrame: NSValue(rect: startFrame),
            .endFrame: NSValue(rect: endFrame)
        ]
        if fade {
            dict[.effect] = atRight ? NSViewAnimation.EffectName.fadeIn.rawValue : NSViewAnimation.EffectName.fadeOut.rawValue
        }

        let animation = NSViewAnimation(viewAnimations: [dict])
        animation.duration = duration
        animation.animationCurve = curve
        animation.animationBlockingMode = .nonblocking
        context.coordinator.animation = animation
        animation.start()
    }

    static func dismantleNSView(_ nsView: NSView, coordinator: Coordinator) {
        // Stop any in-flight animation before SwiftUI tears down the hosted NSView.
        coordinator.animation?.stop()
        coordinator.animation = nil
    }
}

// MARK: - Page

struct NSViewAnimationPage: View {
    @State private var trigger: Int = 0
    @State private var duration: Double = 0.5
    @State private var curve: NSAnimation.Curve = .easeInOut
    @State private var fade: Bool = false

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
            Text("NSViewAnimation")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Animation object for view frame and fade-in / fade-out effects.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.4+ \u{00b7} class : NSAnimation")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init(viewAnimations:) — drive a frame animation from a dictionary") {
            VStack(alignment: .leading, spacing: 12) {
                NSViewAnimationDemoView(trigger: trigger, duration: duration, curve: curve, fade: fade)
                    .frame(height: 100)
                    .frame(maxWidth: 360)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Button("Animate") { trigger += 1 }
                        .controlSize(.regular)

                    HStack(spacing: 6) {
                        Text("duration").font(.caption).foregroundStyle(.secondary)
                        Slider(value: $duration, in: 0.2...2.0)
                            .frame(width: 140)
                        Text(String(format: "%.2fs", duration))
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }

                HStack(spacing: 12) {
                    Picker("curve", selection: $curve) {
                        Text("easeIn").tag(NSAnimation.Curve.easeIn)
                        Text("easeOut").tag(NSAnimation.Curve.easeOut)
                        Text("easeInOut").tag(NSAnimation.Curve.easeInOut)
                        Text("linear").tag(NSAnimation.Curve.linear)
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 280)

                    Toggle("Apply fade effect", isOn: $fade)
                        .toggleStyle(.checkbox)
                        .controlSize(.regular)
                }

                APICallout("NSViewAnimation(viewAnimations: [[.target: view, .startFrame: NSValue(rect:), .endFrame: NSValue(rect:)]])")
                Text("Each tap on Animate constructs a fresh NSViewAnimation with one dictionary describing the target view and its start/end frames. Duration and animationCurve are configured directly on the animation object before calling start().")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "NSViewAnimation.Key — the dictionary keys") {
                snippet("""
                // Build a viewAnimations dictionary using these keys:
                let dict: [NSViewAnimation.Key: Any] = [
                    .target:     someView,                        // the view to animate
                    .startFrame: NSValue(rect: startRect),        // optional — defaults to current frame
                    .endFrame:   NSValue(rect: endRect),          // optional — defaults to current frame
                    .effect:     NSViewAnimation.EffectName.fadeIn.rawValue   // optional fade effect
                ]
                let anim = NSViewAnimation(viewAnimations: [dict])
                anim.duration = 0.5
                anim.start()
                """)
            }

            Block(title: "NSViewAnimation.EffectName — fade values") {
                snippet("""
                NSViewAnimation.EffectName.fadeIn      // shows the view, animating opacity 0 → 1
                NSViewAnimation.EffectName.fadeOut     // hides the view, animating opacity 1 → 0
                // Stored as a String in the dictionary — pass .rawValue.
                """)
                Text("The fade effect runs alongside the frame animation if both are present in the same dictionary. Use fadeOut to dismiss; fadeIn to introduce.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Multiple targets in one animation") {
                snippet("""
                let anim = NSViewAnimation(viewAnimations: [
                    [.target: panelA, .endFrame: NSValue(rect: leftRect)],
                    [.target: panelB, .endFrame: NSValue(rect: rightRect)],
                    [.target: panelC, .effect: NSViewAnimation.EffectName.fadeOut.rawValue]
                ])
                anim.duration = 0.6
                anim.animationCurve = .easeInOut
                anim.start()
                """)
                Text("A single NSViewAnimation drives any number of view dictionaries simultaneously — they share duration, curve, blocking mode, and progress marks.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Inherited NSAnimation configuration") {
                snippet("""
                let anim = NSViewAnimation(viewAnimations: [...])
                anim.duration = 0.5                     // default 0.5s
                anim.animationCurve = .easeInOut        // default .easeInOut
                anim.animationBlockingMode = .nonblocking
                anim.frameRate = 0                      // 0 = use system default
                anim.delegate = self                    // NSAnimationDelegate
                anim.addProgressMark(0.5)               // notify at the halfway point
                anim.start()
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Animation lifecycle") {
                snippet("""
                anim.start()                  // begin animating
                anim.isAnimating              // true while running
                anim.stop()                   // jumps to end frame, fires animationDidStop
                """)
                Text("Stopping an NSViewAnimation moves the animation to its end frame — it does NOT revert to the start.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Blocking modes") {
                snippet("""
                anim.animationBlockingMode = .blocking            // synchronous
                anim.animationBlockingMode = .nonblocking         // async on main thread (default)
                anim.animationBlockingMode = .nonblockingThreaded // async on a separate thread
                """)
            }

            Block(title: "Delegate hooks") {
                snippet("""
                anim.delegate = self
                func animationShouldStart(_ animation: NSAnimation) -> Bool { true }
                func animationDidEnd(_ animation: NSAnimation) { /* completed normally */ }
                func animationDidStop(_ animation: NSAnimation) { /* stopped early */ }
                func animation(_: NSAnimation, didReachProgressMark progress: NSAnimation.Progress) {
                    // fires for each registered progress mark
                }
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "NSViewAnimation is limited to frame and fade animations. For other property animations, use the animator() proxy with NSAnimationContext.")
            noteRow("clock", "Default duration is 0.5s, default curve is .easeInOut. Override on the animation object before calling start().")
            noteRow("arrow.triangle.2.circlepath", "stop() jumps the animation to its end frame — it does not revert to the start.")
            noteRow("hand.point.up", "Multiple view dictionaries in one NSViewAnimation share a single timeline; for independent timelines use multiple NSViewAnimation instances or NSAnimationContext groupings.")
            noteRow("link", "Inherits all NSAnimation configuration: blockingMode, frameRate, animationCurve, delegate, progress marks.")
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
    NSViewAnimationPage().frame(width: 1100, height: 900)
}
