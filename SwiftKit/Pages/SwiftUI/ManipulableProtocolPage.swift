import SwiftUI

// SwiftUI `Manipulable` protocol reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulable.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulableProtocolPage: View {
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
            Text("Manipulable")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A protocol that types adopt to participate in manipulation gestures (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulable.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: "protocol Manipulable — visionOS",
            code: """
            // visionOS only
            protocol Manipulable {
                associatedtype ManipulationBody: Manipulable
                var manipulationBody: ManipulationBody { get }
            }
            """,
            note: "Conformers describe how a custom 3D type participates in manipulation. Apple's Model3D conforms automatically."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "Built-in conformer \u{2014} Model3D") {
                VOSnippet(
                    api: "Model3D: Manipulable",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulable() // works because Model3D : Manipulable
                    """,
                    note: "Model3D conforms out of the box. The .manipulable() modifier requires this conformance."
                )
            }

            VOBlock(title: "Custom conformer") {
                VOSnippet(
                    api: "Custom Manipulable type",
                    code: """
                    struct MyVolumetricObject: Manipulable, View {
                        var manipulationBody: some Manipulable {
                            // describe the manipulation surface
                            BoundingBoxManipulation(\u{2026})
                        }
                        var body: some View { \u{2026} }
                    }
                    """,
                    note: "Conform to Manipulable when you have a custom 3D representation that should expose a manipulation surface."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Pairs with .manipulable() and friends") {
            VOSnippet(
                api: "Manipulable + .manipulable / .manipulationGeometry / .manipulationGesture",
                code: """
                MyVolumetricObject()
                    .manipulable()
                    .manipulationGeometry(.box)
                    .onManipulationPhaseChange { phase in handle(phase) }
                """,
                note: "Manipulable is the conformance that makes the modifiers in this folder work \u{2014} they all rely on it."
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
              detail: "Manipulable lives in the visionOS surface of SwiftUI. SwiftKit (macOS 26) documents the protocol; runtime is unavailable here.",
              symbol: "visionpro"),
        .init(title: "Foundation for the Manipulation modifier family.",
              detail: ".manipulable, .manipulationGeometry, .manipulationGesture, the responder modifiers \u{2014} all expect a Manipulable parent.",
              symbol: "puzzlepiece.extension"),
        .init(title: "Apple's volumetric primitives conform.",
              detail: "Model3D and the other 3D primitives Apple ships conform to Manipulable. Custom types only need to conform when they replace those primitives wholesale.",
              symbol: "cube.transparent")
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
    ManipulableProtocolPage()
        .frame(width: 1100, height: 800)
}
