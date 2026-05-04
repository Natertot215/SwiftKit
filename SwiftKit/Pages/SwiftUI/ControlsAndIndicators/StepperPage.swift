import SwiftUI

// SwiftUI `Stepper` reference page.
// Covers: basic value, range, step, onIncrement/onDecrement, and label variants.
// macOS 10.15+

struct StepperPage: View {
    @State private var basicValue = 0
    @State private var rangeValue = 5
    @State private var steppedValue = 0.0
    @State private var customValue = 10

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
            Text("Stepper")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control that performs increment and decrement actions.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/stepper.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        STCard(api: "Stepper(\"Count: \\(basicValue)\", value: $basicValue)") {
            Stepper("Count: \(basicValue)", value: $basicValue)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            STVariant(title: "String label, unbound range") {
                STCard(api: "Stepper(\"Count: \\(n)\", value: $n)") {
                    Stepper("Count: \(basicValue)", value: $basicValue)
                }
            }

            STVariant(title: "With in: range constraint") {
                STCard(api: "Stepper(value: $v, in: 0...10) { Text(\"Value: \\(v)\") }") {
                    Stepper(value: $rangeValue, in: 0...10) {
                        Text("Value: \(rangeValue)  (0–10)")
                    }
                }
            }

            STVariant(title: "With step: increment") {
                STCard(api: "Stepper(\"Step 0.5\", value: $v, in: 0...5, step: 0.5)") {
                    Stepper("Step 0.5: \(steppedValue, specifier: "%.1f")", value: $steppedValue, in: 0...5, step: 0.5)
                }
            }

            STVariant(title: "Manual onIncrement / onDecrement") {
                STCard(api: "Stepper(onIncrement: { v += 10 }, onDecrement: { v -= 10 }) { … }") {
                    Stepper {
                        Text("Value: \(customValue)")
                    } onIncrement: {
                        customValue += 10
                    } onDecrement: {
                        customValue -= 10
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            STVariant(title: "Disabled") {
                STCard(api: "Stepper(\"Count\", value: $n).disabled(true)") {
                    Stepper("Count: \(basicValue)", value: $basicValue).disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowST(symbol: "plus.forwardslash.minus", title: "Range enforcement is automatic with in:.",
                      detail: "When in: is supplied SwiftUI clamps the value so the + button disables at max and the – button disables at min. Without in:, the value grows unbounded.")
            NoteRowST(symbol: "hand.tap", title: "Use onIncrement/onDecrement for custom step logic.",
                      detail: "The explicit callback form is useful when a step isn't a fixed delta — e.g. doubling, cycling through enum cases, or clamping against external state.")
        }
    }
}

private struct STCard<Content: View>: View {
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

private struct STVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowST: View {
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
    StepperPage().frame(width: 800, height: 700)
}
