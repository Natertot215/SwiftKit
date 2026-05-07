import SwiftUI

// SwiftUI `WindowVisibilityToggle` reference page.
// Source: Documentation/SwiftUI/windows/windowvisibilitytoggle.md
// macOS 15.0+. A specialized button that toggles a Window/UtilityWindow's
// visibility. Used inside .commands { \u{2026} }.

struct WindowVisibilityToggleGalleryPage: View {
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
            Text("WindowVisibilityToggle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A Button-like view that toggles the visibility of a Window or UtilityWindow. The label updates between \u{201C}Show\u{2026}\u{201D} and \u{201C}Hide\u{2026}\u{201D} automatically.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowvisibilitytoggle.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: "WindowVisibilityToggle(windowID: \"formatting\")",
            code: """
            .commands {
                CommandGroup(before: .textFormatting) {
                    WindowVisibilityToggle(windowID: "formatting")
                        .keyboardShortcut("t", modifiers: [.command, .shift])
                }
            }
            """,
            note: "Inside .commands { CommandGroup(\u{2026}) { \u{2026} } } so the toggle becomes a real menu item."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Default label \u{2014} init(windowID:)") {
                WindowSnippet(
                    api: "WindowVisibilityToggle(windowID: \"photo-info\")",
                    code: """
                    WindowVisibilityToggle(windowID: "photo-info")
                    """,
                    note: "Default label uses the window's title and toggles between \u{201C}Show Photo Info\u{201D} and \u{201C}Hide Photo Info\u{201D}."
                )
            }

            VariantBlock(title: "Replacing the auto-added View menu item") {
                WindowSnippet(
                    api: "Pair UtilityWindow.commandsRemoved() with WindowVisibilityToggle elsewhere",
                    code: """
                    UtilityWindow("Formatting Style", id: "formatting") {
                        TextAndImageFormatForm()
                    }
                    .commandsRemoved()

                    .commands {
                        CommandGroup(before: .textFormatting) {
                            WindowVisibilityToggle(windowID: "formatting")
                                .keyboardShortcut("t", modifiers: [.command, .shift])
                        }
                    }
                    """,
                    note: "UtilityWindow auto-adds a toggle to the View menu. .commandsRemoved() drops it so you can place the toggle exactly where you want."
                )
            }

            VariantBlock(title: "Multiple toggles in a Section") {
                WindowSnippet(
                    api: "Group via Section { } inside CommandGroup",
                    code: """
                    CommandGroup(before: .sidebar) {
                        Section {
                            WindowVisibilityToggle(windowID: "photo-library")
                            WindowVisibilityToggle(windowID: "metadata-inspector")
                        }
                    }
                    """,
                    note: "Section adds standard menu separators between groups of toggles."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Targets only Window and UtilityWindow scenes \u{2014} not WindowGroup, since groups can have many simultaneous windows.",
                "Label tracks the window's current visibility automatically (Show\u{2026} / Hide\u{2026}).",
                "Supports .keyboardShortcut(\u{2026}) like a normal Button.",
                "Lives inside .commands { \u{2026} } \u{2014} not a regular toolbar surface.",
                "If the targeted windowID doesn't exist, the toggle is disabled."
            ])
        }
    }

    // MARK: Notes

    private struct WVTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WVTNote] = [
        .init(title: "One initializer: init(windowID:).",
              detail: "The string must match the id passed to a Window or UtilityWindow scene. WindowGroup is not supported \u{2014} groups can produce multiple windows simultaneously, so a single Show/Hide toggle doesn't make semantic sense.",
              symbol: "tag"),
        .init(title: "DefaultWindowVisibilityToggleLabel handles the label rename.",
              detail: "The supporting type DefaultWindowVisibilityToggleLabel is what renders \u{201C}Show {Title}\u{201D} \u{2194} \u{201C}Hide {Title}\u{201D}. You don't construct it directly \u{2014} the toggle wires it up.",
              symbol: "character.cursor.ibeam"),
        .init(title: "Pair with .commandsRemoved() to replace defaults.",
              detail: "UtilityWindow auto-adds a Show/Hide entry to the View menu. Window auto-populates the Window menu. Use .commandsRemoved() on the scene when you want full control over toggle placement / shortcut.",
              symbol: "menubar.dock.rectangle"),
        .init(title: "Keyboard shortcuts compose like a normal Button.",
              detail: ".keyboardShortcut(\"t\", modifiers: [.command, .shift]) attaches to the toggle the same way it attaches to a Button. Useful for inspectors and palettes that benefit from a quick keyboard summon.",
              symbol: "keyboard"),
        .init(title: "macOS 15+; no iOS / iPadOS counterpart.",
              detail: "Other platforms don't have a Window menu / View menu in the same form. WindowVisibilityToggle is part of the macOS-15 window-API expansion.",
              symbol: "calendar.badge.exclamationmark")
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

extension WindowVisibilityToggleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowVisibilityToggle",
        title: "WindowVisibilityToggle",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowVisibilityToggle"
        ],
        blurb: "A specialized button for toggling the visibility of a window. Most commonly used in the main menu to show or hide a Window or UtilityWindow.",
        signature: "struct WindowVisibilityToggle<Label> where Label : View",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowvisibilitytoggle.md",
        page: { AnyView(WindowVisibilityToggleGalleryPage()) }
    )
}

#Preview {
    WindowVisibilityToggleGalleryPage()
        .frame(width: 1100, height: 800)
}
