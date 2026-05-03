import SwiftUI

// SwiftUI `ButtonStyle` protocol reference page.
// Source: Documentation/SwiftUI/view-styles/buttonstyle.md
// macOS 10.15+. ButtonStyle is the protocol the system's built-in styles
// (.automatic, .borderless, .bordered, .borderedProminent, .plain, .glass,
// .glassProminent, .link) conform to. SwiftKit documents the protocol surface
// and shows the built-in conformers — it does not author new styles
// (see framework hard constraint).

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 90

struct ButtonStyleProtocolPage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("ButtonStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that applies standard interaction behavior and a custom appearance to all buttons within a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/buttonstyle.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Protocol declaration")
                .font(.headline)
                .foregroundStyle(.primary)
            CodeBlock(text:
                """
                @MainActor protocol ButtonStyle {
                    associatedtype Body : View
                    typealias Configuration = ButtonStyleConfiguration

                    @ViewBuilder @MainActor
                    func makeBody(configuration: Self.Configuration) -> Self.Body
                }
                """)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Built-in conformers shipped by SwiftUI on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                conformerCard(title: "DefaultButtonStyle", literal: ".automatic")
                conformerCard(title: "BorderlessButtonStyle", literal: ".borderless")
                conformerCard(title: "BorderedButtonStyle", literal: ".bordered")
                conformerCard(title: "BorderedProminentButtonStyle", literal: ".borderedProminent")
                conformerCard(title: "PlainButtonStyle", literal: ".plain")
                conformerCard(title: "GlassButtonStyle", literal: ".glass")
                conformerCard(title: "GlassProminentButtonStyle", literal: ".glassProminent")
                conformerCard(title: "LinkButtonStyle", literal: ".link")
            }
        }
    }

    private func conformerCard(title: String, literal: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            HStack(spacing: 8) {
                styledButton(literal)
            }
            .padding(12)
            .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
            APICallout(".buttonStyle(\(literal))")
        }
    }

    @ViewBuilder
    private func styledButton(_ literal: String) -> some View {
        let pair = HStack(spacing: 8) {
            Button("OK") {}
            Button("Cancel") {}
        }
        switch literal {
        case ".automatic":          pair.buttonStyle(.automatic)
        case ".borderless":         pair.buttonStyle(.borderless)
        case ".bordered":           pair.buttonStyle(.bordered)
        case ".borderedProminent":  pair.buttonStyle(.borderedProminent)
        case ".plain":              pair.buttonStyle(.plain)
        case ".glass":              pair.buttonStyle(.glass)
        case ".glassProminent":     pair.buttonStyle(.glassProminent)
        case ".link":               pair.buttonStyle(.link)
        default:                    pair
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Configuration shape")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("makeBody(configuration:) receives a `ButtonStyleConfiguration`. The configuration carries the button's role, label, and pressed state — see ButtonStyleConfiguration for full surface.")
                .font(.callout)
                .foregroundStyle(.secondary)
            CodeBlock(text:
                """
                struct ButtonStyleConfiguration {
                    let role: ButtonRole?
                    let label: ButtonStyleConfiguration.Label   // type-erased view
                    let isPressed: Bool
                }
                """)
        }
    }

    // MARK: Notes

    private struct BSPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [BSPNote] = [
        .init(title: "ButtonStyle vs PrimitiveButtonStyle.",
              detail: "ButtonStyle applies appearance + standard tap/click behavior. PrimitiveButtonStyle gives you the trigger gesture too — pick that when you need to author the entire interaction (long-press, custom rules).",
              symbol: "rectangle.split.2x1"),
        .init(title: "SwiftKit does NOT author custom conformers.",
              detail: "Per project hard constraint: SwiftKit documents Apple's API surface. You can show what the built-in styles look like, but never define a new ButtonStyle struct in the catalog.",
              symbol: "lock"),
        .init(title: "isPressed reflects the active touch/click state.",
              detail: "Custom conformers typically scale, dim, or recolor based on configuration.isPressed. The system's built-in styles already handle this — that's why you adopt them when possible.",
              symbol: "hand.tap"),
        .init(title: "Apply via .buttonStyle(_:); inherits down the view tree.",
              detail: "Inner .buttonStyle wins for its subtree. The same modifier also affects Toggle and Menu when they've adopted .button via .toggleStyle(.button) / .menuStyle(.button).",
              symbol: "arrow.down")
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

// MARK: - Page-local helpers

private struct CodeBlock: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    ButtonStyleProtocolPage()
        .frame(width: 1100, height: 900)
}
