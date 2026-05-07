import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSStepper (class, inherits NSControl) — small up/down arrow
// pair for incrementing a numeric value, typically paired with an
// adjacent text field display.
// Source: Documentation/AppKit/views-and-controls/nsstepper.md
//
// Renderable demo: an NSViewRepresentable hosts an NSStepper bound to
// a SwiftUI @State Double. Adjacent SwiftUI controls show the live
// value and configure min/max/increment/valueWraps/autorepeat.

// MARK: - Bridge

private struct NSStepperDemo: NSViewRepresentable {
    @Binding var value: Double
    var minValue: Double
    var maxValue: Double
    var increment: Double
    var valueWraps: Bool
    var autorepeat: Bool

    func makeNSView(context: Context) -> NSStepper {
        let s = NSStepper()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.target = context.coordinator
        s.action = #selector(Coordinator.changed(_:))
        return s
    }

    func updateNSView(_ nsView: NSStepper, context: Context) {
        context.coordinator.parent = self
        nsView.minValue = minValue
        nsView.maxValue = maxValue
        nsView.increment = increment
        nsView.valueWraps = valueWraps
        nsView.autorepeat = autorepeat
        if nsView.doubleValue != value {
            nsView.doubleValue = value
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSStepperDemo
        init(_ parent: NSStepperDemo) { self.parent = parent }
        @objc func changed(_ sender: NSStepper) {
            parent.value = sender.doubleValue
        }
    }
}

// MARK: - Page

struct NSStepperPage: View {
    @State private var value: Double = 5
    @State private var minValue: Double = 0
    @State private var maxValue: Double = 10
    @State private var increment: Double = 1
    @State private var valueWraps: Bool = false
    @State private var autorepeat: Bool = true

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
            Text("NSStepper")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("An interface with up and down arrow buttons for incrementing or decrementing a value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nsstepper.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSStepper bound to a SwiftUI @State Double") {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    Text(String(format: "%.2f", value))
                        .font(.title3)
                        .fontDesign(.monospaced)
                        .frame(minWidth: 80, alignment: .trailing)
                    NSStepperDemo(
                        value: $value,
                        minValue: minValue,
                        maxValue: maxValue,
                        increment: increment,
                        valueWraps: valueWraps,
                        autorepeat: autorepeat
                    )
                    .frame(width: 19, height: 27)
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("min").font(.caption).foregroundStyle(.secondary)
                    Stepper(value: $minValue, in: -100...100) {
                        Text(String(format: "%.0f", minValue)).font(.caption).fontDesign(.monospaced)
                    }
                    .frame(width: 200)
                    Text("max").font(.caption).foregroundStyle(.secondary)
                    Stepper(value: $maxValue, in: -100...100) {
                        Text(String(format: "%.0f", maxValue)).font(.caption).fontDesign(.monospaced)
                    }
                    .frame(width: 200)
                }

                HStack(spacing: 12) {
                    Text("increment").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $increment) {
                        Text("0.25").tag(0.25)
                        Text("0.5").tag(0.5)
                        Text("1").tag(1.0)
                        Text("5").tag(5.0)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                }

                Toggle("valueWraps (max\u{2192}min when stepping past)", isOn: $valueWraps).controlSize(.small)
                Toggle("autorepeat (hold to step continuously)", isOn: $autorepeat).controlSize(.small)

                APICallout("let s = NSStepper(); s.minValue = 0; s.maxValue = 10; s.increment = 1")
                APICallout("s.valueWraps = false; s.autorepeat = true; s.doubleValue = 5")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Range and step") {
                snippet("""
                s.minValue = 0
                s.maxValue = 10
                s.increment = 1
                s.doubleValue = 5
                s.intValue = 5             // Int convenience accessor
                """)
            }

            Block(title: "Wrap and autorepeat") {
                snippet("""
                s.valueWraps = true        // stepping past max wraps to min and vice versa
                s.autorepeat = true        // holding the arrow steps continuously
                """)
            }

            Block(title: "Pairing with NSTextField") {
                snippet("""
                let field = NSTextField()
                field.formatter = NumberFormatter()

                let stepper = NSStepper()
                stepper.target = self
                stepper.action = #selector(stepperChanged(_:))

                @objc func stepperChanged(_ sender: NSStepper) {
                    field.doubleValue = sender.doubleValue
                }
                """)
                Text("Steppers are typically paired with a text field. Bind both controls to the same model value through target/action or Cocoa bindings.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Continuous vs discrete") {
                snippet("""
                s.isContinuous = true   // (NSControl) action fires while autorepeating
                s.isContinuous = false  // action fires only when the user releases the arrow
                """)
            }

            Block(title: "Disabled") {
                snippet("""
                s.isEnabled = false     // both arrows dim and ignore input
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wraps an NSStepperCell internally.")
            noteRow("info.circle", "If valueWraps = false (default), reaching max disables the up arrow and reaching min disables the down arrow.")
            noteRow("hand.point.up", "For SwiftUI parity see Stepper(value:in:step:label:) — same model, same behavior.")
            noteRow("rectangle.fill.badge.plus", "Pair with an NSTextField + NumberFormatter for the canonical numeric-entry UI.")
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

extension NSStepperPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsStepper",
        title: "NSStepper",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSStepper",
            "NSStepperCell"
        ],
        blurb: "An interface with up and down arrow buttons for incrementing or decrementing a value. Typically paired with an adjacent NSTextField to render the current numeric value.",
        signature: "class NSStepper : NSControl",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nsstepper.md",
        page: { AnyView(NSStepperPage()) }
    )
}

#Preview {
    NSStepperPage().frame(width: 1100, height: 900)
}
