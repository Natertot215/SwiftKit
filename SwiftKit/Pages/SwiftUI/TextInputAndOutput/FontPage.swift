import SwiftUI

// SwiftUI `Font` type reference page.
// Source: Documentation/SwiftUI/text-input-and-output/font.md
// macOS 10.15+. The Font type — text styles, weights, designs, and custom fonts.

struct FontPage: View {
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
            Text("Font")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A environment-aware font that scales with Dynamic Type and carries design, weight, and width attributes.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/text-input-and-output/font.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FCard(api: ".font(.body)") {
            Text("The quick brown fox").font(.body)
        }
    }

    private let textStyles: [(String, Font)] = [
        ("largeTitle", .largeTitle),
        ("title", .title),
        ("title2", .title2),
        ("title3", .title3),
        ("headline", .headline),
        ("subheadline", .subheadline),
        ("body", .body),
        ("callout", .callout),
        ("footnote", .footnote),
        ("caption", .caption),
        ("caption2", .caption2),
    ]

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FVariant(title: "Text styles (semantic)") {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(textStyles, id: \.0) { name, style in
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text(".\(name)")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                                .frame(width: 120, alignment: .leading)
                            Text("The quick brown fox")
                                .font(style)
                        }
                    }
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            FVariant(title: "Font designs") {
                HStack(alignment: .top, spacing: 16) {
                    FCard(api: ".fontDesign(.default)") {
                        Text("Default design").fontDesign(.default)
                    }
                    FCard(api: ".fontDesign(.serif)") {
                        Text("Serif design").fontDesign(.serif)
                    }
                    FCard(api: ".fontDesign(.rounded)") {
                        Text("Rounded design").fontDesign(.rounded)
                    }
                    FCard(api: ".fontDesign(.monospaced)") {
                        Text("Mono design").fontDesign(.monospaced)
                    }
                }
            }

            FVariant(title: "Font weights") {
                VStack(alignment: .leading, spacing: 6) {
                    let weights: [(String, Font.Weight)] = [
                        ("ultraLight", .ultraLight), ("thin", .thin), ("light", .light),
                        ("regular", .regular), ("medium", .medium), ("semibold", .semibold),
                        ("bold", .bold), ("heavy", .heavy), ("black", .black)
                    ]
                    ForEach(weights, id: \.0) { name, weight in
                        HStack(spacing: 12) {
                            Text(".\(name)")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                                .frame(width: 100, alignment: .leading)
                            Text("The quick brown fox")
                                .fontWeight(weight)
                        }
                    }
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            FVariant(title: "Font widths (condensed / expanded)") {
                HStack(alignment: .top, spacing: 16) {
                    FCard(api: ".fontWidth(.compressed)") {
                        Text("Compressed").fontWidth(.compressed)
                    }
                    FCard(api: ".fontWidth(.condensed)") {
                        Text("Condensed").fontWidth(.condensed)
                    }
                    FCard(api: ".fontWidth(.standard)") {
                        Text("Standard").fontWidth(.standard)
                    }
                    FCard(api: ".fontWidth(.expanded)") {
                        Text("Expanded").fontWidth(.expanded)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FVariant(title: "Bold + italic modifiers") {
                HStack(alignment: .top, spacing: 16) {
                    FCard(api: ".bold()") {
                        Text("Bold text").bold()
                    }
                    FCard(api: ".italic()") {
                        Text("Italic text").italic()
                    }
                    FCard(api: ".bold().italic()") {
                        Text("Bold italic").bold().italic()
                    }
                    FCard(api: ".monospaced()") {
                        Text("Monospaced").monospaced()
                    }
                }
            }
            FVariant(title: "Custom font via Font.custom") {
                FCard(api: "Font.custom(\"Georgia\", size: 18)") {
                    Text("Custom font — Georgia").font(Font.custom("Georgia", size: 18))
                }
            }
        }
    }

    private struct FNote { let title: String; let detail: String; let symbol: String }
    private let notes: [FNote] = [
        .init(title: "Semantic styles scale with Dynamic Type.", detail: ".body, .headline, etc. respond to the user's Dynamic Type setting. Avoid Font.system(size:) which is fixed.", symbol: "textformat.size"),
        .init(title: "Designs modify the typeface, not the size.", detail: ".fontDesign(.rounded) switches to the rounded variant of SF Pro. All text styles remain scalable.", symbol: "pencil.and.outline"),
        .init(title: "Font.custom registers a named font.", detail: "Use Font.custom(\"FontName\", size:) for installed custom fonts. Use Font.custom(\"FontName\", size:, relativeTo:) to keep the custom font scalable.", symbol: "f.cursive"),
        .init(title: "Bold/italic/monospaced are shorthand modifiers.", detail: "These call .fontWeight(.bold), .fontDesign(.monospaced), etc. internally — they're convenience wrappers on the Font type.", symbol: "b.circle"),
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

private struct FCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 140, minHeight: 40, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct FVariant<C: View>: View {
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
    FontPage().frame(width: 1000, height: 1200)
}
