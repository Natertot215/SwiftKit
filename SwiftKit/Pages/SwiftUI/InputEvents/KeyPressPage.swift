import SwiftUI

// SwiftUI `View.onKeyPress` family + `KeyPress` + `KeyEquivalent` reference page.
// Source: Documentation/SwiftUI/input-events/onkeypress(_:action:).md
// Interactive: focuses a text field and captures key presses with various overloads.

struct KeyPressPage: View {
    @State private var log: [String] = []
    @State private var fieldText = ""
    @FocusState private var fieldFocused: Bool

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
            Text("onKeyPress · KeyPress · KeyEquivalent")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Respond to physical keyboard events on any focusable view.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "onKeyPress(_:action:) — match a single key") {
            VStack(alignment: .leading, spacing: 10) {
                TextField("Focus me, then press keys", text: $fieldText)
                    .textFieldStyle(.roundedBorder)
                    .focused($fieldFocused)
                    .onKeyPress(.space) {
                        log.append("SPACE pressed")
                        return .handled
                    }
                    .onKeyPress(.return) {
                        log.append("RETURN pressed")
                        return .handled
                    }
                Button("Focus field") { fieldFocused = true }
                if !log.isEmpty {
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(log.suffix(4), id: \.self) { entry in
                            Text(entry)
                                .font(.caption).fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Button("Clear") { log = [] }
                }
            }
            APICallout(".onKeyPress(.space) { log.append(…); return .handled }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "onKeyPress(phases:action:) — track press and release") {
                snippet("""
                view.onKeyPress(.escape, phases: [.down, .up]) { press in
                    switch press.phase {
                    case .down: // key went down
                    case .up:   // key released
                    default: break
                    }
                    return .handled
                }
                """)
                Text("phases: lets you observe .down, .repeat, and .up separately. Default is .down.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onKeyPress(characters:phases:action:) — character set") {
                snippet("""
                view.onKeyPress(characters: .alphanumerics, phases: .down) { press in
                    handleChar(press.characters)
                    return .handled
                }
                """)
                Text("Pass a CharacterSet to match any key whose character is in that set — useful for implementing keyboard navigation or hotkeys.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onKeyPress(keys:phases:action:) — key set") {
                snippet("""
                view.onKeyPress(keys: [.upArrow, .downArrow]) { press in
                    moveSelection(press.key)
                    return .handled
                }
                """)
                Text("Pass a Set<KeyEquivalent> to handle multiple discrete keys in one handler.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onKeyPress(phases:action:) — catch-all") {
                snippet("""
                view.onKeyPress(phases: .all) { press in
                    print(press.key, press.phase, press.modifiers)
                    return .ignored // let SwiftUI also handle it
                }
                """)
                Text("Return .ignored to let the event propagate up the view tree. Return .handled to consume it.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "KeyPress properties") {
                snippet("""
                // KeyPress
                press.key          // KeyEquivalent — the key pressed
                press.phase        // KeyPress.Phases — .down | .repeat | .up
                press.characters   // String — character(s) the key produced
                press.modifiers    // EventModifiers — .command, .shift, .option, .control
                """)
                Text("KeyPress is the value passed to every onKeyPress handler. It surfaces the raw key, phase, produced characters, and active modifiers.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "KeyEquivalent — named keys") {
                snippet("""
                KeyEquivalent.return    // ↩
                KeyEquivalent.escape    // ⎋
                KeyEquivalent.space     // ⎵
                KeyEquivalent.tab       // ⇥
                KeyEquivalent.upArrow   // ↑
                KeyEquivalent.downArrow // ↓
                KeyEquivalent("a")      // letter 'a'
                """)
                Text("KeyEquivalent is a struct that identifies a key by its character or a static constant. Used by onKeyPress and keyboardShortcut.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Requires focus") {
                snippet("""
                TextField(…, text: $text)
                    .focusable()     // makes non-focusable views accept key events
                    .onKeyPress(…)
                """)
                Text("onKeyPress only fires when the view (or a descendant) has keyboard focus. Non-interactive views need .focusable() to receive key events.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Return value controls propagation") {
                snippet("""
                .onKeyPress(.tab) {
                    moveFocus()
                    return .handled   // stops propagation
                }
                .onKeyPress(.tab) {
                    return .ignored   // pass up the tree
                }
                """)
                Text("Returning .handled prevents the event from reaching any outer onKeyPress handlers or the system. .ignored lets it bubble.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("keyboard", "onKeyPress is macOS 14.0+ and iPadOS 17.0+. Not available on watchOS or tvOS.")
            noteRow("arrow.up.and.down", "To capture arrow-key navigation, use onKeyPress(keys: [.upArrow, .downArrow]) or the dedicated onMoveCommand(perform:).")
            noteRow("exclamationmark.triangle", "Returning .handled for every key can break system keyboard shortcuts (Cut, Copy, Paste). Only handle what you own.")
            noteRow("textformat", "press.characters reflects the text the key would produce — depends on keyboard layout. For layout-independent matching, match on press.key.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(text, systemImage: symbol)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
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
    KeyPressPage().frame(width: 1100, height: 900)
}
