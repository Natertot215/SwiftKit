import SwiftUI

// SwiftUI `PrimitiveButtonStyleConfiguration` reference page.
// Source: Documentation/SwiftUI/view-styles/primitivebuttonstyleconfiguration.md
// macOS 10.15+. The data passed to PrimitiveButtonStyle.makeBody(configuration:).
// Differs from ButtonStyleConfiguration by exposing trigger() (the action
// invocation) and omitting isPressed (the style owns press tracking now).

struct PrimitiveButtonStyleConfigurationPage: View {
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
            Text("PrimitiveButtonStyleConfiguration")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The properties of a button.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/primitivebuttonstyleconfiguration.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PBSCCodeBlock(text:
            """
            struct PrimitiveButtonStyleConfiguration {
                let role: ButtonRole?
                let label: PrimitiveButtonStyleConfiguration.Label

                func trigger()   -- invokes the button's action
            }
            """)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("trigger() — invoke the action")
                    .font(.headline)
                Text("The principal difference from ButtonStyleConfiguration. You decide which gesture fires the button, then call trigger() inside the gesture handler.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                PBSCCodeBlock(text:
                    """
                    configuration.label
                        .onTapGesture(count: 2) { configuration.trigger() }
                    """)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("label — type-erased view")
                    .font(.headline)
                Text("Render the caller's label content unchanged; decorate it with whatever chrome the style provides.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                PBSCCodeBlock(text:
                    """
                    configuration.label
                        .padding(.horizontal, 12).padding(.vertical, 6)
                        .background(.tint.opacity(0.18), in: Capsule())
                    """)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("role — semantic intent")
                    .font(.headline)
                Text("Same shape as ButtonStyleConfiguration.role: optional ButtonRole. Use it to color destructive variants and to honor system-wide accessibility verbs.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                PBSCCodeBlock(text:
                    """
                    let tint: Color = configuration.role == .destructive ? .red : .accentColor
                    """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Comparison with ButtonStyleConfiguration")
                .font(.headline)
                .foregroundStyle(.primary)
            PBSCCodeBlock(text:
                """
                ButtonStyleConfiguration                PrimitiveButtonStyleConfiguration
                ----------------------------            ----------------------------
                role: ButtonRole?                       role: ButtonRole?
                label: <opaque>                         label: <opaque>
                isPressed: Bool                         (not exposed)
                (action fires automatically)            trigger()  -- you call this
                """)
        }
    }

    private struct PBSCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PBSCNote] = [
        .init(title: "trigger() is required somewhere in the body.",
              detail: "Without calling trigger(), the button never fires. Wire it to onTapGesture, onLongPressGesture, an NSGestureRecognizer bridge, etc.",
              symbol: "exclamationmark.triangle"),
        .init(title: "No isPressed — track press state yourself.",
              detail: "PrimitiveButtonStyle owns the gesture entirely, so SwiftUI doesn't expose a ready-made press boolean. Use @GestureState or DragGesture(minimumDistance: 0) to derive one.",
              symbol: "hand.tap"),
        .init(title: "Configuration is read-only; trigger() is the only mutator.",
              detail: "You can't mutate role or label. trigger() is the side-effect entry point.",
              symbol: "lock"),
        .init(title: "SwiftKit does NOT author conformers.",
              detail: "Per project hard constraint: SwiftKit documents the configuration's surface. Custom PrimitiveButtonStyle conformers are out of scope.",
              symbol: "lock.shield")
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

private struct PBSCCodeBlock: View {
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
    PrimitiveButtonStyleConfigurationPage()
        .frame(width: 1100, height: 900)
}
