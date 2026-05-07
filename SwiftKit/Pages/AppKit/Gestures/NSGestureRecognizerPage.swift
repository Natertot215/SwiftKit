import SwiftUI
import AppKit

// AppKit Gestures — NSGestureRecognizer and standard gesture recognizer types.
//
// Absorbed leaves:
//   Standard Gestures: NSClickGestureRecognizer, NSPressGestureRecognizer,
//                      NSPanGestureRecognizer, NSRotationGestureRecognizer,
//                      NSMagnificationGestureRecognizer
//   Custom Gestures:   NSGestureRecognizer, NSGestureRecognizerDelegate

// MARK: - Bridges

private struct NSGesturesDemoVC: NSViewControllerRepresentable {
    @Binding var log: [String]

    func makeNSViewController(context: Context) -> NSViewController {
        let vc = NSViewController()
        let view = DemoCanvas(log: context.coordinator.log)
        view.frame = NSRect(x: 0, y: 0, width: 360, height: 120)
        vc.view = view
        return vc
    }

    func updateNSViewController(_ nsViewController: NSViewController, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator(log: $log) }

    final class Coordinator: NSObject {
        let log: Binding<[String]>
        init(log: Binding<[String]>) { self.log = log }
    }

    class DemoCanvas: NSView {
        var log: Binding<[String]>

