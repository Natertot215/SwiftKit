import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSSegmentedControl (class, inherits NSControl) — a row of
// labeled (or imaged) segments with configurable tracking.
// Source: Documentation/AppKit/views-and-controls/nssegmentedcontrol.md
//
// Renderable demo: an NSViewRepresentable hosts an NSSegmentedControl
// driven by SwiftUI controls — segmentStyle picker, trackingMode picker,
// and bound selectedSegment.

// MARK: - Bridge

private struct NSSegmentedControlDemo: NSViewRepresentable {
    var labels: [String]
    var segmentStyle: NSSegmentedControl.Style
    var trackingMode: NSSegmentedControl.SwitchTracking
    @Binding var selectedSegment: Int

    func makeNSView(context: Context) -> NSSegmentedControl {
        let v = NSSegmentedControl(labels: labels, trackingMode: trackingMode, target: context.coordinator, action: #selector(Coordinator.changed(_:)))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }

    func updateNSView(_ nsView: NSSegmentedControl, context: Context) {
        context.coordinator.parent = self
        nsView.segmentStyle = segmentStyle
        nsView.trackingMode = trackingMode
        if nsView.segmentCount != labels.count {
            nsView.segmentCount = labels.count
        }
        for (i, label) in labels.enumerated() {
            nsView.setLabel(label, forSegment: i)
        }
        if trackingMode != .selectAny && nsView.selectedSegment != selectedSegment {
            nsView.selectedSegment = selectedSegment
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSSegmentedControlDemo
        init(_ parent: NSSegmentedControlDemo) { self.parent = parent }
        @objc func changed(_ sender: NSSegmentedControl) {
            parent.selectedSegment = sender.selectedSegment
        }
    }
}

// MARK: - Page

struct NSSegmentedControlPage: View {
    @State private var selectedSegment: Int = 0
    @State private var segmentStyle: NSSegmentedControl.Style = .automatic
    @State private var trackingMode: NSSegmentedControl.SwitchTracking = .selectOne

    private let labels = ["List", "Icons", "Columns", "Gallery"]

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
            Text("NSSegmentedControl")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Display one or more buttons in a single horizontal group.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nssegmentedcontrol.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSSegmentedControl with style + tracking pickers") {
            VStack(alignment: .leading, spacing: 16) {
                NSSegmentedControlDemo(
                    labels: labels,
                    segmentStyle: segmentStyle,
                    trackingMode: trackingMode,
                    selectedSegment: $selectedSegment
                )
                .frame(height: 28)
                .frame(maxWidth: 360)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("segmentStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $segmentStyle) {
                        Text("automatic").tag(NSSegmentedControl.Style.automatic)
                        Text("rounded").tag(NSSegmentedControl.Style.rounded)
                        Text("texturedSquare").tag(NSSegmentedControl.Style.texturedSquare)
                        Text("smallSquare").tag(NSSegmentedControl.Style.smallSquare)
                        Text("texturedRounded").tag(NSSegmentedControl.Style.texturedRounded)
                        Text("capsule").tag(NSSegmentedControl.Style.capsule)
                        Text("separated").tag(NSSegmentedControl.Style.separated)
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .frame(width: 220)
                }

                HStack(spacing: 12) {
                    Text("trackingMode").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $trackingMode) {
                        Text("selectOne").tag(NSSegmentedControl.SwitchTracking.selectOne)
                        Text("selectAny").tag(NSSegmentedControl.SwitchTracking.selectAny)
                        Text("momentary").tag(NSSegmentedControl.SwitchTracking.momentary)
                        Text("momentaryAccelerator").tag(NSSegmentedControl.SwitchTracking.momentaryAccelerator)
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .frame(width: 240)
                }

                if trackingMode != .selectAny {
                    Text("selectedSegment = \(selectedSegment)")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                APICallout("let s = NSSegmentedControl(labels: [\"List\", \"Icons\", \"Columns\", \"Gallery\"], trackingMode: .selectOne, target: nil, action: nil)")
                APICallout("s.segmentStyle = .automatic; s.selectedSegment = 0")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Initializers") {
                snippet("""
                NSSegmentedControl(labels: ["A", "B", "C"], trackingMode: .selectOne, target: nil, action: nil)
                NSSegmentedControl(images: [imgA, imgB, imgC], trackingMode: .selectOne, target: nil, action: nil)
                """)
                Text("Segments hold images OR labels — not both at once.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Configuring individual segments") {
                snippet("""
                s.setLabel("Inbox", forSegment: 0)
                s.setImage(NSImage(systemSymbolName: "tray", accessibilityDescription: nil), forSegment: 0)
                s.setImageScaling(.scaleProportionallyDown, forSegment: 0)
                s.setAlignment(.center, forSegment: 0)
                s.setMenu(menu, forSegment: 0)
                s.setShowsMenuIndicator(true, forSegment: 0)
                s.setWidth(80, forSegment: 0)         // 0 = autosize
                s.setEnabled(false, forSegment: 0)
                s.setSelected(true, forSegment: 0)
                """)
            }

            Block(title: "Distribution and compression") {
                snippet("""
                s.segmentDistribution = .fillEqually   // .fit / .fill / .fillEqually / .fillProportionally
                s.activeCompressionOptions = .init()
                """)
            }

            Block(title: "Border shape (macOS 14+)") {
                snippet("""
                s.borderShape = .roundedRectangle      // .roundedSquare / .roundedRectangle / .circle / .capsule
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Tracking modes") {
                snippet("""
                s.trackingMode = .selectOne              // radio-group: exactly one segment selected
                s.trackingMode = .selectAny              // multi-select: any number of segments selected
                s.trackingMode = .momentary              // segment shows pressed but doesn't latch
                s.trackingMode = .momentaryAccelerator   // pressure-sensitive, sends doubleValue
                """)
            }

            Block(title: "Spring loading") {
                snippet("""
                s.isSpringLoaded = true   // user can drag a draggable item over a segment to activate it
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wraps an NSSegmentedCell internally; most methods are cover methods.")
            noteRow("info.circle", "Use Picker(selection:label:content:).pickerStyle(.segmented) for the SwiftUI parity surface.")
            noteRow("eye", "Mode .selectAny disables the unique-selection rule — any subset of segments may be selected at once.")
            noteRow("hand.point.up", "Full Keyboard Access is supported: Tab into the control, then use arrow keys to move the focus and Space to activate.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
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
    NSSegmentedControlPage().frame(width: 1100, height: 900)
}
