# A3 — PaddingPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/LayoutAdjustments/PaddingPage.swift (new)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.layout-adjustments` subsection, line ~958 (to be consolidated)
**Status:** implementing

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | View/padding(_:) | Pages/SwiftUI/LayoutAdjustments/PaddingInsetsPage.swift | View/padding(_:) — EdgeInsets variant | Documentation/SwiftUI/layout-adjustments/padding(_:).md | gallery | "padding(_:) — EdgeInsets variant" |
| 2 | View/padding(_:_:) | Pages/SwiftUI/LayoutAdjustments/PaddingEdgesAmountPage.swift | View/padding(_:_:) — Edge.Set + CGFloat? | Documentation/SwiftUI/layout-adjustments/padding(_:_:).md | gallery | "padding(_:_:) — Edge.Set + amount" |
| 3 | View/scenePadding(_:) | Pages/SwiftUI/LayoutAdjustments/ScenePaddingEdgesPage.swift | View/scenePadding(_:) — Edge.Set only | Documentation/SwiftUI/layout-adjustments/scenepadding(_:).md | gallery | "scenePadding(_:) — Edge.Set variant" |
| 4 | View/scenePadding(_:edges:) | Pages/SwiftUI/LayoutAdjustments/ScenePaddingKindEdgesPage.swift | View/scenePadding(_:edges:) — ScenePadding + Edge.Set | Documentation/SwiftUI/layout-adjustments/scenepadding(_:edges:).md | gallery | "scenePadding(_:edges:) — kind variant" |
| 5 | ScenePadding | Pages/SwiftUI/LayoutAdjustments/ScenePaddingDescribePage.swift | struct ScenePadding { static minimum, navigationBar } | Documentation/SwiftUI/layout-adjustments/scenepadding.md | describe | "Reference (ScenePadding type)" |
| 6 | View/contentMargins(_:for:) | Pages/SwiftUI/LayoutAdjustments/ContentMarginsPage.swift | View/contentMargins(_:for:) — CGFloat + placement | Documentation/SwiftUI/layout-adjustments/contentmargins(_:for:).md | gallery | "contentMargins(_:for:)" |
| 7 | View/contentMargins(_:_:for:) | Pages/SwiftUI/LayoutAdjustments/ContentMarginsForPage.swift | View/contentMargins(_:_:for:) — Edge.Set + CGFloat? + placement | Documentation/SwiftUI/layout-adjustments/contentmargins(_:_:for:).md | gallery | "contentMargins(_:_:for:)" |
| 8 | View/contentMargins(_:_:for:) edges | Pages/SwiftUI/LayoutAdjustments/ContentMarginsEdgesForPage.swift | View/contentMargins(_:_:for:) — EdgeInsets + placement | Documentation/SwiftUI/layout-adjustments/contentmargins(_:_:for:).md | gallery | "contentMargins(_:_:for:) — EdgeInsets variant" |

## Per-leaf coverage checklist

### Leaf 1: View/padding(_:) — EdgeInsets variant
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed (EdgeInsets init)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — asymmetric horizontal, asymmetric vertical)
- [x] States demos transferred (count expected: 1 — stored EdgeInsets value)
- [x] Notes paragraphs preserved (3 notes on overload selection, border/background order, layout direction)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "padding(_:) — EdgeInsets variant"

### Leaf 2: View/padding(_:_:) — Edge.Set + amount variant
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed (Edge.Set + optional CGFloat overloads)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — Edge.Set values, combined edges via OptionSet, defaults)
- [x] States demos transferred (count expected: 2 — platform default no length, no edges)
- [x] Notes paragraphs preserved (3 notes on OptionSet, OptionSet shorthand, defaults resolution)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "padding(_:_:) — Edge.Set + amount"

### Leaf 3: View/scenePadding(_:) — Edge.Set only
- [x] Header info captured (title, availability macOS 12.0+, apiSignature)
- [x] All signatures from source page transcribed (Edge.Set only, platform-default amount)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 5 — .all, .horizontal, .vertical, .top, .leading)
- [x] States demos transferred (count expected: 1 — defaults to .all)
- [x] Notes paragraphs preserved (3 notes on macOS window content margin, non-macOS platform fallback, kind overload reference)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "scenePadding(_:)"

### Leaf 4: View/scenePadding(_:edges:) — ScenePadding kind variant
- [x] Header info captured (title, availability macOS 13.0+, apiSignature)
- [x] All signatures from source page transcribed (ScenePadding + Edge.Set)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — kinds (.minimum, navigationBar unavailable on macOS), edge subsets, top only)
- [x] States demos transferred (count expected: 1 — default edges .all)
- [x] Notes paragraphs preserved (3 notes on .minimum vs .navigationBar, platform fallback, no-kind reference)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "scenePadding(_:edges:)"

### Leaf 5: ScenePadding — describe-only type
- [x] Header info captured (title, availability macOS 13.0+, apiSignature)
- [x] All signatures from describe page transcribed (struct definition, static let minimum, static let navigationBar)
- [x] Blurb paragraph preserved ("struct describing the padding amount appropriate for spacing a view from its containing scene")
- [x] Notes paragraphs preserved (3 notes on macOS window content margin, watchOS curved edges, pre-macOS 13 history)
- [x] Conformances transcribed (Equatable, Sendable, SendableMetatype)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference (ScenePadding type)" — placed ABOVE demo subsections per describe-track rule

