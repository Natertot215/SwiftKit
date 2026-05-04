import SwiftUI

// SwiftUI `ProgressView` + `DefaultDateProgressLabel` reference page.
// Covers: indeterminate, determinate, timer-based, and style variants.
// macOS 11.0+

struct ProgressViewPage: View {
    @State private var progress = 0.4
    private let timerInterval = Date()...Date().addingTimeInterval(10)

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
            Text("ProgressView · DefaultDateProgressLabel")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that shows the progress of a task. Supports indeterminate, determinate, and timer-based modes.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/progressview.md · macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PVCard(api: "ProgressView()  // indeterminate spinner") {
            ProgressView()
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            PVVariant(title: "Indeterminate (spinning activity indicator)") {
                PVCard(api: "ProgressView()") {
                    ProgressView()
                }
            }

            PVVariant(title: "Indeterminate with label") {
                PVCard(api: "ProgressView(\"Loading…\")") {
                    ProgressView("Loading…")
                }
            }

            PVVariant(title: "Determinate — value: 0.0...1.0") {
                PVCard(api: "ProgressView(value: 0.4)") {
                    VStack(alignment: .leading, spacing: 6) {
                        ProgressView(value: progress)
                        Text("progress: \(progress, specifier: "%.2f")")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        Slider(value: $progress).controlSize(.small)
                    }
                }
            }

            PVVariant(title: "Determinate with label and total") {
                PVCard(api: "ProgressView(\"Uploading\", value: 40, total: 100)") {
                    ProgressView("Uploading", value: 40.0, total: 100.0)
                }
            }

            PVVariant(title: ".circular style (spinning on macOS)") {
                PVCard(api: ".progressViewStyle(.circular)") {
                    ProgressView().progressViewStyle(.circular)
                }
            }

            PVVariant(title: ".linear style (progress bar)") {
                PVCard(api: ".progressViewStyle(.linear)") {
                    ProgressView(value: progress).progressViewStyle(.linear)
                }
            }

            PVVariant(title: "Timer-based — ProgressView(timerInterval:)") {
                PVCard(api: "ProgressView(timerInterval: start...end)") {
                    ProgressView(timerInterval: timerInterval)
                }
            }

            PVVariant(title: "DefaultDateProgressLabel — internal label type for timer ProgressViews") {
                PVCard(api: "// DefaultDateProgressLabel has no public init — used internally by ProgressView(timerInterval:)") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("DefaultDateProgressLabel is an internal SwiftUI type used by ProgressView(timerInterval:) to render the countdown. It is not publicly constructible.")
                            .font(.caption).foregroundStyle(.secondary)
                        ProgressView(timerInterval: timerInterval)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            PVVariant(title: "Boundary values — empty and full") {
                HStack(spacing: 16) {
                    PVCard(api: "value: 0.0") {
                        ProgressView(value: 0.0)
                    }
                    PVCard(api: "value: 1.0") {
                        ProgressView(value: 1.0)
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowPV(symbol: "circle.dotted", title: ".circular maps to NSProgressIndicator.style = .spinning on macOS.",
                      detail: ".linear maps to NSProgressIndicator.style = .bar. The default style (.automatic) resolves based on context.")
            NoteRowPV(symbol: "timer", title: "Timer-based ProgressView auto-updates from a DateInterval.",
                      detail: "Provide a ClosedRange<Date> with timerInterval: and SwiftUI animates the bar forward in real time. DefaultDateProgressLabel shows a countdown label.")
        }
    }
}

private struct PVCard<Content: View>: View {
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

private struct PVVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowPV: View {
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
    ProgressViewPage().frame(width: 800, height: 1000)
}
