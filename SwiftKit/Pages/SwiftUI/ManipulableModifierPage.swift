import SwiftUI

// SwiftUI `ManipulableModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulablemodifier.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulableModifierPage: View {
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
            Text("ManipulableModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that makes a view manipulable in 3D space (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulablemodifier.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: ".manipulable() — visionOS",
            code: """
            // visionOS only
            Model3D(named: "TeaPot")
                .manipulable()
            """,
            note: "Adds direct manipulation (pinch + drag, two-handed rotate/scale) to a view in a volumetric scene."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "Constrain operations") {
                VOSnippet(
                    api: ".manipulable(operations: .translation)",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulable(operations: .translation)
                    """,
                    note: "Restrict the modifier to a subset of operations \u{2014} translation, rotation, scale, or any combination."
                )
            }

            VOBlock(title: "Inertia and coordinate space") {
                VOSnippet(
                    api: ".manipulable(operations:inertia:coordinateSpace:)",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulable(
                            operations: .all,
                            inertia: .gentle,
                            coordinateSpace: .immersiveSpace
                        )
                    """,
                    note: "Inertia controls release behavior. Coordinate space sets the frame the manipulation happens in."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Track manipulation lifecycle") {
            VOSnippet(
                api: ".onManipulationEvent { phase in \u{2026} }",
                code: """
                Model3D(named: "TeaPot")
                    .manipulable()
                    .onManipulationEvent { phase in
                        switch phase {
                        case .began:   audio.startManipulating()
                        case .changed: haptic.tick()
                        case .ended:   audio.stopManipulating()
                        }
                    }
                """,
                note: "Pair with manipulation event modifiers to drive audio, haptics, or analytics."
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
              detail: "ManipulableModifier and the .manipulable() family ship for visionOS. SwiftKit (macOS 26) renders the documentation; the modifier itself is not available at runtime here.",
              symbol: "visionpro"),
        .init(title: "Designed for volumetric scenes.",
              detail: "Use inside a volumetric WindowGroup, an ImmersiveSpace, or any container that renders 3D content. The modifier is a no-op outside a 3D context.",
              symbol: "cube.transparent"),
        .init(title: "Pair with the Manipulable protocol for custom geometry.",
              detail: "Custom types conform to Manipulable to participate in the modifier's transform binding. Apple's Model3D conforms automatically.",
              symbol: "puzzlepiece.extension"),
        .init(title: "Inertia, snap, and bounds via the same API.",
              detail: "Configure release physics, snap targets, and the coordinate space the manipulation occurs in via the modifier's parameters \u{2014} no separate gesture wiring required.",
              symbol: "speedometer")
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
    ManipulableModifierPage()
        .frame(width: 1100, height: 800)
}
