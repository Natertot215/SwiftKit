# B2 — Picker / DatePicker / ColorPicker Coverage Manifest

**Parent pages:** 
- SwiftKit/Pages/SwiftUI/ControlsAndIndicators/PickerPage.swift (rewrite in place)
- SwiftKit/Pages/SwiftUI/ControlsAndIndicators/DatePickerPage.swift (rewrite in place)
- SwiftKit/Pages/SwiftUI/ControlsAndIndicators/ColorPickerPage.swift (rewrite in place)

**Parent leaf locations:** 
- Picker: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 706
- DatePicker: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 711
- ColorPicker: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 713
- PickerStyle: Catalog+SwiftUI.swift, `swiftui.view-styles` subsection, line 439
- DatePickerStyle: Catalog+SwiftUI.swift, `swiftui.view-styles` subsection, line 441
- (No ColorPickerStyle — ColorPicker has no style protocol)

**Status:** reviewed

## Absorbed leaves

### Picker consolidation

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | PickerStyle | PickerStylePage.swift | protocol PickerStyle | Documentation/SwiftUI/view-styles/pickerstyle.md | gallery | "Reference — PickerStyle protocol" |
| 2 | View/pickerStyle(_:) | PickerStylePage.swift | View/pickerStyle(_:) | Documentation/SwiftUI/view-styles/pickerstyle(_:).md | gallery | "PickerStyle gallery — built-in styles" |
| 3 | View/horizontalRadioGroupLayout() | PickerPage.swift (currently embedded) | View/horizontalRadioGroupLayout() | Documentation/SwiftUI/controls-and-indicators/horizontalradiogrouplayout().md | gallery | "Picker layout modifiers" |
| 4 | View/paletteSelectionEffect(_:) | PickerPage.swift (currently embedded) | View/paletteSelectionEffect(_:) | Documentation/SwiftUI/controls-and-indicators/paletteselectioneffect(_:).md | gallery | "PaletteSelectionEffect" |
| 5 | PaletteSelectionEffect | PickerPage.swift (currently embedded) | enum PaletteSelectionEffect | Documentation/SwiftUI/controls-and-indicators/paletteselectioneffect.md | gallery | "PaletteSelectionEffect" |

### DatePicker consolidation

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 6 | DatePickerStyle | DatePickerStylePage.swift | protocol DatePickerStyle | Documentation/SwiftUI/view-styles/datepickerstyle.md | gallery | "Reference — DatePickerStyle protocol" |
| 7 | View/datePickerStyle(_:) | DatePickerStylePage.swift | View/datePickerStyle(_:) | Documentation/SwiftUI/view-styles/datepickerstyle(_:).md | gallery | "DatePickerStyle gallery — built-in styles" |

### ColorPicker consolidation

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| (none — ColorPicker has no absorbed style or configuration siblings) |

## Per-leaf coverage checklist

### Picker Leaf 1: PickerStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 8 — .automatic, .menu, .inline, .segmented, .palette, .radioGroup, .wheel iOS-only, .navigationLink iOS-only)
- [x] States demos transferred (count expected: 1 — disabled state)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 439)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — PickerStyle protocol"

### Picker Leaf 2: View/pickerStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 8 — one per PickerStyle value)
- [x] States demos transferred (count expected: 1 — style + disabled variants)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 438)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "PickerStyle gallery — built-in styles"

### Picker Leaf 3: View/horizontalRadioGroupLayout()
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — horizontal radio layout demo)
- [x] States demos transferred (count expected: 0 — modifier only)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 708)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Picker layout modifiers"

### Picker Leaf 4: View/paletteSelectionEffect(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .automatic, .symbolVariant(.fill), .custom)
- [x] States demos transferred (count expected: 0 — modifier only)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 709)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "PaletteSelectionEffect"

### Picker Leaf 5: PaletteSelectionEffect
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .automatic, .symbolVariant(.fill), .custom)
- [x] States demos transferred (count expected: 1 — visual selection effects demo)
- [x] Notes paragraphs preserved (2 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 710)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "PaletteSelectionEffect"

### DatePicker Leaf 6: DatePickerStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 5 — .automatic, .compact, .field, .graphical, .stepperField; .wheel iOS-only)
- [x] States demos transferred (count expected: 1 — disabled state + displayedComponents variants)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 441)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — DatePickerStyle protocol"

### DatePicker Leaf 7: View/datePickerStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 5 — one per DatePickerStyle value on macOS)
- [x] States demos transferred (count expected: 1 — displayedComponents variants + disabled state)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 440)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "DatePickerStyle gallery — built-in styles"

