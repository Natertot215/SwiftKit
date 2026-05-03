import SwiftUI

// SwiftUI `EmptyModifier` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/emptymodifier.md
// Identity modifier — useful as a default in conditional modifier composition.

struct EmptyModifierPage: View {
    @State private var emphasized = false

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
            Text("EmptyModifier")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An empty, or identity, modifier, used during development to switch modifiers at compile time.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/emptymodifier.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Identity \u{2014} no-op modifier") {
            HStack(spacing: 16) {
                Text("Plain")
                Text("Plain via EmptyModifier").modifier(EmptyModifier())
            }
            APICallout("Text(\u{2026}).modifier(EmptyModifier())")
            Text("Renders identically to the unmodified view. Body returns the content unchanged.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Pick at compile time") {
                snippet("""
                #if DEBUG
                let debugBorder = AnyViewModifier(BorderStyle(.red))
                #else
                let debugBorder = AnyViewModifier(EmptyModifier())
                #endif

                Text("Hello").modifier(debugBorder)
                """)
                Text("EmptyModifier is the canonical 'do nothing' choice when one branch of a #if needs a modifier and the other doesn't.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Conditional via ternary on .modifier") {
                snippet("""
                let mod: any ViewModifier = isEmphasized
                    ? EmphasisStyle()
                    : EmptyModifier()
                """)
                Text("EmptyModifier lets you keep the .modifier(\u{2026}) call site uniform regardless of which branch is taken.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Block(title: "Toggle EmptyModifier vs. EmphasisStyle") {
            VStack(alignment: .leading, spacing: 12) {
                if emphasized {
                    Text("Emphasized")
                        .modifier(EmphasisStyle())
                } else {
                    Text("Plain (EmptyModifier path)")
                        .modifier(EmptyModifier())
                }
                Toggle("Emphasized", isOn: $emphasized)
                    .toggleStyle(.switch)
            }
            APICallout("emphasized ? .modifier(EmphasisStyle()) : .modifier(EmptyModifier())")
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "EmptyModifier is the identity element of ViewModifier.",
              detail: "Conforms to ViewModifier with body(content:) -> Content { content }. Useful as a default or sentinel.",
              symbol: "circle.dotted"),
        .init(title: "Use sparingly.",
              detail: "Most conditional-modifier needs are better served by `if` inside the view body, not by toggling between EmptyModifier and a real modifier.",
              symbol: "scissors"),
        .init(title: "Apple uses it for compile-time switches.",
              detail: "Common pattern: pick an EmptyModifier in release, an instrumented modifier in debug, behind a #if. Same call site, swappable behavior.",
              symbol: "switch.2"),
        .init(title: "It's an @frozen struct.",
              detail: "Zero overhead — the compiler optimizes it away in most cases. Treat it as a free no-op.",
              symbol: "speedometer")
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

private struct EmphasisStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.tint)
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
    EmptyModifierPage()
        .frame(width: 1100, height: 800)
}
