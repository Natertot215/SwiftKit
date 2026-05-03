import SwiftUI

// SwiftUI `ManipulationGestureModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulationgesturemodifier.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulationGestureModifierPage: View {
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
            Text("ManipulationGestureModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that adds a manipulation gesture to a view (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulationgesturemodifier.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: ".manipulationGesture { update in \u{2026} } — visionOS",
            code: """
            Model3D(named: "TeaPot")
                .manipulationGesture { update in
                    transform = update.transform
                }
            """,
            note: "Add a manipulation gesture without the full .manipulable() lifecycle \u{2014} you handle the transform manually."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "Differential transform") {
                VOSnippet(
                    api: "ManipulationGesture.Update exposes the delta and absolute transform",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulationGesture { update in
                            transform = baseTransform.concatenating(update.transform)
                        }
                    """,
                    note: "Compose the gesture's relative transform with your stored base transform to get the new absolute transform."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Combine with other gestures") {
            VOSnippet(
                api: ".simultaneousGesture / .highPriorityGesture",
                code: """
                Model3D(named: "TeaPot")
                    .manipulationGesture { update in apply(update) }
                    .simultaneousGesture(TapGesture().onEnded { select() })
                """,
                note: "Use .simultaneousGesture to layer manipulation with selection or other gestures on the same view."
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
              detail: "ManipulationGestureModifier ships for visionOS. SwiftKit (macOS 26) documents the surface; runtime is unavailable here.",
              symbol: "visionpro"),
        .init(title: "Lower level than .manipulable().",
              detail: "Use this modifier when you want the gesture without the full Manipulable lifecycle \u{2014} you control how the transform is applied and persisted.",
              symbol: "slider.horizontal.3"),
        .init(title: "Pairs with the standard SwiftUI gesture vocabulary.",
              detail: "Stack with .simultaneousGesture, .highPriorityGesture, .gesture(\u{2026}.exclusively(before:)) to coordinate with taps and other recognizers.",
              symbol: "hand.tap")
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
    ManipulationGestureModifierPage()
        .frame(width: 1100, height: 800)
}