        init(log: Binding<[String]>) {
            self.log = log
            super.init(frame: .zero)
            let click = NSClickGestureRecognizer(target: self, action: #selector(handleClick(_:)))
            addGestureRecognizer(click)

            let press = NSPressGestureRecognizer(target: self, action: #selector(handlePress(_:)))
            press.minimumPressDuration = 0.4
            addGestureRecognizer(press)

            let mag = NSMagnificationGestureRecognizer(target: self, action: #selector(handleMag(_:)))
            addGestureRecognizer(mag)

            let rot = NSRotationGestureRecognizer(target: self, action: #selector(handleRot(_:)))
            addGestureRecognizer(rot)
        }

        required init?(coder: NSCoder) { fatalError() }

        override func draw(_ dirtyRect: NSRect) {
            NSColor.windowBackgroundColor.setFill()
            dirtyRect.fill()
            let label = NSAttributedString(string: "Click, long-press, pinch, or rotate here", attributes: [
                .font: NSFont.systemFont(ofSize: 13),
                .foregroundColor: NSColor.secondaryLabelColor
            ])
            label.draw(at: NSPoint(x: 20, y: 50))
        }

        @objc func handleClick(_ gr: NSClickGestureRecognizer) {
            log.wrappedValue.append("click at \(gr.location(in: self))")
        }
        @objc func handlePress(_ gr: NSPressGestureRecognizer) {
            if gr.state == .began { log.wrappedValue.append("long press began") }
        }
        @objc func handleMag(_ gr: NSMagnificationGestureRecognizer) {
            if gr.state == .changed { log.wrappedValue.append(String(format: "magnification %.2f", gr.magnification)) }
        }
        @objc func handleRot(_ gr: NSRotationGestureRecognizer) {
            if gr.state == .changed { log.wrappedValue.append(String(format: "rotation %.2f°", gr.rotation)) }
        }
    }
}

// MARK: - Page

struct NSGestureRecognizerPage: View {
    @State private var log: [String] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                demoSection
                baseClassSection
                standardGesturesSection
                delegateSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Gestures")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSGestureRecognizer and standard recognizer types: click, press, pan, rotation, and magnification.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSGestureRecognizer macOS 10.10+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var demoSection: some View {
        PageSection("Live Gesture Demo") {
            VStack(alignment: .leading, spacing: 12) {
                NSGesturesDemoVC(log: $log)
                    .frame(height: 120)
                    .frame(maxWidth: 400)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                if !log.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 2) {
                            ForEach(log.suffix(8).reversed(), id: \.self) { entry in
                                Text(entry)
                                    .font(.caption).fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .frame(height: 80)
                    .padding(8)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                Button("Clear log") { log.removeAll() }
                    .buttonStyle(.borderless)
                    .controlSize(.small)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var baseClassSection: some View {
        PageSection("Reference \u{2014} NSGestureRecognizer") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSGestureRecognizer",
                    kind: "class : NSObject (abstract)",
                    availability: "macOS 10.10+",
                    blurb: "The abstract base for all AppKit gesture recognizers. Subclass to build custom recognizers. Gesture recognizers receive NSEvent objects before the view's event methods."
                ) {
                    snippet("""
                    class NSGestureRecognizer: NSObject

                    init(target: Any?, action: Selector?)
                    var target: AnyObject? { get set }
                    var action: Selector? { get set }

                    // State machine:
                    var state: NSGestureRecognizer.State { get }
                    // .possible → .began → .changed → .ended / .cancelled / .failed

                    var isEnabled: Bool
                    var delaysKeyEvents: Bool
                    var delaysMagnificationEvents: Bool
                    var delaysPrimaryMouseButtonEvents: Bool
                    var delaysSecondaryMouseButtonEvents: Bool
                    var delaysOtherMouseButtonEvents: Bool
                    var delaysRotationEvents: Bool

                    var delegate: NSGestureRecognizerDelegate? { get set }

                    // Hit testing:
                    func location(in view: NSView?) -> NSPoint
                    var view: NSView? { get }

                    // Coordination:
                    func require(toFail otherGestureRecognizer: NSGestureRecognizer)
                    func shouldRequireFailure(of otherGestureRecognizer: NSGestureRecognizer) -> Bool
                    func shouldBeRequiredToFail(by otherGestureRecognizer: NSGestureRecognizer) -> Bool

                    // Subclass event callbacks (override these in custom recognizers):
                    func mouseDown(with event: NSEvent)
                    func mouseUp(with event: NSEvent)
                    func mouseDragged(with event: NSEvent)
                    func magnifyWithEvent(_ event: NSEvent)
                    func rotateWithEvent(_ event: NSEvent)
                    func pressureChangeWithEvent(_ event: NSEvent)
                    func tabletPoint(with event: NSEvent)
                    func touchesBegan(with event: NSEvent)
                    func touchesMoved(with event: NSEvent)
                    func touchesEnded(with event: NSEvent)
                    func touchesCancelled(with event: NSEvent)

                    // State transitions (call in subclass):
                    func reset()    // reset to .possible for next gesture
                    """)
                }
            }
        }
    }

    private var standardGesturesSection: some View {
        PageSection("Standard Gesture Recognizers") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSClickGestureRecognizer",
                    kind: "class : NSGestureRecognizer",
                    availability: "macOS 10.10+",
                    blurb: "Recognizes single or multiple mouse clicks. Configure numberOfClicksRequired to require double-click or triple-click."
                ) {
                    snippet("""
                    class NSClickGestureRecognizer: NSGestureRecognizer
                    var numberOfClicksRequired: Int     // default = 1
                    var numberOfTouchesRequired: Int    // for trackpad/touch events
                    var buttonMask: Int                 // 0x1 = left, 0x2 = right

                    // Example — double-click:
                    let dbClick = NSClickGestureRecognizer(target: self, action: #selector(doubleClicked(_:)))
                    dbClick.numberOfClicksRequired = 2
                    view.addGestureRecognizer(dbClick)
                    """)
                }

                refBlock(
                    name: "NSPressGestureRecognizer",
                    kind: "class : NSGestureRecognizer",
                    availability: "macOS 10.10+",
                    blurb: "Recognizes a long press. Fires .began when the press duration exceeds minimumPressDuration. Fires .ended on mouse up."
                ) {
                    snippet("""
                    class NSPressGestureRecognizer: NSGestureRecognizer
                    var minimumPressDuration: TimeInterval   // default = 0.5s
                    var allowableMovement: CGFloat           // tolerance before cancelling
                    var numberOfTouchesRequired: Int
                    var buttonMask: Int                      // 0x1 = left, 0x2 = right

                    // Example:
                    let press = NSPressGestureRecognizer(target: self, action: #selector(longPressed(_:)))
                    press.minimumPressDuration = 0.8
                    view.addGestureRecognizer(press)
                    """)
                }

                refBlock(
                    name: "NSPanGestureRecognizer",
                    kind: "class : NSGestureRecognizer",
                    availability: "macOS 10.10+",
                    blurb: "Recognizes a mouse drag or two-finger trackpad pan. Use translation(in:) to get accumulated movement and velocity(in:) for momentum."
                ) {
                    snippet("""
                    class NSPanGestureRecognizer: NSGestureRecognizer
                    var buttonMask: Int           // which mouse button triggers pan (default = left)
                    var numberOfTouchesRequired: Int

                    func translation(in view: NSView?) -> NSPoint   // accumulated delta
                    func setTranslation(_ translation: NSPoint, in view: NSView?)   // reset
                    func velocity(in view: NSView?) -> NSPoint      // pixels per second

                    // Example:
                    let pan = NSPanGestureRecognizer(target: self, action: #selector(panned(_:)))
                    view.addGestureRecognizer(pan)

                    @objc func panned(_ gr: NSPanGestureRecognizer) {
                        let delta = gr.translation(in: view)
                        myView.frame.origin.x += delta.x
                        myView.frame.origin.y += delta.y
                        gr.setTranslation(.zero, in: view)
                    }
                    """)
                }

                refBlock(
                    name: "NSMagnificationGestureRecognizer",
                    kind: "class : NSGestureRecognizer",
                    availability: "macOS 10.10+",
                    blurb: "Recognizes a pinch-to-zoom gesture on the trackpad. The magnification property gives the scale factor relative to the start of the gesture (not cumulative)."
                ) {
                    snippet("""
                    class NSMagnificationGestureRecognizer: NSGestureRecognizer
                    var magnification: CGFloat   // scale factor delta since gesture began

                    // Example — scale a view:
                    @objc func pinched(_ gr: NSMagnificationGestureRecognizer) {
                        myView.frame.size.width  *= (1 + gr.magnification)
                        myView.frame.size.height *= (1 + gr.magnification)
                        gr.magnification = 0    // reset for next event delta
                    }
                    """)
                }

                refBlock(
                    name: "NSRotationGestureRecognizer",
                    kind: "class : NSGestureRecognizer",
                    availability: "macOS 10.10+",
                    blurb: "Recognizes a two-finger rotation gesture on the trackpad. The rotation property gives the cumulative rotation in radians since the gesture began."
                ) {
                    snippet("""
                    class NSRotationGestureRecognizer: NSGestureRecognizer
                    var rotation: CGFloat    // radians; positive = counter-clockwise (macOS convention)
                    var rotationInDegrees: CGFloat { get }   // computed from rotation

                    // Example — rotate a view:
                    @objc func rotated(_ gr: NSRotationGestureRecognizer) {
                        myView.frameCenterRotation += gr.rotationInDegrees
                        gr.rotation = 0   // reset for next delta
                    }
                    """)
                }
            }
        }
    }

