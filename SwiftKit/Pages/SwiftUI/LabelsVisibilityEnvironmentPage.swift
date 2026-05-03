import SwiftUI

// SwiftUI `EnvironmentValues/labelsVisibility` reference page.
// Source: Documentation/SwiftUI/view-configuration/labelsvisibility.md
// macOS 15.0+. Environment value mirroring the .labelsVisibility(_:) modifier.

struct LabelsVisibilityEnvironmentPage: View {
    @State private var visibility: Visibility = .automatic

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
            Text("EnvironmentValues/labelsVisibility")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The labels visibility set by View/labelsVisibility(_:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/labelsvisibility.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            QuizCardView()
                .labelsVisibility(visibility)
                .frame(width: 280)
            Picker("Visibility", selection: $visibility) {
                Text(".automatic").tag(Visibility.automatic)
                Text(".visible").tag(Visibility.visible)
                Text(".hidden").tag(Visibility.hidden)
            }
            .pickerStyle(.segmented)
            .frame(width: 320)
            APICallout("@Environment(\\.labelsVisibility) private var labelsVisibility")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LVEVariantRow(title: "Reading the value in a custom view") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("""
                    @Environment(\\.labelsVisibility) private var labelsVisibility
                    var body: some View {
                        VStack {
                            CardContent()
                            if labelsVisibility != .hidden {
                                Text(\"Quiz Card\")
                            }
                        }
                    }
                    """)
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                    APICallout("Read \\.labelsVisibility to mirror the parent's preference.")
                }
            }

            LVEVariantRow(title: "Three preset values rendered side-by-side") {
                HStack(alignment: .top, spacing: 16) {
                    ForEach([Visibility.automatic, .visible, .hidden], id: \.self) { vis in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(label(for: vis))
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                            QuizCardView()
                                .labelsVisibility(vis)
                                .frame(width: 200)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            LVEVariantRow(title: "Always include accessibility label.") {
                Text("Even when hiding the visible label, attach an accessibility label so VoiceOver still announces meaning. The doc example uses .accessibilityLabel { Text(\"Quiz Card\") }.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
    }

    private struct LVENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LVENote] = [
        .init(title: "Read the environment to mirror the parent's preference.",
              detail: "Custom views can opt into the same .labelsVisibility(_:) preference as Apple controls by reading the environment value and conditionally rendering their own label.",
              symbol: "leaf"),
        .init(title: "Compare against .hidden, not .visible.",
              detail: ".automatic and .visible both typically mean \"show the label\". Branch on labelsVisibility != .hidden when deciding whether to render.",
              symbol: "checkmark.circle"),
        .init(title: "Always supply an accessibility label.",
              detail: "Hiding the visible label is a UI choice; accessibility still needs to know what the control is. Pair with .accessibilityLabel.",
              symbol: "accessibility"),
        .init(title: "Default value is .automatic.",
              detail: "When no ancestor sets the modifier, the environment value is .automatic \u{2014} platform default behavior for whatever control reads it.",
              symbol: "gear"),
        .init(title: "Set with the .labelsVisibility(_:) modifier.",
              detail: "There is no setter in the environment surface itself \u{2014} apply the modifier on a parent view to push a value down the hierarchy.",
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

private struct QuizCardView: View {
    @Environment(\.labelsVisibility) private var labelsVisibility

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundStyle(.tint)
                Text("3 \u{00d7} 7 = ?")
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            if labelsVisibility != .hidden {
                Text("Quiz Card")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct LVEVariantRow<Content: View>: View {
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
    LabelsVisibilityEnvironmentPage()
        .frame(width: 1100, height: 800)
}
