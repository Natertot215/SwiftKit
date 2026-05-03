import SwiftUI

// SwiftUI `EnvironmentValues/colorSchemeContrast` reference page.
// Source: Documentation/SwiftUI/view-configuration/colorschemecontrast.md
// macOS 10.15+. Read-only environment value reflecting the user's Increase
// Contrast accessibility setting.

struct ColorSchemeContrastEnvironmentPage: View {
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
            Text("EnvironmentValues/colorSchemeContrast")
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
        VStack(alignment: .leading, spacing: 8) {
            ContrastReporter()
            APICallout("@Environment(\\.colorSchemeContrast) private var colorSchemeContrast")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CSCEVariantRow(title: "Read live value") {
                Text(".colorSchemeContrast is read-only — toggle System Settings → Accessibility → Display → Increase Contrast to flip it.")
                    .font(.caption).foregroundStyle(.secondary)
                ContrastReporter()
            }

            CSCEVariantRow(title: "Branching to bump line weight / contrast") {
                Text("""
                @Environment(\\.colorSchemeContrast) private var contrast
                var body: some View {
                    border
                        .strokeBorder(.separator, lineWidth: contrast == .increased ? 2 : 1)
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

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            CSCEVariantRow(title: "Set by System Settings, not by the app") {
                Text("Users enable Increase Contrast under Accessibility > Display in System Settings (macOS) or Accessibility > Display & Text Size (iOS). Apps cannot override the user's choice via this environment value.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
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

    private struct CSCENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CSCENote] = [
        .init(title: "Read-only \u{2014} you cannot push it down.",
              detail: "Production code reads \\.colorSchemeContrast to react to the system setting. Use .environment(_:_:) only for previews / tests.",
              symbol: "lock"),
        .init(title: "Two cases: .standard and .increased.",
              detail: "When .increased, prefer thicker lines, stronger separators, and full-opacity ShapeStyles to meet the user's intent.",
              symbol: "circle.righthalf.filled"),
        .init(title: "Most semantic styles already adapt.",
              detail: ".primary, .secondary, system materials, and named asset colors increase their contrast automatically. Custom drawing is what usually needs manual handling.",
              symbol: "paintbrush"),
        .init(title: "SwiftUI redraws on change.",
              detail: "Toggle Increase Contrast in System Settings and views reading the value re-render. No observers needed.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Honor the user's request.",
              detail: "Per HIG, Increase Contrast is an accessibility setting. Don't override it for branding reasons \u{2014} adapt your visuals.",
              symbol: "accessibility")
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

private struct ContrastReporter: View {
    @Environment(\.colorSchemeContrast) private var contrast

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: contrast == .increased ? "circle.righthalf.filled" : "circle.lefthalf.filled")
                .foregroundStyle(.tint)
            Text("contrast = \(contrast == .increased ? ".increased" : ".standard")")
                .font(.callout)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: contrast == .increased ? 2 : 1)
        )
    }
}

private struct CSCEVariantRow<Content: View>: View {
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
    ColorSchemeContrastEnvironmentPage()
        .frame(width: 1100, height: 800)
}
