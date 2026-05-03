import SwiftUI

// SwiftUI `View/preferredSurroundingsEffect(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/preferredsurroundingseffect(_:).md
// visionOS-only API. Code-only on macOS \u{2014} no live preview.

struct PreferredSurroundingsEffectPage: View {
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
            Text("View/preferredSurroundingsEffect(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Applies an effect to passthrough video. visionOS-only.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/preferredsurroundingseffect(_:).md \u{00b7} visionOS 1.0+ (code-only on macOS)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PSECodeBlock(
            api: ".preferredSurroundingsEffect(.dark)",
            code: """
            ImmersiveSpace(id: "orbit") {
                Orbit()
                    .preferredSurroundingsEffect(.dark)
            }
            """,
            note: "Apple's example. Dims passthrough video while the Orbit scene is presented."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            PSEVariantRow(title: "Use nil to clear a deeper preference") {
                PSECodeBlock(
                    api: ".preferredSurroundingsEffect(nil)",
                    code: """
                    Orbit()
                        .preferredSurroundingsEffect(.dark)
                        .overlay {
                            ChildView()
                                .preferredSurroundingsEffect(nil)  // resets back to system default
                        }
                    """
                )
            }

            PSEVariantRow(title: "Pair with ImmersionStyle.mixed for the strongest effect") {
                PSECodeBlock(
                    api: "Mixed immersion + .systemDark",
                    code: """
                    ImmersiveSpace(id: "scene") {
                        SceneContent()
                            .preferredSurroundingsEffect(.systemDark)
                    }
                    .immersionStyle(selection: .constant(.mixed), in: .mixed)
                    """,
                    note: "The dimming reads as a meaningful contrast against passthrough; in a fully .full immersion the effect is moot."
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            PSECalloutBox(text: "macOS does not render passthrough video. This modifier compiles cross-platform but has no visual effect outside visionOS.")
            PSECalloutBox(text: "Apple's docs are explicit: this is a preference. The system may decline to honor it.")
            PSECalloutBox(text: "Pair with the SurroundingsEffect type for the available preset values; BreakthroughEffect controls how virtual content punches through.")
        }
    }

    private struct PSENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PSENote] = [
        .init(title: "visionOS-only API surface.",
              detail: "Use this modifier only when targeting visionOS. On macOS it's a compile-time symbol with no runtime behavior.",
              symbol: "visionpro"),
        .init(title: "Preference, not guarantee.",
              detail: "Apple notes the system may decline (e.g. during shared experiences). Treat as advisory; never depend on the dimming for legibility.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Pass nil to defer to outer preference.",
              detail: "Useful inside conditional content where you only want the dimming sometimes \u{2014} nil is the explicit \"no opinion\" value.",
              symbol: "circle.dashed"),
        .init(title: "Strongest with .mixed immersion style.",
              detail: "When both passthrough and virtual content render, dimming the passthrough draws focus to your scene. With .full immersion there's nothing to dim.",
              symbol: "rectangle.fill"),
        .init(title: "Composes with the ImmersiveSpace scene.",
              detail: "Apply on the root view inside an ImmersiveSpace closure. The system reads the preference at presentation.",
              symbol: "scope")
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

private struct PSECodeBlock: View {
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

private struct PSECalloutBox: View {
    let text: String

    var body: some View {
        Label {
            Text(text)
                .font(.callout)
                .foregroundStyle(.primary)
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.tint)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct PSEVariantRow<Content: View>: View {
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
    PreferredSurroundingsEffectPage()
        .frame(width: 1100, height: 800)
}
