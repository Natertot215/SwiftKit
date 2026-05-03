import SwiftUI

// SwiftUI `EnvironmentValues/colorScheme` reference page.
// Source: Documentation/SwiftUI/view-configuration/colorscheme.md
// macOS 10.15+. Read the resolved color scheme (light/dark) for the current view.

struct ColorSchemeEnvironmentPage: View {
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
            Text("EnvironmentValues/colorScheme")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The current color scheme of the view's environment \u{2014} .light or .dark.")
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
        VStack(alignment: .leading, spacing: 8) {
            CSReporter()
            APICallout("@Environment(\\.colorScheme) private var colorScheme")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            CSEVariantRow(title: "Force the env value with .environment(_:_:)") {
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".environment(\\.colorScheme, .light)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        CSReporter().environment(\.colorScheme, .light)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".environment(\\.colorScheme, .dark)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        CSReporter().environment(\.colorScheme, .dark)
                    }
                }
            }

            CSEVariantRow(title: "Used to swap assets / colors") {
                Text("""
                @Environment(\\.colorScheme) private var colorScheme
                var body: some View {
                    Image(colorScheme == .dark ? "logo-dark" : "logo-light")
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
            CSEVariantRow(title: "ColorScheme.allCases") {
                HStack(spacing: 12) {
                    ForEach(ColorScheme.allCases, id: \.self) { scheme in
                        Text(label(for: scheme))
                            .font(.callout)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Capsule().fill(.tint))
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }

    private struct CSENote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CSENote] = [
        .init(title: "Reflects what's currently rendered, not the user setting.",
              detail: "If a parent applies .preferredColorScheme(.dark) or .environment(\\.colorScheme, .dark), the child reads .dark even on a light system.",
              symbol: "circle.lefthalf.filled"),
        .init(title: "Prefer semantic colors over branching on colorScheme.",
              detail: ".primary, .secondary, system materials, and asset catalog colors automatically adapt. Reach for colorScheme branching only for true asset/value swaps.",
              symbol: "paintbrush"),
        .init(title: "SwiftUI redraws automatically when the value changes.",
              detail: "Switch to dark mode in System Settings and views reading colorScheme update on the next render. No notification plumbing required.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Two cases: .light and .dark.",
              detail: "There is no third value for \"system\" \u{2014} the env value is always one or the other, even if the source is the system setting.",
              symbol: "moon.stars"),
        .init(title: "Override with .preferredColorScheme(_:) at presentation boundaries.",
              detail: ".preferredColorScheme writes the value upward to the presentation; .environment(\\.colorScheme, _) writes it downward to descendants. Pick the one that matches your scope.",
              symbol: "arrow.up.arrow.down")
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

    private func label(for scheme: ColorScheme) -> String {
        switch scheme {
        case .light: return ".light"
        case .dark:  return ".dark"
        @unknown default: return String(describing: scheme)
        }
    }
}

private struct CSReporter: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: colorScheme == .dark ? "moon.stars.fill" : "sun.max.fill")
                .foregroundStyle(.tint)
            Text("colorScheme = \(colorScheme == .dark ? ".dark" : ".light")")
                .font(.callout)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct CSEVariantRow<Content: View>: View {
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
    ColorSchemeEnvironmentPage()
        .frame(width: 1100, height: 800)
}
