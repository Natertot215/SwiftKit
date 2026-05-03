import SwiftUI

// SwiftUI `SurroundingsEffect` reference page.
// Source: Documentation/SwiftUI/view-configuration/surroundingseffect.md
// macOS 26.0 / visionOS 1.0+. Effects applied to passthrough video on visionOS.

struct SurroundingsEffectTypePage: View {
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
            Text("SurroundingsEffect")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Effects that the system can apply to passthrough video.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/surroundingseffect.md \u{00b7} macOS 26.0+ / visionOS 1.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SECodeBlock(
            api: ".preferredSurroundingsEffect(.systemDark)",
            code: """
            ImmersiveSpace(id: "scene") {
                SceneContent()
                    .preferredSurroundingsEffect(.systemDark)
            }
            """,
            note: "Apply via View/preferredSurroundingsEffect(_:). Effective only on visionOS."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SETSection(title: "Type properties (presets)") {
                VStack(alignment: .leading, spacing: 6) {
                    SERow(value: ".dark",      description: "Apply a dark passthrough overlay.")
                    SERow(value: ".semiDark",  description: "Lighter dark overlay \u{2014} less aggressive than .dark.")
                    SERow(value: ".ultraDark", description: "Strongest dark overlay; nearly removes passthrough.")
                    SERow(value: ".systemDark", description: "System-managed dark effect (the documented \"getter\").")
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            }

            SETSection(title: "Type methods (computed effects)") {
                SECodeBlock(
                    api: "SurroundingsEffect.colorMultiply(.blue)",
                    code: """
                    .preferredSurroundingsEffect(.colorMultiply(.blue))

                    .preferredSurroundingsEffect(.dim(intensity: 0.4))
                    """,
                    note: "colorMultiply tints passthrough; dim(intensity:) attenuates with a 0\u{2026}1 amount."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            SETSection(title: "Equatable") {
                Text("Conforms to Equatable. Use == to compare two effects (useful in tests / preview parameterization).")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
    }

    private struct SETNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SETNote] = [
        .init(title: "visionOS-driven, but macOS 26 ships the symbol.",
              detail: "Cross-platform code can name SurroundingsEffect on macOS without conditional compilation. The runtime behavior only manifests on visionOS.",
              symbol: "visionpro"),
        .init(title: "Use the presets first; computed methods second.",
              detail: ".dark / .semiDark / .ultraDark / .systemDark cover most cases. Reach for .colorMultiply / .dim only when you need fine control.",
              symbol: "paintbrush"),
        .init(title: "Effects are advisory.",
              detail: "preferredSurroundingsEffect(_:) is a preference. The system can override or ignore it (e.g. during shared sessions).",
              symbol: "exclamationmark.triangle"),
        .init(title: "No ColorScheme coupling.",
              detail: "SurroundingsEffect is independent from .colorScheme. The user's light/dark preference doesn't change which preset you pick.",
              symbol: "moon.stars"),
        .init(title: "Equatable but not Sendable / Hashable.",
              detail: "Per the doc surface, only Equatable conformance is documented. Plan accordingly if storing effects across actor boundaries.",
              symbol: "checkmark.seal")
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

private struct SECodeBlock: View {
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

private struct SERow: View {
    let value: String
    let description: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(value)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 110, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

private struct SETSection<Content: View>: View {
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
    SurroundingsEffectTypePage()
        .frame(width: 1100, height: 800)
}
