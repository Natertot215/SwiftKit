import SwiftUI

// SwiftUI `ManipulationGeometryModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulationgeometrymodifier.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulationGeometryModifierPage: View {
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
            Text("ManipulationGeometryModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that customizes the geometry of a manipulation in 3D space (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulationgeometrymodifier.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: ".manipulationGeometry(_:) — visionOS",
            code: """
            Model3D(named: "TeaPot")
                .manipulable()
                .manipulationGeometry(.box)
            """,
            note: "Override the default manipulation hit geometry with a simpler shape (box, sphere, etc.) for performance or fit."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "Custom bounds") {
                VOSnippet(
                    api: ".manipulationGeometry(.bounds(\u{2026}))",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulable()
                        .manipulationGeometry(.bounds(BoundingBox(min: \u{2026}, max: \u{2026})))
                    """,
                    note: "Constrain the manipulation hit volume to a precise bounding box."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Pair with .manipulable()") {
            VOSnippet(
                api: "Apply after .manipulable() in the chain",
                code: """
                Model3D(named: "TeaPot")
                    .manipulable()
                    .manipulationGeometry(.sphere(radius: 0.3))
                """,
                note: ".manipulationGeometry replaces the auto-derived hit volume. Place it after .manipulable() so the modifier finds the manipulable parent."
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
              detail: "Ships for visionOS. SwiftKit (macOS 26) documents the surface; the modifier is unavailable at runtime here.",
              symbol: "visionpro"),
        .init(title: "Optimization for complex 3D models.",
              detail: "Real geometry can be expensive to test against on every frame. Replace with a primitive (box, sphere) when accuracy isn't critical.",
              symbol: "speedometer"),
        .init(title: "Helps when the visible silhouette differs from the manipulation target.",
              detail: "Use a slightly larger geometry to make small or thin objects easier to grab in 3D.",
              symbol: "hand.point.up.left")
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
    ManipulationGeometryModifierPage()
        .frame(width: 1100, height: 800)
}
