import SwiftUI

// SwiftUI `ManipulableTransformBindingModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/manipulabletransformbindingmodifier.md
// visionOS-only API \u{2014} code-snippet only on macOS.

struct ManipulableTransformBindingModifierPage: View {
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
            Text("ManipulableTransformBindingModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that binds a manipulable view's transform to a value (visionOS).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/manipulabletransformbindingmodifier.md \u{00b7} visionOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VOSnippet(
            api: ".manipulable(transform: $transform) — visionOS",
            code: """
            @State private var transform: AffineTransform3D = .identity

            var body: some View {
                Model3D(named: "TeaPot")
                    .manipulable(transform: $transform)
            }
            """,
            note: "Bind the manipulable view's transform back to your view's @State so you can read or persist it."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VOBlock(title: "Persist position across launches") {
                VOSnippet(
                    api: "@AppStorage / @SceneStorage encoded transform",
                    code: """
                    @SceneStorage("teapot.transform") private var transformData: Data = Data()
                    @State private var transform: AffineTransform3D = .identity

                    var body: some View {
                        Model3D(named: "TeaPot")
                            .manipulable(transform: $transform)
                            .onChange(of: transform) { _, new in
                                transformData = encode(new)
                            }
                    }
                    """,
                    note: "Bind the transform, watch it via .onChange, and persist via @SceneStorage / @AppStorage."
                )
            }

            VOBlock(title: "Reset to identity") {
                VOSnippet(
                    api: "Reset by writing .identity",
                    code: """
                    Button("Reset") {
                        withAnimation { transform = .identity }
                    }
                    """,
                    note: "Animate writes to the bound transform for smooth resets."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VOBlock(title: "Read translation / rotation / scale") {
            VOSnippet(
                api: "AffineTransform3D exposes translation, rotation, scale components",
                code: """
                Text("x: \\(transform.translation.x, specifier: \"%.2f\")")
                Text("scale: \\(transform.scale.x, specifier: \"%.2f\")")
                """,
                note: "Decompose the bound AffineTransform3D into its components for inspection or display."
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
              detail: "Lives in the visionOS surface of SwiftUI. SwiftKit (macOS 26) documents it; runtime is unavailable here.",
              symbol: "visionpro"),
        .init(title: "Two-way binding.",
              detail: "Drive the transform from your code by writing the binding; read user-driven changes by observing it. The @State is the source of truth.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "Pairs with @SceneStorage for restoration.",
              detail: "Encode AffineTransform3D to Data and persist via @SceneStorage to restore object placement across launches and window restoration.",
              symbol: "externaldrive")
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
    ManipulableTransformBindingModifierPage()
        .frame(width: 1100, height: 800)
}
