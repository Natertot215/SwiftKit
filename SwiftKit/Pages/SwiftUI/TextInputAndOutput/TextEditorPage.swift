import SwiftUI

// SwiftUI `TextEditor` reference page.
// Source: Documentation/SwiftUI/text-input-and-output/texteditor.md
// macOS 10.15+. A view that can display and edit long-form text.

struct TextEditorPage: View {
    @State private var text = "Edit this multi-line text.\n\nTextEditor supports free-form input across multiple lines."
    @State private var styledText = "Styled text editor."

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
            Text("TextEditor")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that can display and edit long-form text.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/texteditor.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 6) {
            TextEditor(text: $text)
                .frame(width: 480, height: 140)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout("TextEditor(text: $text)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TEVariant(title: "With custom font") {
                TECard(api: "TextEditor(text: $text).font(.body.monospaced())") {
                    TextEditor(text: $styledText)
                        .font(.body.monospaced())
                }
            }
            TEVariant(title: "With scrollContentBackground hidden") {
                TECard(api: ".scrollContentBackground(.hidden).background(.tint.opacity(0.1))") {
                    TextEditor(text: $styledText)
                        .scrollContentBackground(.hidden)
                        .background(.tint.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                }
            }
            TEVariant(title: "With line spacing") {
                TECard(api: ".lineSpacing(8)") {
                    TextEditor(text: $text)
                        .lineSpacing(8)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TEVariant(title: "Disabled") {
                TECard(api: "TextEditor(text: .constant(\"…\")).disabled(true)") {
                    TextEditor(text: .constant("This is read-only. You cannot edit this content."))
                        .disabled(true)
                }
            }
            TEVariant(title: "Foreground style") {
                TECard(api: ".foregroundStyle(.tint)") {
                    TextEditor(text: $styledText)
                        .foregroundStyle(.tint)
                }
            }
        }
    }

    private struct TENote { let title: String; let detail: String; let symbol: String }
    private let notes: [TENote] = [
        .init(title: "No built-in placeholder.", detail: "TextEditor has no native placeholder. Use a ZStack with a Text overlay conditioned on text.isEmpty for a placeholder effect.", symbol: "text.quote"),
        .init(title: "scrollContentBackground(.hidden) removes the white background.", detail: "On macOS, TextEditor has a default white background from the scroll view. Use .scrollContentBackground(.hidden) before applying a custom background.", symbol: "square.fill"),
        .init(title: "TextEditorStyle controls appearance.", detail: "Apply .textEditorStyle(_:) to swap between system styles. The default is automatic.", symbol: "paintbrush"),
        .init(title: "Preferred over TextField for long-form input.", detail: "Use TextEditor when you expect multiple paragraphs. For short single-line fields, use TextField (with axis: .vertical if multiline is needed).", symbol: "doc.text"),
    ]

    @ViewBuilder private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct TECard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .frame(width: 480, height: 120)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TEVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    TextEditorPage().frame(width: 900, height: 900)
}
