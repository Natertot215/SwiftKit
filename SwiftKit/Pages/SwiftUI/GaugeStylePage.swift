import SwiftUI

// SwiftUI `View/gaugeStyle(_:)` + `GaugeStyle` + `GaugeStyleConfiguration` page.
// Source: Documentation/SwiftUI/view-styles/gaugestyle(_:).md, gaugestyle.md, gaugestyleconfiguration.md
// macOS 13.0+. Built-in style values on macOS: .automatic, .accessoryCircular,
// .accessoryCircularCapacity, .accessoryLinear, .accessoryLinearCapacity, .linearCapacity.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 160

struct GaugeStylePage: View {
    @State private var value: Double = 0.6

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
            Text("View/gaugeStyle(_:) + GaugeStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for gauges within this view. GaugeStyle is the protocol; GaugeStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/gaugestyle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GSCard(title: ".automatic", api: ".gaugeStyle(.automatic)") {
            sampleGauge.gaugeStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("All GaugeStyle values available on macOS, applied to the same value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                GSCard(title: ".automatic", api: ".gaugeStyle(.automatic)") {
                    sampleGauge.gaugeStyle(.automatic)
                }
                GSCard(title: ".accessoryCircular", api: ".gaugeStyle(.accessoryCircular)") {
                    sampleGauge.gaugeStyle(.accessoryCircular)
                }
                GSCard(title: ".accessoryCircularCapacity", api: ".gaugeStyle(.accessoryCircularCapacity)") {
                    sampleGauge.gaugeStyle(.accessoryCircularCapacity)
                }
                GSCard(title: ".accessoryLinear", api: ".gaugeStyle(.accessoryLinear)") {
                    sampleGauge.gaugeStyle(.accessoryLinear)
                }
                GSCard(title: ".accessoryLinearCapacity", api: ".gaugeStyle(.accessoryLinearCapacity)") {
                    sampleGauge.gaugeStyle(.accessoryLinearCapacity)
                }
                GSCard(title: ".linearCapacity", api: ".gaugeStyle(.linearCapacity)") {
                    sampleGauge.gaugeStyle(.linearCapacity)
                }
            }
        }
    }

    private var sampleGauge: some View {
        Gauge(value: value, in: 0...1) {
            Text("Speed")
        } currentValueLabel: {
            Text(value, format: .percent.precision(.fractionLength(0)))
        } minimumValueLabel: {
            Text("0%")
        } maximumValueLabel: {
            Text("100%")
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Live binding")
                    .font(.headline)
                Slider(value: $value, in: 0...1) { Text("Value") }
                    .frame(maxWidth: 360)
                APICallout("Slider(value: $value, in: 0...1)")
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Tint propagates")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GSCard(title: ".tint(.green)", api: ".tint(.green)") {
                        sampleGauge.gaugeStyle(.accessoryLinearCapacity).tint(.green)
                    }
                    GSCard(title: ".tint(.orange)", api: ".tint(.orange)") {
                        sampleGauge.gaugeStyle(.accessoryLinearCapacity).tint(.orange)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("GaugeStyleConfiguration shape")
                    .font(.headline)
                GSCodeBlock(text:
                    """
                    struct GaugeStyleConfiguration {
                        var value: Double                          // 0…1 normalized
                        var minimumValueLabel: Label?
                        var maximumValueLabel: Label?
                        var label: Label                           // primary
                        var currentValueLabel: Label?
                        var markedValueLabels: AnyRandomAccessCollection<Label>
                    }
                    """)
                Text("SwiftKit does NOT author custom GaugeStyle conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct GSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GSNote] = [
        .init(title: "Two families: capacity vs ranged.",
              detail: "Capacity styles (.linearCapacity, .accessoryLinearCapacity, .accessoryCircularCapacity) draw a fill bar/arc. Ranged styles (.accessoryLinear, .accessoryCircular) draw a needle/dot at the value's position.",
              symbol: "gauge"),
        .init(title: "Accessory styles target widget contexts.",
              detail: "They're sized for Widget complications. They render fine in normal views but are visually tight; consider .linearCapacity for inline progress in regular UI.",
              symbol: "rectangle.stack"),
        .init(title: "currentValueLabel renders inside the gauge for circular styles.",
              detail: "For .accessoryCircular and .accessoryCircularCapacity the currentValueLabel sits at the center. Linear styles render it adjacent to the bar.",
              symbol: "textformat.123"),
        .init(title: "Value is normalized to 0…1 in the configuration.",
              detail: "Even though Gauge accepts an arbitrary range, GaugeStyleConfiguration.value is always 0…1. Custom conformers don't worry about the original range.",
              symbol: "function"),
        .init(title: "Tint colors the fill / needle.",
              detail: "Use .tint(_:) on the Gauge or any ancestor. Capacity styles fill with the tint; ranged styles tint the indicator.",
              symbol: "paintpalette")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct GSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct GSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    GaugeStylePage()
        .frame(width: 1200, height: 1200)
}