### ColorPicker (no absorbed leaves)
- [x] ColorPicker has no style protocol or configuration sibling — consolidation is in-place rewrite only
- [x] Existing ColorPickerPage.swift remains as-is
- [x] No catalog or registry edits required beyond verifying Catalog+SwiftUI.swift line 713 is retained

## Parent page section plans

### PickerPage section order

1. **Header** — Title: "Picker"; summary: "A control for selecting from mutually exclusive values"; availability: macOS 10.15+; APIs: Picker, PickerStyle, horizontalRadioGroupLayout(), paletteSelectionEffect(_:), PaletteSelectionEffect
2. **Default Picker demo** — String label, basic array selection
3. **Picker variants — selection styles** — Menu (default), radioGroup (vertical), segmented, inline, palette (with PaletteSelectionEffect)
4. **Picker layout modifiers** — horizontalRadioGroupLayout() for row-wise radio buttons
5. **PaletteSelectionEffect** — Effect enum (.automatic, .symbolVariant(.fill), .custom); visual selection distinction
6. **Reference — PickerStyle protocol** — Protocol shape; built-in conformers list; no custom implementations in SwiftKit
7. **PickerStyle gallery — built-in styles** — Eight variants: .automatic, .menu, .inline, .segmented, .palette, .radioGroup, .wheel (iOS), .navigationLink (iOS); side-by-side samples
8. **Picker disabled state** — .disabled(true) propagation across styles
9. **Selection binding and state** — @State management; tag/_:) syntax
10. **Notes** — macOS-specific styles, .radioGroup vertical stacking, .palette with icons, horizontal layout macOS-only, keyboard interaction

### DatePickerPage section order

1. **Header** — Title: "DatePicker"; summary: "A control for selecting an absolute date"; availability: macOS 10.15+; APIs: DatePicker, DatePickerStyle, displayedComponents
2. **Default DatePicker demo** — Basic date binding with system style
3. **DatePickerStyle variants** — .automatic (default), .compact (popover), .field (editable text), .graphical (month grid), .stepperField (↑/↓ native)
4. **displayedComponents narrowing** — .date only, .hourAndMinute only, combined
5. **Date range constraints** — in: (ClosedRange), in: (PartialRangeFrom), in: (PartialRangeThrough)
6. **Reference — DatePickerStyle protocol** — Protocol shape; five macOS-supported values; .wheel iOS-only
7. **DatePickerStyle gallery — built-in styles** — Five variants (.automatic, .compact, .field, .graphical, .stepperField); identical sample DatePickers
8. **DatePicker disabled state** — .disabled(true) behavior
9. **Selection state and calendar interaction** — @State binding; calendar month navigation (graphical style only)
10. **Notes** — .graphical for dedicated date screens, .compact for forms, displayedComponents as OptionSet, range semantics, component selection patterns

### ColorPickerPage section order

ColorPickerPage remains as currently structured (no consolidation needed):

1. **Header** — Title: "ColorPicker"; summary: "A control for selecting a color"; availability: macOS 11.0+; APIs: ColorPicker, supportsOpacity
2. **Default ColorPicker demo** — String label, color binding
3. **ColorPicker variants** — String label, view-builder label, supportsOpacity: false (hides alpha), current color preview
4. **ColorPicker disabled state** — .disabled(true)
5. **Notes** — NSColorPanel on macOS, Color binding (not CGColor), opacity control semantics

## Sign-off

- Implementer: Claude Opus 4.7 (1M ctx) — 2026-05-05
- Spec-compliance reviewer: Claude Opus 4.7 (1M ctx) — 2026-05-05 — APPROVED (commit 07f5ee3)
- Code-quality reviewer: _awaiting review_

## Manifest metadata

- **Task ID:** B2
- **Parent types:** Picker, DatePicker, ColorPicker (three small consolidations, one manifest)
- **Framework:** SwiftUI
- **Section:** controls-and-indicators (parents) + view-styles (PickerStyle, DatePickerStyle)
- **Affected Catalog+SwiftUI.swift lines:** 438–439 (pickerStyle modifier + protocol), 440–441 (datePickerStyle modifier + protocol), 706 (Picker), 708–710 (horizontalRadioGroupLayout, defaultWheelPickerItemHeight, paletteSelectionEffect), 711 (DatePicker), 713 (ColorPicker)
- **PageRegistry entries affected:** Picker, PickerStyle, View/pickerStyle(_:), DatePicker, DatePickerStyle, View/datePickerStyle(_:), ColorPicker, horizontalRadioGroupLayout(), paletteSelectionEffect(_:), PaletteSelectionEffect
- **Pages to delete:** PickerStylePage.swift, DatePickerStylePage.swift
- **Pages to rewrite in place:** PickerPage.swift, DatePickerPage.swift, ColorPickerPage.swift
- **Created:** 2026-05-05
