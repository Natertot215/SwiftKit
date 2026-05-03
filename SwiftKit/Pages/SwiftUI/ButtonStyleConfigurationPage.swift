import SwiftUI

// SwiftUI `ButtonStyleConfiguration` reference page.
// Source: Documentation/SwiftUI/view-styles/buttonstyleconfiguration.md
// macOS 10.15+. The data passed to ButtonStyle.makeBody(configuration:).
// SwiftKit documents the surface — it does not author new ButtonStyle conformers.

struct ButtonStyleConfigurationPage: View {
    @State private var roleTag: String = "nil"

    private var role: ButtonRole? {
        switch roleTag {
        case ".destructive": return .destructive
        case ".cancel":      return .cancel
        default:             return nil
        }
    }

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
            Text("ButtonStyleConfiguration")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The properties of a button.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/buttonstyleconfiguration.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        BSCCodeBlock(text:
            """
            struct ButtonStyleConfiguration {
                let role: ButtonRole?
                let label: ButtonStyleConfiguration.Label
                let isPressed: Bool
            }

            // Inside a ButtonStyle conformer:
            // configuration.label             -- type-erased view to render
            // configuration.role              -- .destructive, .cancel, or nil
            // configuration.isPressed         -- live press state
            """)
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Property: label")
                    .font(.headline)
                Text("A type-erased ButtonStyleConfiguration.Label that wraps the original button's label closure. Render it inside makeBody to keep the caller's content.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                BSCCodeBlock(text:
                    """
                    func makeBody(configuration: Configuration) -> some View {
                        configuration.label
                            .padding()
                            .background(.tint, in: Capsule())
                    }
                    """)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Property: role")
                    .font(.headline)
                Text("Optional ButtonRole — .destructive, .cancel, or nil. Use it to vary appearance per role (red destructive backgrounds, etc.).")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                BSCCodeBlock(text:
                    """
                    let bg: Color = configuration.role == .destructive
                        ? .red.opacity(0.2)
                        : .accentColor.opacity(0.2)
                    """)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Property: isPressed")
                    .font(.headline)
                Text("Live boolean for the active touch/click. Drive scale, opacity, or background swaps from this value.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                BSCCodeBlock(text:
                    """
                    configuration.label
                        .scaleEffect(configuration.isPressed ? 0.96 : 1)
                        .opacity(configuration.isPressed ? 0.7 : 1)
                    """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Live demo — built-in .borderedProminent reflects each property")
                    .font(.headline)
                Text("Toggle the picker to flip role; press-and-hold the button to see isPressed propagate visually through the system style.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Picker("Role", selection: $roleTag) {
                    Text("nil").tag("nil")
                    Text(".destructive").tag(".destructive")
                    Text(".cancel").tag(".cancel")
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 360)

                Button(role: role) {
                    // no-op; this is a demo of role propagation
                } label: {
                    Text(roleTag == "nil" ? "Run" : "Run with \(roleTag)")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                APICallout("Button(role: role) { … } label: { Text(\"…\") } .buttonStyle(.borderedProminent)")
            }
        }
    }

    // MARK: Notes

    private struct BSCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [BSCNote] = [
        .init(title: "ButtonStyleConfiguration.Label is opaque on purpose.",
              detail: "It hides the original label's view tree. You compose it back in (apply background, padding, gestures) without rebuilding it.",
              symbol: "rectangle.dashed"),
        .init(title: "isPressed only animates inside ButtonStyle, not PrimitiveButtonStyle.",
              detail: "PrimitiveButtonStyle owns the gesture, so isPressed semantics belong to ButtonStyle's standard interaction. If you adopt PrimitiveButtonStyle you implement the press tracking yourself.",
              symbol: "hand.tap"),
        .init(title: "Role drives semantics, not just color.",
              detail: "The system uses .destructive to influence Accessibility, voice control verbs, and standard menu placement. Wire it through, don't ignore it.",
              symbol: "tag"),
        .init(title: "Configuration is read-only.",
              detail: "You don't mutate configuration. You read its properties and compose a Body view from them.",
              symbol: "lock")
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

private struct BSCCodeBlock: View {
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
    ButtonStyleConfigurationPage()
        .frame(width: 1100, height: 900)
}
