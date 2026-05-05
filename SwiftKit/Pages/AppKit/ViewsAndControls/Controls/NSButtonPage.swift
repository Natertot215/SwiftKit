import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSButton (class, inherits NSControl) — the standard control
// for initiating actions in AppKit. Configurable via bezelStyle,
// borderShape, button type (push/checkbox/radio/.../accelerator), and
// state (off/on/mixed for tri-state).
// Source: Documentation/AppKit/views-and-controls/nsbutton.md
//
// Renderable demo: an NSViewRepresentable hosts a single NSButton driven
// by SwiftUI controls — title, bezelStyle, isBordered, isTransparent, and
// allowsMixedState + state. A second representable shows the standard
// init variants (checkbox, radio, image+title) side-by-side.

// MARK: - Bridges

private struct NSButtonDemo: NSViewRepresentable {
    var title: String
    var bezelStyle: NSButton.BezelStyle
    var isBordered: Bool
    var isTransparent: Bool
    var allowsMixedState: Bool
    var state: NSControl.StateValue

    func makeNSView(context: Context) -> NSButton {
        let button = NSButton(title: title, target: nil, action: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    func updateNSView(_ nsView: NSButton, context: Context) {
        nsView.title = title
        nsView.bezelStyle = bezelStyle
        nsView.isBordered = isBordered
        nsView.isTransparent = isTransparent
        nsView.allowsMixedState = allowsMixedState
        nsView.state = state
    }
}

private struct NSButtonStandardSet: NSViewRepresentable {
    func makeNSView(context: Context) -> NSStackView {
        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 16
        stack.alignment = .centerY
        stack.translatesAutoresizingMaskIntoConstraints = false

        let push = NSButton(title: "Push", target: nil, action: nil)
        let checkbox = NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil)
        checkbox.state = .on
        let radio = NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
        radio.state = .on
        let imageButton = NSButton(
            title: "Image+Title",
            image: NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil) ?? NSImage(),
            target: nil,
            action: nil
        )
        imageButton.imagePosition = .imageLeading

        for view in [push, checkbox, radio, imageButton] {
            stack.addArrangedSubview(view)
        }
        return stack
    }

    func updateNSView(_ nsView: NSStackView, context: Context) {}
}

// MARK: - Page

struct NSButtonPage: View {
    @State private var title: String = "Press Me"
    @State private var bezelStyle: NSButton.BezelStyle = .push
    @State private var isBordered: Bool = true
    @State private var isTransparent: Bool = false
    @State private var allowsMixedState: Bool = false
    @State private var state: NSControl.StateValue = .on

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
            Text("NSButton")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that defines an area on the screen that a user clicks to trigger an action.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nsbutton.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSButton with bezel + state controls") {
            VStack(alignment: .leading, spacing: 12) {
                NSButtonDemo(
                    title: title,
                    bezelStyle: bezelStyle,
                    isBordered: isBordered,
                    isTransparent: isTransparent,
                    allowsMixedState: allowsMixedState,
                    state: state
                )
                .frame(height: 32)
                .frame(maxWidth: 360)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("title").font(.caption).foregroundStyle(.secondary)
                    TextField("", text: $title)
                        .frame(width: 200)
                }

                HStack(spacing: 12) {
                    Text("bezelStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $bezelStyle) {
                        Text("automatic").tag(NSButton.BezelStyle.automatic)
                        Text("push").tag(NSButton.BezelStyle.push)
                        Text("flexiblePush").tag(NSButton.BezelStyle.flexiblePush)
                        Text("glass (macOS 26)").tag(NSButton.BezelStyle.glass)
                        Text("toolbar").tag(NSButton.BezelStyle.toolbar)
                        Text("accessoryBar").tag(NSButton.BezelStyle.accessoryBar)
                        Text("accessoryBarAction").tag(NSButton.BezelStyle.accessoryBarAction)
                        Text("badge").tag(NSButton.BezelStyle.badge)
                        Text("smallSquare").tag(NSButton.BezelStyle.smallSquare)
                        Text("circular").tag(NSButton.BezelStyle.circular)
                        Text("helpButton").tag(NSButton.BezelStyle.helpButton)
                        Text("disclosure").tag(NSButton.BezelStyle.disclosure)
                        Text("pushDisclosure").tag(NSButton.BezelStyle.pushDisclosure)
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .frame(width: 220)
                }

                HStack(spacing: 12) {
                    Text("state").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $state) {
                        Text("off").tag(NSControl.StateValue.off)
                        Text("on").tag(NSControl.StateValue.on)
                        Text("mixed").tag(NSControl.StateValue.mixed)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 240)
                }

