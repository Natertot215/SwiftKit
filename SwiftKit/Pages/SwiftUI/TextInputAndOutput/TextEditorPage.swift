import SwiftUI

// Dense SwiftUI TextEditor + TextEditorStyle reference page — consolidates 3 absorbed leaves:
//   TextEditorStyle                (protocol)                  macOS 14.0+
//   View/textEditorStyle(_:)       (modifier)                  macOS 14.0+
//   TextEditorStyleConfiguration   (struct)                    macOS 14.0+
//
// Source docs:
//   Documentation/SwiftUI/text-input-and-output/texteditor.md
//   Documentation/SwiftUI/view-styles/texteditorstyle(_:).md
//   Documentation/SwiftUI/view-styles/texteditorstyle.md
//   Documentation/SwiftUI/view-styles/texteditorstyleconfiguration.md
//
// Mirrors TypographyPage / GradientPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

struct TextEditorPage: View {
    @State private var text = "Edit this multi-line text.\n\nTextEditor supports free-form input across multiple lines."
    @State private var styledText = "Styled text editor."
    @State private var styleAuto = "The quick brown fox\njumps over the lazy dog."
    @State private var stylePlain = "The quick brown fox\njumps over the lazy dog."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                referenceSection
                defaultSection
                stylingGallerySection
                modifiersSection
                statesSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("TextEditor \u{00b7} TextEditorStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that can display and edit long-form text. TextEditorStyle controls the visual treatment.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/texteditor.md \u{00b7} macOS 11.0+ (TextEditorStyle: macOS 14.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("TextEditor  \u{00b7}  TextEditorStyle  \u{00b7}  View/textEditorStyle(_:)  \u{00b7}  TextEditorStyleConfiguration")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference

    private var referenceSection: some View {
        PageSection("Reference", subtitle: "TextEditorStyle \u{00b7} protocol \u{00b7} macOS 14.0+ \u{00b7} TextEditorStyleConfiguration \u{00b7} struct \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("TextEditorStyle is the protocol; conforming types determine the visual chrome of a TextEditor. Apply it via .textEditorStyle(_:) on any view to style all TextEditor instances in that subtree.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("TextEditorStyleConfiguration is the data shape passed to makeBody(configuration:). Its public surface mirrors the editor binding and presented content; most members are SPI and evolve with the SDK. SwiftKit does NOT author custom TextEditorStyle conformers per project hard constraint.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                Text("Note: .roundedBorder exists in the SDK but is iOS-only. It is not available on macOS.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                TECodeBlock(text:
                    """
                    protocol TextEditorStyle {
                        associatedtype Body: View
                        @ViewBuilder func makeBody(configuration: TextEditorStyleConfiguration) -> Body
                    }

                    struct TextEditorStyleConfiguration {
                        // Public surface mirrors the editor binding and presented content;
                        // exact members evolve per SDK and most are SPI.
                        // Use the built-in style literals (.automatic, .plain).
                    }

                    extension View {
                        func textEditorStyle<S: TextEditorStyle>(_ style: S) -> some View  // macOS 14.0+
                    }
                    """)

                VStack(alignment: .leading, spacing: 4) {
                    teNoteRow(title: "TextEditorStyle is the protocol; TextEditorStyleConfiguration is the data shape.",
                              detail: "Custom conformers are SPI-gated. Use the built-in .automatic and .plain style values.",
                              symbol: "doc.text")
                    teNoteRow(title: ".roundedBorder is iOS-only \u{2014} unavailable on macOS.",
                              detail: "The SDK declares .roundedBorder for TextEditor but macOS does not expose it. Using it on macOS has no visible effect.",
                              symbol: "xmark.rectangle")
                }
            }
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "TextEditor(text: $text)") {
            VStack(alignment: .leading, spacing: 6) {
                TextEditor(text: $text)
                    .frame(width: 480, height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                APICallout("TextEditor(text: $text)")
            }
        }
    }

    // MARK: Styling Gallery

    private var stylingGallerySection: some View {
        PageSection("Styling Gallery", subtitle: "View/textEditorStyle(_:) \u{00b7} two macOS styles plus iOS-only notation") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Two built-in TextEditorStyle values on macOS: .automatic and .plain. .roundedBorder is declared in the SDK but is iOS-only.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                HStack(alignment: .top, spacing: 24) {
                    TEStyleCard(title: ".automatic", api: ".textEditorStyle(.automatic)") {
                        TextEditor(text: $styleAuto)
                            .textEditorStyle(.automatic)
                    }
                    TEStyleCard(title: ".plain", api: ".textEditorStyle(.plain)") {
                        TextEditor(text: $stylePlain)
                            .textEditorStyle(.plain)
                    }
                    TEStyleCard(title: ".roundedBorder \u{2014} iOS-only", api: ".textEditorStyle(.roundedBorder) // unavailable on macOS") {
                        Text("Unavailable on macOS")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    // MARK: Modifiers

    private var modifiersSection: some View {
        PageSection("TextEditor Modifiers", subtitle: "Modifier combinations and appearance variants") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("With custom font")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TECard(api: "TextEditor(text: $text).font(.body.monospaced())") {
                        TextEditor(text: $styledText)
                            .font(.body.monospaced())
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With scrollContentBackground hidden")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TECard(api: ".scrollContentBackground(.hidden).background(.tint.opacity(0.1))") {
                        TextEditor(text: $styledText)
                            .scrollContentBackground(.hidden)
                            .background(.tint.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With line spacing")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TECard(api: ".lineSpacing(8)") {
                        TextEditor(text: $text)
                            .lineSpacing(8)
                    }
                }
            }
        }
    }

    // MARK: States

    private var statesSection: some View {
        PageSection("States", subtitle: "Disabled, foreground style, style propagation") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TECard(api: "TextEditor(text: .constant(\"\u{2026}\")).disabled(true)") {
                        TextEditor(text: .constant("This is read-only. You cannot edit this content."))
                            .disabled(true)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Foreground style")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    TECard(api: ".foregroundStyle(.tint)") {
                        TextEditor(text: $styledText)
                            .foregroundStyle(.tint)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled with style propagation")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        TEStyleCard(title: ".automatic + disabled", api: ".disabled(true)") {
                            TextEditor(text: $styleAuto)
                                .textEditorStyle(.automatic)
                                .disabled(true)
                        }
                        TEStyleCard(title: ".plain + disabled", api: ".disabled(true)") {
                            TextEditor(text: $stylePlain)
                                .textEditorStyle(.plain)
                                .disabled(true)
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Guidance from Apple\u{2019}s docs.") {
            VStack(alignment: .leading, spacing: 16) {
                teNoteRow(title: "No built-in placeholder.",
                          detail: "TextEditor has no native placeholder. Use a ZStack with a Text overlay conditioned on text.isEmpty for a placeholder effect.",
                          symbol: "text.quote")
                teNoteRow(title: "scrollContentBackground(.hidden) removes the white background.",
                          detail: "On macOS, TextEditor has a default white background from the scroll view. Use .scrollContentBackground(.hidden) before applying a custom background.",
                          symbol: "square.fill")
                teNoteRow(title: ".automatic resolves to .plain when embedded in a Form.",
                          detail: "Outside a Form .automatic shows the bordered look. Inside a Form macOS expects flush content.",
                          symbol: "questionmark.circle")
                teNoteRow(title: ".plain has no chrome \u{2014} borderless, transparent.",
                          detail: "Use when nesting in a custom container that already supplies the border, or when integrating with a NSTextView background.",
                          symbol: "rectangle.dashed")
                teNoteRow(title: "TextEditor doesn\u{2019}t auto-size \u{2014} set .frame explicitly.",
                          detail: "TextEditor grabs all available vertical space unless given an explicit .frame(height:) or .frame(minHeight:maxHeight:).",
                          symbol: "arrow.up.and.down")
                teNoteRow(title: "macOS 14.0+ requirement for TextEditorStyle.",
                          detail: "TextEditorStyle and the style modifier are macOS 14+. On older OS the same TextEditor renders with the system default and ignores any style hint.",
                          symbol: "calendar")
                teNoteRow(title: "Inheritance like other style modifiers.",
                          detail: "Inner .textEditorStyle wins for its subtree. Apply once at a container to style every TextEditor inside.",
                          symbol: "arrow.down")
                teNoteRow(title: "Preferred over TextField for long-form input.",
                          detail: "Use TextEditor when you expect multiple paragraphs. For short single-line fields, use TextField (with axis: .vertical if multiline is needed).",
                          symbol: "doc.text")
                teNoteRow(title: "TextEditorStyle controls appearance; TextEditorStyleConfiguration is the data shape.",
                          detail: "Apply .textEditorStyle(_:) to swap between system styles. SwiftKit does not author custom conformers per project hard constraint.",
                          symbol: "paintbrush")
            }
        }
    }

    // MARK: Helpers

    private func teNoteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

private struct TECard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
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

private struct TEStyleCard<Content: View>: View {
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
                .frame(width: 320, height: 120, alignment: .topLeading)
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
    TextEditorPage()
        .frame(width: 1100, height: 1600)
}
