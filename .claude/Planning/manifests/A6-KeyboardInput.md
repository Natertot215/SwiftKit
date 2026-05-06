# A6 — KeyboardInputPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/InputEvents/KeyboardInputPage.swift (new)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.input-events` subsection, lines 1240–1253
**Status:** implementing

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | KeyEquivalent | (in KeyboardShortcutPage) | struct KeyEquivalent | Documentation/SwiftUI/input-events/keyequivalent.md | gallery | "Reference — KeyEquivalent" |
| 2 | EventModifiers | (in KeyboardShortcutPage) | struct EventModifiers | Documentation/SwiftUI/input-events/eventmodifiers.md | gallery | "Reference — EventModifiers" |
| 3 | KeyPress | (in KeyPressPage) | struct KeyPress | Documentation/SwiftUI/input-events/keypress.md | gallery | "Reference — KeyPress" |
| 4 | KeyboardShortcut | (in KeyboardShortcutPage) | struct KeyboardShortcut | Documentation/SwiftUI/input-events/keyboardshortcut.md | gallery | "Reference — KeyboardShortcut" |
| 5 | View/onKeyPress(_:action:) | Pages/SwiftUI/InputEvents/KeyPressPage.swift (variant) | View/onKeyPress(_:action:) | Documentation/SwiftUI/input-events/onkeypress(_:action:).md | gallery | "onKeyPress(_:action:) — single key" |
| 6 | View/onKeyPress(phases:action:) | Pages/SwiftUI/InputEvents/KeyPressPage.swift (variant) | View/onKeyPress(phases:action:) | Documentation/SwiftUI/input-events/onkeypress(phases:action:).md | gallery | "onKeyPress(phases:action:) — track phases" |
| 7 | View/onKeyPress(_:phases:action:) | Pages/SwiftUI/InputEvents/KeyPressPage.swift (variant) | View/onKeyPress(_:phases:action:) | Documentation/SwiftUI/input-events/onkeypress(_:phases:action:).md | gallery | "onKeyPress(_:phases:action:) — named key with phases" |
| 8 | View/onKeyPress(characters:phases:action:) | Pages/SwiftUI/InputEvents/KeyPressPage.swift (variant) | View/onKeyPress(characters:phases:action:) | Documentation/SwiftUI/input-events/onkeypress(characters:phases:action:).md | gallery | "onKeyPress(characters:phases:action:) — character set" |
| 9 | View/onKeyPress(keys:phases:action:) | Pages/SwiftUI/InputEvents/KeyPressPage.swift (variant) | View/onKeyPress(keys:phases:action:) | Documentation/SwiftUI/input-events/onkeypress(keys:phases:action:).md | gallery | "onKeyPress(keys:phases:action:) — key set" |
| 10 | View/keyboardShortcut(_:) | Pages/SwiftUI/InputEvents/KeyboardShortcutPage.swift (variant) | View/keyboardShortcut(_:) | Documentation/SwiftUI/input-events/keyboardshortcut(_:).md | gallery | "keyboardShortcut(_:) — shortcut value" |
| 11 | View/keyboardShortcut(_:modifiers:) | Pages/SwiftUI/InputEvents/KeyboardShortcutPage.swift (variant) | View/keyboardShortcut(_:modifiers:) | Documentation/SwiftUI/input-events/keyboardshortcut(_:modifiers:).md | gallery | "keyboardShortcut(_:modifiers:) — key and modifiers" |
| 12 | View/keyboardShortcut(_:modifiers:localization:) | Pages/SwiftUI/InputEvents/KeyboardShortcutPage.swift (variant) | View/keyboardShortcut(_:modifiers:localization:) | Documentation/SwiftUI/input-events/keyboardshortcut(_:modifiers:localization:).md | gallery | "keyboardShortcut(_:modifiers:localization:) — with layout support" |
| 13 | View/onModifierKeysChanged(mask:initial:_:) | (describe-only) | View/onModifierKeysChanged(mask:initial:_:) | Documentation/SwiftUI/input-events/onmodifierkeyschanged(mask:initial:_:).md | gallery | "onModifierKeysChanged(mask:initial:_:)" |
| 14 | View/modifierKeyAlternate(_:_:) | (in KeyboardShortcutPage variant) | View/modifierKeyAlternate(_:_:) | Documentation/SwiftUI/input-events/modifierkeyalternate(_:_:).md | gallery | "modifierKeyAlternate(_:_:)" |

