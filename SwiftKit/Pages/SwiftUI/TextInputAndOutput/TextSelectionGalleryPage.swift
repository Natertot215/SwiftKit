import SwiftUI

// SwiftUI text selection reference page.
// Covers: textSelection(_:), textSelectionAffinity(_:), TextSelectionAffinity,
//         TextSelection, AttributedTextSelection
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 12.0+

struct TextSelectionGalleryPage: View {
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
            Text("Text Selection")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control whether text in a view hierarchy is user-selectable.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/textSelection(_:) · View/textSelectionAffinity(_:) · TextSelectionAffinity · TextSelection · AttributedTextSelection · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TSCard(api: ".textSelection(.enabled)") {
            Text("You can select this text by clicking and dragging.")
                .textSelection(.enabled)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TSVariant(title: ".textSelection(.enabled)") {
                TSCard(api: "Text(\"…\").textSelection(.enabled)") {
                    Text("This text is selectable. Click and drag to highlight.")
                        .textSelection(.enabled)
                }
            }
            TSVariant(title: ".textSelection(.disabled)") {
                TSCard(api: "Text(\"…\").textSelection(.disabled)") {
                    Text("This text is NOT selectable — disabled explicitly.")
                        .textSelection(.disabled)
                }
            }
            TSVariant(title: "Container opt-out") {
                TSCard(api: "VStack { … }.textSelection(.enabled) with inner .textSelection(.disabled)") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Selectable (inherits from VStack)")
                        Text("Also selectable")
                        Text("Not selectable (overrides to .disabled)")
                            .textSelection(.disabled)
                    }
                    .textSelection(.enabled)
                }
            }
            TSVariant(title: "TextSelectionAffinity (conceptual)") {
                TSCard(api: ".textSelectionAffinity(.upstream) / .downstream") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(".upstream — cursor placed before the character at the boundary")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(".downstream — cursor placed after the character at the boundary")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("TextSelectionAffinity controls disambiguation at line wrap points.")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TSVariant(title: "In a ScrollView — selection works across scroll") {
                TSCard(api: "ScrollView { Text(longContent).textSelection(.enabled) }") {
                    ScrollView {
                        Text("SwiftUI text selection works in scroll views. The user can drag across the visible content and continue scrolling while holding the selection. TextSelection and AttributedTextSelection represent programmatic ranges within the text layout.")
                            .textSelection(.enabled)
                            .padding(8)
                    }
                    .frame(width: 400, height: 80)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }

    private struct TSNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TSNote] = [
        .init(title: "textSelection(_:) works on Text, TextEditor, and containers.", detail: "Apply it to a VStack or other container to enable selection for all descendant Text views at once. Use .disabled on individual children to opt out.", symbol: "hand.point.up.left"),
        .init(title: "TextSelectionAffinity disambiguates line-wrap positions.", detail: "When a cursor position falls exactly on a line break, .upstream places the cursor visually at the end of the first line; .downstream places it at the start of the next.", symbol: "arrow.left.and.right"),
        .init(title: "TextSelection and AttributedTextSelection are SwiftUI 6 types.", detail: "These value types represent selected ranges within Text views. They're used with APIs that allow programmatic selection control and observation.", symbol: "text.cursor"),
        .init(title: "Copy (Cmd+C) works automatically.", detail: "When text selection is enabled, users can copy selected text with the standard keyboard shortcut — no additional code needed.", symbol: "doc.on.doc"),
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

private struct TSCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 320, minHeight: 48, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TSVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension TextSelectionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.textSelection",
        title: "TextSelection",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.textselection",
            "swiftui.text-input-and-output.textselection(_:)",
            "swiftui.text-input-and-output.textselectability",
            "swiftui.text-input-and-output.textselectionaffinity",
            "swiftui.text-input-and-output.textselectionaffinity(_:)",
            "swiftui.text-input-and-output.attributedtextselection"
        ],
        blurb: "Represents a selection of text — the TextSelection value, its plain and attributed flavors, the textSelection(_:) and textSelectionAffinity(_:) modifiers, and the TextSelectability protocol that gates whether selection is allowed.",
        signature: "struct TextSelection · protocol TextSelectability · enum TextSelectionAffinity",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/textselection.md",
        page: { AnyView(TextSelectionGalleryPage()) }
    )
}

#Preview {
    TextSelectionGalleryPage().frame(width: 900, height: 800)
}
