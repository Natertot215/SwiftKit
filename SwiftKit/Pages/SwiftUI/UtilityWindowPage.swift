import SwiftUI

// SwiftUI `UtilityWindow` reference page.
// Source: Documentation/SwiftUI/windows/utilitywindow.md
// macOS 15.0+. Specialized scene for tool palettes / inspector windows.
// Defaults to .floating window level, hides when inactive, not minimizable.

struct UtilityWindowPage: View {
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
            Text("UtilityWindow")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A specialized scene for secondary, palette-style windows that orbit the main scene.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/utilitywindow.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "UtilityWindow(\"Photo Info\", id: \"photo-info\") { PhotoInfoViewer() }",
            code: """
            @main
            struct PhotoBrowser: App {
                var body: some Scene {
                    WindowGroup {
                        PhotoGallery()
                    }
                    UtilityWindow("Photo Info", id: "photo-info") {
                        PhotoInfoViewer()
                    }
                }
            }
            """,
            note: "A floating inspector that follows the focused photo gallery window."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Reading focused values from the active main scene") {
                WindowSnippet(
                    api: "@FocusedValue(PhotoSelection.self) inside the utility content",
                    code: """
                    struct PhotoInfoViewer: View {
                        @FocusedValue(PhotoSelection.self) private var selectedPhotos
                        var body: some View {
                            Text("\\(selectedPhotos?.count ?? 0) photos selected")
                        }
                    }
                    """,
                    note: "Utility windows receive FocusedValues from whichever main window is currently focused — the same channel commands use."
                )
            }

            VariantBlock(title: "Replacing the auto-added View menu item") {
                WindowSnippet(
                    api: "UtilityWindow(\u{2026}).commandsRemoved() + WindowVisibilityToggle elsewhere",
                    code: """
                    UtilityWindow("Formatting", id: "formatting") {
                        FormattingPalette()
                    }
                    .commandsRemoved()

                    // Place the show/hide control yourself:
                    .commands {
                        CommandGroup(before: .textFormatting) {
                            WindowVisibilityToggle(windowID: "formatting")
                                .keyboardShortcut("t", modifiers: [.command, .shift])
                        }
                    }
                    """,
                    note: "By default, UtilityWindow adds an item to the View menu. .commandsRemoved() drops it so you can place a WindowVisibilityToggle exactly where you want."
                )
            }

            VariantBlock(title: "Programmatic open / dismiss") {
                WindowSnippet(
                    api: "openWindow(id:) and dismiss / dismissWindow(id:)",
                    code: """
                    @Environment(\\.openWindow) private var openWindow
                    @Environment(\\.dismissWindow) private var dismissWindow

                    Button("Show inspector") { openWindow(id: "photo-info") }
                    Button("Hide inspector") { dismissWindow(id: "photo-info") }
                    """,
                    note: "Same environment actions as Window — UtilityWindow is just a Scene with palette-flavored defaults."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Default behaviors that distinguish UtilityWindow") {
                BehaviorList(items: [
                    "Window level defaults to .floating so it stays above main scenes.",
                    "Auto-hides when the application is not active.",
                    "Only takes focus when explicitly clicked (titlebar or focusable subview).",
                    "Escape key dismisses while focused.",
                    "Minimize button is disabled by default.",
                    "Receives FocusedValues from the currently focused main scene."
                ])
            }
        }
    }

    // MARK: Notes

    private struct UWNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [UWNote] = [
        .init(title: "Use UtilityWindow for inspectors and tool palettes \u{2014} not as a primary window.",
              detail: "If your auxiliary surface is content the user reads through (a separate viewer, a settings pane), Window is the better fit. Reach for UtilityWindow when the surface acts on the focused main window.",
              symbol: "slider.horizontal.3"),
        .init(title: "FocusedValues replace shared state for cross-window communication.",
              detail: "The inspector reads @FocusedValue(\u{2026}) from whichever main window has focus. This avoids manually plumbing selection state across scenes.",
              symbol: "scope"),
        .init(title: "Pair with WindowVisibilityToggle for menu placement.",
              detail: "The auto-added View menu entry is good enough for most apps. When you need a specific keyboard shortcut or menu position, remove it via .commandsRemoved() and drop in WindowVisibilityToggle(windowID: \u{2026}) inside .commands { \u{2026} }.",
              symbol: "menubar.dock.rectangle"),
        .init(title: "Title and id are required.",
              detail: "Unlike WindowGroup, UtilityWindow's only initializer takes a title and id. The framework needs both to wire the View-menu show/hide affordance.",
              symbol: "tag")
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
    UtilityWindowPage()
        .frame(width: 1100, height: 800)
}
