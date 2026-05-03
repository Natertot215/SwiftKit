import SwiftUI

// SwiftUI `ManipulableResponderModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulablerespondermodifier.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulableResponderModifierPage: View {
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
            Text("ManipulableResponderModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that responds to manipulation events on a manipulable view (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulablerespondermodifier.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: ".onManipulationPhaseChange { \u{2026} } — visionOS",
            code: """
            Model3D(named: "TeaPot")
                .manipulable()
                .onManipulationPhaseChange { phase in
                    switch phase {
                    case .began:   model.beginManipulation()
                    case .changed: model.updateManipulation()
                    case .ended:   model.endManipulation()
                    }
                }
            """,
            note: "Hook lifecycle events on a manipulable view to drive audio, haptics, or analytics."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "React to value changes") {
                VOSnippet(
                    api: ".onManipulationValueChange { value in \u{2026} }",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulable()
                        .onManipulationValueChange { transform in
                            // transform: translation, rotation, scale
                            audio.pitch = Float(transform.scale.x)
                        }
                    """,
                    note: "Stream the live transform out of the manipulation \u{2014} useful for procedurally driven feedback."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Coordinate with onManipulationEvent") {
            VOSnippet(
                api: "Combine with .onManipulationEvent for full lifecycle coverage",
                code: """
                Model3D(named: "TeaPot")
                    .manipulable()
                    .onManipulationEvent { event in handleEvent(event) }
                    .onManipulationPhaseChange { phase in handlePhase(phase) }
                """,
                note: "The two responders complement each other \u{2014} event for discrete moments, phase change for state transitions."
            )
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "visionOS-only API.",
              detail: "Ships for visionOS only. SwiftKit (macOS 26) documents the surface; the modifier is unavailable at runtime here.",
              symbol: "visionpro"),
        .init(title: "Pairs with .manipulable().",
              detail: "ManipulableResponderModifier expects a manipulable parent. Without one, there's nothing to respond to.",
              symbol: "link"),
        .init(title: "Lifecycle vs. value streams.",
              detail: "Phase responders fire at began/changed/ended; value responders stream the live transform. Pick the granularity that matches your feedback loop.",
              symbol: "waveform.path")
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

private struct VOSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct VOBlock<Content: View>: View {
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
    ManipulableResponderModifierPage()
        .frame(width: 1100, height: 800)
}