## Per-leaf coverage checklist

### Leaf 1: KeyEquivalent
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — static constants like .return, .escape, .space; character init)
- [x] States demos transferred (count expected: 1 — usage in onKeyPress and keyboardShortcut)
- [x] Notes paragraphs preserved
- [x] Source page content absorbed into Reference
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — KeyEquivalent"

### Leaf 2: EventModifiers
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — individual flags (.command, .shift, .option, .control, .capsLock, .numericPad, .function), combined flags)
- [x] States demos transferred (count expected: 1 — querying from KeyPress.modifiers)
- [x] Notes paragraphs preserved
- [x] Source page content absorbed into Reference
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — EventModifiers"

### Leaf 3: KeyPress
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — property accessors: key, phase, characters, modifiers)
- [x] States demos transferred (count expected: 1 — usage in onKeyPress handler)
- [x] Notes paragraphs preserved
- [x] Source page content absorbed into Reference
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — KeyPress"

### Leaf 4: KeyboardShortcut
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — init with key and modifiers; static .defaultAction and .cancelAction constants)
- [x] States demos transferred (count expected: 1 — applied to Button via .keyboardShortcut modifier)
- [x] Notes paragraphs preserved
- [x] Source page content absorbed into Reference
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — KeyboardShortcut"

### Leaf 5: View/onKeyPress(_:action:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — match a single key, return .handled/.ignored)
- [x] States demos transferred (count expected: 1 — focus requirement)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyPressPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "onKeyPress(_:action:) — single key"

### Leaf 6: View/onKeyPress(phases:action:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — .down, .repeat, .up phases)
- [x] States demos transferred (count expected: 1 — phase handling in closure)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyPressPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "onKeyPress(phases:action:) — track phases"

### Leaf 7: View/onKeyPress(_:phases:action:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — named key with phase tracking)
- [x] States demos transferred (count expected: 1 — phase and key handling)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyPressPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "onKeyPress(_:phases:action:) — named key with phases"

### Leaf 8: View/onKeyPress(characters:phases:action:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — character set matching)
- [x] States demos transferred (count expected: 1 — alphanumerics, punctuation handling)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyPressPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "onKeyPress(characters:phases:action:) — character set"

### Leaf 9: View/onKeyPress(keys:phases:action:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — arrow key set matching)
- [x] States demos transferred (count expected: 1 — multiple key matching)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyPressPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "onKeyPress(keys:phases:action:) — key set"

### Leaf 10: View/keyboardShortcut(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — KeyboardShortcut value passed directly)
- [x] States demos transferred (count expected: 1 — computed/stored shortcut)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyboardShortcutPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "keyboardShortcut(_:) — shortcut value"

### Leaf 11: View/keyboardShortcut(_:modifiers:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — single modifier, multiple modifiers combined)
- [x] States demos transferred (count expected: 1 — window-scoped shortcut firing)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyboardShortcutPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "keyboardShortcut(_:modifiers:) — key and modifiers"

### Leaf 12: View/keyboardShortcut(_:modifiers:localization:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — .automatic, .withoutMirroring, .custom localization)
- [x] States demos transferred (count expected: 1 — keyboard layout remapping)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyboardShortcutPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "keyboardShortcut(_:modifiers:localization:) — with layout support"

### Leaf 13: View/onModifierKeysChanged(mask:initial:_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — detect modifier key state changes)
- [x] States demos transferred (count expected: 1 — real-time modifier tracking)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "onModifierKeysChanged(mask:initial:_:)"