                Toggle("isBordered", isOn: $isBordered).controlSize(.small)
                Toggle("isTransparent", isOn: $isTransparent).controlSize(.small)
                Toggle("allowsMixedState (enables tri-state cycling)", isOn: $allowsMixedState).controlSize(.small)

                APICallout("let b = NSButton(title: \"Press Me\", target: nil, action: nil)")
                APICallout("b.bezelStyle = .push; b.state = .on; b.allowsMixedState = false")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Standard convenience initializers") {
                NSButtonStandardSet()
                    .frame(height: 36)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                snippet("""
                NSButton(title: "Push", target: nil, action: nil)
                NSButton(checkboxWithTitle: "Checkbox", target: nil, action: nil)
                NSButton(radioButtonWithTitle: "Radio", target: nil, action: nil)
                NSButton(title: "Image+Title", image: img, target: nil, action: nil)
                """)
            }

            Block(title: "Image position") {
                snippet("""
                b.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)
                b.imagePosition = .imageLeading       // .noImage / .imageOnly / .imageLeading / .imageTrailing
                                                       // .imageAbove / .imageBelow / .imageOverlaps
                b.imageScaling = .scaleProportionallyDown
                b.imageHugsTitle = false
                """)
            }

            Block(title: "Tinting and prominence") {
                snippet("""
                b.contentTintColor = .controlAccentColor
                b.bezelColor = nil                     // omit for default bezel
                b.tintProminence = .secondary          // .automatic / .primary / .secondary / .tertiary
                b.borderShape = .roundedRectangle      // .roundedSquare / .roundedRectangle / .circle / .capsule
                """)
            }

            Block(title: "Periodic / continuous click") {
                snippet("""
                b.setPeriodicDelay(0.4, interval: 0.075)
                b.isContinuous = true                  // (NSControl) call action repeatedly while held
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Two-state vs tri-state") {
                snippet("""
                b.allowsMixedState = false
                b.state = .on        // .off / .on

                // Tri-state: .off → .on → .mixed → .off
                b.allowsMixedState = true
                b.setNextState()
                """)
                Text("With allowsMixedState = false, the button cycles .off ↔ .on. Set true to enable .mixed (commonly used for checkboxes representing partial selection).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Highlight + key equivalent") {
                snippet("""
                b.highlight(true)
                b.keyEquivalent = "\\r"               // Return acts as default-button key
                b.keyEquivalentModifierMask = [.command]
                """)
            }

            Block(title: "Destructive action") {
                snippet("""
                b.hasDestructiveAction = true         // hint to system: tint as destructive (red)
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. NSPopUpButton and NSStatusBarButton inherit NSButton.")
            noteRow("paintbrush", "bezelStyle resolves automatically to system look — pick the semantic one (.push / .toolbar / .helpButton / .accessoryBar) over hand-styling.")
            noteRow("hand.point.up", "For tri-state checkbox UX, set allowsMixedState = true and use setNextState() in the action to cycle .off → .on → .mixed → .off.")
            noteRow("info.circle", "tintProminence (macOS 11+) maps the system accent color through .primary / .secondary / .tertiary tiers — prefer it over hardcoded contentTintColor.")
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
    NSButtonPage().frame(width: 1100, height: 900)
}
