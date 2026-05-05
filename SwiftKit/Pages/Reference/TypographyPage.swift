import SwiftUI

// Typography reference page. Mirrors Apple's HIG typography for macOS.
// Source: Documentation/HIG/foundations/typography.md (macOS built-in text styles table).
// Per L-001: every demonstration uses semantic font modifiers — never .system(size:).
// The only hardcoded literal is the API-label column width below, which is layout
// spacing, not typography.
private let apiColumnWidth: CGFloat = 180

struct TypographyPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                textStylesSection
                fontWeightsSection
                fontDesignsSection
                fontWidthsSection
                dynamicTypeSection
                higNotesSection
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
            Text("Typography")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple's macOS type system — sizes, weights, designs, widths, and Dynamic Type ramp.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/HIG/foundations/typography.md")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Text styles

    private struct TextStyleRow {
        let api: String
        let style: Font
        let size: String
        let usage: String
    }

    private let textStyles: [TextStyleRow] = [
        .init(api: ".font(.largeTitle)",  style: .largeTitle,  size: "26 / 32 · Regular", usage: "Document title; primary screen heading."),
        .init(api: ".font(.title)",       style: .title,       size: "22 / 26 · Regular", usage: "Primary section title."),
        .init(api: ".font(.title2)",      style: .title2,      size: "17 / 22 · Regular", usage: "Secondary section title."),
        .init(api: ".font(.title3)",      style: .title3,      size: "15 / 20 · Regular", usage: "Tertiary heading; sidebar group label."),
        .init(api: ".font(.headline)",    style: .headline,    size: "13 / 16 · Bold",    usage: "Emphasized row title in lists."),
        .init(api: ".font(.body)",        style: .body,        size: "13 / 16 · Regular", usage: "Default body text. Use this most often."),
        .init(api: ".font(.callout)",     style: .callout,     size: "12 / 15 · Regular", usage: "Adjacent text in callouts and badges."),
        .init(api: ".font(.subheadline)", style: .subheadline, size: "11 / 14 · Regular", usage: "Secondary line under body text."),
        .init(api: ".font(.footnote)",    style: .footnote,    size: "10 / 13 · Regular", usage: "Footnotes, attributions, fine print."),
        .init(api: ".font(.caption)",     style: .caption,     size: "10 / 13 · Regular", usage: "Image captions; small annotations."),
        .init(api: ".font(.caption2)",    style: .caption2,    size: "10 / 13 · Medium",  usage: "Smallest text; metadata badges.")
    ]

    private var textStylesSection: some View {
        PageSection("Text styles", subtitle: "Sample · API · macOS size in points / line height · Usage") {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(textStyles, id: \.api) { row in
                    textStyleRow(row)
                    Divider().opacity(0.4)
                }
            }
        }
    }

    private func textStyleRow(_ row: TextStyleRow) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 24) {
            Text("The quick brown fox.")
                .font(row.style)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading, spacing: 2) {
                Text(row.api)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .textSelection(.enabled)
                Text(row.size)
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
                Text(row.usage)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            .frame(width: apiColumnWidth, alignment: .leading)
        }
    }

    // MARK: Font weights

    private let weights: [(api: String, weight: Font.Weight)] = [
        (".ultraLight", .ultraLight),
        (".thin",       .thin),
        (".light",      .light),
        (".regular",    .regular),
        (".medium",     .medium),
        (".semibold",   .semibold),
        (".bold",       .bold),
        (".heavy",      .heavy),
        (".black",      .black)
    ]

    private var fontWeightsSection: some View {
        PageSection("Font weights", subtitle: "Apply via .fontWeight(_:). Same word, same size, varying weight only.") {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(weights, id: \.api) { item in
                    HStack(alignment: .firstTextBaseline, spacing: 24) {
                        Text("SwiftKit")
                            .font(.title)
                            .fontWeight(item.weight)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(item.api)
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                            .frame(width: apiColumnWidth, alignment: .leading)
                    }
                }
                Text("HIG: prefer Regular, Medium, Semibold, or Bold. Avoid Ultralight, Thin, and Light at body sizes — they can be hard to see.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
            }
        }
    }

    // MARK: Font designs

    private let designs: [(api: String, design: Font.Design, family: String)] = [
        (".default",     .default,     "SF Pro"),
        (".serif",       .serif,       "New York"),
        (".monospaced",  .monospaced,  "SF Mono"),
        (".rounded",     .rounded,     "SF Rounded")
    ]

    private var fontDesignsSection: some View {
        PageSection("Font designs", subtitle: "Apply via .fontDesign(_:). Each design is a distinct system font family.") {
            VStack(alignment: .leading, spacing: 14) {
                ForEach(designs, id: \.api) { item in
                    HStack(alignment: .firstTextBaseline, spacing: 24) {
                        Text("The quick brown fox jumps over the lazy dog.")
                            .font(.title2)
                            .fontDesign(item.design)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.api)
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                            Text(item.family)
                                .font(.caption2)
                                .foregroundStyle(.tertiary)
                        }
                        .frame(width: apiColumnWidth, alignment: .leading)
                    }
                }
            }
        }
    }

    // MARK: Font widths

    private let widths: [(api: String, width: Font.Width)] = [
        (".compressed", .compressed),
        (".condensed",  .condensed),
        (".standard",   .standard),
        (".expanded",   .expanded)
    ]

    private var fontWidthsSection: some View {
        PageSection("Font widths", subtitle: "Apply via .fontWidth(_:). Visible difference depends on font and weight.") {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(widths, id: \.api) { item in
                    HStack(alignment: .firstTextBaseline, spacing: 24) {
                        Text("Compressed condensed standard expanded")
                            .font(.title)
                            .fontWidth(item.width)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(item.api)
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                            .frame(width: apiColumnWidth, alignment: .leading)
                    }
                }
            }
        }
    }

    // MARK: Dynamic Type

    private let dynamicSizes: [(api: String, size: DynamicTypeSize, group: String)] = [
        (".xSmall",         .xSmall,         "Standard"),
        (".small",          .small,          "Standard"),
        (".medium",         .medium,         "Standard"),
        (".large",          .large,          "Standard (default)"),
        (".xLarge",         .xLarge,         "Standard"),
        (".xxLarge",        .xxLarge,        "Standard"),
        (".xxxLarge",       .xxxLarge,       "Standard"),
        (".accessibility1", .accessibility1, "Accessibility"),
        (".accessibility2", .accessibility2, "Accessibility"),
        (".accessibility3", .accessibility3, "Accessibility"),
        (".accessibility4", .accessibility4, "Accessibility"),
        (".accessibility5", .accessibility5, "Accessibility")
    ]

    private var dynamicTypeSection: some View {
        PageSection("Dynamic Type ramp", subtitle: ".dynamicTypeSize(_:) applied to .body text — 12 documented sizes.") {
            VStack(alignment: .leading, spacing: 12) {
                Label {
                    Text("macOS does not honor a system-wide Dynamic Type setting. The rows below show what each value renders at when applied directly. Apple HIG: macOS uses fixed text sizes; iOS/iPadOS/visionOS/watchOS opt-in via Settings.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                } icon: {
                    Image(systemName: "info.circle")
                        .foregroundStyle(.secondary)
                }
                .padding(12)
                .background(.quaternary.opacity(0.4), in: RoundedRectangle(cornerRadius: 8))

                ForEach(dynamicSizes, id: \.api) { item in
                    HStack(alignment: .firstTextBaseline, spacing: 24) {
                        Text("The quick brown fox jumps.")
                            .font(.body)
                            .dynamicTypeSize(item.size)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.api)
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                            Text(item.group)
                                .font(.caption2)
                                .foregroundStyle(.tertiary)
                        }
                        .frame(width: apiColumnWidth, alignment: .leading)
                    }
                }
            }
        }
    }

    // MARK: HIG notes

    private struct HIGNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let higNotes: [HIGNote] = [
        .init(title: "Use semantic styles, never hardcoded sizes.",
              detail: "Apple's text styles automatically adapt to context, light/dark, and platform conventions. Hardcoded sizes silently break Dynamic Type, accessibility, and platform feel.",
              symbol: "textformat.size"),
        .init(title: "Avoid Ultralight, Thin, and Light at body sizes.",
              detail: "These weights can be hard to see, especially when text is small. Prefer Regular, Medium, Semibold, or Bold for legibility.",
              symbol: "exclamationmark.triangle"),
        .init(title: "SF Symbols match font weight automatically.",
              detail: "When you use Label(_, systemImage:) the symbol's stroke weight matches the adjacent text. Mismatches read as broken hierarchy — never set symbol weight independently.",
              symbol: "star.square"),
        .init(title: "Variable fonts handle optical sizing — don't pick discrete sizes.",
              detail: "SF Pro is a variable font. The system font interpolates weight and width axes; pick a semantic style and let the system size optically.",
              symbol: "textformat"),
        .init(title: "Custom fonts must support Dynamic Type and Bold Text.",
              detail: "If you ship a custom typeface, make sure it scales correctly with Dynamic Type and respects the Accessibility → Bold Text setting on platforms that support it.",
              symbol: "textformat.alt")
    ]

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on typography, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(higNotes, id: \.title) { note in
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
}

#Preview {
    TypographyPage()
        .frame(width: 900, height: 700)
}
