import SwiftUI

// SwiftUI `ManipulationUsingGestureStateModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulationusinggesturestatemodifier.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulationUsingGestureStateModifierPage: View {
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
            Text("ManipulationUsingGestureStateModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that drives a manipulation through @GestureState (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulationusinggesturestatemodifier.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: ".manipulationGesture(updating: $state) { \u{2026} } — visionOS",
            code: """
            @GestureState private var manipulation: ManipulationGesture.Value = .identity

            var body: some View {
                Model3D(named: "TeaPot")
                    .manipulationGesture(updating: $manipulation) { value, state, _ in
                        state = value
                    }
            }
            """,
            note: "@GestureState resets to its initial value automatically when the gesture ends \u{2014} useful for transient previews."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "Live preview transform") {
                VOSnippet(
                    api: "Use .gestureStateValue.transform during the gesture",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulationGesture(updating: $manipulation) { value, state, _ in
                            state = value
                        }
                        .transformEffect3D(manipulation.transform)
                    """,
                    note: "Apply the live gesture state to drive a temporary visual transform; it auto-resets when the gesture ends."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Commit on end") {
            VOSnippet(
                api: ".onEnded { commit() } in combination",
                code: """
                Model3D(named: "TeaPot")
                    .manipulationGesture(updating: $manipulation) { value, state, _ in
                        state = value
                    }
                    .gesture(ManipulationGesture().onEnded { value in
                        baseTransform = baseTransform.concatenating(value.transform)
                    })
                """,
                note: "Use @GestureState for the live preview, .onEnded to commit the final transform back to the source of truth."
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
              detail: "Lives in the visionOS surface of SwiftUI. SwiftKit (macOS 26) documents the surface; the modifier is unavailable at runtime here.",
              symbol: "visionpro"),
        .init(title: "@GestureState auto-resets.",
              detail: "When the gesture ends, @GestureState reverts to its initial value automatically. That's the difference from @State \u{2014} no manual reset code needed.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Best for transient previews.",
              detail: "Use this pattern when you want to show what would happen during the gesture without committing until the user lets go.",
              symbol: "eye")
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
    ManipulationUsingGestureStateModifierPage()
        .frame(width: 1100, height: 800)
}