### Leaf 14: View/modifierKeyAlternate(_:_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — alternate button label/action on modifier hold)
- [x] States demos transferred (count expected: 1 — dynamic button content based on modifier state)
- [x] Notes paragraphs preserved
- [x] Source page deleted from filesystem (consolidate with KeyboardShortcutPage variant)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "modifierKeyAlternate(_:_:)"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense KeyboardInputPage, with one-line description of contents.

1. **Header** — Title, summary ("Raw keyboard events and shortcuts — onKeyPress, keyboardShortcut, modifier tracking, and keyboard input types"), availability (macOS 10.15–15.0+), primary apiSignatures
2. **Reference — KeyEquivalent** — Struct definition, static constants (.return, .escape, .space, .tab, arrows, etc.), character-based init, Equatable conformance, usage notes
3. **Reference — EventModifiers** — OptionSet flags (.command, .shift, .option, .control, .capsLock, .numericPad, .function), .all constant, combined modifier examples, querying from KeyPress
4. **Reference — KeyPress** — Struct properties (key: KeyEquivalent, phase: KeyPress.Phase, characters: String, modifiers: EventModifiers), phases enum (.down, .repeat, .up), usage in onKeyPress handlers
5. **Reference — KeyboardShortcut** — Struct init(Key, modifiers:, localization:), static .defaultAction and .cancelAction, conformances (Hashable, Sendable), scoping and priority notes
6. **onKeyPress(_:action:) — single key** — Single-key match, .handled vs .ignored return, focus requirement, default demo with TextField
7. **onKeyPress(phases:action:) — track phases** — Phase tracking (.down, .repeat, .up), conditional handlers per phase, escape-key capture example
8. **onKeyPress(_:phases:action:) — named key with phases** — Named key (KeyEquivalent) combined with phases, arrow key example
9. **onKeyPress(characters:phases:action:) — character set** — CharacterSet matching (.alphanumerics, .punctuation, custom), layout-independent hotkey handling
10. **onKeyPress(keys:phases:action:) — key set** — Set<KeyEquivalent> matching, multiple discrete keys in one handler, navigation-key example
11. **keyboardShortcut(_:) — shortcut value** — KeyboardShortcut value passed directly, computed/stored shortcuts, priority and scope
12. **keyboardShortcut(_:modifiers:) — key and modifiers** — String key + EventModifiers combo, window-wide firing, standard shortcuts (⌘S, ⌘Q, etc.), disabled state
13. **keyboardShortcut(_:modifiers:localization:) — with layout support** — Localization modes (.automatic, .withoutMirroring, .custom), AZERTY/QWERTZ/JIS layout remapping, international keyboard guidance
14. **onModifierKeysChanged(mask:initial:_:)** — Real-time modifier-key tracking, mask parameter, initial state, independent of key press, modifierKeyAlternate companion use
15. **modifierKeyAlternate(_:_:)** — Alternate button label/action on modifier hold, dynamic button content, commonly paired with onModifierKeysChanged
16. **Notes from the HIG** — Consolidated guidance: avoid overriding system shortcuts, use .automatic localization, distinguish onKeyPress (focused, phase-aware) from keyboardShortcut (global, window-scoped), respect Return/Escape for form buttons, use KeyboardShortcut.defaultAction/.cancelAction for form semantics, prefer CharacterSet over raw onKeyPress for hotkeys

## Sign-off

- **Implementer:** Claude (Opus 4.7, 1M context) — 2026-05-05
- **Spec-compliance reviewer:** (to be completed)
- **Code-quality reviewer:** (to be completed)

---

## Manifest metadata

- **Manifest created:** 2026-05-05
- **Task ID:** A6
- **Parent type:** Keyboard input pipeline (consolidated)
- **Framework:** SwiftUI
- **Target location:** SwiftKit/Pages/SwiftUI/InputEvents/KeyboardInputPage.swift
- **Catalog subsection:** swiftui.input-events
- **Absorbed leaves count:** 14
- **Expected coverage boxes:** 140 (14 leaves × 10 boxes/leaf)
- **Catalog line range affected:** 1240–1253 (14 consolidated lines → 1 line retaining KeyboardInputPage)
- **PageRegistry range affected:** 1088, 1105–1111, 1120–1125
