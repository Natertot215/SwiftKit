import SwiftUI

// SwiftUI PhaseAnimator bundle.
// Covers:
//   PhaseAnimator                               — the view type (macOS 14+)
//   View/phaseAnimator(_:content:animation:)    — continuous phase cycling
//   View/phaseAnimator(_:trigger:content:animation:) — trigger-based
// Source: Documentation/SwiftUI/animations/phaseanimator*.md
// macOS 14.0+

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 200

private enum BouncePhase: CaseIterable {
    case resting, up, peak

    var offsetY: CGFloat {
        switch self {
        case .resting: return 0
        case .up: return -20
        case .peak: return -40
        }
    }

    var scale: CGFloat {
        switch self {
        case .resting: return 1.0
        case .up: return 1.1
        case .peak: return 1.2
        }
    }
}

private enum HighlightPhase: CaseIterable {
    case dim, bright, dim2

    var opacity: Double {
        switch self {
        case .dim: return 0.4
        case .bright: return 1.0
        case .dim2: return 0.4
        }
    }

    var scale: CGFloat {
        switch self {
        case .dim: return 0.9
        case .bright: return 1.15
        case .dim2: return 1.0
        }
    }
}

struct PhaseAnimatorGalleryPage: View {
    @State private var triggerCount = 0

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
            Text("PhaseAnimator")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Cycles a view through a sequence of phases, applying a different animation curve between each phase transition. The PhaseAnimator view type and the .phaseAnimator modifiers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/phaseanimator.md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "PhaseAnimator(BouncePhase.allCases) { phase in \u{2026} }") {
            PhaseAnimator(BouncePhase.allCases) { phase in
                Image(systemName: "circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.tint)
                    .scaleEffect(phase.scale)
                    .offset(y: phase.offsetY)
            } animation: { phase in
                switch phase {
                case .resting: return .easeOut(duration: 0.3)
                case .up: return .easeInOut(duration: 0.2)
                case .peak: return .spring(duration: 0.4)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "PhaseAnimator view type \u{2014} continuous cycling") {
                DemoFrame(api: "PhaseAnimator(HighlightPhase.allCases) { phase in \u{2026} }") {
                    HStack(spacing: 24) {
                        PhaseAnimator(HighlightPhase.allCases) { phase in
                            Image(systemName: "star.fill")
                                .font(.system(size: 36))
                                .foregroundStyle(.yellow)
                                .opacity(phase.opacity)
                                .scaleEffect(phase.scale)
                        } animation: { _ in .easeInOut(duration: 0.5) }

                        Text("Continuously cycles through phases with per-transition animation curves.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: ".phaseAnimator(_:trigger:) \u{2014} trigger-based, plays once per trigger") {
                DemoFrame(api: ".phaseAnimator(BouncePhase.allCases, trigger: count) { \u{2026} }") {
                    VStack(spacing: 12) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.tint)
                            .phaseAnimator(BouncePhase.allCases, trigger: triggerCount) { content, phase in
                                content
                                    .scaleEffect(phase.scale)
                                    .offset(y: phase.offsetY)
                            } animation: { phase in
                                switch phase {
                                case .resting: return .bouncy
                                case .up: return .easeOut(duration: 0.15)
                                case .peak: return .spring(duration: 0.3)
                                }
                            }
                        Button("Ring bell") { triggerCount += 1 }
                            .buttonStyle(.bordered)
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
            VariantBlock(title: ".phaseAnimator(_:content:animation:) modifier form") {
                DemoFrame(api: ".phaseAnimator([false, true]) { content, phase in content.opacity(phase ? 1 : 0.2) }") {
                    Image(systemName: "waveform")
                        .font(.system(size: 40))
                        .foregroundStyle(.tint)
                        .phaseAnimator([false, true]) { content, phase in
                            content.opacity(phase ? 1.0 : 0.2)
                        } animation: { _ in .easeInOut(duration: 0.6) }
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
        .init(title: "Phases must be CaseIterable (or a Sequence).",
              detail: "PhaseAnimator cycles through all phases in order, then loops. For trigger variants, the sequence plays once from start to finish on each trigger increment.",
              symbol: "arrow.clockwise"),
        .init(title: "The animation closure controls the curve for each transition.",
              detail: "Return a different Animation for each phase to get spring on one step and easeOut on another. Return nil for an instant (non-animated) phase jump.",
              symbol: "wand.and.stars"),
        .init(title: "Use the view type PhaseAnimator when you need persistent looping.",
              detail: "Use .phaseAnimator(_:trigger:) when animation should play once in response to a user action, network event, or any value change.",
              symbol: "play.circle"),
        .init(title: "The content closure receives the current phase value.",
              detail: "In the modifier form, the closure receives (content, phase) \u{2014} apply modifiers like .scaleEffect, .offset, .opacity to content based on phase's properties.",
              symbol: "rectangle.and.pencil.and.ellipsis")
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

extension PhaseAnimatorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.phaseAnimator",
        title: "PhaseAnimator",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "PhaseAnimator",
            "View/phaseAnimator(_:content:animation:)",
            "View/phaseAnimator(_:trigger:content:animation:)"
        ],
        blurb: "A container that animates its content by automatically cycling through a collection of phases that you provide, each defining a discrete step within an animation.",
        signature: "struct PhaseAnimator<Phase, Content> where Phase : Equatable, Content : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/phaseanimator.md",
        page: { AnyView(PhaseAnimatorGalleryPage()) }
    )
}

#Preview {
    PhaseAnimatorGalleryPage()
        .frame(width: 1100, height: 900)
}
