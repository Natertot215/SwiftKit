import SwiftUI

// SwiftUI TimelineView bundle.
// Covers:
//   TimelineView               — view that updates on a schedule
//   TimelineSchedule           — protocol for defining update cadence
//   TimelineViewDefaultContext — the context passed to the content closure
// Source: Documentation/SwiftUI/animations/timelineview.md
// macOS 12.0+

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 180

struct TimelineViewPage: View {
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
            Text("TimelineView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that updates its content on a schedule defined by a TimelineSchedule, receiving a TimelineViewDefaultContext with the current date and cadence.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/timelineview.md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "TimelineView(.animation) { context in \u{2026} }") {
            TimelineView(.animation) { context in
                let phase = context.date.timeIntervalSinceReferenceDate.remainder(dividingBy: 2.0)
                let normalized = (phase + 1.0) / 2.0
                Circle()
                    .trim(from: 0, to: normalized)
                    .stroke(.tint, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 80, height: 80)
                    .rotationEffect(.degrees(-90))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".animation \u{2014} highest-frequency schedule (screen refresh)") {
                DemoFrame(api: "TimelineView(.animation) { context in Text(context.date.description) }") {
                    TimelineView(.animation) { context in
                        let seconds = context.date.timeIntervalSinceReferenceDate
                        let angle = Angle.degrees(seconds.truncatingRemainder(dividingBy: 4) / 4 * 360)
                        Image(systemName: "arrow.up")
                            .font(.system(size: 28))
                            .foregroundStyle(.tint)
                            .rotationEffect(angle)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: ".periodic every second \u{2014} updates once per second") {
                DemoFrame(api: "TimelineView(.periodic(from: .now, by: 1)) { context in \u{2026} }") {
                    TimelineView(.periodic(from: .now, by: 1)) { context in
                        Text(context.date.formatted(date: .omitted, time: .standard))
                            .font(.system(size: 36, weight: .medium, design: .monospaced))
                            .foregroundStyle(.primary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: ".periodic(from:by:) \u{2014} custom interval") {
                DemoFrame(api: "TimelineView(.periodic(from: .now, by: 0.5)) { \u{2026} }") {
                    TimelineView(.periodic(from: .now, by: 0.5)) { context in
                        let tick = Int(context.date.timeIntervalSinceReferenceDate * 2) % 2 == 0
                        Image(systemName: tick ? "dot.radiowaves.right" : "dot.radiowaves.left")
                            .font(.system(size: 32))
                            .foregroundStyle(.tint)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: ".explicit(_:) \u{2014} fires only at specified dates") {
                DemoFrame(api: "TimelineView(.explicit([date1, date2, \u{2026}])) { \u{2026} }") {
                    VStack(spacing: 8) {
                        Text(".explicit([Date]) fires the timeline only at the provided dates. After the last date passes, the timeline stops updating. Useful for scheduled events or future-time displays.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "TimelineViewDefaultContext \u{2014} date and cadence") {
                DemoFrame(api: "context.date \u{2014} current update date | context.cadence \u{2014} .live / .seconds / .minutes") {
                    TimelineView(.periodic(from: .now, by: 1)) { context in
                        VStack(spacing: 4) {
                            Text("date: \(context.date.formatted(date: .omitted, time: .standard))")
                                .font(.callout)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.primary)
                            Text("cadence: \(String(describing: context.cadence))")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "TimelineView re-renders on every schedule tick.",
              detail: "Content inside TimelineView re-evaluates on each update. Keep the closure lightweight \u{2014} compute derived values from context.date rather than storing @State.",
              symbol: "clock.arrow.circlepath"),
        .init(title: "context.cadence hints at how to adapt rendering.",
              detail: ".live = high-frequency (animation). .seconds = update ~every second. .minutes = low-power mode. Check cadence to reduce fidelity when appropriate (e.g., hide sub-second hands when .minutes).",
              symbol: "battery.50"),
        .init(title: "TimelineSchedule is a protocol \u{2014} implement it for custom schedules.",
              detail: "Conform to TimelineSchedule by implementing entries(from:mode:) returning a sequence of dates. The built-in schedules (.animation, .everySecond, .periodic, .explicit) cover most cases.",
              symbol: "calendar.badge.clock"),
        .init(title: "Use .animation schedule only for real-time animations.",
              detail: "This schedule fires at the display refresh rate (60–120 fps). Using it for a clock display wastes energy; prefer .everySecond for human-readable time.",
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
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
    TimelineViewPage()
        .frame(width: 1100, height: 900)
}
