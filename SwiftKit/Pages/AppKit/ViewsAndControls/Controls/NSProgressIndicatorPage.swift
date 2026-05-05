import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSProgressIndicator (class, inherits NSView) — bar or
// spinning progress affordance, determinate or indeterminate.
// Source: Documentation/AppKit/views-and-controls/nsprogressindicator.md
//
// Renderable demo: an NSViewRepresentable hosts an NSProgressIndicator
// driven by SwiftUI controls — style picker, indeterminate toggle,
// bound doubleValue. Indeterminate mode auto-animates.

// MARK: - Bridge

private struct NSProgressIndicatorDemo: NSViewRepresentable {
    var style: NSProgressIndicator.Style
    var isIndeterminate: Bool
    var value: Double
    var minValue: Double
    var maxValue: Double
    var controlSize: NSControl.ControlSize
    var isDisplayedWhenStopped: Bool

    func makeNSView(context: Context) -> NSProgressIndicator {
        let v = NSProgressIndicator()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.usesThreadedAnimation = true
        return v
    }

    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        nsView.style = style
        nsView.isIndeterminate = isIndeterminate
        nsView.minValue = minValue
        nsView.maxValue = maxValue
        nsView.doubleValue = value
        nsView.controlSize = controlSize
        nsView.isDisplayedWhenStopped = isDisplayedWhenStopped
        if isIndeterminate {
            nsView.startAnimation(nil)
        } else {
            nsView.stopAnimation(nil)
        }
    }
}

// MARK: - Page

struct NSProgressIndicatorPage: View {
    @State private var style: NSProgressIndicator.Style = .bar
    @State private var isIndeterminate: Bool = false
    @State private var value: Double = 0.4

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
            Text("NSProgressIndicator")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("An interface that provides visual feedback to the user about the status of an ongoing task.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nsprogressindicator.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSProgressIndicator with style + indeterminate toggle") {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center, spacing: 24) {
                    NSProgressIndicatorDemo(
                        style: style,
                        isIndeterminate: isIndeterminate,
                        value: value,
                        minValue: 0,
                        maxValue: 1,
                        controlSize: .regular,
                        isDisplayedWhenStopped: true
                    )
                    .frame(width: style == .bar ? 240 : 32, height: style == .bar ? 16 : 32)

                    Text(isIndeterminate ? "indeterminate (auto-animating)" : "determinate (\(Int(value * 100))%)")
                        .font(.caption).foregroundStyle(.secondary)
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("style").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("bar").tag(NSProgressIndicator.Style.bar)
                        Text("spinning").tag(NSProgressIndicator.Style.spinning)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 240)
                }

                Toggle("isIndeterminate (auto-animate)", isOn: $isIndeterminate).controlSize(.small)

                if !isIndeterminate {
                    HStack(spacing: 12) {
                        Text("doubleValue").font(.caption).foregroundStyle(.secondary)
                        Slider(value: $value, in: 0...1).frame(width: 280)
                        Text(String(format: "%.2f", value)).font(.caption).fontDesign(.monospaced)
                    }
                }

                APICallout("let p = NSProgressIndicator(); p.style = .bar; p.isIndeterminate = false")
                APICallout("p.minValue = 0; p.maxValue = 1; p.doubleValue = 0.4")
                APICallout("p.startAnimation(nil)   // begin indeterminate animation")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Style cases") {
                snippet("""
                p.style = .bar          // horizontal track; show the doubleValue when determinate
                p.style = .spinning     // circular indeterminate spinner
                """)
            }

            Block(title: "Range and increment") {
                snippet("""
                p.minValue = 0
                p.maxValue = 100
                p.doubleValue = 30
                p.increment(by: 5)      // bumps doubleValue by the given delta
                """)
            }

            Block(title: "Animation") {
                snippet("""
                p.startAnimation(nil)
                p.stopAnimation(nil)
                p.usesThreadedAnimation = true   // animate off the main thread for smoother spinners
                """)
            }

            Block(title: "Observe a Foundation Progress") {
                snippet("""
                let progress = Progress(totalUnitCount: 10)
                p.observedProgress = progress     // p auto-updates as fractionCompleted changes
                """)
            }

            Block(title: "Appearance") {
                snippet("""
                p.controlSize = .regular     // .mini / .small / .regular / .large
                p.isBezeled = true           // bar style only — adds a recessed bezel
                p.isDisplayedWhenStopped = true
                p.sizeToFit()
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Indeterminate vs determinate") {
                snippet("""
                p.isIndeterminate = true       // bar shows striped sweep; spinner spins continuously
                p.isIndeterminate = false      // bar fills proportionally; spinner shows segments
                """)
                Text("Indeterminate progress requires startAnimation(_:) to be visible. Determinate progress draws when its doubleValue changes.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Hidden when stopped") {
                snippet("""
                p.isDisplayedWhenStopped = false   // collapse to nothing while idle
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSView (not NSControl). No target/action — driven through doubleValue or observedProgress.")
            noteRow("info.circle", "controlTint exists for legacy reasons; tint is now driven by the system accent color.")
            noteRow("sparkles", "usesThreadedAnimation lets the spinner animate even while the main thread is busy — useful for long synchronous tasks.")
            noteRow("clock.arrow.circlepath", "For SwiftUI parity see ProgressView(value:total:) and ProgressView() (indeterminate spinner).")
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
    NSProgressIndicatorPage().frame(width: 1100, height: 900)
}