### Leaf 6: View/contentMargins(_:for:) — uniform CGFloat variant
- [x] Header info captured (title, availability macOS 14.0+, apiSignature)
- [x] All signatures from source page transcribed (CGFloat + ContentMarginPlacement)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — .scrollContent, .scrollIndicators, .automatic)
- [x] States demos transferred (count expected: 1 — CGFloat-only, no EdgeInsets variant)
- [x] Notes paragraphs preserved (3 notes on uniform amount, .scrollContent pairing, replacement pattern for .padding wrapping)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "contentMargins(_:for:)"

### Leaf 7: View/contentMargins(_:_:for:) — Edge.Set + CGFloat? variant
- [x] Header info captured (title, availability macOS 14.0+, apiSignature)
- [x] All signatures from source page transcribed (Edge.Set + optional CGFloat + ContentMarginPlacement)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 4 — .vertical, single edge, combined Edge.Set, different placements)
- [x] States demos transferred (count expected: 1 — optional length parameter (nil = platform default))
- [x] Notes paragraphs preserved (3 notes on Edge.Set values, layout direction, multiple calls stacking)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "contentMargins(_:_:for:)"

### Leaf 8: View/contentMargins(_:_:for:) — EdgeInsets variant
- [x] Header info captured (title, availability macOS 14.0+, apiSignature — note: confusing double naming in source)
- [x] All signatures from source page transcribed (EdgeInsets + ContentMarginPlacement)
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 0 — this is pure reference without distinct demo variants)
- [x] States demos transferred (count expected: 0 — mirrors the Edge.Set variant)
- [x] Notes paragraphs preserved (documented as reference content in ContentMarginsPage original header)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "contentMargins — EdgeInsets reference" (merged into parent or as reference callout)

## Parent page section plan

Ordered list of `PageSection` titles in the new dense PaddingPage, with one-line description of contents.

1. **Header** — Title ("Padding & Scene Padding"), summary ("Padding modifiers and scene-aware spacing for alignment with window content and scroll containers"), availability (macOS 10.15+ base; macOS 12.0+ for scenePadding; macOS 13.0+ for scenePadding(_:edges:); macOS 14.0+ for contentMargins), primary apiSignatures
2. **Reference (ScenePadding type)** — struct ScenePadding definition, .minimum and .navigationBar cases, conformances, macOS-specific behavior; placed above demos per describe-track placement rule
3. **padding(_:) — EdgeInsets variant** — Adds asymmetric per-edge padding via EdgeInsets value; demo + 2 variants (asymmetric horizontal, asymmetric vertical); stored value state
4. **padding(_:_:) — Edge.Set + amount** — Adds padding to specified edges via Edge.Set + optional CGFloat; demo + 3 variants (all Edge.Set values, combined edges, defaults); 2 states (defaults no length, no edges)
5. **scenePadding(_:)** — Scene-appropriate padding to named edges; platform-default amount; demo + 5 variants (all, horizontal, vertical, top, leading); macOS window-margin semantics; notes on non-macOS fallback
6. **scenePadding(_:edges:)** — Scene padding with kind selector (.minimum vs .navigationBar); demo + 3 variants (kinds, edge subsets, top); defaults resolution; watchOS availability notes
7. **contentMargins(_:for:)** — Uniform content margins for scroll containers; placement selector (.scrollContent, .scrollIndicators, .automatic); demo + 3 placement variants; replacement pattern
8. **contentMargins(_:_:for:)** — Per-edge content margins via Edge.Set + amount; demo + 4 variants (.vertical, single edge, combined, different placements); optional length default; stacking behavior
9. **EdgeInsets reference** — Type definition, init signature, conformances (Equatable, Sendable); used by padding(_:) and contentMargins overloads; layout-direction-aware leading/trailing
10. **Notes from the HIG** — Consolidated guidance: padding shrinks frame, safeAreaPadding shrinks safe area only, scenePadding for window-edge alignment on macOS, contentMargins for scroll insets, layout-direction honor (leading/trailing), all overloads compose additively

## Sign-off

- **Implementer:** Claude Opus 4.7 (1M context) — 2026-05-05
- **Spec-compliance reviewer:** (to be filled during review)
- **Code-quality reviewer:** (to be filled after spec-compliance passes)

---

## Manifest metadata

- **Manifest created:** 2026-05-05
- **Task ID:** A3
- **Parent type:** Padding family (modifier consolidation)
- **Framework:** SwiftUI
- **Target location:** SwiftKit/Pages/SwiftUI/LayoutAdjustments/PaddingPage.swift
- **Catalog subsection:** swiftui.layout-adjustments
- **Leaf count:** 8 (6 gallery + 1 describe-only + 1 merged reference)
- **Notes:** ScenePadding describe-only leaf (Leaf 5) folds into Reference subsection placed above demo subsections per Nathan's describe-track placement rule. SafeArea-prefixed padding (safeAreaPadding, safeAreaInset) was absorbed into A2 SafeAreaPage — not in scope for A3. ContentMarginsPage original implementation (file #6) bundled multiple unrelated types; A3 extracts the pure contentMargins family and absorbs the two-parameter overloads.
