import SwiftUI

// SwiftUI `ColorSchemeContrast` enum reference page.
// Source: Documentation/SwiftUI/view-configuration/colorschemecontrast.md
// macOS 10.15+. Two cases: .standard and .increased.

struct ColorSchemeContrastTypePage: View {
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
            Text("ColorSchemeContrast")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The contrast between the app's foreground and background colors.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/colorschemecontrast.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            CCTRow(value: ".standard",  description: "System default contrast.")
            CCTRow(value: ".increased", description: "User has Increase Contrast enabled.")
            APICallout("enum ColorSchemeContrast { case standard, increased }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CCTSection(title: "Side-by-side preview") {
                HStack(spacing: 16) {
                    CCTSwatch(contrast: .standard)
                    CCTSwatch(contrast: .increased)
                }
            }

            CCTSection(title: "Conformances") {
                Text("CaseIterable, Copyable, Equatable, Escapable, Hashable, Sendable, SendableMetatype")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            CCTSection(title: "Read via the environment value") {
                Text("""
                @Environment(\\.colorSchemeContrast) private var contrast
                var body: some View {
                    Text(contrast == .standard ? "Standard" : "Increased")
                }
                """)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
            }
        }
    }

    private struct CCTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CCTNote] = [
        .init(title: "Two cases \u{2014} .standard and .increased.",
              detail: "There is no third value. Treat this as a Boolean accessibility flag with idiomatic naming.",
              symbol: "circle.lefthalf.filled"),
        .init(title: "Set by the user, not the app.",
              detail: "Increase Contrast lives in System Settings > Accessibility > Display. Apps must adapt; they can't override it.",
              symbol: "accessibility"),
        .init(title: "CaseIterable \u{2014} iterate via .allCases.",
              detail: "Convenient for previewing both states or building snapshot tests.",
              symbol: "list.bullet"),
        .init(title: "Hashable \u{2014} ready for tags / dictionary keys.",
              detail: "You can bind a Picker to a ColorSchemeContrast @State directly when building developer tools.",
              symbol: "checklist"),
        .init(title: "Combine with .colorScheme for full theme decisions.",
              detail: "ColorScheme tells you light/dark; ColorSchemeContrast tells you whether the user wants more punch. Together they describe four meaningful render contexts.",
              symbol: "paintbrush")
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

private struct CCTRow: View {
    let value: String
    let description: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(value)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 110, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

private struct CCTSwatch: View {
    let contrast: ColorSchemeContrast

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Aa Bb Cc")
                    .font(.title)
                    .foregroundStyle(.primary)
                Text("Sample row")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .padding(12)
            .frame(width: 200, height: 90, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: contrast == .increased ? 2 : 1)
            )
            Text(contrast == .increased ? ".increased" : ".standard")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }
}

private struct CCTSection<Content: View>: View {
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
    ColorSchemeContrastTypePage()
        .frame(width: 1100, height: 800)
}
