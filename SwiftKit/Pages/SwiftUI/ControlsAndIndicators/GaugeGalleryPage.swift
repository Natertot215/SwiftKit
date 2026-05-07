import SwiftUI

// SwiftUI `Gauge` consolidated reference page.
// Absorbs: GaugeStyle, GaugeStyleConfiguration, View/gaugeStyle(_:) (from GaugeStylePage.swift)
// Sources:
//   Documentation/SwiftUI/controls-and-indicators/gauge.md
//   Documentation/SwiftUI/view-styles/gaugestyle.md
//   Documentation/SwiftUI/view-styles/gaugestyleconfiguration.md
//   Documentation/SwiftUI/view-styles/gaugestyle(_:).md
// macOS 13.0+
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

private let gaugeCardWidth: CGFloat = 280
private let gaugeCardHeight: CGFloat = 160

struct GaugeGalleryPage: View {
    @State private var value: Double = 0.6
    @State private var speed: Double = 55.0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                referenceSection
                defaultSection
                rangeVariantsSection
                styleGallerySection
                boundaryStatesSection
                tintSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Gauge \u{00b7} GaugeStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that shows a value within a range. Useful for displaying download progress, speed, or capacity.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/gauge.md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Gauge  \u{00b7}  GaugeStyle  \u{00b7}  GaugeStyleConfiguration  \u{00b7}  View/gaugeStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference

    private var referenceSection: some View {
        PageSection(
            "Reference",
            subtitle: "GaugeStyle protocol \u{00b7} GaugeStyleConfiguration \u{00b7} macOS 13.0+"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("GaugeStyle is a protocol for customising the appearance of a Gauge. Apply a built-in style via .gaugeStyle(_:) on any view; all Gauge instances in the subtree inherit it. The built-in conformers on macOS are .automatic, .linearCapacity, .accessoryLinear, .accessoryLinearCapacity, .accessoryCircular, and .accessoryCircularCapacity.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("SwiftKit does NOT author custom GaugeStyle conformers per project hard constraint. The GaugeStyleConfiguration struct is provided to implementations by the framework; it is not publicly constructible.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                GaugeCodeBlock(text:
                    """
                    protocol GaugeStyle {
                        associatedtype Body : View
                        @ViewBuilder func makeBody(configuration: Configuration) -> Body
                        typealias Configuration = GaugeStyleConfiguration
                    }

                    struct GaugeStyleConfiguration {
                        var value: Double                          // 0…1 normalized
                        var minimumValueLabel: Label?
                        var maximumValueLabel: Label?
                        var label: Label                           // primary
                        var currentValueLabel: Label?
                        var markedValueLabels: AnyRandomAccessCollection<Label>
                    }

                    extension View {
                        func gaugeStyle<S: GaugeStyle>(_ style: S) -> some View
                    }
                    """)
            }
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "Gauge(value: 0.6) { Text(\u{201c}Progress\u{201d}) }") {
            VStack(alignment: .leading, spacing: 6) {
                Gauge(value: value) {
                    Text("Progress")
                }
                .frame(minWidth: 300, alignment: .leading)
                APICallout("Gauge(value: 0.6) { Text(\"Progress\") }")
            }
        }
    }

    // MARK: Range Variants

