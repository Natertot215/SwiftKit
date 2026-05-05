import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSSwitch (class, inherits NSControl, macOS 10.15+) — a
// binary on/off control. Lighter-weight than a checkbox; appropriate
// for "instantly applies" toggles per HIG.
// Source: Documentation/AppKit/views-and-controls/nsswitch.md
//
// Renderable demo: an NSViewRepresentable hosts an NSSwitch bound to
// a SwiftUI @State Bool, with adjacent SwiftUI controls toggling
// isContinuous and isEnabled.

// MARK: - Bridge

private struct NSSwitchDemo: NSViewRepresentable {
    @Binding var isOn: Bool
    var isContinuous: Bool
    var isEnabled: Bool

    func makeNSView(context: Context) -> NSSwitch {
        let s = NSSwitch()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.target = context.coordinator
        s.action = #selector(Coordinator.changed(_:))
        return s
    }

    func updateNSView(_ nsView: NSSwitch, context: Context) {
        context.coordinator.parent = self
        let target: NSControl.StateValue = isOn ? .on : .off
        if nsView.state != target {
            nsView.state = target
        }
        nsView.isContinuous = isContinuous
        nsView.isEnabled = isEnabled
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSSwitchDemo
        init(_ parent: NSSwitchDemo) { self.parent = parent }
        @objc func changed(_ sender: NSSwitch) {
            parent.isOn = (sender.state == .on)
        }
    }
}

// MARK: - Page

struct NSSwitchPage: View {
    @State private var isOn: Bool = true
    @State private var isContinuous: Bool = false
    @State private var isEnabled: Bool = true

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
            Text("NSSwitch")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that offers a binary choice.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} macOS 10.15+ \u{00b7} Documentation/AppKit/views-and-controls/nsswitch.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSSwitch bound to a SwiftUI @State Bool") {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    NSSwitchDemo(isOn: $isOn, isContinuous: isContinuous, isEnabled: isEnabled)
                        .frame(width: 38, height: 22)
                    Text("Enable Notifications")
                        .font(.body)
                        .foregroundStyle(.primary)
                    Spacer()
                    Text(isOn ? ".on" : ".off")
                        .font(.caption).fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
                .padding(12)
                .frame(maxWidth: 360)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Toggle("isContinuous (action fires during the drag)", isOn: $isContinuous).controlSize(.small)
                Toggle("isEnabled", isOn: $isEnabled).controlSize(.small)

                APICallout("let s = NSSwitch(); s.target = self; s.action = #selector(toggled(_:))")
                APICallout("s.state = .on   // .on / .off")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "State") {
                snippet("""
                s.state = .on        // .on / .off — NSSwitch only ever has these two states
                """)
                Text("NSSwitch is strictly binary. For a tri-state checkbox, use NSButton with allowsMixedState = true.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Reading state in the action") {
                snippet("""
                @objc func toggled(_ sender: NSSwitch) {
                    let isOn = (sender.state == .on)
                    // apply change immediately — switches are for instant settings per HIG
                }
                """)
            }

            Block(title: "Continuous reporting") {
                snippet("""
                s.isContinuous = true     // (NSControl) action fires while the user drags between states
                s.isContinuous = false    // action fires once when the gesture completes
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Disabled") {
                snippet("""
                s.isEnabled = false   // (NSControl) dims the switch and ignores input
                """)
            }

            Block(title: "Drag between positions") {
                snippet("""
                // Users can drag the knob between positions — NSSwitch handles the gesture itself.
                // No additional configuration needed; respect HIG by treating each transition as the
                // setting being applied immediately.
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. NSSwitch does not use an NSCell — cellClass and cell are nil and ignore writes.")
            noteRow("hand.point.up", "Per HIG, switches apply changes immediately. If your toggle requires a Save step, use a checkbox (NSButton with checkboxWithTitle: init) instead.")
            noteRow("info.circle", "For SwiftUI parity see Toggle(_:isOn:); on macOS the .toggleStyle(.switch) variant maps directly to NSSwitch.")
            noteRow("accessibility", "Conforms to NSAccessibilitySwitch — VoiceOver announces \u{201C}On\u{201D} / \u{201C}Off\u{201D} per state.")
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
    NSSwitchPage().frame(width: 1100, height: 900)
}
