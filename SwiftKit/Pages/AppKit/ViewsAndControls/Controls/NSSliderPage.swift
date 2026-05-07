import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSSlider (class, inherits NSControl) — bar (linear) or
// circular knob over a numeric range. Configurable for tick marks,
// orientation, snap-to-ticks, and continuous-vs-discrete value
// reporting.
// Source: Documentation/AppKit/views-and-controls/nsslider.md
//
// Renderable demo: an NSViewRepresentable hosts an NSSlider driven by
// SwiftUI controls — sliderType picker, isVertical toggle, tickMarks
// + tickMarkPosition, allowsTickMarkValuesOnly, isContinuous, bound
// doubleValue.

// MARK: - Bridge

private struct NSSliderDemo: NSViewRepresentable {
    @Binding var value: Double
    var minValue: Double
    var maxValue: Double
    var sliderType: NSSlider.SliderType
    var isVertical: Bool
    var numberOfTickMarks: Int
    var tickMarkPosition: NSSlider.TickMarkPosition
    var allowsTickMarkValuesOnly: Bool
    var isContinuous: Bool

    func makeNSView(context: Context) -> NSSlider {
        let slider = NSSlider(value: value, minValue: minValue, maxValue: maxValue, target: context.coordinator, action: #selector(Coordinator.changed(_:)))
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }

    func updateNSView(_ nsView: NSSlider, context: Context) {
        context.coordinator.parent = self
        nsView.sliderType = sliderType
        nsView.isVertical = isVertical
        nsView.minValue = minValue
        nsView.maxValue = maxValue
        nsView.numberOfTickMarks = numberOfTickMarks
        nsView.tickMarkPosition = tickMarkPosition
        nsView.allowsTickMarkValuesOnly = allowsTickMarkValuesOnly
        nsView.isContinuous = isContinuous
        if nsView.doubleValue != value {
            nsView.doubleValue = value
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSSliderDemo
        init(_ parent: NSSliderDemo) { self.parent = parent }
        @objc func changed(_ sender: NSSlider) {
            parent.value = sender.doubleValue
        }
    }
}

// MARK: - Page

struct NSSliderPage: View {
    @State private var value: Double = 0.4
    @State private var sliderType: NSSlider.SliderType = .linear
    @State private var isVertical: Bool = false
    @State private var numberOfTickMarks: Int = 0
    @State private var tickMarkPosition: NSSlider.TickMarkPosition = .below
    @State private var allowsTickMarkValuesOnly: Bool = false
    @State private var isContinuous: Bool = true

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
            Text("NSSlider")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A display of a bar representing a continuous range of numerical values and a knob representing the currently selected value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nsslider.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSSlider with type, orientation, and tick controls") {
            VStack(alignment: .leading, spacing: 16) {
                NSSliderDemo(
                    value: $value,
                    minValue: 0,
                    maxValue: 1,
                    sliderType: sliderType,
                    isVertical: sliderType == .linear ? isVertical : false,
                    numberOfTickMarks: numberOfTickMarks,
                    tickMarkPosition: tickMarkPosition,
                    allowsTickMarkValuesOnly: allowsTickMarkValuesOnly,
                    isContinuous: isContinuous
                )
                .frame(
                    width: sliderType == .circular ? 40 : (isVertical ? 32 : 280),
                    height: sliderType == .circular ? 40 : (isVertical ? 160 : 24)
                )
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("doubleValue").font(.caption).foregroundStyle(.secondary)
                    Text(String(format: "%.3f", value))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
                }

                HStack(spacing: 12) {
                    Text("sliderType").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $sliderType) {
                        Text("linear").tag(NSSlider.SliderType.linear)
                        Text("circular").tag(NSSlider.SliderType.circular)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 240)
                }

                if sliderType == .linear {
                    Toggle("isVertical", isOn: $isVertical).controlSize(.small)
                }

                HStack(spacing: 12) {
                    Text("numberOfTickMarks").font(.caption).foregroundStyle(.secondary)
                    Stepper(value: $numberOfTickMarks, in: 0...11) {
                        Text("\(numberOfTickMarks)").font(.caption).fontDesign(.monospaced)
                    }
                    .frame(width: 200)
                }

                HStack(spacing: 12) {
                    Text("tickMarkPosition").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $tickMarkPosition) {
                        Text("below / trailing").tag(NSSlider.TickMarkPosition.below)
                        Text("above / leading").tag(NSSlider.TickMarkPosition.above)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                }

                Toggle("allowsTickMarkValuesOnly (snap)", isOn: $allowsTickMarkValuesOnly).controlSize(.small)
                Toggle("isContinuous (live updates)", isOn: $isContinuous).controlSize(.small)

                APICallout("NSSlider(value: 0.4, minValue: 0, maxValue: 1, target: nil, action: nil)")
                APICallout("s.sliderType = .linear; s.isVertical = false; s.numberOfTickMarks = 5; s.allowsTickMarkValuesOnly = true")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Initializers") {
                snippet("""
                NSSlider(target: nil, action: nil)
                NSSlider(value: 0.5, minValue: 0, maxValue: 1, target: nil, action: nil)
                """)
            }

