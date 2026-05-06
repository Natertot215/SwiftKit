# B1 — ButtonPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/ControlsAndIndicators/ButtonPage.swift (rewrite in place)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 702 (Button) — absorbs lines 703–708 (ButtonBorderShape variants, ButtonRole, ButtonRepeatBehavior, ButtonSizing) and lines 436–443 (ButtonStyle, ButtonStyleConfiguration, GlassButtonStyle, GlassProminentButtonStyle, PrimitiveButtonStyle, PrimitiveButtonStyleConfiguration) plus lines 439 (View/buttonStyle(_:))
**Status:** reviewed

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | ButtonRole | ButtonTypesPage.swift | enum ButtonRole { case .destructive, .cancel } | Documentation/SwiftUI/controls-and-indicators/buttonrole.md | gallery | "ButtonRole reference" |
| 2 | ButtonBorderShape | ButtonTypesPage.swift | enum ButtonBorderShape { case .automatic, .roundedRectangle, .capsule, .circle } | Documentation/SwiftUI/controls-and-indicators/buttonbordershape.md | gallery | "ButtonBorderShape reference" |
| 3 | View/buttonBorderShape(_:) | ButtonTypesPage.swift | View/buttonBorderShape(_:) | Documentation/SwiftUI/controls-and-indicators/buttonbordershape(_:).md | gallery | "ButtonBorderShape variants" |
| 4 | ButtonRepeatBehavior | ButtonTypesPage.swift | enum ButtonRepeatBehavior { case .enabled, .disabled } | Documentation/SwiftUI/controls-and-indicators/buttonrepeatbehavior.md | gallery | "ButtonRepeatBehavior reference" |
| 5 | View/buttonRepeatBehavior(_:) | ButtonTypesPage.swift | View/buttonRepeatBehavior(_:) | Documentation/SwiftUI/controls-and-indicators/buttonrepeatbehavior(_:).md | gallery | "ButtonRepeatBehavior variants" |
| 6 | ButtonSizing | ButtonTypesPage.swift | typealias ButtonSizing (ControlSize) | Documentation/SwiftUI/controls-and-indicators/buttonsizing.md | gallery | "ButtonSizing via ControlSize" |
| 7 | ButtonStyle | ButtonStyleProtocolPage.swift | protocol ButtonStyle | Documentation/SwiftUI/view-styles/buttonstyle.md | describe | "Reference — ButtonStyle protocol" |
| 8 | ButtonStyleConfiguration | ButtonStyleConfigurationPage.swift | struct ButtonStyleConfiguration | Documentation/SwiftUI/view-styles/buttonstyleconfiguration.md | describe | "Reference — ButtonStyleConfiguration" |
| 9 | View/buttonStyle(_:) | ButtonStyleModifierPage.swift | View/buttonStyle(_:) | Documentation/SwiftUI/view-styles/buttonstyle(_:).md | gallery | "ButtonStyle gallery — built-in styles" |
| 10 | PrimitiveButtonStyle | PrimitiveButtonStyleProtocolPage.swift | protocol PrimitiveButtonStyle | Documentation/SwiftUI/view-styles/primitivebuttonstyle.md | describe | "Reference — PrimitiveButtonStyle protocol" |
| 11 | PrimitiveButtonStyleConfiguration | PrimitiveButtonStyleConfigurationPage.swift | struct PrimitiveButtonStyleConfiguration | Documentation/SwiftUI/view-styles/primitivebuttonstyleconfiguration.md | describe | "Reference — PrimitiveButtonStyleConfiguration" |
| 12 | GlassButtonStyle | GlassButtonStyleTypePage.swift | struct GlassButtonStyle : PrimitiveButtonStyle | Documentation/SwiftUI/view-styles/glassbuttonstyle.md | gallery | "ButtonStyle gallery — .glass" |
| 13 | GlassProminentButtonStyle | GlassProminentButtonStyleTypePage.swift | struct GlassProminentButtonStyle : PrimitiveButtonStyle | Documentation/SwiftUI/view-styles/glassprominentbuttonstyle.md | gallery | "ButtonStyle gallery — .glassProminent" |

## Per-leaf coverage checklist

### Leaf 1: ButtonRole
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .destructive, .cancel, nil default)
- [x] States demos transferred (count expected: 1 — usage in Alert context)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 706)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonRole reference"

### Leaf 2: ButtonBorderShape
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 4 — .automatic, .roundedRectangle, .capsule, .circle)
- [x] States demos transferred (count expected: 1 — visual constraints)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 705)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonBorderShape reference"

### Leaf 3: View/buttonBorderShape(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 4 — same as ButtonBorderShape values)
- [x] States demos transferred (count expected: 0 — modifier only)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 703)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonBorderShape variants"

### Leaf 4: ButtonRepeatBehavior
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — .enabled, .disabled)
- [x] States demos transferred (count expected: 1 — hold behavior demo)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 707)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonRepeatBehavior reference"

### Leaf 5: View/buttonRepeatBehavior(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — enabled/disabled variants)
- [x] States demos transferred (count expected: 0 — modifier only)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 704)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonRepeatBehavior variants"

### Leaf 6: ButtonSizing
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 5 — .mini, .small, .regular, .large, .extraLarge via ControlSize)
- [x] States demos transferred (count expected: 1 — sizing scale demo)
- [x] Notes paragraphs preserved (0 notes present — sizing handled in ControlSize)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 708)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonSizing via ControlSize"

