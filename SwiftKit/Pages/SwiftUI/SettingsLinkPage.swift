import SwiftUI

// SwiftUI `SettingsLink` reference page.
// Source: Documentation/SwiftUI/scenes/settingslink.md
// macOS 14.0+. A button that opens the app's Settings scene.
// init() — no label needed, system provides standard glyph.
// init(label:) — custom label.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 160

struct SettingsLinkPage: View {
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
            Text("SettingsLink")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A button that navigates to the app's Settings scene, equivalent to choosing Settings from the app menu on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scenes/settingslink.md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "SettingsLink()") {
            HStack(spacing: 16) {
                SettingsLink()
                Text("Opens the Settings scene (cmd+,)")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init() \u{2014} default system label") {
                DemoFrame(api: "SettingsLink()") {
                    HStack {
                        SettingsLink()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "init(label:) \u{2014} custom label") {
                DemoFrame(api: "SettingsLink { Label(\"Preferences\", systemImage: \"gear\") }") {
                    HStack {
                        SettingsLink {
                            Label("Preferences\u{2026}", systemImage: "gearshape")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "In a toolbar") {
                DemoFrame(api: ".toolbar { ToolbarItem { SettingsLink() } }") {
                    NavigationStack {
                        Text("App content")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    SettingsLink()
                                }
                            }
                    }
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "Requires a Settings scene in the app.",
              detail: "SettingsLink only navigates somewhere if the app declares a Settings { \u{2026} } scene. Without it the button is present but tapping it has no effect.",
              symbol: "exclamationmark.triangle"),
        .init(title: "macOS 14.0+ only.",
              detail: "On earlier macOS versions the Settings scene is still opened via the app menu; SettingsLink is the SwiftUI API surface added in macOS 14.",
              symbol: "macwindow"),
        .init(title: "Equivalent to Cmd+\u{2c} on macOS.",
              detail: "The system automatically wires SettingsLink to the standard keyboard shortcut, just as the App menu entry does.",
              symbol: "keyboard"),
        .init(title: "Use init(label:) for custom toolbar or menu appearances.",
              detail: "The default init() renders a standard gear icon and 'Settings\u{2026}' label. Supply a custom label only when the context demands a different appearance.",
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
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
    SettingsLinkPage()
        .frame(width: 1100, height: 900)
}
