import SwiftUI

// SwiftUI `KeyboardShortcut` + `EventModifiers` + `View/keyboardShortcut` reference page.
// Source: Documentation/SwiftUI/input-events/keyboardshortcut.md

struct KeyboardShortcutPage: View {
    @State private var lastAction = "(none)"

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
            Text("keyboardShortcut · KeyboardShortcut · EventModifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Attach keyboard shortcuts to buttons and controls.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "keyboardShortcut(_:modifiers:) on a Button") {
            VStack(alignment: .leading, spacing: 12) {
                Text("Last action: \(lastAction)")
                    .font(.callout).fontDesign(.monospaced).foregroundStyle(.secondary)
                HStack(spacing: 12) {
                    Button("Save (⌘S)") { lastAction = "Save" }
                        .keyboardShortcut("s", modifiers: .command)
                    Button("Refresh (⌘R)") { lastAction = "Refresh" }
                        .keyboardShortcut("r", modifiers: .command)
                    Button("Find (⌘F)") { lastAction = "Find" }
                        .keyboardShortcut("f", modifiers: .command)
                }
            }
            APICallout(".keyboardShortcut(\"s\", modifiers: .command)")
            Text("Press ⌘S, ⌘R, or ⌘F while the window is active — the handler fires even without button focus.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "keyboardShortcut(_:) — shortcut value") {
                snippet("""
                let shortcut = KeyboardShortcut("n", modifiers: [.command, .shift])
                Button("New Window") { … }
                    .keyboardShortcut(shortcut)
                """)
                Text("Pass a KeyboardShortcut value directly — useful when the shortcut is stored or computed.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "keyboardShortcut(_:modifiers:localization:)") {
                snippet("""
                Button("Quit") { … }
                    .keyboardShortcut("q", modifiers: .command,
                                      localization: .automatic)
                // .automatic  — remaps for non-US keyboards
                // .withoutMirroring — keeps original position, no mirror for RTL
                // .custom      — use the key verbatim
                """)
                Text("localization: controls how the shortcut adapts to non-English keyboard layouts. .automatic is the default and recommended.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "EventModifiers — available flags") {
                snippet("""
                EventModifiers.command   // ⌘
                EventModifiers.shift     // ⇧
                EventModifiers.option    // ⌥
                EventModifiers.control   // ⌃
                EventModifiers.capsLock  // ⇪
                EventModifiers.numericPad// Numeric pad modifier
                EventModifiers.function  // Fn key
                EventModifiers.all       // all modifiers combined
                // Combine with array literal:
                [.command, .shift]
                """)
            }

            Block(title: "Named shortcuts — KeyboardShortcut static constants") {
                snippet("""
                KeyboardShortcut.defaultAction   // Return / Enter
                KeyboardShortcut.cancelAction    // Escape
                // Apply to the default / cancel buttons in a form:
                Button("OK") { … }
                    .keyboardShortcut(.defaultAction)
                Button("Cancel") { … }
                    .keyboardShortcut(.cancelAction)
                """)
                Text("Use .defaultAction and .cancelAction to wire the system Return/Escape shortcuts to your form buttons.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "modifierKeyAlternate(_:_:) — modifier-key variants") {
                snippet("""
                Button("Open") { open() }
                    .modifierKeyAlternate(.option) {
                        Button("Open In…") { openInPlace() }
                    }
                """)
                Text("modifierKeyAlternate presents an alternate button label/action when the user holds a modifier key — macOS 15.0+.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Disabled shortcut") {
                snippet("""
                Button("Disabled") { … }
                    .keyboardShortcut("d", modifiers: .command)
                    .disabled(true) // shortcut also disabled
                """)
                Text("Disabling the button disables its keyboard shortcut. There is no separate way to disable only the shortcut.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Shortcut scope") {
                snippet("""
                // Shortcut is scoped to the window by default.
                // It fires when the window is key, regardless of focus.
                Button("Export") { … }
                    .keyboardShortcut("e", modifiers: [.command, .shift])
                """)
                Text("Unlike onKeyPress, keyboard shortcuts fire window-wide — they don't require the button to be focused.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("keyboard", "keyboardShortcut is macOS 11.0+ (AppKit backend). On iOS/iPadOS it requires an external keyboard.")
            noteRow("command", "Avoid overriding system shortcuts (⌘C, ⌘V, ⌘Z, ⌘Q, etc.) unless intentional — doing so breaks standard expectations.")
            noteRow("globe", "Use localization: .automatic so your shortcut remaps correctly on AZERTY, QWERTZ, and JIS layouts.")
            noteRow("lightbulb", "KeyboardShortcut.defaultAction / .cancelAction are the canonical way to identify OK/Cancel buttons — menu commands use them too.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    KeyboardShortcutPage().frame(width: 1100, height: 900)
}
