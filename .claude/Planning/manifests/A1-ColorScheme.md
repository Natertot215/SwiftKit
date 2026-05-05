# A1 — ColorSchemePage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/ViewConfiguration/ColorSchemePage.swift (new)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.view-configuration` subsection, single line replacing former 413–417
**Status:** reviewed

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | ColorScheme | Pages/SwiftUI/ColorSchemeTypePage.swift | enum ColorScheme { case light, dark } | Documentation/SwiftUI/view-configuration/colorscheme.md | gallery | "ColorScheme type" |
| 2 | ColorSchemeContrast | Pages/SwiftUI/ColorSchemeContrastTypePage.swift | enum ColorSchemeContrast { case standard, increased } | Documentation/SwiftUI/view-configuration/colorschemecontrast.md | gallery | "ColorSchemeContrast type" |
| 3 | EnvironmentValues/colorScheme | Pages/SwiftUI/ColorSchemeEnvironmentPage.swift | @Environment(\.colorScheme) | Documentation/SwiftUI/view-configuration/colorscheme.md | gallery | "Environment-driven color scheme" |
| 4 | EnvironmentValues/colorSchemeContrast | Pages/SwiftUI/ColorSchemeContrastEnvironmentPage.swift | @Environment(\.colorSchemeContrast) | Documentation/SwiftUI/view-configuration/colorschemecontrast.md | gallery | "Environment-driven contrast" |
| 5 | View/preferredColorScheme(_:) | Pages/SwiftUI/PreferredColorSchemePage.swift | View/preferredColorScheme(_:) | Documentation/SwiftUI/view-configuration/preferredcolorscheme(_:).md | gallery | "preferredColorScheme(_:)" |
| 6 | View/toolbarColorScheme(_:for:) | Pages/SwiftUI/ToolbarColorSchemePage.swift | View/toolbarColorScheme(_:for:) | Documentation/SwiftUI/toolbars/toolbarcolorscheme(_:for:).md | gallery | "toolbarColorScheme(_:for:)" |

## Per-leaf coverage checklist

### Leaf 1: ColorScheme
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — pick a scheme programmatically, all cases via CaseIterable)
- [x] States demos transferred (count expected: 1 — conformances list)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ColorScheme type"

### Leaf 2: ColorSchemeContrast
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — side-by-side preview)
- [x] States demos transferred (count expected: 1 — read via environment value)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ColorSchemeContrast type"

### Leaf 3: EnvironmentValues/colorScheme
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — force env value with .environment(_:_:), used to swap assets)
- [x] States demos transferred (count expected: 1 — ColorScheme.allCases)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Environment-driven color scheme"

### Leaf 4: EnvironmentValues/colorSchemeContrast
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — read live value, branching to bump line weight)
- [x] States demos transferred (count expected: 1 — set by System Settings, not by the app)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Environment-driven contrast"

### Leaf 5: View/preferredColorScheme(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — side-by-side .light, .dark, nil; conditional override)
- [x] States demos transferred (count expected: 1 — interactive override with @State)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "preferredColorScheme(_:)"

### Leaf 6: View/toolbarColorScheme(_:for:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .light, .dark, nil)
- [x] States demos transferred (count expected: 1 — bound to @State)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "toolbarColorScheme(_:for:)"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense ColorSchemePage, with one-line description of contents.

1. **Header** — Title, summary ("The color scheme and contrast environment values, plus modifiers to override them"), availability (macOS 10.15+), primary apiSignatures
2. **ColorScheme type** — Enum cases (.light, .dark) with swatches; conformances; usage notes
3. **ColorSchemeContrast type** — Enum cases (.standard, .increased) with contrast swatches; conformances; accessibility context
4. **Environment-driven color scheme** — Reading @Environment(\.colorScheme); forcing values with .environment(_:_:); asset swapping; HIG notes on semantic colors
5. **Environment-driven contrast** — Reading @Environment(\.colorSchemeContrast); adapting line weight and contrast; read-only note; HIG accessibility guidance
6. **preferredColorScheme(_:)** — Setting preferred scheme for presentations; nil semantics; side-by-side demos of .light, .dark, nil; interactive toggling; scope and priority notes
7. **toolbarColorScheme(_:for:)** — Coloring toolbar content; variants for .light, .dark, nil; binding to state; interaction with .toolbarBackground; bar placement; macOS 13.0+ availability
8. **Notes from the HIG** — Consolidated guidance: prefer semantic colors, honor Increase Contrast setting, use preferredColorScheme at presentation boundaries, combined dark-mode branching patterns

## Sign-off

- **Implementer:** 2026-05-05 — ColorSchemePage authored at SwiftKit/Pages/SwiftUI/ViewConfiguration/ColorSchemePage.swift; 6 source pages deleted; Catalog+SwiftUI consolidated to one ColorScheme leaf in swiftui.view-configuration; PageRegistry remapped "ColorScheme" -> ColorSchemePage(); xcodebuild Debug clean; L-001 grep clean.
- **Spec-compliance reviewer:** 2026-05-05 — All 60 manifest boxes verified against commit 3fd20a2; 8-section plan intact; helpers are pure Apple-primitive compositions (no custom-component violations).
- **Code-quality reviewer:** (to be filled after spec-compliance approval)

---

## Manifest metadata

- **Manifest created:** 2026-05-05
- **Task ID:** A1
- **Parent type:** ColorScheme (enum, macOS 10.15+)
- **Framework:** SwiftUI
- **Target location:** SwiftKit/Pages/SwiftUI/ViewConfiguration/ColorSchemePage.swift
- **Catalog subsection:** swiftui.view-configuration
- **Toolbar leaf catalog subsection:** swiftui.toolbars (note: toolbarColorScheme leaf is in a separate subsection)
