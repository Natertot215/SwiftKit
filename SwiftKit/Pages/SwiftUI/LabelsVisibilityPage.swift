import SwiftUI

// SwiftUI `View/labelsVisibility(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/labelsvisibility(_:).md
// macOS 15.0+. Controls visibility of labels via the Visibility enum.

struct LabelsVisibilityPage: View {
    @State private var toggle1 = true
    @State private var toggle2 = false
    @State private var slider1: Double = 0.5
    @State private var visibility: Visibility = .hidden

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
            Text("View/labelsVisibility(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls the visibility of labels of any controls contained within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/labelsvisibility(_:).md \u{00b7} macOS 15.0+")
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
                    .labelsVisibility(.hidden)
                Toggle(isOn: $toggle2) { Text("Toggle 2") }
            }
            .frame(width: 240, alignment: .leading)
            APICallout(".labelsVisibility(.hidden)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LVVariantRow(title: "Side-by-side \u{2014} all three Visibility values") {
                HStack(alignment: .top, spacing: 24) {
                    ForEach([Visibility.automatic, .visible, .hidden], id: \.self) { vis in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(label(for: vis))
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                            Slider(value: .constant(0.5), in: 0...1) { Text("Brightness") }
                                .labelsVisibility(vis)
                                .frame(width: 200)
                            Toggle(isOn: .constant(true)) { Text("On") }
                                .labelsVisibility(vis)
                                .frame(width: 200, alignment: .leading)
                        }
                    }
                }
            }

            LVVariantRow(title: "LabeledContent + .labelsVisibility(.visible)") {
                VStack(alignment: .leading, spacing: 8) {
                    LabeledContent("Volume") {
                        Slider(value: $slider1, in: 0...1)
                            .frame(width: 180)
                    }
                    .labelsVisibility(.visible)
                    .frame(width: 320, alignment: .leading)
                    APICallout("LabeledContent(\u{2026}).labelsVisibility(.visible)")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            LVVariantRow(title: "Drive from a Picker") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Visibility", selection: $visibility) {
                        Text(".automatic").tag(Visibility.automatic)
                        Text(".visible").tag(Visibility.visible)
                        Text(".hidden").tag(Visibility.hidden)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 320)

                    Toggle(isOn: $toggle1) { Text("Notifications") }
                        .labelsVisibility(visibility)
                        .frame(width: 240, alignment: .leading)
                    Slider(value: $slider1, in: 0...1) { Text("Brightness") }
                        .labelsVisibility(visibility)
                        .frame(width: 240)
                    Text("visibility = \(label(for: visibility))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct LVNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LVNote] = [
        .init(title: "Bindable replacement for .labelsHidden().",
              detail: ".labelsHidden() is a constant; .labelsVisibility(_:) takes a Visibility value (.automatic / .visible / .hidden) so you can drive it from state.",
              symbol: "eye"),
        .init(title: ".automatic defers to the platform default for the control.",
              detail: "On iOS a Picker inside a Menu hides its label automatically. Use .labelsVisibility(.visible) to override that default explicitly.",
              symbol: "gear"),
        .init(title: "Always provide a label even if hiding it.",
              detail: "Labels feed accessibility, Switch Control, tooltips, and the menu bar. Hiding visually is fine; omitting structurally is not.",
              symbol: "accessibility"),
        .init(title: "Pairs with the labelsVisibility environment value.",
              detail: "Custom views can read \\.labelsVisibility from the environment to apply the same preference to their own bespoke labels. See EnvironmentValues/labelsVisibility.",
              symbol: "leaf"),
        .init(title: "Inherited down the hierarchy.",
              detail: "Setting .labelsVisibility on a container affects every supporting control inside it. Children can override by reapplying the modifier.",
              symbol: "arrow.down.circle")
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

    private func label(for v: Visibility) -> String {
        switch v {
        case .automatic: return ".automatic"
        case .visible:   return ".visible"
        case .hidden:    return ".hidden"
        @unknown default: return String(describing: v)
        }
    }
}

private struct LVVariantRow<Content: View>: View {
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
    LabelsVisibilityPage()
        .frame(width: 1100, height: 800)
}
