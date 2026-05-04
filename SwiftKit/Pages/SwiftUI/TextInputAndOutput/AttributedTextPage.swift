import SwiftUI

// Attributed text formatting reference page.
// Covers: AttributedTextFormattingDefinition, AttributedTextValueConstraint, AttributedTextFormatting
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 26+

struct AttributedTextPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Attributed Text Formatting")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Protocols and types for defining custom attributes in SwiftUI text editing.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("AttributedTextFormattingDefinition · AttributedTextValueConstraint · AttributedTextFormatting · macOS 26+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ATCard(api: "AttributedString with inline SwiftUI formatting") {
            let attrStr: AttributedString = {
                var s = AttributedString("Rich text with bold, italic, and link.")
                // Bold first word
                var boldRange = s.startIndex ..< s.index(s.startIndex, offsetByCharacters: 4)
                s[boldRange].font = .body.bold()
                // Italic "italic"
                if let iRange = s.range(of: "italic") {
                    s[iRange].font = .body.italic()
                }
                return s
            }()
            Text(attrStr)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ATVariant(title: "AttributedTextFormattingDefinition (protocol)") {
                ATCard(api: "AttributedTextFormattingDefinition — defines a custom attribute type") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("A protocol you conform to in order to declare a new attributed-text attribute key for use in SwiftUI text editing views.")
                            .font(.body)
                        Text("Conforming types provide: the attribute's value type, a key name, and constraint semantics.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            ATVariant(title: "AttributedTextValueConstraint (protocol)") {
                ATCard(api: "AttributedTextValueConstraint — constrains valid values for an attribute") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Specifies constraints that restrict what values an attribute may hold.")
                            .font(.body)
                        Text("For example, a font-size attribute could constrain its values to a positive range.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            ATVariant(title: "AttributedTextFormatting (protocol)") {
                ATCard(api: "AttributedTextFormatting — groups formatting definitions") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("An umbrella protocol that groups related AttributedTextFormattingDefinition conformances into a named formatting set.")
                            .font(.body)
                        Text("Applied to a TextEditor or TextField to enable those attributes for editing.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            ATVariant(title: "Practical: AttributedString in Text") {
                ATCard(api: "Text(AttributedString) — renders attributed string inline") {
                    let s: AttributedString = {
                        var base = AttributedString("")
                        var boldPart = AttributedString("Bold")
                        boldPart.font = .body.bold()
                        var normalPart = AttributedString(" and ")
                        var italicPart = AttributedString("italic")
                        italicPart.font = .body.italic()
                        var monopart = AttributedString(" and ")
                        var monoPart2 = AttributedString("monospaced")
                        monoPart2.font = .body.monospaced()
                        return boldPart + normalPart + italicPart + monopart + monoPart2
                    }()
                    Text(s)
                }
            }
        }
    }

    private struct ATNote { let title: String; let detail: String; let symbol: String }
    private let notes: [ATNote] = [
        .init(title: "AttributedTextFormatting is SwiftUI 6 / macOS 26.", detail: "These types enable custom attribute definitions for use with SwiftUI's text editing APIs. They complement Foundation's AttributedString, which is available since macOS 12.", symbol: "a.magnify"),
        .init(title: "Text(AttributedString) renders rich text in read-only views.", detail: "For read-only rich text display, construct an AttributedString and pass it to Text(). No formatting protocols are needed for this common case.", symbol: "doc.richtext"),
        .init(title: "Custom attributes require both a definition and a constraint.", detail: "Conform a type to AttributedTextFormattingDefinition to declare the attribute, then use AttributedTextValueConstraint to restrict valid values.", symbol: "key"),
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

private struct ATCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 360, minHeight: 48, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct ATVariant<C: View>: View {
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
    AttributedTextPage().frame(width: 900, height: 800)
}
