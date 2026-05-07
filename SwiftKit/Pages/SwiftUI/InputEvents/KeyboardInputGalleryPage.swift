import SwiftUI

// Dense keyboard-input reference page. Consolidates fourteen previously-separate
// leaves:
//   • KeyEquivalent                                                      (struct)
//   • EventModifiers                                                     (OptionSet)
//   • KeyPress                                                           (struct)
//   • KeyboardShortcut                                                   (struct)
//   • View/onKeyPress(_:action:)
//   • View/onKeyPress(phases:action:)
//   • View/onKeyPress(_:phases:action:)
//   • View/onKeyPress(characters:phases:action:)
//   • View/onKeyPress(keys:phases:action:)
//   • View/keyboardShortcut(_:)
//   • View/keyboardShortcut(_:modifiers:)
//   • View/keyboardShortcut(_:modifiers:localization:)
//   • View/onModifierKeysChanged(mask:initial:_:)
//   • View/modifierKeyAlternate(_:_:)
//
// Source docs:
//   Documentation/SwiftUI/input-events/keyequivalent.md
//   Documentation/SwiftUI/input-events/eventmodifiers.md
//   Documentation/SwiftUI/input-events/keypress.md
//   Documentation/SwiftUI/input-events/keyboardshortcut.md
//   Documentation/SwiftUI/input-events/onkeypress(_:action:).md
//   Documentation/SwiftUI/input-events/onkeypress(phases:action:).md
//   Documentation/SwiftUI/input-events/onkeypress(_:phases:action:).md
//   Documentation/SwiftUI/input-events/onkeypress(characters:phases:action:).md
//   Documentation/SwiftUI/input-events/onkeypress(keys:phases:action:).md
//   Documentation/SwiftUI/input-events/keyboardshortcut(_:).md
//   Documentation/SwiftUI/input-events/keyboardshortcut(_:modifiers:).md
//   Documentation/SwiftUI/input-events/keyboardshortcut(_:modifiers:localization:).md
//   Documentation/SwiftUI/input-events/onmodifierkeyschanged(mask:initial:_:).md
//   Documentation/SwiftUI/input-events/modifierkeyalternate(_:_:).md
//
// Mirrors TypographyPage / PaddingPage / ScrollTransitionPage's dense rhythm:
// one ScrollView, one VStack, one PageSection per topic. The four type-describe
// Reference subsections (KeyEquivalent, EventModifiers, KeyPress,
// KeyboardShortcut) are placed ABOVE all demo subsections per the describe-track
// placement rule. All demos compose Apple primitives directly — no custom
// wrapper views.

struct KeyboardInputGalleryPage: View {
    @State private var fieldText = ""
    @State private var keyLog: [String] = []
    @State private var phaseLog: [String] = []
    @State private var arrowLog: [String] = []
    @State private var charLog: [String] = []
    @State private var keysetLog: [String] = []
    @State private var lastShortcut = "(none)"
    @State private var modifiersHeld: EventModifiers = []
    @FocusState private var defaultFocus: Bool
    @FocusState private var phasesFocus: Bool
    @FocusState private var namedKeyFocus: Bool
    @FocusState private var charactersFocus: Bool
    @FocusState private var keysFocus: Bool

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                keyEquivalentReferenceSection
                eventModifiersReferenceSection
                keyPressReferenceSection
                keyboardShortcutReferenceSection
                onKeyPressSingleSection
                onKeyPressPhasesSection
                onKeyPressNamedPhasesSection
                onKeyPressCharactersSection
                onKeyPressKeysSection
                keyboardShortcutValueSection
                keyboardShortcutKeyModifiersSection
                keyboardShortcutLocalizationSection
                onModifierKeysChangedSection
                modifierKeyAlternateSection
                higNotesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Keyboard input")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Raw keyboard events and shortcuts \u{2014} onKeyPress, keyboardShortcut, modifier tracking, and the keyboard input types (KeyEquivalent, EventModifiers, KeyPress, KeyboardShortcut).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/input-events/ \u{00b7} macOS 10.15+ (onKeyPress: 14.0+; onModifierKeysChanged / modifierKeyAlternate: 15.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".onKeyPress(\u{2026})  \u{00b7}  .keyboardShortcut(\u{2026})  \u{00b7}  .onModifierKeysChanged(\u{2026})  \u{00b7}  .modifierKeyAlternate(\u{2026})  \u{00b7}  KeyEquivalent  \u{00b7}  EventModifiers  \u{00b7}  KeyPress  \u{00b7}  KeyboardShortcut")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (KeyEquivalent)
    //
    // Describe-track content placed above demos per the describe-track placement
    // rule. Open the page, see the type definitions first, then scroll into demos.

