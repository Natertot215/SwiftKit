import SwiftUI

// Text styling modifiers reference page.
// Covers: bold(_:), italic(_:), underline(_:pattern:color:), strikethrough(_:pattern:color:),
//         textCase(_:), monospaced(_:), monospacedDigit()
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 10.15+

struct TextStylingPage: View {
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
            Text("Text Styling")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Modifiers for bold, italic, underline, strikethrough, case, and spacing.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("bold(_:) · italic(_:) · underline(_:pattern:color:) · strikethrough(_:pattern:color:) · textCase(_:) · monospaced(_:) · monospacedDigit() · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TStyCard(api: ".bold().italic()") {
            Text("Bold and italic").bold().italic()
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TStyVariant(title: "bold(_:) and italic(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    TStyCard(api: ".bold()") { Text("Bold text").bold() }
                    TStyCard(api: ".bold(false)") { Text("Not bold").bold(false) }
                    TStyCard(api: ".italic()") { Text("Italic text").italic() }
                    TStyCard(api: ".italic(false)") { Text("Not italic").italic(false) }
                }
            }

            TStyVariant(title: "underline(_:pattern:color:)") {
                HStack(alignment: .top, spacing: 16) {
                    TStyCard(api: ".underline()") {
                        Text("Underlined").underline()
                    }
                    TStyCard(api: ".underline(pattern: .dashDot)") {
                        Text("DashDot underline").underline(pattern: .dashDot)
                    }
                    TStyCard(api: ".underline(.dash)") {
                        Text("Dash underline").underline(pattern: .dash)
                    }
                    TStyCard(api: ".underline(color: .accentColor)") {
                        Text("Tinted underline").underline(color: Color.accentColor)
                    }
                }
            }

            TStyVariant(title: "strikethrough(_:pattern:color:)") {
                HStack(alignment: .top, spacing: 16) {
                    TStyCard(api: ".strikethrough()") {
                        Text("Strikethrough").strikethrough()
                    }
                    TStyCard(api: ".strikethrough(pattern: .dash)") {
                        Text("Dashed strike").strikethrough(pattern: .dash)
                    }
                    TStyCard(api: ".strikethrough(color: .red)") {
                        Text("Red strikethrough").strikethrough(color: .red)
                    }
                }
            }

            TStyVariant(title: "textCase(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    TStyCard(api: ".textCase(.uppercase)") {
                        Text("uppercase text").textCase(.uppercase)
                    }
                    TStyCard(api: ".textCase(.lowercase)") {
                        Text("LOWERCASE TEXT").textCase(.lowercase)
                    }
                    TStyCard(api: ".textCase(nil)") {
                        Text("Original Case").textCase(nil)
                    }
                }
            }

            TStyVariant(title: "monospaced(_:) and monospacedDigit()") {
                HStack(alignment: .top, spacing: 16) {
                    TStyCard(api: ".monospaced()") {
                        Text("Monospaced text 123").monospaced()
                    }
                    TStyCard(api: ".monospaced(false)") {
                        Text("Proportional text 123").monospaced(false)
                    }
                    TStyCard(api: ".monospacedDigit()") {
                        VStack(alignment: .leading) {
                            Text("Score: 100").monospacedDigit()
                            Text("Score: 9").monospacedDigit()
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TStyVariant(title: "Composing multiple styling modifiers") {
                TStyCard(api: ".bold().italic().underline().textCase(.uppercase)") {
                    Text("Composed styling")
                        .bold()
                        .italic()
                        .underline()
                        .textCase(.uppercase)
                }
            }
            TStyVariant(title: "monospacedDigit() for aligned numbers in lists") {
                TStyCard(api: ".monospacedDigit() — digits align across rows") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Files: 1,024").monospacedDigit()
                        Text("Files: 42").monospacedDigit()
                        Text("Files: 8,388,608").monospacedDigit()
                    }
                }
            }
        }
    }

    private struct TStyNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TStyNote] = [
        .init(title: "bold(_:) / italic(_:) accept a Bool parameter.", detail: "Pass false to explicitly disable a trait that may have been set by a parent. Equivalent to calling the modifier conditionally.", symbol: "b.circle"),
        .init(title: "underline / strikethrough share the same pattern enum.", detail: "Both share Text.LineStyle.Pattern: .solid, .dot, .dash, .dashDot, .dashDotDot. The default is .solid.", symbol: "line.horizontal.star.fill.line.horizontal"),
        .init(title: "textCase(_:) does not change the stored string.", detail: "It applies a visual transformation only — the underlying Text value and accessibility label remain in their original case.", symbol: "textformat.abc"),
        .init(title: "monospacedDigit() only affects digit characters.", detail: "Letters keep their proportional width; only 0-9 switch to tabular (fixed-width) spacing. Use for counters, scores, and numeric lists.", symbol: "number"),
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

private struct TStyCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 150, minHeight: 40, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TStyVariant<C: View>: View {
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
    TextStylingPage().frame(width: 1000, height: 1100)
}
