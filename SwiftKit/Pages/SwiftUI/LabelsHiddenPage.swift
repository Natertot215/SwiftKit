import SwiftUI

// SwiftUI `View/labelsHidden()` reference page.
// Source: Documentation/SwiftUI/view-configuration/labelshidden().md
// macOS 10.15+. Hides labels of contained controls; labels still exist for accessibility.

struct LabelsHiddenPage: View {
    @State private var toggle1 = true
    @State private var toggle2 = false
    @State private var slider1: Double = 0.4
    @State private var slider2: Double = 0.6
    @State private var pickerValue = "Vanilla"

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
            Text("View/labelsHidden()")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Hides the labels of any controls contained within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/labelshidden().md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 12) {
                Toggle(isOn: $toggle1) { Text("Toggle 1") }
                    .labelsHidden()
                Toggle(isOn: $toggle2) { Text("Toggle 2") }
            }
            .frame(width: 240, alignment: .leading)
            APICallout("Toggle(isOn: $toggle1) { Text(\"Toggle 1\") }.labelsHidden()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LabelsHiddenVariantRow(title: "Slider \u{2014} hide leading label") {
                VStack(alignment: .leading, spacing: 12) {
                    Slider(value: $slider1, in: 0...1) { Text("Volume") }
                        .labelsHidden()
                        .frame(width: 240)
                    APICallout("Slider(value: _, in: _) { Text(\"Volume\") }.labelsHidden()")
                }
            }

            LabelsHiddenVariantRow(title: "Picker \u{2014} hide leading label") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Flavor", selection: $pickerValue) {
                        Text("Chocolate").tag("Chocolate")
                        Text("Vanilla").tag("Vanilla")
                        Text("Strawberry").tag("Strawberry")
                    }
                    .labelsHidden()
                    .frame(width: 200)
                    APICallout("Picker(\"Flavor\", selection:) { \u{2026} }.labelsHidden()")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LabelsHiddenVariantRow(title: "With label vs labelsHidden") {
                HStack(alignment: .top, spacing: 32) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("with label")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                        Slider(value: $slider1, in: 0...1) { Text("Brightness") }
                            .frame(width: 220)
                        Toggle(isOn: $toggle1) { Text("Notifications") }
                            .frame(width: 220, alignment: .leading)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text(".labelsHidden()")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                        Slider(value: $slider2, in: 0...1) { Text("Brightness") }
                            .labelsHidden()
                            .frame(width: 220)
                        Toggle(isOn: $toggle2) { Text("Notifications") }
                            .labelsHidden()
                            .frame(width: 220, alignment: .leading)
                    }
                }
            }
        }
    }

    private struct LHNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LHNote] = [
        .init(title: "Always provide a label, even when hiding it.",
              detail: "Labels still feed accessibility (VoiceOver, Switch Control) and tooltips. Hiding the label visually is fine; omitting it entirely breaks accessibility.",
              symbol: "accessibility"),
        .init(title: "Only affects labels separate from the control body.",
              detail: "Toggle, Slider, Stepper, Picker, ColorPicker have detached labels and respect this modifier. A bordered Button's label is inside the button's border \u{2014} .labelsHidden() does not affect it.",
              symbol: "switch.2"),
        .init(title: "Prefer .labelsVisibility(_:) when you need a binding.",
              detail: "labelsHidden() is a constant on/off. .labelsVisibility(_:) takes a Visibility value, so you can drive it from state (.automatic, .visible, .hidden).",
              symbol: "eye"),
        .init(title: "Common in dense Inspector / Form layouts.",
              detail: "Rows that already have a header column often hide the per-control label so the controls align flush. Used heavily in Mac apps with custom property inspectors.",
              symbol: "sidebar.right"),
        .init(title: "Doesn't suppress LabeledContent labels by itself.",
              detail: "LabeledContent's label is structural \u{2014} treat .labelsHidden() as a hint to controls within. Use .labelsVisibility(.hidden) or omit the label parameter for full LabeledContent suppression.",
              symbol: "exclamationmark.triangle")
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

private struct LabelsHiddenVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    LabelsHiddenPage()
        .frame(width: 1100, height: 800)
}
