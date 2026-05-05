import SwiftUI

// SwiftUI `View/tint(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/tint(_:).md
// macOS 12.0+. Sets a per-view tint color, overriding the inherited accent.

struct TintPage: View {
    @State private var sliderValue: Double = 0.6
    @State private var toggleOn: Bool = true

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
            Text("View/tint(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the tint color within this view, overriding the inherited accent for tint-aware controls.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/tint(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button("Continue") {}
                .buttonStyle(.borderedProminent)
                .tint(.green)
            APICallout(".tint(.green)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TPVariantRow(title: "Tint on Buttons (.borderedProminent)") {
                HStack(spacing: 12) {
                    Button("Answer") {}.buttonStyle(.borderedProminent).tint(.green)
                    Button("Decline") {}.buttonStyle(.borderedProminent).tint(.red)
                    Button("Snooze") {}.buttonStyle(.borderedProminent).tint(.orange)
                    Button("Default") {}.buttonStyle(.borderedProminent)
                }
            }

            TPVariantRow(title: "Tint on Toggle") {
                HStack(spacing: 16) {
                    Toggle("Default", isOn: $toggleOn)
                    Toggle("Pink", isOn: $toggleOn).tint(.pink)
                    Toggle("Indigo", isOn: $toggleOn).tint(.indigo)
                    Toggle("Mint", isOn: $toggleOn).tint(.mint)
                }
                .toggleStyle(.switch)
            }

            TPVariantRow(title: "Tint on ProgressView") {
                VStack(alignment: .leading, spacing: 8) {
                    ProgressView(value: sliderValue)
                    ProgressView(value: sliderValue).tint(.purple)
                    ProgressView(value: sliderValue).tint(.teal)
                }
                .frame(width: 300)
            }

            TPVariantRow(title: "Tint on Slider") {
                VStack(alignment: .leading, spacing: 8) {
                    Slider(value: $sliderValue)
                    Slider(value: $sliderValue).tint(.orange)
                    Slider(value: $sliderValue).tint(.cyan)
                }
                .frame(width: 300)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            TPVariantRow(title: ".tint(nil) — restore inherited accent") {
                HStack(spacing: 12) {
                    Button("Inherited") {}.buttonStyle(.borderedProminent)
                    Button("Tinted Pink") {}.buttonStyle(.borderedProminent).tint(.pink)
                    Button("Reset to nil") {}.buttonStyle(.borderedProminent).tint(.pink).tint(nil)
                }
            }

            TPVariantRow(title: "Disabled — tint dims") {
                HStack(spacing: 12) {
                    Button("Enabled") {}.buttonStyle(.borderedProminent).tint(.green)
                    Button("Disabled") {}.buttonStyle(.borderedProminent).tint(.green).disabled(true)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Tint overrides accent within its subtree.", ".tint(_:) sets a value in the environment that tint-aware controls read; everything below it (until the next .tint or .tint(nil)) uses the new color.", "drop.fill"),
        ("Distinct from .accentColor.", "Apple's accent color is set by user preference and tracks system; .tint is a per-view override that's always respected. Use .tint to add semantic meaning to a control (.green for confirm, .red for destructive).", "circle.lefthalf.filled"),
        ("Pass a Color or nil.", "tint(_:) takes Color? — passing .red, .green, etc. sets a value; passing nil clears any inherited tint and restores the parent context's accent.", "paintpalette"),
        ("Affects ProgressView, Slider, Toggle (.switch), Buttons in tinted styles.", "Many controls read the tint environment value. .borderedProminent buttons fill with the tint, .switch toggles use it for the on-state, ProgressView and Slider color their fill with it.", "switch.2")
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

private struct TPVariantRow<Content: View>: View {
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
    TintPage()
        .frame(width: 1100, height: 1000)
}
