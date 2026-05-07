import SwiftUI

// SwiftUI `Slider` reference page.
// Covers: basic value, range, step, labels, and onEditingChanged.
// macOS 10.15+

struct SliderGalleryPage: View {
    @State private var basicValue: Double = 0.5
    @State private var steppedValue: Double = 3
    @State private var labeledValue: Double = 50
    @State private var isEditing = false

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
            Text("Slider")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control for selecting a value from a bounded linear range of values.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/slider.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SCard(api: "Slider(value: $value)  // value: 0.0...1.0") {
            VStack(alignment: .leading, spacing: 6) {
                Slider(value: $basicValue)
                Text("value: \(basicValue, specifier: "%.2f")")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            SVariant(title: "Custom range — in: 0...100") {
                SCard(api: "Slider(value: $value, in: 0...100)") {
                    VStack(alignment: .leading, spacing: 6) {
                        Slider(value: $labeledValue, in: 0...100)
                        Text("value: \(labeledValue, specifier: "%.0f")")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            SVariant(title: "Stepped — step: 1.0 over 0...10") {
                SCard(api: "Slider(value: $value, in: 0...10, step: 1)") {
                    VStack(alignment: .leading, spacing: 6) {
                        Slider(value: $steppedValue, in: 0...10, step: 1)
                        Text("value: \(steppedValue, specifier: "%.0f")")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            SVariant(title: "With min / max labels") {
                SCard(api: "Slider(value: $v, in: 0...100) { Text(\"Vol\") } minimumValueLabel: { Image(systemName: \"speaker\") } maximumValueLabel: { Image(systemName: \"speaker.wave.3\") }") {
                    Slider(value: $labeledValue, in: 0...100) {
                        Text("Volume")
                    } minimumValueLabel: {
                        Image(systemName: "speaker")
                    } maximumValueLabel: {
                        Image(systemName: "speaker.wave.3")
                    }
                }
            }

            SVariant(title: "With onEditingChanged callback") {
                SCard(api: "Slider(value: $v) { editing in isEditing = editing }") {
                    VStack(alignment: .leading, spacing: 6) {
                        Slider(value: $basicValue) { editing in
                            isEditing = editing
                        }
                        Text(isEditing ? "Dragging…" : "Idle")
                            .font(.caption).fontDesign(.monospaced)
                            .foregroundStyle(isEditing ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary))
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            SVariant(title: "Disabled") {
                SCard(api: "Slider(value: $value).disabled(true)") {
                    Slider(value: .constant(0.4)).disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowS(symbol: "slider.horizontal.3", title: "Default range is 0.0...1.0.",
                     detail: "Use the in: parameter for custom ranges. The step: parameter snaps to discrete values — useful for integer-backed preferences.")
            NoteRowS(symbol: "label.slash", title: "The label is accessible only — not rendered on macOS.",
                     detail: "On macOS the label view in Slider(value:in:label:minimumValueLabel:maximumValueLabel:) is used by VoiceOver but not displayed inline. Use surrounding Text views if you need a visible label.")
        }
    }
}

private struct SCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(width: 340, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct SVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowS: View {
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

extension SliderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.slider",
        title: "Slider",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Slider"],
        blurb: "A control for selecting a value from a bounded linear range. The thumb moves along a track between minimum and maximum values, updating the bound value continuously.",
        signature: "struct Slider<Label, ValueLabel> where Label : View, ValueLabel : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/slider.md",
        page: { AnyView(SliderGalleryPage()) }
    )
}

#Preview {
    SliderGalleryPage().frame(width: 800, height: 700)
}
