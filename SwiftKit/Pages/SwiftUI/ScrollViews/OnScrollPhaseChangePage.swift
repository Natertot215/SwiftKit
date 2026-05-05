import SwiftUI

// SwiftUI `View/onScrollPhaseChange(_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/onscrollphasechange(_:).md
// macOS 15.0+. Reports transitions between ScrollPhase states.

struct OnScrollPhaseChangePage: View {
    @State private var currentPhase: ScrollPhase = .idle
    @State private var phaseHistory: [ScrollPhase] = []

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
            Text("View/onScrollPhaseChange(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds an action that runs when the scroll phase of the first scroll view in the hierarchy transitions \u{2014} idle, tracking, interacting, decelerating, animating.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/onscrollphasechange(_:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".onScrollPhaseChange { _, newPhase in currentPhase = newPhase }")

            HStack(spacing: 16) {
                phaseChip(label: "current", phase: currentPhase, active: true)
                Spacer()
                Text("history:")
                    .font(.caption).foregroundStyle(.secondary)
                ForEach(Array(phaseHistory.suffix(5).enumerated()), id: \.offset) { _, phase in
                    Text(label(for: phase))
                        .font(.caption2).fontDesign(.monospaced).foregroundStyle(.tertiary)
                }
            }

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<60) { i in
                        Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 220)
            .onScrollPhaseChange { _, newPhase in
                currentPhase = newPhase
                phaseHistory.append(newPhase)
                if phaseHistory.count > 12 { phaseHistory.removeFirst(phaseHistory.count - 12) }
            }
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private func phaseChip(label: String, phase: ScrollPhase, active: Bool) -> some View {
        HStack(spacing: 6) {
            Text(label)
                .font(.caption).foregroundStyle(.secondary)
            Text(self.label(for: phase))
                .font(.caption).fontDesign(.monospaced).fontWeight(.semibold)
                .foregroundStyle(active ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary))
                .padding(.horizontal, 8).padding(.vertical, 3)
                .background(.fill.tertiary, in: Capsule())
        }
    }

    private func label(for phase: ScrollPhase) -> String {
        switch phase {
        case .idle: return "idle"
        case .tracking: return "tracking"
        case .interacting: return "interacting"
        case .decelerating: return "decelerating"
        case .animating: return "animating"
        @unknown default: return "?"
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Three-argument closure with context").font(.headline).foregroundStyle(.primary)
                APICallout("""
.onScrollPhaseChange { oldPhase, newPhase, context in
    if newPhase == .interacting {
        lastOffset = context.geometry.contentOffset.y
    }
}
""")
                Text("The optional third closure argument is a ScrollPhaseChangeContext, exposing geometry and velocity at the moment of transition.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Filtering on settle").font(.headline).foregroundStyle(.primary)
                APICallout("""
.onScrollPhaseChange { _, newPhase in
    if newPhase == .decelerating || newPhase == .idle {
        commitSelection()
    }
}
""")
                Text("Run heavy work only when the user has stopped driving the scroll \u{2014} canonical pattern for snap-to-row selection.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Phase set").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollPhase: .idle  //  .tracking  //  .interacting  //  .decelerating  //  .animating")
                Text("idle — no scrolling. tracking — finger down, no movement yet. interacting — active drag. decelerating — momentum after release. animating — programmatic scroll target.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("isScrolling helper").font(.headline).foregroundStyle(.primary)
            APICallout("ScrollPhase.isScrolling  // true for .tracking, .interacting, .decelerating, .animating")
            Text("Convenience for collapsing the four non-idle states into a single Bool. Use it instead of the four-way switch when you don't care which kind of scrolling is happening.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("First scroll view wins.", "Multiple ScrollViews under the same modifier? Only the first reports phase changes; SwiftUI logs a runtime issue.", "1.circle"),
        ("Old + new = full transition.", "The closure receives oldPhase and newPhase. Read both \u{2014} idle\u{2192}interacting and decelerating\u{2192}interacting carry different meaning.", "arrow.left.and.right"),
        ("Geometry at transition time.", "The 3-arg form's context.geometry is captured at the exact moment of transition \u{2014} useful for direction detection by comparing successive interacting captures.", "ruler"),
        ("Doesn't replace onScrollGeometryChange.", "Phase change fires once per transition. For continuous offset tracking, use onScrollGeometryChange.", "waveform")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

#Preview {
    OnScrollPhaseChangePage().frame(width: 1100, height: 1100)
}