            Block(title: "Slider type and orientation") {
                snippet("""
                s.sliderType = .linear     // .linear / .circular
                s.isVertical = true        // linear sliders only — circular is always orientation-agnostic
                """)
            }

            Block(title: "Tick marks") {
                snippet("""
                s.numberOfTickMarks = 5
                s.tickMarkPosition = .below       // .above / .below for horizontal; .leading / .trailing for vertical
                s.allowsTickMarkValuesOnly = true // snap to closest tick

                let v = s.tickMarkValue(at: 2)    // value corresponding to a tick index
                let i = s.indexOfTickMark(at: pt) // tick index for a screen point
                let r = s.rectOfTickMark(at: 2)   // bounding rect for drawing
                let nearest = s.closestTickMarkValue(toValue: 0.62)
                """)
            }

            Block(title: "Knob and tint") {
                snippet("""
                s.knobThickness = 12
                s.trackFillColor = .controlAccentColor   // colors the track up to the knob
                s.tintProminence = .secondary            // tier the system accent: .primary / .secondary / .tertiary
                """)
            }

            Block(title: "Increment with the option key") {
                snippet("""
                s.altIncrementValue = 0.05               // option-arrow steps; -1 disables the alt increment
                """)
            }

            Block(title: "Neutral / rest position (macOS 12+)") {
                snippet("""
                s.neutralValue = 0.0                     // baseline used by accessory behaviors and value reset
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Continuous vs discrete reporting") {
                snippet("""
                s.isContinuous = true     // (NSControl) action fires for every value change during drag
                s.isContinuous = false    // action fires only on mouse-up
                """)
            }

            Block(title: "Snap-to-tick") {
                snippet("""
                s.numberOfTickMarks = 11
                s.allowsTickMarkValuesOnly = true   // dragging clicks to the nearest tick
                """)
            }

            Block(title: "Disabled") {
                snippet("""
                s.isEnabled = false       // (NSControl) dim and stop accepting input
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Driven by an internal NSSliderCell — most methods are cover methods that forward to the cell.")
            noteRow("info.circle", "Circular sliders (sliderType = .circular) ignore isVertical and orient based on the knob position around the dial.")
            noteRow("hand.point.up", "Full Keyboard Access: Tab into the slider, then arrow keys move by one increment, option-arrow by altIncrementValue.")
            noteRow("rectangle.portrait", "For SwiftUI parity see Slider(value:in:step:onEditingChanged:); SwiftUI doesn't expose a circular variant.")
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

extension NSSliderPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsSlider",
        title: "NSSlider",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSSlider",
            "NSSliderCell",
            "NSSliderAccessory",
            "NSSliderAccessoryBehavior"
        ],
        blurb: "A display of a bar (or circular knob) representing a continuous range of numerical values, with a knob representing the currently selected value. Configurable for tick marks, orientation, snap-to-ticks, and continuous-vs-discrete value reporting.",
        signature: "class NSSlider : NSControl",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nsslider.md",
        page: { AnyView(NSSliderPage()) }
    )
}

#Preview {
    NSSliderPage().frame(width: 1100, height: 900)
}
