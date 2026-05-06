# A2 — SafeAreaPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/LayoutAdjustments/SafeAreaPage.swift (rewrite existing)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.layout-adjustments` subsection; `safeAreaBar` currently in `swiftui.scroll-views` subsection (to absorb in place)
**Status:** merged

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | SafeAreaPage | Pages/SwiftUI/LayoutAdjustments/SafeAreaPage.swift | View/safeAreaInset, ignoresSafeArea, SafeAreaRegions | Documentation/SwiftUI/layout-adjustments/ | gallery | SafeAreaPage (source content preserved) |
| 2 | View/safeAreaPadding(_:) | Pages/SwiftUI/LayoutAdjustments/SafeAreaPaddingPage.swift | View/safeAreaPadding(_:) | Documentation/SwiftUI/layout-adjustments/safeareapadding(_:).md | gallery | "safeAreaPadding(_:)" |
| 3 | View/safeAreaPadding(_:_:) | Pages/SwiftUI/LayoutAdjustments/SafeAreaPaddingEdgesPage.swift | View/safeAreaPadding(_:_:) | Documentation/SwiftUI/layout-adjustments/safeareapadding(_:_:).md | gallery | "safeAreaPadding(_:_:)" |
| 4 | View/safeAreaInset(edge:alignment:spacing:content:) | Pages/SwiftUI/LayoutAdjustments/SafeAreaInsetPage.swift | View/safeAreaInset(edge:alignment:spacing:content:) | Documentation/SwiftUI/layout-adjustments/safeareainset(edge:alignment:spacing:content:).md | gallery | "safeAreaInset(edge:alignment:spacing:content:)" |
| 5 | View/ignoresSafeArea(_:edges:) | Pages/SwiftUI/LayoutAdjustments/IgnoresSafeAreaPage.swift | View/ignoresSafeArea(_:edges:) | Documentation/SwiftUI/layout-adjustments/ignoressafearea(_:edges:).md | gallery | "ignoresSafeArea(_:edges:)" |
| 6 | View/safeAreaBar(edge:alignment:spacing:content:) | Pages/SwiftUI/ScrollViews/SafeAreaBarPage.swift | View/safeAreaBar(edge:alignment:spacing:content:) | Documentation/SwiftUI/scroll-views/safeareabar(edge:alignment:spacing:content:).md | gallery | "safeAreaBar(edge:alignment:spacing:content:)" |
| 7 | SafeAreaRegions | Pages/SwiftUI/LayoutAdjustments/SafeAreaRegionsDescribePage.swift | @frozen struct SafeAreaRegions: OptionSet | Documentation/SwiftUI/layout-adjustments/safearearegions.md | describe | "Reference (SafeAreaRegions type)" |

## Per-leaf coverage checklist

### Leaf 1: SafeAreaPage (existing source content)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — safeAreaInset, ignoresSafeArea, safeAreaInset all params)
- [x] States demos transferred (count expected: 1 — SafeAreaRegions cases)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page NOT deleted (destination page, rewrite in place)
- [x] Catalog leaf retained in Catalog+SwiftUI.swift
- [x] PageRegistry entry retained
- [x] Lands in subsection: "SafeAreaPage (dense, root)"

### Leaf 2: View/safeAreaPadding(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — asymmetric vertical, all-edge padding)
- [x] States demos transferred (count expected: 1 — vs. View/padding)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "safeAreaPadding(_:)"

### Leaf 3: View/safeAreaPadding(_:_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .vertical/.top/.bottom, combined Edge.Set, defaults no length)
- [x] States demos transferred (count expected: 1 — vs. View/padding)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "safeAreaPadding(_:_:)"

### Leaf 4: View/safeAreaInset(edge:alignment:spacing:content:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — top edge, trailing edge with spacing, alignment within edge stripe)
- [x] States demos transferred (count expected: 1 — all parameters)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "safeAreaInset(edge:alignment:spacing:content:)"

### Leaf 5: View/ignoresSafeArea(_:edges:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 4 — specific edges, .horizontal/.vertical Edge.Set, SafeAreaRegions selector, defaults no arguments)
- [x] States demos transferred (count expected: 1 — comparison with vs. without)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "ignoresSafeArea(_:edges:)"

### Leaf 6: View/safeAreaBar(edge:alignment:spacing:content:)
- [x] Header info captured (title, availability, apiSignature — macOS 26.0+)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — leading edge, vertical alignment, spacing)
- [x] States demos transferred (count expected: 1 — HorizontalEdge only)
- [x] Notes paragraphs preserved (4 notes present)
- [x] Source page deleted from filesystem (currently in ScrollViews/)
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (swiftui.scroll-views subsection)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "safeAreaBar(edge:alignment:spacing:content:)"

### Leaf 7: SafeAreaRegions (describe-only content)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from describe page transcribed (OptionSet conformances, static cases)
- [x] Blurb paragraph preserved
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference (SafeAreaRegions type)" — placed ABOVE demo subsections per describe-track rule