### Leaf 7: ButtonStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 8 — .automatic, .borderless, .bordered, .borderedProminent, .plain, .glass, .glassProminent, .link)
- [x] States demos transferred (count expected: 1 — configuration shape)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 440)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — ButtonStyle protocol"

### Leaf 8: ButtonStyleConfiguration
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — label property, role property, isPressed property)
- [x] States demos transferred (count expected: 1 — live demo with .borderedProminent)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 441)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — ButtonStyleConfiguration"

### Leaf 9: View/buttonStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 8 — one per built-in style literal)
- [x] States demos transferred (count expected: 4 — role/tint/disabled variants with different styles)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 439)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonStyle gallery — built-in styles"

### Leaf 10: PrimitiveButtonStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — protocol declaration + conformers list)
- [x] States demos transferred (count expected: 1 — comparison with ButtonStyle + trigger() requirement)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 442)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — PrimitiveButtonStyle protocol"

### Leaf 11: PrimitiveButtonStyleConfiguration
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — trigger() method, label property, role property)
- [x] States demos transferred (count expected: 1 — comparison table with ButtonStyleConfiguration)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 443)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — PrimitiveButtonStyleConfiguration"

### Leaf 12: GlassButtonStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .glass + default, .glass + tint, .glass + role destructive)
- [x] States demos transferred (count expected: 2 — disabled state, controlSize variants)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 436)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonStyle gallery — .glass"

### Leaf 13: GlassProminentButtonStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .glassProminent + default, .glassProminent + tint, .glassProminent + role)
- [x] States demos transferred (count expected: 3 — primary+secondary pairing, disabled state, controlSize variants)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 437)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ButtonStyle gallery — .glassProminent"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense ButtonPage, with one-line description of contents.

1. **Header** — Title: "Button"; summary: "A control that initiates an action"; availability: macOS 10.15+; primary APIs: Button, ButtonRole, ButtonStyle modifiers
2. **Reference — ButtonRole** — Enum cases (.destructive, .cancel, nil) with semantic meaning; conformances
3. **Reference — ButtonBorderShape** — Enum cases (.automatic, .roundedRectangle, .capsule, .circle) with shapes; constraints
4. **Reference — ButtonStyle protocol** — Protocol shape; protocol declaration; list of built-in conformers
5. **Reference — ButtonStyleConfiguration** — Structure definition; properties (role, label, isPressed); usage in ButtonStyle.makeBody
6. **Reference — PrimitiveButtonStyle protocol** — Protocol shape; differs from ButtonStyle by exposing trigger(); protocol declaration
7. **Reference — PrimitiveButtonStyleConfiguration** — Structure definition; properties (role, label); trigger() method; comparison with ButtonStyleConfiguration
8. **Default Button demo** — String label button in default system style
9. **Button variants — labels and roles** — String label; Label with image; image-only; .destructive role; .cancel role; multi-button layouts
10. **Button states** — Disabled state; disabled destructive/cancel variants; tapped feedback via @State
11. **ButtonRole variants** — .destructive, .cancel, nil; visual and semantic differences
12. **ButtonBorderShape via .buttonBorderShape(_:)** — All four shape variants (.automatic, .roundedRectangle, .capsule, .circle) with demos
13. **ButtonRepeatBehavior via .buttonRepeatBehavior(_:)** — .enabled with hold count demo; .disabled default
14. **ButtonSizing via .controlSize(_:)** — All five sizes (.mini, .small, .regular, .large, .extraLarge)
15. **ButtonStyle gallery — built-in styles** — Eight conformers: .automatic, .borderless, .bordered, .borderedProminent, .plain, .glass, .glassProminent, .link; identical tri-button samples
16. **ButtonStyle gallery — .glass** — Default tint; tint color variants; role variants; disabled state; controlSize variants; macOS 26+
17. **ButtonStyle gallery — .glassProminent** — Default tint; tint color variants; role: .destructive; primary+secondary pairing; disabled state; controlSize variants; macOS 26+
18. **Custom ButtonStyle protocol example** — Code snippet showing makeBody(configuration:) implementation
19. **Notes** — Semantic roles, keyboard shortcuts, ButtonStyle inheritance, accessibility guidance, glass styles availability

## Sign-off

- Implementer: Claude Opus 4.7 (1M ctx) — 2026-05-05
- Spec-compliance reviewer: Claude Opus 4.7 (1M ctx) — 2026-05-05
- Code-quality reviewer: _____ (date)

## Manifest metadata

- **Task ID:** B1
- **Parent type:** Button
- **Framework:** SwiftUI
- **Section:** controls-and-indicators
- **Affected catalog lines:** 702–708 (controls-and-indicators), 436–443 (view-styles), 439 (view-styles modifier)
- **PageRegistry entries:** Button, ButtonRole, ButtonBorderShape, ButtonRepeatBehavior, ButtonSizing, ButtonStyle, ButtonStyleConfiguration, View/buttonStyle(_:), PrimitiveButtonStyle, PrimitiveButtonStyleConfiguration, GlassButtonStyle, GlassProminentButtonStyle
- **Pages to delete:** ButtonTypesPage.swift, ButtonStyleProtocolPage.swift, ButtonStyleConfigurationPage.swift, ButtonStyleModifierPage.swift, PrimitiveButtonStyleProtocolPage.swift, PrimitiveButtonStyleConfigurationPage.swift, GlassButtonStyleTypePage.swift, GlassProminentButtonStyleTypePage.swift
- **Created:** 2026-05-05
