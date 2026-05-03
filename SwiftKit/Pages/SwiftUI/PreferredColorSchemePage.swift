import SwiftUI

// SwiftUI `View/preferredColorScheme(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/preferredcolorscheme(_:).md
// macOS 11.0+. Sets the preferred color scheme for the nearest enclosing
// presentation. Pass nil to defer to the system.

struct PreferredColorSchemePage: View {
    @State private var override: ColorSchemeOverride = .none

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
            Text("View/preferredColorScheme(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the preferred color scheme for this presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/preferredcolorscheme(_:).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            schemeCard("Forced .dark")
                .preferredColorScheme(.dark)
                .frame(width: 300)
            APICallout(".preferredColorScheme(.dark)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            PCSVariantRow(title: "Side-by-side \u{2014} .light, .dark, nil") {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".light").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        schemeCard(".light").preferredColorScheme(.light).frame(width: 200)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".dark").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        schemeCard(".dark").preferredColorScheme(.dark).frame(width: 200)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text("nil (defer to system)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        schemeCard("nil").preferredColorScheme(nil).frame(width: 200)
                    }
                }
            }

            PCSVariantRow(title: "Conditional \u{2014} only override sometimes") {
                Text("""
                .preferredColorScheme(isDarkMode ? .dark : nil)
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
            PCSVariantRow(title: "Interactive override") {
                VStack(alignment: .leading, spacing: 12) {
                    Picker("Scheme", selection: $override) {
                        Text("nil (system)").tag(ColorSchemeOverride.none)
                        Text(".light").tag(ColorSchemeOverride.light)
                        Text(".dark").tag(ColorSchemeOverride.dark)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                    schemeCard(label(for: override))
                        .preferredColorScheme(scheme(for: override))
                        .frame(width: 320)
                    Text("scheme = \(label(for: override))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private struct PCSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PCSNote] = [
        .init(title: "Affects the nearest enclosing presentation.",
              detail: "Sheets, popovers, windows. The system uses the value at the presentation boundary; values applied deeper inside still propagate up to that boundary.",
              symbol: "rectangle.stack"),
        .init(title: "Pass nil to defer to the system / parent.",
              detail: "Useful when the override only applies conditionally. Without nil you can't \"unset\" a previously chosen value mid-conditional.",
              symbol: "circle.dashed"),
        .init(title: "First non-nil sibling wins.",
              detail: "When parallel branches set different values, SwiftUI resolves to the first non-nil preference based on view order.",
              symbol: "arrow.left.and.right"),
        .init(title: "Don't use to theme inline content.",
              detail: "preferredColorScheme is for whole presentations \u{2014} scoping a sheet to dark mode, for instance. To swap appearance for a single subview, use .environment(\\.colorScheme, .dark) or roll your own ShapeStyle.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Setting overrides any descendant's preferredColorScheme.",
              detail: "Applying the modifier replaces nested preferences. Combine with thoughtful structure so consumers know which level wins.",
              symbol: "lock")
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

    @ViewBuilder
    private func schemeCard(_ title: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Sample text on a card")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack {
                Button("Action") {}
                    .buttonStyle(.borderedProminent)
                Spacer()
                Image(systemName: "moon.stars")
                    .foregroundStyle(.tint)
            }
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }

    private func scheme(for override: ColorSchemeOverride) -> ColorScheme? {
        switch override {
        case .none:  return nil
        case .light: return .light
        case .dark:  return .dark
        }
    }

    private func label(for override: ColorSchemeOverride) -> String {
        switch override {
        case .none:  return "nil"
        case .light: return ".light"
        case .dark:  return ".dark"
        }
    }
}

private enum ColorSchemeOverride: Hashable {
    case none, light, dark
}

private struct PCSVariantRow<Content: View>: View {
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
    PreferredColorSchemePage()
        .frame(width: 1100, height: 800)
}
