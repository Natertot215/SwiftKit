import SwiftUI

// SwiftUI `View/help(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/help(_:).md
// macOS 11.0+. Sets a help tag (tooltip) on macOS / visionOS, and the
// accessibility hint on every platform. Multiple overloads: Text, String, LocalizedStringKey.

struct HelpPage: View {
    @State private var opacity: Double = 0.5

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
            Text("View/help(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds help text to a view using a text view that you provide.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/help(_:).md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Slider(value: $opacity, in: 0...1) {
                Text("Opacity")
            }
            .help(Text("Adjust the opacity of the selected shape"))
            .frame(width: 280)
            APICallout(".help(Text(\"Adjust the opacity of the selected shape\"))")
            Text("Hover the slider to reveal the tooltip.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            HelpVariantRow(title: "Three accepted argument types") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 16) {
                        Button("StringProtocol") {}
                            .help("Plain string overload")
                        APICallout(".help(\"Plain string overload\")")
                    }
                    HStack(spacing: 16) {
                        Button("LocalizedStringKey") {}
                            .help("Localized key overload")
                        APICallout(".help(\"Localized key overload\")")
                    }
                    HStack(spacing: 16) {
                        Button("Text") {}
                            .help(Text("Text overload \u{2014} pass formatted Text"))
                        APICallout(".help(Text(\u{2026}))")
                    }
                }
            }

            HelpVariantRow(title: "On non-button targets") {
                HStack(spacing: 24) {
                    Image(systemName: "info.circle")
                        .font(.title)
                        .foregroundStyle(.tint)
                        .help("Information")
                    Image(systemName: "lock.fill")
                        .font(.title)
                        .foregroundStyle(.tint)
                        .help("Locked")
                    Image(systemName: "wifi")
                        .font(.title)
                        .foregroundStyle(.tint)
                        .help("Connected via Wi\u{2011}Fi")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HelpVariantRow(title: "Toolbar buttons \u{2014} the canonical macOS use case") {
                HStack(spacing: 12) {
                    Button {} label: {
                        Image(systemName: "plus")
                    }
                    .help("Add a new item")
                    Button {} label: {
                        Image(systemName: "trash")
                    }
                    .help("Delete the selected item")
                    Button {} label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .help("Share with others")
                }
                .buttonStyle(.bordered)
                APICallout("Icon-only toolbar buttons should always provide .help(\u{2026}).")
            }
        }
    }

    private struct HelpNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [HelpNote] = [
        .init(title: "Tooltip on macOS / visionOS, hint everywhere.",
              detail: "On macOS the help text appears as a hover tooltip after a brief delay. On every platform it becomes the accessibility hint for VoiceOver.",
              symbol: "info.circle"),
        .init(title: "Mandatory for icon-only controls.",
              detail: "Without a label, icon-only buttons rely on .help to disclose their purpose to mouse and assistive-tech users alike. HIG: never ship a chrome icon button without it.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Three overloads: StringProtocol, LocalizedStringKey, Text.",
              detail: "Use the Text form when you need formatting (e.g. attributed strings, localizing through a Text helper). Otherwise the literal string form is fine.",
              symbol: "textformat"),
        .init(title: "Applied per leaf view, not per container.",
              detail: "Help text is best attached close to the interactive control that owns it. Adding it to a wrapping VStack pushes the same hint to everything inside.",
              symbol: "rectangle.dashed"),
        .init(title: "Localize via LocalizedStringKey or Text(NSLocalizedString:).",
              detail: "The string overload takes a LocalizedStringKey \u{2014} keys flow through Localizable.xcstrings. The Text overload preserves whatever localization Text was constructed with.",
              symbol: "globe")
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

private struct HelpVariantRow<Content: View>: View {
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
    HelpPage()
        .frame(width: 1100, height: 800)
}
