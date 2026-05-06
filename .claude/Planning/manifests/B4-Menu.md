# B4 — Menu Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/MenusAndCommands/MenuPage.swift (rewrite in place)

**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.menus-and-commands` subsection, line 732

**Status:** merged

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | MenuStyle | MenuStylePage.swift | protocol MenuStyle | Documentation/SwiftUI/view-styles/menustyle.md | gallery | "Reference — MenuStyle protocol" |
| 2 | MenuStyleConfiguration | MenuStylePage.swift | struct MenuStyleConfiguration | Documentation/SwiftUI/view-styles/menustyleconfiguration.md | gallery | "Reference — MenuStyleConfiguration" |
| 3 | View/menuStyle(_:) | MenuStylePage.swift | View/menuStyle(_:) | Documentation/SwiftUI/view-styles/menustyle(_:).md | gallery | "MenuStyle gallery — built-in styles" |
| 4 | MenuOrder | MenuModifiersPage.swift | enum MenuOrder | Documentation/SwiftUI/menus-and-commands/menuorder.md | gallery | "MenuOrder variants" |
| 5 | View/menuOrder(_:) | MenuModifiersPage.swift | View/menuOrder(_:) | Documentation/SwiftUI/menus-and-commands/menuorder(_:).md | gallery | "MenuOrder variants" |
| 6 | View/menuIndicator(_:) | MenuIndicatorPage.swift | View/menuIndicator(_:) | Documentation/SwiftUI/view-configuration/menuindicator(_:).md | gallery | "menuIndicator visibility control" |
| 7 | ToolbarTitleMenu | ToolbarTitleMenuPage.swift | struct ToolbarTitleMenu | Documentation/SwiftUI/toolbars/toolbartitlemenu.md | gallery | "ToolbarTitleMenu integration" |
| 8 | View/toolbarTitleMenu(content:) | ToolbarTitleMenuPage.swift | View/toolbarTitleMenu(content:) | Documentation/SwiftUI/toolbars/toolbartitlemenu(content:).md | gallery | "ToolbarTitleMenu integration" |

## Per-leaf coverage checklist

### Leaf 1: MenuStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .automatic, .button, .borderlessButton)
- [x] States demos transferred (count expected: 2 — buttonStyle composition, MenuStyleConfiguration shape)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 439)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — MenuStyle protocol"

### Leaf 2: MenuStyleConfiguration
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 0 — structure only, shown as code block)
- [x] States demos transferred (count expected: 0 — configuration reference only)
- [x] Notes paragraphs preserved (1 note: "SwiftKit does NOT author custom MenuStyle conformers")
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 440)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — MenuStyleConfiguration"

### Leaf 3: View/menuStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — one per built-in style: .automatic, .button, .borderlessButton)
- [x] States demos transferred (count expected: 1 — buttonStyle composition after .menuStyle(.button))
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 438)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "MenuStyle gallery — built-in styles"

### Leaf 4: MenuOrder
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — .fixed, .priority (iOS-only note))
- [x] States demos transferred (count expected: 1 — enum reference, note on platform availability)
- [x] Notes paragraphs preserved (1 note present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 751)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "MenuOrder variants"

### Leaf 5: View/menuOrder(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — modifier application demo)
- [x] States demos transferred (count expected: 0 — modifier only)
- [x] Notes paragraphs preserved (1 note: platform-specific behavior)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 750)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "MenuOrder variants"

### Leaf 6: View/menuIndicator(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .automatic, .visible, .hidden; plus primaryAction split-button variant)
- [x] States demos transferred (count expected: 1 — Picker-driven visibility state)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 403)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "menuIndicator visibility control"

### Leaf 7: ToolbarTitleMenu
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — no-argument form, custom-content form, and .toolbarTitleMenu modifier form)
- [x] States demos transferred (count expected: 2 — conformance info, default vs override)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 315)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ToolbarTitleMenu integration"

### Leaf 8: View/toolbarTitleMenu(content:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — modifier form demo)
- [x] States demos transferred (count expected: 0 — modifier form only, dual surface info folded into Leaf 7)
- [x] Notes paragraphs preserved (merged into Leaf 7 notes)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 314)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ToolbarTitleMenu integration"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense page:

1. **Header** — Title: "Menu"; summary: "A control for presenting a menu of actions or selections. Renders as a pull-down button on macOS."; availability: macOS 11.0+; APIs: Menu, MenuStyle, MenuStyleConfiguration, MenuOrder, View/menuIndicator(_:), ToolbarTitleMenu, View/toolbarTitleMenu(content:)
2. **Default Menu demo** — String label, basic array selection with Button items
3. **Menu variants — label forms** — String label, view-builder label, submenu (nested Menu), primaryAction split-button pattern, destructive item + Divider
4. **MenuStyle gallery — built-in styles** — Three variants: .automatic (default chevron), .button (renders as Button), .borderlessButton (legacy variant)
5. **MenuStyle composition with ButtonStyle** — Demo: .menuStyle(.button) combined with .buttonStyle(.bordered), .borderedProminent, .glass
6. **Reference — MenuStyle protocol** — Protocol shape with Title and Content inner types; MenuStyleConfiguration structure; note on no custom implementations in SwiftKit
7. **MenuOrder variants** — Enum cases: .fixed (preserve declaration order), .priority (iOS-only, system may reorder)
8. **menuIndicator visibility control** — View/menuIndicator(_:) modifier; three Visibility cases: .automatic (default, shows chevron), .visible, .hidden; use cases for split-button menus
9. **ToolbarTitleMenu integration** — Default system-populated form, custom-content override form, .toolbarTitleMenu(content:) modifier form; document-title menu pattern on macOS; CommandGroupPlacement integration
10. **Menu disabled state** — .disabled(true) propagation
11. **Notes** — Menu renders as pull-down button with chevron; primaryAction separates click from long-press; Divider usage; menuStyle composition with buttonStyle; menuIndicator hierarchy; ToolbarTitleMenu macOS document-window pattern; iOS alternative (tap navigation title)

## Sign-off

- Implementer: Claude Sonnet 4.6 (2026-05-05)
- Spec-compliance reviewer: Claude Sonnet 4.6 (2026-05-05) — all 8 leaves verified ✓
- Code-quality reviewer: Claude Sonnet 4.6 (2026-05-05) — approved ✓

## Manifest metadata

- **Task ID:** B4
- **Parent type:** Menu (rewritten in place)
- **Framework:** SwiftUI
- **Sections affected:** menus-and-commands (primary), view-styles (MenuStyle, MenuStyleConfiguration), view-configuration (menuIndicator), toolbars (ToolbarTitleMenu)
- **Affected Catalog+SwiftUI.swift lines:** 314–315 (toolbarTitleMenu variants), 403 (menuIndicator), 438–440 (menuStyle variants + protocol + config), 732 (Menu), 750–751 (menuOrder variants + protocol)
- **PageRegistry entries affected:** Menu, MenuStyle, MenuStyleConfiguration, View/menuStyle(_:), MenuOrder, View/menuOrder(_:), View/menuIndicator(_:), ToolbarTitleMenu, View/toolbarTitleMenu(content:)
- **Pages to delete:** MenuStylePage.swift, MenuIndicatorPage.swift, ToolbarTitleMenuPage.swift
- **Pages to rewrite in place:** MenuPage.swift (currently under MenusAndCommands/)
- **NOT absorbed (stays separate):** MenuBarExtra, MenuBarExtraStyle (both in scenes section — B4 exclusion confirmed)
- **Created:** 2026-05-05
- **Implemented:** 2026-05-05
