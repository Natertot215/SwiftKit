import SwiftUI

// SwiftUI `ViewModifier` protocol reference page.
// Source: Documentation/SwiftUI/view-fundamentals/viewmodifier.md
// Live demo: a custom modifier rendered against an unmodified comparison.

private struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            .foregroundStyle(.primary)
    }
}

private struct AccentBadge: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color, in: Capsule())
            .foregroundStyle(.white)
    }
}

struct ViewModifierProtocolPage: View {
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
            Text("ViewModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A modifier that you apply to a view or another view modifier, producing a different version of the original value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/viewmodifier.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VMVariant(title: "Custom CardStyle modifier") {
            VStack(alignment: .leading, spacing: 12) {
                Text("Plain text")
                Text("Card-styled text").modifier(CardStyle())
            }
            APICallout("struct CardStyle: ViewModifier { func body(content: Content) -> some View { \u{2026} } }")
            Text("Define a struct conforming to ViewModifier and implement `body(content:)`. Apply via .modifier(CardStyle()).")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VMVariant(title: "Parameterized modifier") {
                HStack(spacing: 12) {
                    Text("Beta").modifier(AccentBadge(color: .blue))
                    Text("New").modifier(AccentBadge(color: .green))
                    Text("Hot").modifier(AccentBadge(color: .red))
                }
                APICallout("struct AccentBadge: ViewModifier { let color: Color \u{2026} }")
            }

            VMVariant(title: "Extending View for ergonomic call sites") {
                snippet("""
                extension View {
                    func cardStyle() -> some View { modifier(CardStyle()) }
                    func accentBadge(_ color: Color) -> some View { modifier(AccentBadge(color: color)) }
                }

                Text("Beta").accentBadge(.blue)
                Text("Card").cardStyle()
                """)
                Text("Wrapping .modifier(\u{2026}) in a View extension makes call sites read like Apple-supplied modifiers.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VMVariant(title: "Stateful modifier") {
                snippet("""
                struct Shake: ViewModifier {
                    var animatableData: CGFloat
                    func body(content: Content) -> some View {
                        content.offset(x: sin(animatableData * .pi * 4) * 6)
                    }
                }
                """)
                Text("ViewModifier can hold animatable state via `animatableData`. SwiftUI interpolates between values during animation.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VMVariant(title: "Composition") {
                Text("Composed modifier").modifier(CardStyle()).modifier(AccentBadge(color: .purple))
                APICallout(".modifier(CardStyle()).modifier(AccentBadge(color: .purple))")
                Text("Modifiers chain. Order matters — outermost wins for layout that competes (padding, frame, background).")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct VMNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [VMNote] = [
        .init(title: "ViewModifier returns a new View, not a mutation.",
              detail: "body(content:) takes the input view as `content` and returns a transformed view. The original is never mutated — SwiftUI rebuilds the tree.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Use ViewModifier when reusing 2+ chained modifiers.",
              detail: "If you find yourself repeating the same .padding/.background/.font sequence, hoist it into a ViewModifier per the 'Reducing view modifier maintenance' article.",
              symbol: "wand.and.stars"),
        .init(title: "Extend View to expose your modifier ergonomically.",
              detail: "Apple's pattern: define a private struct conforming to ViewModifier, then add a public func on View that calls .modifier(\u{2026}). Call sites stay clean.",
              symbol: "puzzlepiece"),
        .init(title: "Animatable modifiers conform to AnimatableModifier.",
              detail: "Add a `var animatableData: \u{2026}` property to participate in interpolation. Useful for path-based animations and physics-style effects.",
              symbol: "waveform.path"),
        .init(title: "Don't reach for ViewModifier when a plain function works.",
              detail: "If you're not animating and the helper is one or two modifiers deep, a `func styled() -> some View` extension on View is simpler than the protocol dance.",
              symbol: "scissors")
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

private struct VMVariant<Content: View>: View {
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
    ViewModifierProtocolPage()
        .frame(width: 1100, height: 800)
}