    private var keyEquivalentReferenceSection: some View {
        PageSection("Reference \u{2014} KeyEquivalent", subtitle: "struct KeyEquivalent \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Identifies a key that activates a shortcut or matches against an onKeyPress handler. Constructible from a Character literal or from a static constant for non-character keys (Return, Escape, Tab, arrows, function keys).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Static constants (named keys)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".return", "\u{21a9} Return / Enter.")
                    referenceRow(".escape", "\u{238b} Escape.")
                    referenceRow(".space", "\u{2423} Space bar.")
                    referenceRow(".tab", "\u{21e5} Tab.")
                    referenceRow(".delete", "\u{232b} Delete (backspace).")
                    referenceRow(".deleteForward", "Forward delete (Fn + Delete).")
                    referenceRow(".upArrow", "\u{2191} Up arrow.")
                    referenceRow(".downArrow", "\u{2193} Down arrow.")
                    referenceRow(".leftArrow", "\u{2190} Left arrow.")
                    referenceRow(".rightArrow", "\u{2192} Right arrow.")
                    referenceRow(".home", "Home.")
                    referenceRow(".end", "End.")
                    referenceRow(".pageUp", "Page Up.")
                    referenceRow(".pageDown", "Page Down.")
                    referenceRow(".clear", "Clear.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Character init")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("KeyEquivalent(\"a\")   // letter 'a'")
                    APICallout("KeyEquivalent(\"?\")   // punctuation")
                    Text("Any single Character can be wrapped. ExpressibleByExtendedGraphemeClusterLiteral support means string literals like \"s\" auto-convert when passed where a KeyEquivalent is expected.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct KeyEquivalent")
                    APICallout("init(_ character: Character)")
                    APICallout("var character: Character")
                    APICallout("static let return: KeyEquivalent")
                    APICallout("static let escape: KeyEquivalent")
                    APICallout("static let space: KeyEquivalent")
                    APICallout("static let tab: KeyEquivalent")
                    APICallout("static let delete: KeyEquivalent")
                    APICallout("static let upArrow: KeyEquivalent")
                    APICallout("static let downArrow: KeyEquivalent")
                    APICallout("static let leftArrow: KeyEquivalent")
                    APICallout("static let rightArrow: KeyEquivalent")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Equatable, Hashable, Sendable, ExpressibleByExtendedGraphemeClusterLiteral")
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

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Used by both onKeyPress and keyboardShortcut.",
                        detail: "The same KeyEquivalent value powers focused key matching (onKeyPress) and window-wide shortcuts (keyboardShortcut). Pick the named static constant when one exists; reach for the Character init only for letter / digit / punctuation keys.",
                        symbol: "keyboard"
                    )
                    noteRow(
                        title: "Match on .key for layout independence.",
                        detail: "press.key (a KeyEquivalent) is keyboard-layout-independent. press.characters depends on the user's keyboard layout \u{2014} match the named key for hotkeys, the characters for text-driven matching.",
                        symbol: "globe"
                    )
                    noteRow(
                        title: "ExpressibleByExtendedGraphemeClusterLiteral.",
                        detail: "Anywhere a KeyEquivalent is expected you can pass a string literal directly: .keyboardShortcut(\"s\", modifiers: .command) auto-converts the literal to KeyEquivalent.",
                        symbol: "textformat.abc"
                    )
                }
            }
        }
    }

    // MARK: Reference (EventModifiers)

    private var eventModifiersReferenceSection: some View {
        PageSection("Reference \u{2014} EventModifiers", subtitle: "struct EventModifiers : OptionSet \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A set of modifier keys held during a keyboard event. OptionSet semantics \u{2014} combine flags with array-literal syntax. Used by keyboardShortcut, onKeyPress, and onModifierKeysChanged.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Individual flags")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".command", "\u{2318} Command.")
                    referenceRow(".shift", "\u{21e7} Shift.")
                    referenceRow(".option", "\u{2325} Option / Alt.")
                    referenceRow(".control", "\u{2303} Control.")
                    referenceRow(".capsLock", "\u{21ea} Caps Lock.")
                    referenceRow(".numericPad", "Numeric keypad keys (number row vs. keypad).")
                    referenceRow(".function", "Fn (function-key modifier).")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Combined")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("[.command, .shift]                  // \u{2318}\u{21e7}")
                    APICallout("[.command, .option]                 // \u{2318}\u{2325}")
                    APICallout("[.command, .shift, .option]         // \u{2318}\u{21e7}\u{2325}")
                    APICallout("EventModifiers.all                  // every flag set")
                    Text("OptionSet \u{2014} use array literal syntax to combine. .all is a convenience for \u{201c}any modifier\u{201d} masks (e.g. onModifierKeysChanged default mask).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct EventModifiers : OptionSet")
                    APICallout("init(rawValue: Int)")
                    APICallout("static let command: EventModifiers")
                    APICallout("static let shift: EventModifiers")
                    APICallout("static let option: EventModifiers")
                    APICallout("static let control: EventModifiers")
                    APICallout("static let capsLock: EventModifiers")
                    APICallout("static let numericPad: EventModifiers")
                    APICallout("static let function: EventModifiers")
                    APICallout("static let all: EventModifiers")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("OptionSet, Equatable, Hashable, Sendable, BitwiseCopyable")
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

                VStack(alignment: .leading, spacing: 8) {
                    Text("Querying from a KeyPress")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.onKeyPress(phases: .down) { press in
    if press.modifiers.contains(.command) { \u{2026} }
    if press.modifiers == [.command, .shift] { \u{2026} }
    return .handled
}
"""
                    )
                    Text("press.modifiers is an EventModifiers value \u{2014} use OptionSet methods (.contains, set equality, .intersection) to inspect.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "OptionSet, not enum.",
                        detail: "Use array-literal combination ([.command, .shift]) and OptionSet APIs (.contains, .isStrictSubset(of:)). Don't switch on an EventModifiers value as if it were a single case.",
                        symbol: "square.grid.2x2"
                    )
                    noteRow(
                        title: ".all = every flag set.",
                        detail: "Useful for onModifierKeysChanged(mask: .all) (the default) when you want every modifier change to fire. Pass a narrower mask (.option) to fire only on that one.",
                        symbol: "command"
                    )
                    noteRow(
                        title: ".numericPad and .function are macOS-leaning.",
                        detail: "iOS keyboards rarely emit them. Code that targets multiple platforms should treat them as best-effort \u{2014} present on hardware keyboards, absent on touch layouts.",
                        symbol: "keyboard"
                    )
                }
            }
        }
    }

    // MARK: Reference (KeyPress)

    private var keyPressReferenceSection: some View {
        PageSection("Reference \u{2014} KeyPress", subtitle: "struct KeyPress \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The value passed to every onKeyPress handler. Surfaces the raw key, the press phase, the produced characters, and the active modifiers \u{2014} so a single closure can match all of them.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("press.key", "KeyEquivalent \u{2014} the layout-independent key identifier.")
                    referenceRow("press.phase", "KeyPress.Phases \u{2014} .down, .repeat, or .up.")
                    referenceRow("press.characters", "String \u{2014} the character(s) the key would produce given the current keyboard layout.")
                    referenceRow("press.modifiers", "EventModifiers \u{2014} flags held at the time of the event.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("KeyPress.Phases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".down", "Key transitioned from up to down.")
                    referenceRow(".repeat", "Key is held; the system is emitting auto-repeat events.")
                    referenceRow(".up", "Key transitioned from down to up.")
                    referenceRow(".all", "All three phases combined (OptionSet convenience).")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct KeyPress")
                    APICallout("var key: KeyEquivalent")
                    APICallout("var phase: KeyPress.Phases")
                    APICallout("var characters: String")
                    APICallout("var modifiers: EventModifiers")
                    APICallout("struct KeyPress.Phases : OptionSet")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Inside an onKeyPress handler")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.onKeyPress(phases: .all) { press in
    print(press.key, press.phase,
          press.characters, press.modifiers)
    return .ignored
}
"""
                    )
                    Text("Returning .handled consumes the event; .ignored lets it bubble. The handler runs once per phase you opted into.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Phases is an OptionSet, not an enum.",
                        detail: "Combine phases with array literals: [.down, .up]. Inspect a single press with press.phase == .down (the receiver inside the closure is a single phase value but the request is a set).",
                        symbol: "square.stack"
                    )
                    noteRow(
                        title: "characters depends on layout; key does not.",
                        detail: "On AZERTY, pressing the key labeled Q produces \u{201c}a\u{201d} as press.characters but press.key is still KeyEquivalent(\"q\"). Match on .key for layout-stable hotkeys; on .characters when the visible character is what matters.",
                        symbol: "globe"
                    )
                    noteRow(
                        title: "modifiers reflects state at event time.",
                        detail: "Held shift at the moment of the down event \u{2192} press.modifiers contains .shift. The value is captured per event, not sampled from a separate stream.",
                        symbol: "command"
                    )
                }
            }
        }
    }

    // MARK: Reference (KeyboardShortcut)

    private var keyboardShortcutReferenceSection: some View {
        PageSection("Reference \u{2014} KeyboardShortcut", subtitle: "struct KeyboardShortcut \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A combination of a KeyEquivalent and an EventModifiers set. Used as the value type passed to View/keyboardShortcut(_:). Build it inline at a call site or store it for reuse.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("init(_ key: KeyEquivalent, modifiers: EventModifiers = .command)")
                    APICallout("init(_ key: KeyEquivalent, modifiers: EventModifiers, localization: KeyboardShortcut.Localization)")
                    Text("Default modifier is .command. The localization-aware init takes a KeyboardShortcut.Localization (.automatic / .withoutMirroring / .custom).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Static constants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".defaultAction", "Return / Enter \u{2014} the standard form-default shortcut (OK button in a sheet, default button in a dialog).")
                    referenceRow(".cancelAction", "Escape \u{2014} the standard form-cancel shortcut (Cancel button in a sheet).")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct KeyboardShortcut")
                    APICallout("var key: KeyEquivalent")
                    APICallout("var modifiers: EventModifiers")
                    APICallout("var localization: KeyboardShortcut.Localization")
                    APICallout("static let defaultAction: KeyboardShortcut")
                    APICallout("static let cancelAction: KeyboardShortcut")
                    APICallout("enum KeyboardShortcut.Localization")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Hashable, Sendable, BitwiseCopyable")
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

                VStack(alignment: .leading, spacing: 8) {
                    Text("Applied to a Button via .keyboardShortcut")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
let save = KeyboardShortcut(\"s\", modifiers: .command)
Button(\"Save\") { \u{2026} }
    .keyboardShortcut(save)
"""
                    )
                    Text("The shortcut value is decoupled from the call site so the same definition can drive a button, a menu command, and a keyboard help overlay.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Default modifier is .command.",
                        detail: "KeyboardShortcut(\"s\") and KeyboardShortcut(\"s\", modifiers: .command) are equivalent. The modifier-less init is intentional because nearly every Mac shortcut uses Command.",
                        symbol: "command"
                    )
                    noteRow(
                        title: "Use .defaultAction / .cancelAction on form buttons.",
                        detail: "The system uses these to identify the default and cancel buttons in a dialog or sheet \u{2014} they wire Return / Escape and also influence button style (the default button highlights).",
                        symbol: "checkmark.circle"
                    )
                    noteRow(
                        title: "Hashable + Sendable.",
                        detail: "Safe to compare, store in sets, and capture across actor boundaries. Useful when modeling a centralized shortcut table that drives multiple commands.",
                        symbol: "checkmark.seal"
                    )
                }
            }
        }
    }

    // MARK: onKeyPress(_:action:) — single key

    private var onKeyPressSingleSection: some View {
        PageSection("onKeyPress(_:action:) \u{2014} single key", subtitle: "View/onKeyPress(_:action:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".onKeyPress(.space) { return .handled }")
                    Text("Match a single named key. Closure returns .handled (consumes the event) or .ignored (passes it up the view tree). Fires only when the view has keyboard focus.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Focus me, then press Space or Return", text: $fieldText)
                            .textFieldStyle(.roundedBorder)
                            .focused($defaultFocus)
                            .onKeyPress(.space) {
                                keyLog.append("SPACE pressed")
                                return .handled
                            }
                            .onKeyPress(.return) {
                                keyLog.append("RETURN pressed")
                                return .handled
                            }
                        HStack(spacing: 12) {
                            Button("Focus field") { defaultFocus = true }
                            Button("Clear log") { keyLog.removeAll() }
                                .disabled(keyLog.isEmpty)
                        }
                        if !keyLog.isEmpty {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(keyLog.suffix(4), id: \.self) { entry in
                                    Text(entry)
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".handled vs .ignored")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.onKeyPress(.tab) {
    moveFocus()
    return .handled    // stop propagation
}
.onKeyPress(.tab) {
    return .ignored    // bubble up
}
"""
                    )
                    Text(".handled stops the event reaching outer onKeyPress handlers and the system. .ignored lets it propagate \u{2014} useful when partially handling a key.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Focus requirement")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
SomeView()
    .focusable()         // non-focusable views need this
    .onKeyPress(.escape) { dismiss(); return .handled }
"""
                    )
                    Text("onKeyPress only fires when the view (or a descendant) has keyboard focus. Decorative views need .focusable() before they can receive key events.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Stack handlers \u{2014} they don't override.",
                        detail: "Multiple .onKeyPress calls compose. Each handler sees the event in modifier order; the first to return .handled stops propagation.",
                        symbol: "square.stack"
                    )
                    noteRow(
                        title: "macOS 14.0+ / iPadOS 17.0+.",
                        detail: "Not available on watchOS or tvOS. Pre-macOS 14 used onMoveCommand / onExitCommand for the limited cases SwiftUI surfaced.",
                        symbol: "calendar.badge.clock"
                    )
                }
            }
        }
    }

    // MARK: onKeyPress(phases:action:) — track phases

    private var onKeyPressPhasesSection: some View {
        PageSection("onKeyPress(phases:action:) \u{2014} track phases", subtitle: "View/onKeyPress(phases:action:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.onKeyPress(phases: [.down, .up]) { press in
    switch press.phase {
    case .down: \u{2026}
    case .up:   \u{2026}
    default: break
    }
    return .handled
}
"""
                    )
                    Text("Opt into specific phases of the press cycle. Default is .down only \u{2014} pass [.down, .repeat, .up] or .all to observe more.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Focus me, then hold any key", text: $fieldText)
                            .textFieldStyle(.roundedBorder)
                            .focused($phasesFocus)
                            .onKeyPress(phases: [.down, .repeat, .up]) { press in
                                phaseLog.append("\(press.key.character) \u{2014} \(phaseLabel(press.phase))")
                                return .ignored
                            }
                        HStack(spacing: 12) {
                            Button("Focus field") { phasesFocus = true }
                            Button("Clear log") { phaseLog.removeAll() }
                                .disabled(phaseLog.isEmpty)
                        }
                        if !phaseLog.isEmpty {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(phaseLog.suffix(6), id: \.self) { entry in
                                    Text(entry)
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Phase values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".onKeyPress(phases: .down) { \u{2026} }      // default")
                    APICallout(".onKeyPress(phases: .repeat) { \u{2026} }    // auto-repeat only")
                    APICallout(".onKeyPress(phases: .up) { \u{2026} }        // release only")
                    APICallout(".onKeyPress(phases: .all) { \u{2026} }       // every phase")
                    Text("KeyPress.Phases is an OptionSet \u{2014} combine with array literal syntax. .all is the convenience for the full set.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Switch on press.phase inside the closure")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
switch press.phase {
case .down:   isHeld = true
case .repeat: ()                  // ignore auto-repeat
case .up:     isHeld = false
default:      break
}
"""
                    )
                    Text("Even when you opt into all three phases the closure receives one phase per call. Common pattern: track a boolean from .down / .up while ignoring .repeat.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Default phase is .down.",
                        detail: "Omitting the phases parameter is equivalent to .onKeyPress(phases: .down). Tap-style behavior fires once per press.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: "Returning .ignored on .repeat lets the system handle auto-repeat.",
                        detail: "Useful when you want the .down event but don't want to consume the auto-repeat stream \u{2014} return .handled on .down, .ignored on .repeat.",
                        symbol: "arrow.clockwise"
                    )
                }
            }
        }
    }

    // MARK: onKeyPress(_:phases:action:) — named key + phases

    private var onKeyPressNamedPhasesSection: some View {
        PageSection("onKeyPress(_:phases:action:) \u{2014} named key with phases", subtitle: "View/onKeyPress(_:phases:action:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.onKeyPress(.upArrow, phases: [.down, .repeat]) { press in
    moveSelection(up: true)
    return .handled
}
"""
                    )
                    Text("Combine a single named key with phase tracking. Closure runs only for matching key + phase combinations.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Focus me, then arrow up/down", text: $fieldText)
                            .textFieldStyle(.roundedBorder)
                            .focused($namedKeyFocus)
                            .onKeyPress(.upArrow, phases: [.down, .repeat]) { press in
                                arrowLog.append("UP \u{2014} \(phaseLabel(press.phase))")
                                return .handled
                            }
                            .onKeyPress(.downArrow, phases: [.down, .repeat]) { press in
                                arrowLog.append("DOWN \u{2014} \(phaseLabel(press.phase))")
                                return .handled
                            }
                        HStack(spacing: 12) {
                            Button("Focus field") { namedKeyFocus = true }
                            Button("Clear log") { arrowLog.removeAll() }
                                .disabled(arrowLog.isEmpty)
                        }
                        if !arrowLog.isEmpty {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(arrowLog.suffix(6), id: \.self) { entry in
                                    Text(entry)
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use for hold-to-repeat behaviors.",
                        detail: "[.down, .repeat] is the canonical combination for navigation keys that should respond once on press and continue while held. Auto-repeat cadence is the system's choice.",
                        symbol: "arrow.up.and.down"
                    )
                    noteRow(
                        title: "Layout-independent matching.",
                        detail: "Arrow keys, Return, Escape, etc. resolve correctly across keyboard layouts because KeyEquivalent constants are layout-stable.",
                        symbol: "globe"
                    )
                }
            }
        }
    }

    // MARK: onKeyPress(characters:phases:action:)

    private var onKeyPressCharactersSection: some View {
        PageSection("onKeyPress(characters:phases:action:) \u{2014} character set", subtitle: "View/onKeyPress(characters:phases:action:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.onKeyPress(characters: .alphanumerics, phases: .down) { press in
    handleChar(press.characters)
    return .handled
}
"""
                    )
                    Text("Match any key whose produced characters fall inside a CharacterSet. Useful for layout-aware text-driven matching when the visible character is what matters (typing-to-find, custom hotkeys).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Focus me, then type any letter or digit", text: $fieldText)
                            .textFieldStyle(.roundedBorder)
                            .focused($charactersFocus)
                            .onKeyPress(characters: .alphanumerics, phases: .down) { press in
                                charLog.append("alphanumeric: \"\(press.characters)\"")
                                return .ignored
                            }
                        HStack(spacing: 12) {
                            Button("Focus field") { charactersFocus = true }
                            Button("Clear log") { charLog.removeAll() }
                                .disabled(charLog.isEmpty)
                        }
                        if !charLog.isEmpty {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(charLog.suffix(6), id: \.self) { entry in
                                    Text(entry)
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Common CharacterSet values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".onKeyPress(characters: .alphanumerics, phases: .down) { \u{2026} }")
                    APICallout(".onKeyPress(characters: .decimalDigits, phases: .down) { \u{2026} }")
                    APICallout(".onKeyPress(characters: .letters, phases: .down) { \u{2026} }")
                    APICallout(".onKeyPress(characters: .punctuationCharacters, phases: .down) { \u{2026} }")
                    APICallout(".onKeyPress(characters: CharacterSet(charactersIn: \"abcXYZ\"), phases: .down) { \u{2026} }")
                    Text("Pass any Foundation CharacterSet \u{2014} including custom subsets via the Character-array initializer. Empty match-set silently never fires.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Characters are layout-dependent.",
                        detail: "On AZERTY the top-row key produces \u{201c}q\u{201d}; the same key matches CharacterSet.letters but won't equal \"a\". Use this overload when the typed character matters; use the keys: overload when the physical key matters.",
                        symbol: "globe"
                    )
                    noteRow(
                        title: "Pair with a TextField filter for type-ahead.",
                        detail: "Typing-to-find UI listens for alphanumerics on the focused list view, advances selection, then forwards modifier-bearing presses with .ignored.",
                        symbol: "magnifyingglass"
                    )
                }
            }
        }
    }

    // MARK: onKeyPress(keys:phases:action:)

    private var onKeyPressKeysSection: some View {
        PageSection("onKeyPress(keys:phases:action:) \u{2014} key set", subtitle: "View/onKeyPress(keys:phases:action:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.onKeyPress(keys: [.upArrow, .downArrow,
                   .leftArrow, .rightArrow]) { press in
    move(press.key)
    return .handled
}
"""
                    )
                    Text("Match a Set<KeyEquivalent>. One handler covers any number of discrete named keys \u{2014} concise alternative to chaining individual onKeyPress calls.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Focus me, then arrow keys", text: $fieldText)
                            .textFieldStyle(.roundedBorder)
                            .focused($keysFocus)
                            .onKeyPress(keys: [.upArrow, .downArrow, .leftArrow, .rightArrow]) { press in
                                keysetLog.append("arrow \(press.key.character)")
                                return .handled
                            }
                        HStack(spacing: 12) {
                            Button("Focus field") { keysFocus = true }
                            Button("Clear log") { keysetLog.removeAll() }
                                .disabled(keysetLog.isEmpty)
                        }
                        if !keysetLog.isEmpty {
                            VStack(alignment: .leading, spacing: 2) {
                                ForEach(keysetLog.suffix(6), id: \.self) { entry in
                                    Text(entry)
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Inspect press.key inside the closure")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.onKeyPress(keys: [.return, .escape]) { press in
    if press.key == .return { commit() }
    if press.key == .escape { cancel() }
    return .handled
}
"""
                    )
                    Text("press.key tells you which key in the set matched. Compare against the same KeyEquivalent constants you passed into the set.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Set<KeyEquivalent> avoids closure duplication.",
                        detail: "If two or three keys share handler logic, this overload is shorter than three .onKeyPress(_:action:) chains.",
                        symbol: "square.stack.3d.up"
                    )
                    noteRow(
                        title: "For arrow navigation prefer onMoveCommand when possible.",
                        detail: "onMoveCommand(perform:) covers the four arrow keys and the equivalent gesture/keyboard inputs across platforms. Reach for onKeyPress(keys:) when you need finer-grained control.",
                        symbol: "arrow.up.arrow.down"
                    )
                }
            }
        }
    }

    // MARK: keyboardShortcut(_:) — shortcut value

    private var keyboardShortcutValueSection: some View {
        PageSection("keyboardShortcut(_:) \u{2014} shortcut value", subtitle: "View/keyboardShortcut(_:) \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
let newWindow = KeyboardShortcut(\"n\",
    modifiers: [.command, .shift])
Button(\"New Window\") { open() }
    .keyboardShortcut(newWindow)
"""
                    )
                    Text("Pass a KeyboardShortcut value directly. Useful when the shortcut is stored, computed, or reused across multiple call sites.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    HStack(spacing: 12) {
                        Button("Refresh (\u{2318}R)") { lastShortcut = "Refresh" }
                            .keyboardShortcut(KeyboardShortcut("r", modifiers: .command))
                        Button("OK (\u{21a9})") { lastShortcut = "OK (defaultAction)" }
                            .keyboardShortcut(.defaultAction)
                        Button("Cancel (\u{238b})") { lastShortcut = "Cancel (cancelAction)" }
                            .keyboardShortcut(.cancelAction)
                    }
                    Text("Last shortcut fired: \(lastShortcut)")
                        .font(.callout)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Static constants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".keyboardShortcut(.defaultAction)   // Return / Enter")
                    APICallout(".keyboardShortcut(.cancelAction)    // Escape")
                    Text(".defaultAction also marks the button as the form's default \u{2014} the system applies a prominent style and handles Return for you.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Decouples shortcut definition from call site.",
                        detail: "Store shortcuts in a single source of truth (a static let, an enum) and pass the value to every place that fires them \u{2014} buttons, menu commands, help overlays.",
                        symbol: "list.bullet.rectangle"
                    )
                    noteRow(
                        title: "Window-scoped firing.",
                        detail: "Shortcuts fire whenever the window is key, regardless of which view holds focus. Unlike onKeyPress, no .focusable() requirement.",
                        symbol: "macwindow"
                    )
                }
            }
        }
    }

    // MARK: keyboardShortcut(_:modifiers:) — key + modifiers

    private var keyboardShortcutKeyModifiersSection: some View {
        PageSection("keyboardShortcut(_:modifiers:) \u{2014} key and modifiers", subtitle: "View/keyboardShortcut(_:modifiers:) \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(".keyboardShortcut(\"s\", modifiers: .command)")
                    Text("Inline-build the KeyboardShortcut at the call site. KeyEquivalent + EventModifiers \u{2014} the most common form.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    HStack(spacing: 12) {
                        Button("Save (\u{2318}S)") { lastShortcut = "Save" }
                            .keyboardShortcut("s", modifiers: .command)
                        Button("Find (\u{2318}F)") { lastShortcut = "Find" }
                            .keyboardShortcut("f", modifiers: .command)
                        Button("Quit (\u{2318}Q)") { lastShortcut = "Quit" }
                            .keyboardShortcut("q", modifiers: .command)
                    }
                    Text("Last shortcut fired: \(lastShortcut)")
                        .font(.callout)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Single modifier")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".keyboardShortcut(\"r\", modifiers: .command)         // \u{2318}R")
                    APICallout(".keyboardShortcut(.return, modifiers: .control)     // \u{2303}\u{21a9}")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Multiple modifiers combined")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".keyboardShortcut(\"e\", modifiers: [.command, .shift])  // \u{2318}\u{21e7}E")
                    APICallout(".keyboardShortcut(\"n\", modifiers: [.command, .option]) // \u{2318}\u{2325}N")
                    Text("EventModifiers is an OptionSet \u{2014} array literal syntax combines flags. Order doesn't matter.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Window-scoped firing \u{2014} no focus required")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
Button(\"Export\") { export() }
    .keyboardShortcut(\"e\",
        modifiers: [.command, .shift])
"""
                    )
                    Text("Press \u{2318}\u{21e7}E while the window is key \u{2014} the handler fires whether the button has focus or not. Disabled buttons disable their shortcuts.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled shortcut")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
Button(\"Disabled\") { \u{2026} }
    .keyboardShortcut(\"d\", modifiers: .command)
    .disabled(true)
"""
                    )
                    Text("Disabling the button disables its keyboard shortcut. There's no separate API to disable only the shortcut.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Default modifier is .command.",
                        detail: ".keyboardShortcut(\"s\") and .keyboardShortcut(\"s\", modifiers: .command) are equivalent. Most macOS shortcuts are command-prefixed.",
                        symbol: "command"
                    )
                    noteRow(
                        title: "Avoid overriding system shortcuts.",
                        detail: "\u{2318}C, \u{2318}V, \u{2318}Z, \u{2318}Q, \u{2318}W, \u{2318}H \u{2026} taking these over breaks user expectations app-wide. Reach for app-specific letters and combinations instead.",
                        symbol: "exclamationmark.triangle"
                    )
                    noteRow(
                        title: "Disabled = inert shortcut.",
                        detail: "When the button is disabled the shortcut is inert. To swap shortcut behavior between modes, swap the Button \u{2014} don't try to disable just the shortcut.",
                        symbol: "nosign"
                    )
                }
            }
        }
    }

    // MARK: keyboardShortcut(_:modifiers:localization:)

    private var keyboardShortcutLocalizationSection: some View {
        PageSection("keyboardShortcut(_:modifiers:localization:) \u{2014} with layout support", subtitle: "View/keyboardShortcut(_:modifiers:localization:) \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.keyboardShortcut(\"q\", modifiers: .command,
                  localization: .automatic)
"""
                    )
                    Text("Adds a localization parameter that controls how the shortcut adapts to non-US keyboard layouts (AZERTY, QWERTZ, JIS, etc.).")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Localization values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "Default \u{2014} the system remaps the shortcut for the active layout. Recommended for almost every shortcut.")
                    referenceRow(".withoutMirroring", "Keeps the shortcut on the same physical key position; doesn't mirror for right-to-left layouts.")
                    referenceRow(".custom", "Use the key verbatim; opt out of all layout-dependent remapping.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("enum KeyboardShortcut.Localization")
                    APICallout("case automatic")
                    APICallout("case withoutMirroring")
                    APICallout("case custom")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("AZERTY / QWERTZ / JIS layout remapping")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
Button(\"Save\") { save() }
    .keyboardShortcut(\"s\", modifiers: .command,
                      localization: .automatic)
"""
                    )
                    Text("With .automatic, the system finds the equivalent key on AZERTY / QWERTZ / JIS keyboards so \u{2318}S still maps to the canonical Save key, even if it's in a different physical position than QWERTY.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".automatic is almost always right.",
                        detail: "It tracks Apple's layout remapping intelligence. Reach for .withoutMirroring or .custom only when you have a specific reason to defeat localization (e.g. the shortcut is keyed off a positional reference).",
                        symbol: "globe"
                    )
                    noteRow(
                        title: ".withoutMirroring vs .custom.",
                        detail: ".withoutMirroring still remaps for layouts but doesn't flip for RTL languages. .custom disables both \u{2014} the shortcut hits the literal character on every keyboard.",
                        symbol: "arrow.left.arrow.right"
                    )
                    noteRow(
                        title: "macOS 12.0+ overload.",
                        detail: "The two-argument keyboardShortcut(_:modifiers:) is older (macOS 11.0). The localization-aware overload ships with macOS 12.0.",
                        symbol: "calendar.badge.clock"
                    )
                }
            }
        }
    }

    // MARK: onModifierKeysChanged(mask:initial:_:)

    private var onModifierKeysChangedSection: some View {
        PageSection("onModifierKeysChanged(mask:initial:_:)", subtitle: "View/onModifierKeysChanged(mask:initial:_:) \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
.onModifierKeysChanged(mask: .all, initial: true) { old, new in
    // old: previous EventModifiers
    // new: current EventModifiers
}
"""
                    )
                    Text("Performs an action whenever the user presses or releases a hardware modifier key. Independent of any key press \u{2014} fires on Command / Shift / Option / Control state changes alone.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Currently held: \(modifierLabel(modifiersHeld))")
                            .font(.title3)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                        Text("Hover this view and press / release any modifier (\u{2318}, \u{21e7}, \u{2325}, \u{2303}). The label updates without a key press.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    .onModifierKeysChanged(mask: .all, initial: true) { _, new in
                        modifiersHeld = new
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("mask parameter")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".onModifierKeysChanged(mask: .option) { old, new in \u{2026} }")
                    Text("Restricts updates to changes that involve a key in the mask. Default is .all (every modifier change fires). Pass .option to fire only when the Option key state changes.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("initial parameter")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".onModifierKeysChanged(mask: .all, initial: true) { _, new in \u{2026} }")
                    Text("When initial is true (default), SwiftUI checks modifier state when the view first appears and fires the closure if any masked key is already held. Pass false to skip the initial sample.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Real-time modifier tracking")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.onModifierKeysChanged(mask: .option) { old, new in
    if new.isEmpty {
        // Option released
    } else {
        // Option pressed
    }
}
"""
                    )
                    Text("Old / new EventModifiers values let you compute the delta. Use it to drive UI state \u{2014} swap a button label, reveal a hint, or pair with .modifierKeyAlternate.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Independent of key presses.",
                        detail: "onKeyPress fires on key transitions; onModifierKeysChanged fires on modifier-key transitions only. Use this when the modifier is the event \u{2014} not when a letter key was also pressed.",
                        symbol: "command"
                    )
                    noteRow(
                        title: "Combined keyboard inputs.",
                        detail: "When multiple keyboards are attached, the emitted state is the union across all of them \u{2014} press Option on either keyboard and new contains .option.",
                        symbol: "keyboard.badge.ellipsis"
                    )
                    noteRow(
                        title: "Pairs naturally with modifierKeyAlternate.",
                        detail: "Use onModifierKeysChanged to drive arbitrary UI state on modifier press; modifierKeyAlternate is the focused, button-only sibling.",
                        symbol: "switch.2"
                    )
                }
            }
        }
    }

    // MARK: modifierKeyAlternate(_:_:)

    private var modifierKeyAlternateSection: some View {
        PageSection("modifierKeyAlternate(_:_:)", subtitle: "View/modifierKeyAlternate(_:_:) \u{00b7} macOS 15.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    APICallout(
"""
Button(\"Open\") { open() }
    .modifierKeyAlternate(.option) {
        Button(\"Open In\u{2026}\") { openInPlace() }
    }
"""
                    )
                    Text("Presents an alternate button label and action while the user is holding a modifier key. The system swaps the visible button when the modifier is held; releases it when the modifier is released.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    VStack(alignment: .leading, spacing: 10) {
                        Button("Open") { lastShortcut = "Open" }
                            .modifierKeyAlternate(.option) {
                                Button("Open In\u{2026}") { lastShortcut = "Open In\u{2026}" }
                            }
                        Text("Hold \u{2325} (Option) to swap the button to \u{201c}Open In\u{2026}\u{201d}.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("Last action: \(lastShortcut)")
                            .font(.callout)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Dynamic content based on modifier state")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
Button(\"Save\") { save() }
    .modifierKeyAlternate(.option) {
        Button(\"Save As\u{2026}\") { saveAs() }
    }
    .modifierKeyAlternate(.shift) {
        Button(\"Save All\") { saveAll() }
    }
"""
                    )
                    Text("Stack modifierKeyAlternate calls with different EventModifiers \u{2014} each modifier reveals its own alternate. The visible button reflects whichever modifier is held at the moment.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Alternate has its own action.",
                        detail: "The alternate Button is a fully independent SwiftUI Button \u{2014} different label, different action closure. Same shortcut still fires the visible variant.",
                        symbol: "rectangle.2.swap"
                    )
                    noteRow(
                        title: "Pairs with onModifierKeysChanged.",
                        detail: "Use modifierKeyAlternate for the localized button swap; onModifierKeysChanged for any other UI state that needs to track the modifier (status text, cursor changes).",
                        symbol: "switch.2"
                    )
                    noteRow(
                        title: "macOS 15.0+ only.",
                        detail: "Pre-macOS 15 used to require manually wrapping a button in a stateful Modifier-tracking view; this overload removes the boilerplate.",
                        symbol: "calendar.badge.clock"
                    )
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on keyboard input, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Don't override system shortcuts.",
                    detail: "\u{2318}C, \u{2318}V, \u{2318}Z, \u{2318}Q, \u{2318}W, \u{2318}H, \u{2318}A \u{2014} reserved by the system or universally expected. Overriding any of them breaks the muscle memory of every Mac user.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "Use .automatic localization.",
                    detail: "AZERTY, QWERTZ, JIS keyboards rearrange the QWERTY positions. .automatic ensures \u{2318}S still hits the canonical Save key on every layout. .custom should be the rare exception.",
                    symbol: "globe"
                )
                noteRow(
                    title: "onKeyPress is focused; keyboardShortcut is global.",
                    detail: "onKeyPress requires the receiving view to have keyboard focus. keyboardShortcut fires whenever the window is key, regardless of focus. Pick by intent: per-control raw input vs. window-scoped command.",
                    symbol: "scope"
                )
                noteRow(
                    title: "Respect Return / Escape for form buttons.",
                    detail: "Use KeyboardShortcut.defaultAction (Return) on the OK / Save / Confirm button; KeyboardShortcut.cancelAction (Escape) on the Cancel button. Don't reassign these elsewhere in the form.",
                    symbol: "checkmark.circle"
                )
                noteRow(
                    title: "Prefer onKeyPress(characters:phases:) for typing-driven hotkeys.",
                    detail: "Type-to-find UI listens for alphanumerics on the focused list; modifier-bearing presses bubble back up via .ignored. CharacterSet matching is layout-aware in the way the user expects.",
                    symbol: "magnifyingglass"
                )
                noteRow(
                    title: "Match on .key for layout independence; .characters when the typed glyph matters.",
                    detail: "press.key (KeyEquivalent) is constant across keyboard layouts. press.characters is what the user actually typed. Use the one that matches the user's mental model of the shortcut.",
                    symbol: "globe"
                )
                noteRow(
                    title: "Stay disciplined about returning .handled.",
                    detail: "Return .handled only for the cases you actually own. Returning .handled blanket-style breaks bubble-up handlers, system shortcuts, and accessibility key navigation.",
                    symbol: "checkmark.shield"
                )
                noteRow(
                    title: "Disabled buttons disable their shortcuts.",
                    detail: "There's no separate API to disable just the shortcut. To remove a shortcut conditionally, swap the button \u{2014} don't try to keep the button alive while disabling its shortcut.",
                    symbol: "nosign"
                )
            }
        }
    }

    // MARK: Helpers

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 170, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }

    private func phaseLabel(_ phase: KeyPress.Phases) -> String {
        var parts: [String] = []
        if phase.contains(.down) { parts.append(".down") }
        if phase.contains(.repeat) { parts.append(".repeat") }
        if phase.contains(.up) { parts.append(".up") }
        return parts.isEmpty ? "(none)" : parts.joined(separator: "+")
    }

    private func modifierLabel(_ mods: EventModifiers) -> String {
        var parts: [String] = []
        if mods.contains(.command) { parts.append("\u{2318}") }
        if mods.contains(.shift) { parts.append("\u{21e7}") }
        if mods.contains(.option) { parts.append("\u{2325}") }
        if mods.contains(.control) { parts.append("\u{2303}") }
        if mods.contains(.capsLock) { parts.append("\u{21ea}") }
        if mods.contains(.function) { parts.append("Fn") }
        if mods.contains(.numericPad) { parts.append("NumPad") }
        return parts.isEmpty ? "(none)" : parts.joined(separator: " ")
    }
}

extension KeyboardInputGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.keyboardInput",
        title: "KeyboardInput",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "KeyboardInput",
            "View/onKeyPress(_:action:)",
            "View/onKeyPress(phases:action:)",
            "View/onKeyPress(_:phases:action:)",
            "View/onKeyPress(characters:phases:action:)",
            "View/onKeyPress(keys:phases:action:)",
            "View/keyboardShortcut(_:)",
            "View/keyboardShortcut(_:modifiers:)",
            "View/keyboardShortcut(_:modifiers:localization:)",
            "View/onModifierKeysChanged(mask:initial:_:)",
            "View/modifierKeyAlternate(_:_:)",
            "KeyEquivalent",
            "EventModifiers",
            "KeyPress",
            "KeyboardShortcut"
        ],
        blurb: "Hardware keyboard input — onKeyPress for focused key handling, keyboardShortcut for window-scoped commands, and the supporting types KeyEquivalent, EventModifiers, KeyPress, and KeyboardShortcut.",
        signature: "func onKeyPress(_ key: KeyEquivalent, action: @escaping () -> KeyPress.Result) -> some View",
        availability: "macOS 11.0+ (onKeyPress: macOS 14.0+; onModifierKeysChanged / modifierKeyAlternate: macOS 15.0+)",
        docPath: "Documentation/SwiftUI/input-events/onkeypress(_:action:).md",
        page: { AnyView(KeyboardInputGalleryPage()) }
    )
}

#Preview {
    KeyboardInputGalleryPage()
        .frame(width: 1100, height: 1100)
}
