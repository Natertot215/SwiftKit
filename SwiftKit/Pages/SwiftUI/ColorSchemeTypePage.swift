import SwiftUI

// SwiftUI `ColorScheme` enum reference page.
// Source: Documentation/SwiftUI/view-configuration/colorscheme.md
// macOS 10.15+. Two cases: .light and .dark.

struct ColorSchemeTypePage: View {
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
            Text("ColorScheme")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The possible color schemes, corresponding to the light and dark appearances.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/colorscheme.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            CSTypeRow(value: ".light", description: "Light appearance \u{2014} bright background, dark foreground.")
            CSTypeRow(value: ".dark",  description: "Dark appearance \u{2014} dark background, bright foreground.")
            APICallout("enum ColorScheme { case light, dark }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CSTSection(title: "Pick a scheme programmatically") {
                Text("""
                let preferred: ColorScheme = isNight ? .dark : .light
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

            CSTSection(title: "All cases via CaseIterable") {
                HStack(spacing: 12) {
                    ForEach(ColorScheme.allCases, id: \.self) { scheme in
                        CSTSwatch(scheme: scheme)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            CSTSection(title: "Conformances") {
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

            CSTSection(title: "Used by") {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\\.colorScheme  \u{2014}  EnvironmentValues").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".preferredColorScheme(_:)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text(".environment(\\.colorScheme, _)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
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

    private struct CSTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CSTNote] = [
        .init(title: "Two cases only \u{2014} no \"automatic\" value.",
              detail: "If you need \"defer to the system\" semantics, model it as Optional<ColorScheme>; nil means \"no preference\".",
              symbol: "moon.stars"),
        .init(title: "CaseIterable \u{2014} iterate via ColorScheme.allCases.",
              detail: "Useful for previews or test fixtures that exercise both modes.",
              symbol: "list.bullet"),
        .init(title: "Hashable \u{2014} works as a Picker tag.",
              detail: "Bind a Picker to a ColorScheme @State directly; both cases tag cleanly.",
              symbol: "checklist"),
        .init(title: "Use init(_ uiUserInterfaceStyle:) on iOS for UIKit bridging.",
              detail: "Cross-platform code that converts between SwiftUI ColorScheme and UIKit UIUserInterfaceStyle uses the documented inits to round-trip.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "ColorScheme is observable, not stylable.",
              detail: "It tells you what's currently rendering. To actually change the appearance, set .preferredColorScheme(_:) or .environment(\\.colorScheme, _) on a parent.",
              symbol: "info.circle")
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

private struct CSTypeRow: View {
    let value: String
    let description: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(value)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 80, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

private struct CSTSwatch: View {
    let scheme: ColorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 8)
                .fill(scheme == .dark ? Color.black : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
                .frame(width: 120, height: 80)
                .overlay(
                    Text("Aa")
                        .font(.title)
                        .foregroundStyle(scheme == .dark ? Color.white : Color.black)
                )
            Text(scheme == .dark ? ".dark" : ".light")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }
}

private struct CSTSection<Content: View>: View {
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
    ColorSchemeTypePage()
        .frame(width: 1100, height: 800)
}
