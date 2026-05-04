import SwiftUI

// SwiftUI `Gauge` reference page.
// Covers: basic value, range, labels, currentValueLabel, and GaugeStyle variants.
// macOS 13.0+

struct GaugePage: View {
    @State private var progress = 0.6
    @State private var speed = 55.0

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
            Text("Gauge")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that shows a value within a range. Useful for displaying download progress, speed, or capacity.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/gauge.md · macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GACard(api: "Gauge(value: 0.6) { Text(\"Progress\") }") {
            Gauge(value: progress) {
                Text("Progress")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            GAVariant(title: ".automatic (linear, macOS default)") {
                GACard(api: "Gauge(value: 0.6)  // .gaugeStyle(.automatic)") {
                    Gauge(value: progress) {
                        Text("Capacity")
                    }.gaugeStyle(.automatic)
                }
            }

            GAVariant(title: ".linearCapacity") {
                GACard(api: ".gaugeStyle(.linearCapacity)") {
                    Gauge(value: progress) {
                        Text("Storage")
                    } currentValueLabel: {
                        Text("\(Int(progress * 100))%")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
                    .gaugeStyle(.linearCapacity)
                }
            }

            GAVariant(title: ".accessoryLinear") {
                GACard(api: ".gaugeStyle(.accessoryLinear)") {
                    Gauge(value: progress) {
                        Text("Progress")
                    } currentValueLabel: {
                        Text("\(Int(progress * 100))%")
                    }
                    .gaugeStyle(.accessoryLinear)
                }
            }

            GAVariant(title: ".accessoryLinearCapacity") {
                GACard(api: ".gaugeStyle(.accessoryLinearCapacity)") {
                    Gauge(value: progress) {
                        Text("Battery")
                    } currentValueLabel: {
                        Text("\(Int(progress * 100))%")
                    }
                    .gaugeStyle(.accessoryLinearCapacity)
                }
            }

            GAVariant(title: ".accessoryCircular") {
                GACard(api: ".gaugeStyle(.accessoryCircular)") {
                    Gauge(value: speed, in: 0...120) {
                        Image(systemName: "gauge.medium")
                    } currentValueLabel: {
                        Text("\(Int(speed))")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("120")
                    }
                    .gaugeStyle(.accessoryCircular)
                }
            }

            GAVariant(title: ".accessoryCircularCapacity") {
                GACard(api: ".gaugeStyle(.accessoryCircularCapacity)") {
                    Gauge(value: progress) {
                        Text("CPU")
                    } currentValueLabel: {
                        Text("\(Int(progress * 100))%")
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                }
            }

            GAVariant(title: "Custom range in: 0...120") {
                GACard(api: "Gauge(value: speed, in: 0...120) { … }") {
                    Gauge(value: speed, in: 0...120) {
                        Text("Speed (km/h)")
                    } currentValueLabel: {
                        Text("\(Int(speed))")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("120")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            GAVariant(title: "Boundary values") {
                HStack(spacing: 16) {
                    GACard(api: "value: 0.0") {
                        Gauge(value: 0.0) { Text("Empty") }.gaugeStyle(.linearCapacity)
                    }
                    GACard(api: "value: 1.0") {
                        Gauge(value: 1.0) { Text("Full") }.gaugeStyle(.linearCapacity)
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowGA(symbol: "dial.medium", title: ".accessoryCircular renders as a small arc — ideal for widgets and Watch complications.",
                      detail: "On macOS it also renders correctly in views. The circular styles are best paired with a compact currentValueLabel to avoid crowding.")
            NoteRowGA(symbol: "slider.horizontal.3", title: "Gauge does not accept user interaction — it's read-only.",
                      detail: "To let users adjust the value, pair Gauge with a Slider that binds to the same @State variable. Gauge displays; Slider adjusts.")
        }
    }
}

private struct GACard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 300, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct GAVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowGA: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

#Preview {
    GaugePage().frame(width: 800, height: 1000)
}
