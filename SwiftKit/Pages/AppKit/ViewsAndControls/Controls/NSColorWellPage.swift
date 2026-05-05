import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSColorWell (class, inherits NSControl) — a control that
// displays a color value and lets the user pick a new one via the
// system color picker popover or NSColorPanel.
// Source: Documentation/AppKit/views-and-controls/nscolorwell.md
//
// Renderable demo: an NSViewRepresentable hosts an NSColorWell driven
// by SwiftUI controls — colorWellStyle (default/minimal/expanded), a
// bound NSColor, and supportsAlpha. The selected color is reflected
// in a SwiftUI swatch alongside.

// MARK: - Bridge

private struct NSColorWellDemo: NSViewRepresentable {
    @Binding var color: NSColor
    var style: NSColorWell.Style
    var supportsAlpha: Bool
    var isBordered: Bool

    func makeNSView(context: Context) -> NSColorWell {
        let well = NSColorWell(style: style)
        well.translatesAutoresizingMaskIntoConstraints = false
        well.target = context.coordinator
        well.action = #selector(Coordinator.colorChanged(_:))
        return well
    }

    func updateNSView(_ nsView: NSColorWell, context: Context) {
        context.coordinator.parent = self
        nsView.colorWellStyle = style
        nsView.supportsAlpha = supportsAlpha
        nsView.isBordered = isBordered
        if nsView.color != color {
            nsView.color = color
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSColorWellDemo
        init(_ parent: NSColorWellDemo) { self.parent = parent }

        @objc func colorChanged(_ sender: NSColorWell) {
            parent.color = sender.color
        }
    }
}

// MARK: - Page

struct NSColorWellPage: View {
    @State private var color: NSColor = .controlAccentColor
    @State private var style: NSColorWell.Style = .default
    @State private var supportsAlpha: Bool = true
    @State private var isBordered: Bool = true

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
            Text("NSColorWell")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that displays a color value and lets the user change that color value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nscolorwell.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSColorWell with style picker + bound color") {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 16) {
                    NSColorWellDemo(
                        color: $color,
                        style: style,
                        supportsAlpha: supportsAlpha,
                        isBordered: isBordered
                    )
                    .frame(width: 64, height: 30)

                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(nsColor: color))
                        .frame(width: 80, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                    Text("selected color (SwiftUI swatch)").font(.caption).foregroundStyle(.secondary)
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("colorWellStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("default").tag(NSColorWell.Style.default)
                        Text("minimal").tag(NSColorWell.Style.minimal)
                        Text("expanded").tag(NSColorWell.Style.expanded)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 360)
                }

                Toggle("supportsAlpha", isOn: $supportsAlpha).controlSize(.small)
                Toggle("isBordered", isOn: $isBordered).controlSize(.small)

                APICallout("let well = NSColorWell(style: .default); well.color = .controlAccentColor")
                APICallout("well.supportsAlpha = true; well.colorWellStyle = .expanded")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Style cases") {
                snippet("""
                NSColorWell(style: .default)    // standard well — opens color picker on click
                NSColorWell(style: .minimal)    // smaller swatch with no chrome
                NSColorWell(style: .expanded)   // wider chip with a paint-color affordance
                """)
                Text("colorWellStyle is settable post-init too — the style only affects appearance, not the underlying picking machinery.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Color storage") {
                snippet("""
                well.color = NSColor.systemRed             // KVO-observable
                well.takeColorFrom(otherColorWell)         // copy color from a sender
                well.supportsAlpha = true                  // include opacity in the picker
                well.maximumLinearExposure = 1.0           // HDR clamp (macOS 14+)
                """)
            }

            Block(title: "Activation") {
                snippet("""
                well.activate(true)                        // open the picker; true = exclusive
                let active = well.isActive                 // is the picker currently bound to this well?
                well.deactivate()                          // close the picker bound to this well
                """)
            }

            Block(title: "Pulldown action (style: .expanded)") {
                snippet("""
                well.pulldownTarget = self
                well.pulldownAction = #selector(showCustomMenu(_:))
                """)
                Text("On the .expanded style, the small disclosure on the well can run a custom pulldown action — typically a menu of saved colors.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Bordered vs unbordered") {
                snippet("""
                well.isBordered = true     // standard chrome
                well.isBordered = false    // raw swatch
                """)
            }

            Block(title: "Disabled") {
                snippet("""
                well.isEnabled = false     // (NSControl) prevents activation; well dims
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Bound through NSViewRepresentable here; the SwiftUI-native equivalent is the ColorPicker view.")
            noteRow("info.circle", "Only one well can be active at a time when activated exclusively (well.activate(true)). Use false for non-exclusive activation.")
            noteRow("paintbrush", "supportsAlpha controls whether the system color picker shows the opacity slider. Off-by-default for opaque-only domains.")
            noteRow("sparkles", "maximumLinearExposure (macOS 14+) clamps HDR colors so wells in non-HDR pipelines remain in-gamut.")
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
    NSColorWellPage().frame(width: 1100, height: 900)
}
