import SwiftUI

// SwiftUI `ModifiedContent` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/modifiedcontent.md
// Type-erased output of every .modifier(_:) call.

private struct UnderlineStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.underline(true, color: .accentColor)
    }
}

struct ModifiedContentPage: View {
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
            Text("ModifiedContent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A value with a modifier applied to it.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/modifiedcontent.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Result of .modifier(_:)") {
            Text("Underlined").modifier(UnderlineStyle())
            APICallout("ModifiedContent<Text, UnderlineStyle>")
            Text("Every modifier returns a ModifiedContent. The chain stacks: .padding().background() becomes ModifiedContent<ModifiedContent<\u{2026}>, _BackgroundStyleModifier<\u{2026}>>.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Direct construction (rare)") {
                snippet("""
                let modified = ModifiedContent(
                    content: Text("Hello"),
                    modifier: UnderlineStyle()
                )
                """)
                Text("You almost never type this out — .modifier(_:) creates the value for you.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Stacked modifiers \u{2192} nested ModifiedContent") {
                snippet("""
                Text("Hi")
                    .padding()
                    .background(.background.secondary)

                // Equivalent type:
                // ModifiedContent<
                //     ModifiedContent<Text, _PaddingLayout>,
                //     _BackgroundStyleModifier<HierarchicalShapeStyle>
                // >
                """)
                Text("This is why `some View` is mandatory: spelling the full type out is unworkable.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        Block(title: "Both View and ViewModifier conform") {
            snippet("""
            // ModifiedContent is generic over (Content, Modifier).
            // - When Content: View and Modifier: ViewModifier, ModifiedContent: View.
            // - When Content: ViewModifier and Modifier: ViewModifier,
            //   ModifiedContent: ViewModifier (modifier composition).
            """)
            Text("This dual conformance is what makes modifier chains and modifier composition possible from the same type.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "Implementation detail you rarely name.",
              detail: "ModifiedContent is the runtime representation of every modifier application. Application code uses .modifier(_:) and `some View` and never spells the type.",
              symbol: "gear"),
        .init(title: "Generic over (Content, Modifier).",
              detail: "The two type parameters are the input view (or modifier) and the modifier being applied. Both layers participate in identity, equatability, and animation.",
              symbol: "rectangle.stack"),
        .init(title: "Conforms to View when its content is a View.",
              detail: "Conditional conformance: ModifiedContent: View where Content: View, Modifier: ViewModifier. That's why .modifier(_:) returns something you can keep chaining.",
              symbol: "link"),
        .init(title: "Conforms to ViewModifier when its content is a ViewModifier.",
              detail: "ModifiedContent: ViewModifier where Content: ViewModifier, Modifier: ViewModifier. This is how you compose modifier-with-modifier into a single bundled modifier.",
              symbol: "square.stack"),
        .init(title: "Frozen, generic, zero-cost.",
              detail: "@frozen — layout is part of the ABI. The compiler optimizes most chains down to flat, allocation-free descriptions of the view tree.",
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
    ModifiedContentPage()
        .frame(width: 1100, height: 800)
}
