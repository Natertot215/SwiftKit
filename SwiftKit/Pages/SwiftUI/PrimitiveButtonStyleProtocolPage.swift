import SwiftUI

// SwiftUI `PrimitiveButtonStyle` protocol reference page.
// Source: Documentation/SwiftUI/view-styles/primitivebuttonstyle.md
// macOS 10.15+. PrimitiveButtonStyle owns the trigger gesture in addition to
// appearance. SwiftKit shows the protocol shape and lists the built-in styles
// — it does not author new conformers.

struct PrimitiveButtonStyleProtocolPage: View {
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
            Text("PrimitiveButtonStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type that applies custom interaction behavior and a custom appearance to all buttons within a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/primitivebuttonstyle.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PBSCodeBlock(text:
            """
            @MainActor protocol PrimitiveButtonStyle {
                associatedtype Body : View
                typealias Configuration = PrimitiveButtonStyleConfiguration

                @ViewBuilder @MainActor
                func makeBody(configuration: Self.Configuration) -> Self.Body
            }

            // Apply via:
            // .buttonStyle(MyPrimitiveStyle())
            """)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Built-in PrimitiveButtonStyle conformers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            PBSCodeBlock(text:
                """
                .borderless    -- BorderlessButtonStyle
                .plain         -- PlainButtonStyle
                .link          -- LinkButtonStyle
                """)
            Text("Note: .automatic, .bordered, .borderedProminent, .glass, .glassProminent are PrimitiveButtonStyle conformers in newer SDKs as well — most built-ins now flow through PrimitiveButtonStyle internally.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Required member: trigger() on the configuration")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("PrimitiveButtonStyle differs from ButtonStyle in one crucial way: you decide WHEN the action fires by calling configuration.trigger() yourself.")
                .font(.callout)
                .foregroundStyle(.secondary)
            PBSCodeBlock(text:
                """
                func makeBody(configuration: Configuration) -> some View {
                    configuration.label
                        .onTapGesture { configuration.trigger() }
                        // or .onLongPressGesture, .onHover, etc.
                }
                """)
        }
    }

    private struct PBSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PBSNote] = [
        .init(title: "Use ButtonStyle for appearance only; PrimitiveButtonStyle when you control the gesture.",
              detail: "If you only need to recolor / scale based on isPressed, ButtonStyle is enough. PrimitiveButtonStyle is for long-press, double-click, custom hit testing.",
              symbol: "hand.tap"),
        .init(title: "Forget to call trigger() and the button never fires.",
              detail: "PrimitiveButtonStyle is wholly responsible for invoking the action. If you don't call configuration.trigger() somewhere, the user's click does nothing.",
              symbol: "exclamationmark.triangle"),
        .init(title: "SwiftKit does NOT author conformers.",
              detail: "Per project hard constraint: SwiftKit documents the protocol; it does not ship custom PrimitiveButtonStyle types.",
              symbol: "lock"),
        .init(title: "Most built-in styles bridge through PrimitiveButtonStyle.",
              detail: "On modern SDKs the system styles like .bordered are PrimitiveButtonStyle conformers — the primitive variant is the canonical extension point.",
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

private struct PBSCodeBlock: View {
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
    PrimitiveButtonStyleProtocolPage()
        .frame(width: 1100, height: 800)
}