    private var rangeVariantsSection: some View {
        PageSection("Gauge Variants", subtitle: "Custom range, labels, and value display") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Custom range: in: 0...120")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Gauge(value: speed, in: 0...120) {
                            Text("Speed (km/h)")
                        } currentValueLabel: {
                            Text("\(Int(speed))")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("120")
                        }
                        .frame(minWidth: 300, alignment: .leading)
                        APICallout("Gauge(value: speed, in: 0...120) { … } currentValueLabel: { … } minimumValueLabel: { … } maximumValueLabel: { … }")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Live binding with Slider")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Gauge(value: value) {
                            Text("Capacity")
                        } currentValueLabel: {
                            Text(value, format: .percent.precision(.fractionLength(0)))
                        } minimumValueLabel: {
                            Text("0%")
                        } maximumValueLabel: {
                            Text("100%")
                        }
                        .gaugeStyle(.linearCapacity)
                        .frame(minWidth: 300, alignment: .leading)
                        Slider(value: $value, in: 0...1) { Text("Value") }
                            .frame(maxWidth: 360)
                        APICallout("Slider(value: $value, in: 0...1)")
                    }
                }
            }
        }
    }

    // MARK: Style Gallery

    private var styleGallerySection: some View {
        PageSection(
            "GaugeStyle Gallery",
            subtitle: "View/gaugeStyle(_:) \u{00b7} all six built-in styles on macOS"
        ) {
            VStack(alignment: .leading, spacing: 16) {
                Text("All GaugeStyle values available on macOS, applied to the same gauge value.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: gaugeCardWidth + 24), spacing: 24)],
                    alignment: .leading,
                    spacing: 24
                ) {
                    GaugeStyleCard(title: ".automatic", api: ".gaugeStyle(.automatic)") {
                        sampleGauge.gaugeStyle(.automatic)
                    }
                    GaugeStyleCard(title: ".linearCapacity", api: ".gaugeStyle(.linearCapacity)") {
                        sampleGauge.gaugeStyle(.linearCapacity)
                    }
                    GaugeStyleCard(title: ".accessoryLinear", api: ".gaugeStyle(.accessoryLinear)") {
                        sampleGauge.gaugeStyle(.accessoryLinear)
                    }
                    GaugeStyleCard(title: ".accessoryLinearCapacity", api: ".gaugeStyle(.accessoryLinearCapacity)") {
                        sampleGauge.gaugeStyle(.accessoryLinearCapacity)
                    }
                    GaugeStyleCard(title: ".accessoryCircular", api: ".gaugeStyle(.accessoryCircular)") {
                        Gauge(value: value, in: 0...1) {
                            Image(systemName: "gauge.medium")
                        } currentValueLabel: {
                            Text(value, format: .percent.precision(.fractionLength(0)))
                        } minimumValueLabel: {
                            Text("0%")
                        } maximumValueLabel: {
                            Text("100%")
                        }
                        .gaugeStyle(.accessoryCircular)
                    }
                    GaugeStyleCard(title: ".accessoryCircularCapacity", api: ".gaugeStyle(.accessoryCircularCapacity)") {
                        sampleGauge.gaugeStyle(.accessoryCircularCapacity)
                    }
                }
            }
        }
    }

    // MARK: Boundary States

    private var boundaryStatesSection: some View {
        PageSection("Boundary States", subtitle: "value: 0.0 (empty) and value: 1.0 (full)") {
            HStack(alignment: .top, spacing: 24) {
                VStack(alignment: .leading, spacing: 6) {
                    Gauge(value: 0.0) { Text("Empty") }
                        .gaugeStyle(.linearCapacity)
                        .frame(width: 280)
                    APICallout("Gauge(value: 0.0) { … }.gaugeStyle(.linearCapacity)")
                }
                VStack(alignment: .leading, spacing: 6) {
                    Gauge(value: 1.0) { Text("Full") }
                        .gaugeStyle(.linearCapacity)
                        .frame(width: 280)
                    APICallout("Gauge(value: 1.0) { … }.gaugeStyle(.linearCapacity)")
                }
            }
        }
    }

    // MARK: Tint

    private var tintSection: some View {
        PageSection("Tint Propagation", subtitle: ".tint(_:) colors the fill or needle") {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 24) {
                    GaugeStyleCard(title: ".tint(.green)", api: ".tint(.green)") {
                        sampleGauge.gaugeStyle(.accessoryLinearCapacity).tint(.green)
                    }
                    GaugeStyleCard(title: ".tint(.orange)", api: ".tint(.orange)") {
                        sampleGauge.gaugeStyle(.accessoryLinearCapacity).tint(.orange)
                    }
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Guidance from Apple\u{2019}s docs.") {
            VStack(alignment: .leading, spacing: 16) {
                gaugeNoteRow(
                    symbol: "gauge",
                    title: "Two families: capacity vs ranged.",
                    detail: "Capacity styles (.linearCapacity, .accessoryLinearCapacity, .accessoryCircularCapacity) draw a fill bar/arc. Ranged styles (.accessoryLinear, .accessoryCircular) draw a needle/dot at the value\u{2019}s position."
                )
                gaugeNoteRow(
                    symbol: "rectangle.stack",
                    title: "Accessory styles target widget contexts.",
                    detail: "They\u{2019}re sized for Widget complications and Watch complications. They render fine in normal views but are visually tight; consider .linearCapacity for inline progress in regular UI."
                )
                gaugeNoteRow(
                    symbol: "textformat.123",
                    title: "currentValueLabel renders inside circular styles.",
                    detail: "For .accessoryCircular and .accessoryCircularCapacity the currentValueLabel sits at the center. Linear styles render it adjacent to the bar."
                )
                gaugeNoteRow(
                    symbol: "function",
                    title: "GaugeStyleConfiguration.value is normalized to 0\u{2026}1.",
                    detail: "Even though Gauge accepts an arbitrary in: range, the configuration\u{2019}s value is always 0\u{2026}1. Custom conformers don\u{2019}t need to handle the original range."
                )
                gaugeNoteRow(
                    symbol: "paintpalette",
                    title: "Tint colors the fill or needle.",
                    detail: "Use .tint(_:) on the Gauge or any ancestor. Capacity styles fill with the tint; ranged styles tint the indicator."
                )
                gaugeNoteRow(
                    symbol: "slider.horizontal.3",
                    title: "Gauge is read-only \u{2014} pair with Slider for user adjustment.",
                    detail: "Gauge does not accept user interaction. To let users change the value, bind both a Gauge and a Slider to the same @State variable."
                )
            }
        }
    }

    // MARK: Helpers

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

    private func gaugeNoteRow(symbol: String, title: String, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

// MARK: Private sub-views

private struct GaugeStyleCard<Content: View>: View {
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
                .frame(width: 280, height: 160, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct GaugeCodeBlock: View {
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

extension GaugeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.gauge",
        title: "Gauge",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Gauge"],
        blurb: "A view that shows a current value within a range, like a fuel gauge. Configure with bounds, marked values, and labels.",
        signature: "struct Gauge<Label, CurrentValueLabel, BoundsLabel, MarkedValueLabels> where Label : View, CurrentValueLabel : View, BoundsLabel : View, MarkedValueLabels : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/gauge.md",
        page: { AnyView(GaugeGalleryPage()) }
    )
}

#Preview {
    GaugeGalleryPage()
        .frame(width: 1000, height: 1400)
}
