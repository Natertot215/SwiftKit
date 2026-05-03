import SwiftUI

// SwiftUI `View/textEditorStyle(_:)` + `TextEditorStyle` + `TextEditorStyleConfiguration`
// Source: Documentation/SwiftUI/view-styles/texteditorstyle(_:).md, texteditorstyle.md, texteditorstyleconfiguration.md
// macOS 14.0+. Built-in style values supported on macOS: .automatic, .plain.
// (.roundedBorder exists in the SDK but is iOS-only.)

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 200

struct TextEditorStylePage: View {
    @State private var text1: String = "The quick brown fox\njumps over the lazy dog."
    @State private var text2: String = "The quick brown fox\njumps over the lazy dog."
    @State private var text3: String = "The quick brown fox\njumps over the lazy dog."

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
            Text("View/textEditorStyle(_:) + TextEditorStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for text editors within this view. TextEditorStyle is the protocol; TextEditorStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/texteditorstyle(_:).md · macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TECard(title: ".automatic", api: ".textEditorStyle(.automatic)") {
            TextEditor(text: $text1).textEditorStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Two built-in TextEditorStyle values supported on macOS; .roundedBorder is iOS-only.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                TECard(title: ".automatic", api: ".textEditorStyle(.automatic)") {
                    TextEditor(text: $text1).textEditorStyle(.automatic)
                }
                TECard(title: ".plain", api: ".textEditorStyle(.plain)") {
                    TextEditor(text: $text2).textEditorStyle(.plain)
                }
                TECard(title: ".roundedBorder — iOS-only", api: ".textEditorStyle(.roundedBorder) // unavailable on macOS") {
                    Text("Unavailable on macOS")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled propagates")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    TECard(title: ".automatic + disabled", api: ".disabled(true)") {
                        TextEditor(text: $text1).textEditorStyle(.automatic).disabled(true)
                    }
                    TECard(title: ".plain + disabled", api: ".disabled(true)") {
                        TextEditor(text: $text2).textEditorStyle(.plain).disabled(true)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("TextEditorStyleConfiguration shape")
                    .font(.headline)
                TECodeBlock(text:
                    """
                    struct TextEditorStyleConfiguration {
                        // Public surface mirrors the editor binding and presented content;
                        // exact members evolve per SDK and most are SPI.
                        // Use the built-in style literals (.automatic, .plain, .roundedBorder).
                    }
                    """)
                Text("SwiftKit does NOT author custom TextEditorStyle conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct TENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TENote] = [
        .init(title: ".automatic resolves to .plain when embedded in a Form.",
              detail: "Outside a Form .automatic shows the bordered look. Inside a Form macOS expects flush content.",
              symbol: "questionmark.circle"),
        .init(title: ".roundedBorder draws the bezel; height is up to you.",
              detail: "TextEditor doesn't auto-size — set .frame(height:) or .frame(minHeight:maxHeight:) explicitly. Otherwise it grabs all available vertical space.",
              symbol: "arrow.up.and.down"),
        .init(title: ".plain has no chrome — borderless, transparent.",
              detail: "Use when nesting in a custom container that already supplies the border. Or when integrating with a NSTextView background.",
              symbol: "rectangle.dashed"),
        .init(title: "macOS 14.0+ requirement.",
              detail: "TextEditorStyle and the style modifier are macOS 14+. On older OS the same TextEditor renders with the system default and ignores any style hint.",
              symbol: "calendar"),
        .init(title: "Inheritance like other style modifiers.",
              detail: "Inner .textEditorStyle wins for its subtree. Apply once at a container to style every TextEditor inside.",
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

private struct TECard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct TECodeBlock: View {
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
    TextEditorStylePage()
        .frame(width: 1200, height: 1100)
}
