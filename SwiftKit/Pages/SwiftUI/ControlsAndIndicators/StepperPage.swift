import SwiftUI

// SwiftUI `Stepper` reference page — TypographyPage rhythm.
// Covers: basic value, range, step, onIncrement/onDecrement, disabled state.
// macOS 10.15+
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

struct StepperPage: View {
    @State private var basicValue = 0
    @State private var rangeValue = 5
    @State private var steppedValue = 0.0
    @State private var customValue = 10

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                defaultSection
                steppedRangeSection
                customLabelSection
                statesSection
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
            Text("Stepper")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control that performs increment and decrement actions.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/stepper.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Stepper")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "Stepper(\u{201c}Count: \\(n)\u{201d}, value: $n)") {
            VStack(alignment: .leading, spacing: 6) {
                Stepper("Count: \(basicValue)", value: $basicValue)
                    .frame(width: 340)
                APICallout("Stepper(\"Count: \\(basicValue)\", value: $basicValue)")
            }
        }
    }

    // MARK: Stepped Range

    private var steppedRangeSection: some View {
        PageSection("Stepped Range Variants", subtitle: "in: range constraint and step: increment") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("String label, unbound range")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Stepper("Count: \(basicValue)", value: $basicValue)
                            .frame(width: 340)
                        APICallout("Stepper(\"Count: \\(n)\", value: $n)")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With in: range constraint")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Stepper(value: $rangeValue, in: 0...10) {
                            Text("Value: \(rangeValue)  (0\u{2013}10)")
                        }
                        .frame(width: 340)
                        APICallout("Stepper(value: $v, in: 0...10) { Text(\"Value: \\(v)\") }")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With step: increment")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Stepper(
                            "Step 0.5: \(steppedValue, specifier: "%.1f")",
                            value: $steppedValue,
                            in: 0...5,
                            step: 0.5
                        )
                        .frame(width: 340)
                        APICallout("Stepper(\"Step 0.5\", value: $v, in: 0...5, step: 0.5)")
                    }
                }
            }
        }
    }

    // MARK: Custom Labels

    private var customLabelSection: some View {
        PageSection("Custom Labels \u{0026} Callbacks", subtitle: "Manual onIncrement / onDecrement") {
            VStack(alignment: .leading, spacing: 8) {
                Text("onIncrement / onDecrement explicit callbacks")
                    .font(.headline)
                    .foregroundStyle(.primary)
                VStack(alignment: .leading, spacing: 6) {
                    Stepper {
                        Text("Value: \(customValue)")
                    } onIncrement: {
                        customValue += 10
                    } onDecrement: {
                        customValue -= 10
                    }
                    .frame(width: 340)
                    APICallout("Stepper(onIncrement: { v += 10 }, onDecrement: { v -= 10 }) { … }")
                }
            }
        }
    }

    // MARK: States

    private var statesSection: some View {
        PageSection("States", subtitle: "Disabled state \u{2014} .disabled(true) propagation") {
            VStack(alignment: .leading, spacing: 6) {
                Stepper("Count: \(basicValue)", value: $basicValue)
                    .disabled(true)
                    .frame(width: 340)
                APICallout("Stepper(\"Count\", value: $n).disabled(true)")
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Guidance from Apple\u{2019}s docs.") {
            VStack(alignment: .leading, spacing: 16) {
                stepperNoteRow(
                    symbol: "plus.forwardslash.minus",
                    title: "Range enforcement is automatic with in:.",
                    detail: "When in: is supplied SwiftUI clamps the value so the + button disables at max and the \u{2013} button disables at min. Without in:, the value grows unbounded."
                )
                stepperNoteRow(
                    symbol: "hand.tap",
                    title: "Use onIncrement/onDecrement for custom step logic.",
                    detail: "The explicit callback form is useful when a step isn\u{2019}t a fixed delta \u{2014} e.g. doubling, cycling through enum cases, or clamping against external state."
                )
                stepperNoteRow(
                    symbol: "textformat",
                    title: "Label accepts any View.",
                    detail: "The label trailing closure accepts a full View, not just a String. Use it for rich labels with icons, secondary text, or custom formatting."
                )
            }
        }
    }

    // MARK: Helpers

    private func stepperNoteRow(symbol: String, title: String, detail: String) -> some View {
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

#Preview {
    StepperPage()
        .frame(width: 800, height: 900)
}
