import SwiftUI

// SwiftUI `BreakthroughEffect` reference page.
// Source: Documentation/SwiftUI/view-configuration/breakthrougheffect.md
// visionOS 26.0+. Code-only on macOS \u{2014} controls how virtual content
// \"breaks through\" passthrough video.

struct BreakthroughEffectPage: View {
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
            Text("BreakthroughEffect")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Controls how virtual content visually \"breaks through\" passthrough video on visionOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/breakthrougheffect.md \u{00b7} visionOS 26.0+ (code-only on macOS)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        BECodeBlock(
            api: "BreakthroughEffect.automatic",
            code: """
            // visionOS scene composition
            SceneContent()
                .breakthroughEffect(.automatic)
            """,
            note: "Use the matching modifier with one of the four documented values."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BESection(title: "Type properties (the four values)") {
                VStack(alignment: .leading, spacing: 6) {
                    BERow(value: ".automatic", description: "Let the system choose based on context.")
                    BERow(value: ".none",      description: "Suppress any breakthrough effect.")
                    BERow(value: ".prominent", description: "Strong, immediately visible breakthrough.")
                    BERow(value: ".subtle",    description: "Gentle, less assertive breakthrough.")
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            }

            BESection(title: "Side-by-side code") {
                BECodeBlock(
                    api: "All four values",
                    code: """
                    SceneContent().breakthroughEffect(.automatic)
                    SceneContent().breakthroughEffect(.none)
                    SceneContent().breakthroughEffect(.prominent)
                    SceneContent().breakthroughEffect(.subtle)
                    """
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            BECalloutBox(text: "macOS exposure is symbol-only \u{2014} no live preview because passthrough video is a visionOS surface.")
            BECalloutBox(text: "Pair with SurroundingsEffect for the inverse direction \u{2014} that one controls passthrough; this one controls how your virtual content interacts with it.")
            BECalloutBox(text: "Conformances: Equatable, Sendable, SendableMetatype.")
        }
    }

    private struct BENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [BENote] = [
        .init(title: "Four values \u{2014} no platform-default escape hatch.",
              detail: ".automatic delegates to the system; the others are explicit. Documented type properties: .automatic, .none, .prominent, .subtle.",
              symbol: "list.bullet"),
        .init(title: "visionOS-only behavior.",
              detail: "macOS ships the symbol so cross-platform code compiles, but passthrough video doesn't exist on macOS \u{2014} no visible effect.",
              symbol: "visionpro"),
        .init(title: "Inverse partner of SurroundingsEffect.",
              detail: "SurroundingsEffect dims passthrough; BreakthroughEffect controls how strongly your scene cuts through it. Use them together for a coherent immersion.",
              symbol: "rectangle.split.2x1"),
        .init(title: "Documented as a struct, not an enum.",
              detail: "Like ButtonStyle / GroupBoxStyle, the values are static properties on a struct rather than enum cases. This lets Apple add new effects without breaking existing code.",
              symbol: "square.stack.3d.up"),
        .init(title: "Sendable \u{2014} safe across tasks.",
              detail: "Pass BreakthroughEffect values across actor boundaries without ceremony. They're value-type Sendable.",
              symbol: "shippingbox")
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

private struct BECodeBlock: View {
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

private struct BECalloutBox: View {
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

private struct BERow: View {
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

private struct BESection<Content: View>: View {
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
    BreakthroughEffectPage()
        .frame(width: 1100, height: 800)
}
