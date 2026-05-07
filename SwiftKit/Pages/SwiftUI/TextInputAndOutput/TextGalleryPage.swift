import SwiftUI

// SwiftUI `Text` reference page.
// Source: Documentation/SwiftUI/text-input-and-output/text.md
// macOS 10.15+. The primary view for displaying read-only text.

struct TextGalleryPage: View {
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
            Text("Text")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that displays one or more lines of read-only text.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/text.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TCard(api: "Text(\"Hello, world!\")") {
            Text("Hello, world!")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TVariant(title: "String literal") {
                TCard(api: "Text(\"Plain string\")") {
                    Text("Plain string")
                }
            }
            TVariant(title: "LocalizedStringKey (implicit)") {
                TCard(api: "Text(\"key\") — resolved via localizations table") {
                    Text("Hello, world!")
                }
            }
            TVariant(title: "AttributedString") {
                TCard(api: "Text(AttributedString(…))") {
                    let attrStr: AttributedString = {
                        var s = AttributedString("Bold and italic")
                        s[s.startIndex ..< s.index(s.startIndex, offsetByCharacters: 4)].font = .body.bold()
                        s[s.index(s.startIndex, offsetByCharacters: 9) ..< s.endIndex].font = .body.italic()
                        return s
                    }()
                    Text(attrStr)
                }
            }
            TVariant(title: "Markdown inline") {
                TCard(api: "Text(\"**Bold**, _italic_, `code`\")") {
                    Text("**Bold**, _italic_, `code`")
                }
            }
            TVariant(title: "Image interpolation") {
                TCard(api: "Text(\"Check \\(Image(systemName: \\\"checkmark\\\"))!\")") {
                    Text("Check \(Image(systemName: "checkmark.circle.fill"))!")
                }
            }
            TVariant(title: "Date") {
                TCard(api: "Text(Date.now, style: .time)") {
                    Text(Date.now, style: .time)
                }
            }
            TVariant(title: "Date range") {
                TCard(api: "Text(Date.now ... Date.now.addingTimeInterval(3600))") {
                    Text(Date.now ... Date.now.addingTimeInterval(3600))
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TVariant(title: "Text selection enabled") {
                TCard(api: ".textSelection(.enabled)") {
                    Text("Select me — I'm selectable text.")
                        .textSelection(.enabled)
                }
            }
            TVariant(title: "Truncation modes") {
                HStack(alignment: .top, spacing: 16) {
                    TCard(api: ".truncationMode(.tail)") {
                        Text("A very long piece of text that will be truncated at the tail end.")
                            .truncationMode(.tail)
                            .frame(width: 160)
                    }
                    TCard(api: ".truncationMode(.head)") {
                        Text("A very long piece of text that will be truncated at the head.")
                            .truncationMode(.head)
                            .frame(width: 160)
                    }
                    TCard(api: ".truncationMode(.middle)") {
                        Text("A very long piece of text truncated in the middle position.")
                            .truncationMode(.middle)
                            .frame(width: 160)
                    }
                }
            }
            TVariant(title: "Line limit") {
                HStack(alignment: .top, spacing: 16) {
                    TCard(api: ".lineLimit(1)") {
                        Text("One line only — any overflow is clipped by the line limit modifier.")
                            .lineLimit(1)
                            .frame(width: 160)
                    }
                    TCard(api: ".lineLimit(2)") {
                        Text("Two lines allowed — any overflow beyond two is clipped by the modifier.")
                            .lineLimit(2)
                            .frame(width: 160)
                    }
                    TCard(api: ".lineLimit(nil)") {
                        Text("No limit — wraps to as many lines as needed.")
                            .lineLimit(nil)
                            .frame(width: 160)
                    }
                }
            }
            TVariant(title: "Redacted") {
                TCard(api: ".redacted(reason: .placeholder)") {
                    Text("Sensitive information here.")
                        .redacted(reason: .placeholder)
                }
            }
        }
    }

    private struct TNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TNote] = [
        .init(title: "Markdown parsed at compile time.", detail: "Text(\"**bold**\") parses inline markdown automatically — no extra imports needed. Use AttributedString for runtime-constructed rich text.", symbol: "text.badge.star"),
        .init(title: "Image interpolation embeds SF Symbols inline.", detail: "Text(\"Done \\(Image(systemName: \\\"checkmark\\\"))\") composites the symbol into the text run, inheriting font size.", symbol: "photo.on.rectangle"),
        .init(title: "Date style renders live-updating text.", detail: "Text(Date.now, style: .relative) updates automatically without a Timer — SwiftUI tracks time internally.", symbol: "clock"),
        .init(title: "Text is not a container.", detail: "Unlike UILabel, Text has no built-in padding or frame constraints. Wrap in a layout container (VStack, HStack, etc.) for positioning.", symbol: "rectangle.dashed"),
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

private struct TCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 240, minHeight: 48, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct TVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension TextGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.text",
        title: "Text",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.bold(_:)",
            "swiftui.text-input-and-output.italic(_:)",
            "swiftui.text-input-and-output.strikethrough(_:pattern:color:)",
            "swiftui.text-input-and-output.text",
            "swiftui.text-input-and-output.underline(_:pattern:color:)"
        ],
        blurb: "A view that displays one or more lines of read-only text. This page also covers the inline text-decoration modifiers: bold, italic, underline, and strikethrough.",
        signature: "Text \u{00b7} View/bold(_:) \u{00b7} View/italic(_:) \u{00b7} View/underline(_:pattern:color:) \u{00b7} View/strikethrough(_:pattern:color:)",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/text.md",
        page: { AnyView(TextGalleryPage()) }
    )
}

#Preview {
    TextGalleryPage().frame(width: 1000, height: 900)
}
