import SwiftUI

// SwiftUI `EnvironmentalModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/environmentalmodifier.md
// Note: this protocol is largely an implementation detail in modern SwiftUI;
// flagging that explicitly in the header.

struct EnvironmentalModifierPage: View {
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
            Text("EnvironmentalModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that must resolve to a concrete modifier in an environment before use.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("Implementation detail \u{2014} prefer @Environment-driven custom modifiers in app code.", systemImage: "exclamationmark.triangle")
                .font(.caption)
                .foregroundStyle(.orange)
            Text("Documentation/SwiftUI/view-fundamentals/environmentalmodifier.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Protocol shape") {
            snippet("""
            protocol EnvironmentalModifier: ViewModifier where Self.Body == Never {
                associatedtype ResolvedModifier: ViewModifier
                func resolve(in environment: EnvironmentValues) -> ResolvedModifier
            }
            """)
            APICallout("EnvironmentalModifier: ViewModifier where Body == Never")
            Text("A ViewModifier with no body — instead it resolves into a concrete modifier given the current environment.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "What it's used for internally") {
                Text("Apple framework modifiers that need to inspect environment values before producing a real ViewModifier conform to EnvironmentalModifier under the hood. Examples include some style and layout modifiers that change behavior with .colorScheme, .layoutDirection, or .accessibilityEnabled.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            Block(title: "App-code equivalent \u{2014} read @Environment in a regular modifier") {
                snippet("""
                struct AdaptiveCard: ViewModifier {
                    @Environment(\\.colorScheme) private var scheme
                    func body(content: Content) -> some View {
                        content
                            .padding(12)
                            .background(
                                scheme == .dark ? Color.white.opacity(0.04) : Color.black.opacity(0.04),
                                in: RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
                """)
                Text("In modern SwiftUI, you almost never need EnvironmentalModifier yourself \u{2014} read @Environment inside a regular ViewModifier instead.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Block(title: "When SwiftUI resolves") {
            Text("EnvironmentalModifier.resolve(in:) is invoked by the framework when SwiftUI walks the view tree and needs the concrete modifier. There's no public API for app code to call resolve directly.")
                .font(.callout)
                .foregroundStyle(.secondary)
            APICallout("func resolve(in environment: EnvironmentValues) -> ResolvedModifier")
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "You almost never write one.",
              detail: "EnvironmentalModifier exists for framework-internal modifiers that need access to the environment before they can produce concrete output. App code uses @Environment in a regular ViewModifier.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Body is Never.",
              detail: "Conformers are required to set Body == Never. There's no body(content:) implementation \u{2014} the body is supplied by the resolved concrete modifier.",
              symbol: "stop.circle"),
        .init(title: "Prefer @Environment + ViewModifier.",
              detail: "If your modifier needs colorScheme, layoutDirection, accessibility flags, etc., declare an @Environment property in a normal ViewModifier. Cleaner, fully supported, no protocol gymnastics.",
              symbol: "tree"),
        .init(title: "Documented for completeness.",
              detail: "This page exists because the protocol is in the public SwiftUI surface. It's mostly an implementation seam Apple uses for first-party modifiers.",
              symbol: "book.closed")
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

    private func snippet(_ code: String) -> some View {
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
    }
}

private struct Block<Content: View>: View {
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
    EnvironmentalModifierPage()
        .frame(width: 1100, height: 800)
}
