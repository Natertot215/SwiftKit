import SwiftUI

// SwiftUI `WindowLevel` + `Scene/windowLevel(_:)` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowlevel.md
//   Documentation/SwiftUI/windows/windowlevel(_:).md
// macOS 15.0+. Documented values per Apple: .automatic, .desktop, .floating, .normal.
// (NOTE: AppKit's NSWindow.Level has many more cases like .modalPanel, .statusBar, etc.,
// but SwiftUI's surface only exposes the four above.)

struct WindowLevelPage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WindowLevel")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a window's level in the macOS window stacking order. Floating windows stay above normal ones; desktop sits below.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowlevel.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowLevel(.automatic)",
            code: """
            Window("Utility Window", id: "utility") {
                UtilityContent()
            }
            .windowLevel(.automatic)
            """,
            note: "Default \u{2014} system picks per scene type. WindowGroup/Window default to .normal, UtilityWindow defaults to .floating."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} per-scene default") {
                WindowSnippet(
                    api: ".windowLevel(.automatic)",
                    code: """
                    Window("Main", id: "main") { ContentView() }
                        .windowLevel(.automatic)
                    """,
                    note: "Equivalent to omitting the modifier. Window/WindowGroup \u{2192} .normal; UtilityWindow \u{2192} .floating."
                )
            }

            VariantBlock(title: ".normal \u{2014} standard application window") {
                WindowSnippet(
                    api: ".windowLevel(.normal)",
                    code: """
                    Window("Editor", id: "editor") { Editor() }
                        .windowLevel(.normal)
                    """,
                    note: "Standard z-order. The default for primary application windows."
                )
            }

            VariantBlock(title: ".floating \u{2014} stays above normal windows") {
                WindowSnippet(
                    api: ".windowLevel(.floating)",
                    code: """
                    Window("Inspector", id: "inspector") { Inspector() }
                        .windowLevel(.floating)
                    """,
                    note: "Tool palettes, floating utility panels. UtilityWindow uses this by default."
                )
            }

            VariantBlock(title: ".desktop \u{2014} sits below normal windows") {
                WindowSnippet(
                    api: ".windowLevel(.desktop)",
                    code: """
                    Window("Wallpaper", id: "wallpaper") { WallpaperView() }
                        .windowLevel(.desktop)
                    """,
                    note: "Background widget territory. The window sits behind normal application windows but above the desktop background."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                ".desktop \u{2014} below normal windows; useful for wallpaper-like overlays.",
                ".normal \u{2014} the default for WindowGroup and Window.",
                ".floating \u{2014} above normal windows; the default for UtilityWindow.",
                ".automatic \u{2014} system picks per scene type, equivalent to omitting the modifier.",
                "Within the same level, standard activation order applies."
            ])
        }
    }

    // MARK: Notes

    private struct WLNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WLNote] = [
        .init(title: "Four documented values \u{2014} far fewer than AppKit's NSWindow.Level.",
              detail: "AppKit exposes .modalPanel, .statusBar, .popUpMenu, .screenSaver, .mainMenu, .floating, .submenu, .tornOffMenu, etc. SwiftUI's WindowLevel only surfaces .automatic / .desktop / .floating / .normal. Drop to AppKit (NSApplication.shared.windows + NSWindow.level) when you need finer control.",
              symbol: "rectangle.stack"),
        .init(title: "UtilityWindow already defaults to .floating.",
              detail: "Setting .windowLevel(.floating) on a UtilityWindow is a no-op. Reach for this modifier when you have a Window or WindowGroup that should behave like a palette but you don't want UtilityWindow's other defaults (auto-hide, no minimize, focus rules).",
              symbol: "info.circle"),
        .init(title: ".desktop is rarely the right answer for normal apps.",
              detail: "It's intended for ambient overlays \u{2014} wallpaper widgets, screensaver-style scenes. Standard app windows belong at .normal so users can stack and arrange them naturally.",
              symbol: "exclamationmark.triangle"),
        .init(title: "macOS 15+; visionOS doesn't ship windowLevel.",
              detail: "WindowLevel is a macOS-only Scene modifier on macOS 15+. visionOS uses spatial placement instead of stacked z-order; there is no equivalent.",
              symbol: "calendar.badge.exclamationmark"),
        .init(title: "Equatable + Hashable + Sendable.",
              detail: "WindowLevel is a value type with full equality + hashing. You can store one in @State, key it, or compare it for routing logic.",
              symbol: "checkmark.seal")
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

// MARK: - Reusable demo helpers (page-local)

private struct WindowSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
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

private struct BehaviorList: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Label {
                    Text(item)
                        .font(.callout)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.tint)
                }
            }
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

#Preview {
    WindowLevelPage()
        .frame(width: 1100, height: 800)
}
