import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSLevelIndicator (class, inherits NSControl) — a non-
// interactive read-out of a numeric level, like a battery meter,
// audio level, star rating, or relevancy bar.
// Source: Documentation/AppKit/views-and-controls/nslevelindicator.md
//
// Renderable demo: an NSViewRepresentable hosts an NSLevelIndicator
// with a bound doubleValue and a SwiftUI picker over all four
// NSLevelIndicator.Style cases.

// MARK: - Bridge

private struct NSLevelIndicatorDemo: NSViewRepresentable {
    var value: Double
    var minValue: Double
    var maxValue: Double
    var style: NSLevelIndicator.Style
    var numberOfTickMarks: Int
    var numberOfMajorTickMarks: Int
    var warningValue: Double
    var criticalValue: Double

    func makeNSView(context: Context) -> NSLevelIndicator {
        let v = NSLevelIndicator()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isEditable = false
        return v
    }

    func updateNSView(_ nsView: NSLevelIndicator, context: Context) {
        nsView.levelIndicatorStyle = style
        nsView.minValue = minValue
        nsView.maxValue = maxValue
        nsView.warningValue = warningValue
        nsView.criticalValue = criticalValue
        nsView.numberOfTickMarks = numberOfTickMarks
        nsView.numberOfMajorTickMarks = numberOfMajorTickMarks
        nsView.doubleValue = value
    }
}

// MARK: - Page

struct NSLevelIndicatorPage: View {
    @State private var value: Double = 6
    @State private var style: NSLevelIndicator.Style = .continuousCapacity

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
            Text("NSLevelIndicator")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A visual representation of a level or quantity, using discrete values.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nslevelindicator.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSLevelIndicator with style picker + bound value") {
            VStack(alignment: .leading, spacing: 16) {
                NSLevelIndicatorDemo(
                    value: value,
                    minValue: 0,
                    maxValue: 10,
                    style: style,
                    numberOfTickMarks: style == .discreteCapacity ? 11 : 0,
                    numberOfMajorTickMarks: 0,
                    warningValue: 7,
                    criticalValue: 9
                )
                .frame(height: 24)
                .frame(maxWidth: 320)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("doubleValue").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $value, in: 0...10).frame(width: 280)
                    Text(String(format: "%.1f", value)).font(.caption).fontDesign(.monospaced)
                }

                HStack(spacing: 12) {
                    Text("levelIndicatorStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("relevancy").tag(NSLevelIndicator.Style.relevancy)
                        Text("continuousCapacity").tag(NSLevelIndicator.Style.continuousCapacity)
                        Text("discreteCapacity").tag(NSLevelIndicator.Style.discreteCapacity)
                        Text("rating").tag(NSLevelIndicator.Style.rating)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 460)
                }

                APICallout("let v = NSLevelIndicator(); v.levelIndicatorStyle = .continuousCapacity")
                APICallout("v.minValue = 0; v.maxValue = 10; v.doubleValue = 6")
                APICallout("v.warningValue = 7; v.criticalValue = 9   // capacity styles only")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "All four styles, side-by-side") {
                VStack(alignment: .leading, spacing: 12) {
                    styleRow("relevancy", style: .relevancy, value: 7)
                    styleRow("continuousCapacity", style: .continuousCapacity, value: 6)
                    styleRow("discreteCapacity", style: .discreteCapacity, value: 6, ticks: 11)
                    styleRow("rating", style: .rating, value: 4)
                }
            }

            Block(title: "Range + thresholds") {
                snippet("""
                v.minValue = 0
                v.maxValue = 10
                v.doubleValue = 6
                v.warningValue = 7      // continuousCapacity / discreteCapacity: yellow above
                v.criticalValue = 9     //                                         red above
                """)
            }

            Block(title: "Tick marks") {
                snippet("""
                v.numberOfTickMarks = 11
                v.numberOfMajorTickMarks = 5
                v.tickMarkPosition = .below     // .above / .below for horizontal
                """)
            }

            Block(title: "Custom rating image") {
                snippet("""
                v.levelIndicatorStyle = .rating
                v.ratingImage = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)
                v.ratingPlaceholderImage = NSImage(systemSymbolName: "star", accessibilityDescription: nil)
                v.placeholderVisibility = .whileEditing   // .always / .whileEditing / .automatic
                """)
            }

            Block(title: "Capacity colors") {
                snippet("""
                v.fillColor = .systemGreen
                v.warningFillColor = .systemYellow
                v.criticalFillColor = .systemRed
                v.drawsTieredCapacityLevels = true   // tiered look in continuousCapacity
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Editable") {
                snippet("""
                v.isEditable = true   // user can drag to set the value (rating + capacity styles)
                """)
                Text("Off by default. Sliders are editable by definition; level indicators must opt in.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wraps an NSLevelIndicatorCell internally; almost all configuration mirrors up to the control.")
            noteRow("info.circle", "Capacity styles use warningValue / criticalValue thresholds for tiered colors. Rating + relevancy styles ignore those thresholds.")
            noteRow("paintbrush", "fillColor / warningFillColor / criticalFillColor only apply to capacity styles. Rating uses ratingImage; relevancy uses the system tint.")
            noteRow("hand.raised", "For interactive selection use NSSlider — a level indicator is fundamentally a read-out, even when isEditable = true.")
        }
    }

    private func styleRow(_ label: String, style: NSLevelIndicator.Style, value: Double, ticks: Int = 0) -> some View {
        HStack(alignment: .center, spacing: 16) {
            Text(label)
                .font(.caption).fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .frame(width: 180, alignment: .leading)
            NSLevelIndicatorDemo(
                value: value,
                minValue: 0,
                maxValue: 10,
                style: style,
                numberOfTickMarks: ticks,
                numberOfMajorTickMarks: 0,
                warningValue: 7,
                criticalValue: 9
            )
            .frame(height: 24)
            .frame(maxWidth: 280)
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
    NSLevelIndicatorPage().frame(width: 1100, height: 900)
}