    private var delegateSection: some View {
        PageSection("Reference \u{2014} NSGestureRecognizerDelegate") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSGestureRecognizerDelegate",
                    kind: "protocol",
                    availability: "macOS 10.10+",
                    blurb: "Optional callbacks for fine-grained gesture recognition control: whether to begin, whether to recognize simultaneously with another recognizer, and whether to receive a specific event."
                ) {
                    snippet("""
                    protocol NSGestureRecognizerDelegate: AnyObject {
                        // Should recognition begin?
                        func gestureRecognizerShouldBegin(_ gestureRecognizer: NSGestureRecognizer) -> Bool

                        // Allow two recognizers to fire simultaneously?
                        func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer,
                            shouldRecognizeSimultaneouslyWith otherGestureRecognizer: NSGestureRecognizer) -> Bool

                        // Should this recognizer receive a particular event?
                        func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer,
                            shouldAttemptToRecognizeWith event: NSEvent) -> Bool

                        // Touch-based:
                        func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer,
                            shouldReceive touch: NSTouch) -> Bool
                    }
                    """)
                }
            }
        }
    }

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("cursorarrow.click.2", "Gesture recognizers sit in the event pipeline before the view's mouseDown/mouseUp chain. If a recognizer fires, the view's event methods still receive events unless the recognizer cancels them (delaysPrimaryMouseButtonEvents = true).")
                noteRow("arrow.triangle.2.circlepath", "For simultaneous recognition (e.g., pan + rotation together), implement gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:) and return true for the pair.")
                noteRow("plus.magnifyingglass", "NSMagnificationGestureRecognizer.magnification resets to 0 between calls in .changed state when you call gr.magnification = 0. If you don't reset it, the value accumulates across the entire gesture.")
                noteRow("rotate.right", "NSRotationGestureRecognizer.rotation is positive counter-clockwise on macOS (opposite of iOS UIRotationGestureRecognizer). Negate it if mirroring iOS behavior.")
                noteRow("hand.tap", "NSPressGestureRecognizer with minimumPressDuration = 0 is equivalent to an NSClickGestureRecognizer but fires on mouseDown rather than mouseUp.")
            }
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

    private func refBlock<Content: View>(
        name: String,
        kind: String,
        availability: String,
        blurb: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(name).font(.headline).foregroundStyle(.primary)
                Text(kind).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
                Text(availability).font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
            }
            Text(blurb).font(.callout).foregroundStyle(.secondary)
            content()
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    NSGestureRecognizerPage().frame(width: 1100, height: 900)
}
