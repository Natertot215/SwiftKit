# A5 — ScrollTransitionPage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/ScrollViews/ScrollTransitionPage.swift (rewritten in place)
**Parent leaf (Catalog+SwiftUI.swift):** Line 1149
**Status:** merged

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | View/scrollTransition(_:axis:transition:) | ScrollTransitionPage.swift (self — rewrite) | View/scrollTransition(_:axis:transition:) | Documentation/SwiftUI/scroll-views/scrolltransition(_:axis:transition:).md | gallery | (parent — default demo) |
| 2 | View/scrollTransition(topLeading:bottomTrailing:axis:transition:) | ScrollTransitionTopBottomPage.swift | View/scrollTransition(topLeading:bottomTrailing:axis:transition:) | Documentation/SwiftUI/scroll-views/scrolltransition(topleading:bottomtrailing:axis:transition:).md | gallery | Top/bottom variant |
| 3 | ScrollTransitionPhase | ScrollTransitionPhaseDescribePage.swift | @frozen enum ScrollTransitionPhase | Documentation/SwiftUI/scroll-views/scrolltransitionphase.md | describe | Reference |
| 4 | ScrollTransitionConfiguration | ScrollTransitionConfigurationDescribePage.swift | struct ScrollTransitionConfiguration | Documentation/SwiftUI/scroll-views/scrolltransitionconfiguration.md | describe | Reference |

## Per-leaf coverage checklist

- [x] **View/scrollTransition(_:axis:transition:)** (parent, rewrite in place)
  - [x] Header info captured (title, availability, apiSignature)
  - [x] All signatures from source page transcribed (method signature + closure parameters)
  - [x] Default demo transferred (scroll-transition opacity demo with horizontal scroll)
  - [x] Variant demos transferred (count expected: 3 — scale+opacity, phase.value parametric, configuration: .animated)
  - [x] States demos transferred (count expected: 1 — axis: .vertical override)
  - [x] Notes paragraphs preserved (count expected: 5 — identity phase, symmetric, EmptyVisualEffect, default config, axis nil)
  - [x] Source page structure migrated from GalleryPageScaffold to dense ScrollView/VStack/PageSection rhythm
  - [x] Catalog leaf retained as parent (one entry, symbol kept)
  - [x] PageRegistry entry retained pointing to rewritten ScrollTransitionPage
  - [x] Lands in dense page: "Default scrollTransition" section

- [x] **View/scrollTransition(topLeading:bottomTrailing:axis:transition:)** (absorb)
  - [x] Header info captured (title, availability, apiSignature)
  - [x] All signatures from source page transcribed (topLeading/bottomTrailing parameters, closure)
  - [x] Default demo transferred (asymmetric interactive/animated demo with scale+opacity)
  - [x] Variant demos transferred (count expected: 2 — asymmetric scale, asymmetric thresholds via configuration.threshold)
  - [x] States demos transferred (count expected: 1 — axis override for horizontal)
  - [x] Notes paragraphs preserved (count expected: 5 — top/leading vs bottom/trailing, same closure, asymmetric is point, identity pinned, pairs with scrollTargetLayout)
  - [x] Source page deleted from filesystem
  - [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 1150)
  - [x] PageRegistry entry removed (line 1279)
  - [x] Lands in dense page: "Top/bottom variant" section

- [x] **ScrollTransitionPhase** (absorb describe-only)
  - [x] Header info captured (title, availability, apiSignature @frozen enum)
  - [x] All signatures from source page transcribed (count expected: 6 — 3 cases topLeading/identity/bottomTrailing, isIdentity, value, plus conformances)
  - [x] Blurb transcribed verbatim (enum definition, three cases, two derived properties)
  - [x] Notes paragraphs preserved (count expected: 5 — Equatable/Hashable/BitwiseCopyable, identity guidance, value parametric form, isIdentity returns, EmptyVisualEffect pairing)
  - [x] Source page deleted from filesystem
  - [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 1151)
  - [x] PageRegistry entry removed (line 1281)
  - [x] Lands in dense page: "Reference" section (above demos)

- [x] **ScrollTransitionConfiguration** (absorb describe-only)
  - [x] Header info captured (title, availability, apiSignature struct)
  - [x] All signatures from source page transcribed (count expected: 9 — .identity, .animated, .animated(_:), .interactive, .interactive(timingCurve:), animation(_:), threshold(_:), nested .Threshold type)
  - [x] Blurb transcribed verbatim (configuration purpose, two factory entry points, parameterized variants, tuning methods)
  - [x] Notes paragraphs preserved (count expected: 5 — .interactive is default, .animated timing, Threshold values, asymmetric form use, .identity no-op)
  - [x] Source page deleted from filesystem
  - [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 1152)
  - [x] PageRegistry entry removed (line 1280)
  - [x] Lands in dense page: "Reference" section (above demos, after ScrollTransitionPhase)

## Parent page section plan

Ordered list of `PageSection` titles in the new dense page:

1. **Header** — title "View/scrollTransition", summary blurb, availability (macOS 14.0+), API signature footer
2. **Reference (ScrollTransitionPhase & ScrollTransitionConfiguration describe content)** — describes both enum and struct above all demos, placed per describe-track placement rule
3. **Default scrollTransition** — default symmetric form with opacity demo, variants (scale+opacity, phase.value parametric, configuration .animated), states (axis override), notes
4. **Top/bottom variant** — asymmetric topLeading/bottomTrailing form with interactive/animated demo, variants (asymmetric scale, asymmetric thresholds), states (axis override), notes
5. **Notes** — consolidated HIG guidance on scroll transitions

## Sign-off

- Implementer: Claude Opus 4.7 (1M context) — 2026-05-05
- Spec-compliance reviewer: Claude Opus 4.7 (1M context) — 2026-05-05 — APPROVED (commit 0727c68; all 36 checklist boxes verified; section order matches plan; describe-track placement satisfied; Apple primitives only; parent leaf retained, 3 absorbed leaves removed from Catalog+SwiftUI.swift and PageRegistry.swift; symbol maps to ScrollTransitionPage())
- Code-quality reviewer: Claude Opus 4.7 (1M context) — 2026-05-05 — APPROVED (build clean; L-001 grep clean; L-012 grep clean; Apple primitives only — every demo uses real `.scrollTransition` calls, `EmptyVisualEffect` chains, and `LazyHStack`/`ScrollView`; semantic tokens throughout — `.primary`/`.secondary`/`.tertiary`/`.separator`/`.tint`/`.background.secondary`/`.fill.tertiary`, zero hex or hand-mixed RGBA; rhythm matches PaddingPage / TypographyPage — single ScrollView + VStack(spacing: 32) + PageSection per topic, describe-track sections placed above demos, header/notes/card helpers shaped identically; `noteRow` uses `Label` so SF Symbol weight inherits from `.headline` per macuix-rules.md; no L-001/L-012 violations, no dead code, no parameter sprawl, no copy-paste duplication beyond rhythm-required structure)

## Manifest metadata

**Created:** 2026-05-05
**Task ID:** A5
**Phase:** Phase A — SwiftUI modifier-family collapses (existing populated pages)
**Manifest version:** 1.0
**Discovery agent:** Claude Haiku 4.5