## Parent page section plan

Ordered list of `PageSection` titles in the new dense SafeAreaPage, with one-line description of contents.

1. **Header** — Title ("SafeArea"), summary ("Safe-area insets, region ignoring, and bar attachment modifiers"), availability (macOS 11.0+ base; macOS 26.0+ for safeAreaBar), primary apiSignatures
2. **Reference (SafeAreaRegions type)** — OptionSet definition, cases (.container, .keyboard, .all), conformances, usage with ignoresSafeArea; placed before demos per describe-track placement rule
3. **safeAreaPadding(_:)** — EdgeInsets variant; adding per-edge safe-area padding; demo + 2 variants (asymmetric vertical, all-edge); vs. View/padding notes
4. **safeAreaPadding(_:_:)** — Edge.Set + amount variant; single-edge and combined edge insets; demo + 3 variants (.vertical/.top/.bottom, combined Edge.Set, defaults); vs. View/padding notes
5. **safeAreaInset(edge:alignment:spacing:content:)** — Fixed overlay that adjusts safe area; demo + 3 variants (top edge, trailing with spacing, alignment within stripe); all parameters breakdown
6. **ignoresSafeArea(_:edges:)** — Extending view into safe-area regions; demo + 4 variants (specific edges, .horizontal/.vertical, SafeAreaRegions selector, defaults); comparison with/without
7. **safeAreaBar(edge:alignment:spacing:content:)** — Side-bar variant anchored to horizontal edges (macOS 26+); demo + 3 variants (leading edge, vertical alignment, spacing); HorizontalEdge-only constraint; scroll edge effects integration
8. **Notes from the HIG** — Consolidated guidance: prefer safeAreaInset for persistent bars over scrollable content, ignoresSafeArea for full-bleed backgrounds (with caution), macOS title-bar/sidebar safe-area zones, keyboard-region iOS-only behavior, macOS 26 safeAreaBar for new sidebar language

## Sign-off

- **Implementer:** Claude Opus 4.7 (1M context) — 2026-05-05; build clean, L-001 grep clean (zero hits), 7 leaves consolidated into single dense page (852 lines)
- **Spec-compliance reviewer:** Claude Opus 4.7 (1M context) — 2026-05-05; all 70 boxes verified against commit 2221af6; section plan order intact (Header → Reference → safeAreaPadding(_:) → safeAreaPadding(_:_:) → safeAreaInset → ignoresSafeArea → safeAreaBar → HIG Notes); Reference subsection placed above demos per describe-track placement rule; SafeArea symbol mapped in PageRegistry to SafeAreaPage(); SafeArea leaf retained in Catalog+SwiftUI.swift `swiftui.layout-adjustments`; absorbed source pages deleted from filesystem; no custom-component violations (Apple primitives only — PageSection / APICallout / noteRow are presentation helpers, not re-implemented system controls)
- **Code-quality reviewer:** Claude Opus 4.7 (1M context) — 2026-05-05; build clean (`** BUILD SUCCEEDED **`), L-001 grep zero hits, L-012 grep zero hits (no `Color(red:` or `.system(size:` literals), Apple-only confirmed (`noteRow` is pure `Label` + `Text` composition matching the ColorSchemePage A1 precedent — `PageSection` and `APICallout` are sanctioned scaffold helpers in `SwiftKit/Detail/PageScaffold/`, not re-implemented system controls), TypographyPage rhythm matches exactly (outer `ScrollView { VStack(.leading, spacing: 32) { … } .padding(.horizontal, 32).padding(.vertical, 24).frame(maxWidth: galleryReadableContentWidth, alignment: .leading).frame(maxWidth: .infinity, alignment: .leading) }`), section ordering matches manifest plan (Header → Reference → safeAreaPadding(_:) → safeAreaPadding(_:_:) → safeAreaInset → ignoresSafeArea → safeAreaBar → HIG Notes), describe-track Reference subsection placed above demos. No `@State` (declarative-only page, appropriate), no `AnyView`, no redundant wrappers, body decomposed into private computed properties keeping each section well within type-checker budget. No Critical or Important findings.

---

## Manifest metadata

- **Manifest created:** 2026-05-05
- **Task ID:** A2
- **Parent type:** SafeArea (modifier family)
- **Framework:** SwiftUI
- **Target location:** SwiftKit/Pages/SwiftUI/LayoutAdjustments/SafeAreaPage.swift
- **Catalog subsections affected:** swiftui.layout-adjustments (6 leaves), swiftui.scroll-views (1 leaf — safeAreaBar to move)
- **Leaf count:** 7 (6 gallery + 1 describe-only)
- **Notes:** SafeAreaBarPage currently in ScrollViews will be moved/absorbed into LayoutAdjustments on parent page. SafeAreaRegionsDescribePage (describe-only) folds into Reference subsection placed above demo subsections per Nathan's describe-track placement rule.
