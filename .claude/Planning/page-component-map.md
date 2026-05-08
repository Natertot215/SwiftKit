# Page-Component Map — Phase 1 Manifest

This is the unified manifest for the SwiftKit MVP page list. Per-framework details (every tile, every Apple type name) live in the linked sub-files; this document captured the Phase 1 user-checkpoint decisions.

**Status:** ✅ APPROVED 2026-05-07. Phase 2 ✅ DONE. Phase 3 **REDESIGNED 2026-05-07** — manifest itself unchanged; Phase 3 dispatch shape replaced with per-page bespoke integration on opus per Nathan's redesign directive. See [`../framework.md`](../framework.md) Phase 3 section, [`../handoff.md`](../handoff.md) for tomorrow's queue, [`page-logic-log.md`](page-logic-log.md) for the new per-page reasoning record.

## Summary (post-resolution)

| Heading | Folders | Leaves | Tiles (approx) | Per-framework manifest |
|---|---|---|---|---|
| Reference | flat (single-folder collapse) | 5 | 93 | [`page-component-map-reference.md`](page-component-map-reference.md) |
| SwiftUI | 12 | 63 (60 from sort + 5 added: Environment trimmed, State and Bindings, Custom Layout, AppKit Integration, View Fundamentals; minus 2 folded: AsyncImage→Image, FullScreenCover→Sheet) | ~960 | [`page-component-map-swiftui.md`](page-component-map-swiftui.md) |
| AppKit | flat (single-folder collapse) | 6 (5 from sort + 1 added: NSGlassEffectView) | 29 | [`page-component-map-appkit.md`](page-component-map-appkit.md) |

**Total: 74 leaves**, ~1,082+ tiles.

Sort-decisions audit trail: [`sort-decisions.md`](sort-decisions.md) (and per-framework variants).

## Phase 1 checkpoint resolution (locked 2026-05-07)

### A. PlanningTree adjustments

| # | Item | Decision |
|---|---|---|
| A1 | SwiftUI > App Structure > **Environment** | ✅ **Yes — TRIMMED.** Add leaf with 3 anchor tiles (`EnvironmentValues`, `Environment`, `EnvironmentKey`). 162 individual environment property docs DEFERRED to post-V1. |
| A2 | SwiftUI > App Structure > **State and Bindings** | ✅ **Yes.** Add leaf (11 tiles from `model-data/`). |
| A3 | SwiftUI > Layout > **Custom Layout** | ✅ **Yes.** Add leaf (13 tiles — 14 source docs minus 1 sampleCode `composing-custom-layouts-with-swiftui` deferred per C11). |
| A4 | SwiftUI > App Structure > **AppKit Integration** | ✅ **Yes.** Add leaf (13 tiles from `appkit-integration/`). |
| A5 | SwiftUI > App Structure > **View Fundamentals** | ✅ **Yes — minimal.** 5 tiles: `AnyView`, `EmptyView` (live render), plus description-only `View`, `ViewModifier`, `ViewBuilder`. |
| A6 | SwiftUI > Images and Shapes > **AsyncImage** | ✅ **Folded into Image** — drop separate leaf. |
| A7 | SwiftUI > Presentation > **FullScreenCover** | ✅ **Folded into Sheet** — drop separate leaf. |
| A8 | SwiftUI > Animation and Effects > **Glass Effects** | ❌ **No leaf.** macOS 26 Liquid Glass APIs stay scattered as tiles on Button / Canvas / etc. |
| A9 | AppKit > **NSGlassEffectView** | ✅ **Yes.** 3 tiles only (`NSGlassEffectView`, `NSGlassEffectView.Style`, `NSGlassEffectContainerView`). NSBackgroundExtensionView NOT included (deferred). |

### B. Mirror gap

10. **`LinearGradient`, `RadialGradient`, `AngularGradient`** — ✅ **B10 CLOSED 2026-05-07.** Recapture script ran cleanly; 3 docs landed in `Documentation/SwiftUI/drawing-and-graphics/`. 3 tiles inserted in source-order into the Gradient page (now 17 tiles). `GradientGalleryPage.swift` and the Phase 2.5 audit both reflect the new count.

### C. Sample-code case-by-case review

11. **22 sampleCode docs** (13 SwiftUI + 9 AppKit) — ✅ **C11 RESOLVED 2026-05-07: 22/22 deferred from tiles.** None fit the single-primitive-render tile model (most are stub references to downloadable WWDC sample apps; the two substantive ones span multiple primitives). Phase 3 implementers MAY cite specific samples in tile descriptions where they add context. Per-doc rationales in [`sort-decisions-swiftui.md`](sort-decisions-swiftui.md) and [`sort-decisions-appkit.md`](sort-decisions-appkit.md).

### D. Deferred large folders

✅ **Acknowledged.** No tiles surface from any of the following:

- `technology-specific-views/` (112 docs) — MapKit/StoreKit/HealthKit/PhotosPicker/TipKit/WebKit/Wallet integration; out of scope for a macOS SwiftUI primitive gallery.
- `previews-in-xcode/` (22 docs) — Xcode tooling, not UI primitives.
- `immersive-spaces/` (22 docs) — visionOS only.
- `uikit-integration/` (14 docs), `watchkit-integration/` (4 docs) — non-macOS bridges.
- `app-extensions/` (19 docs), `system-events/` (17 docs), `persistent-storage/` (8 docs), `preferences/` (11 docs) — non-UI infrastructure.

### E. AppKit secondary considerations

- **`NSBackgroundExtensionView`** — Deferred (per A9 decision; not added to NSGlassEffectView leaf).
- **`NSHostingMenu`** — Deferred (no NSMenu page in PlanningTree).
- **`NSVisualEffectView`** — Deferred (SwiftUI material modifiers cover most use cases).

## Verification

- Every doc kind in the active corpus (16 distinct values, 2,249 docs total) is bucketed: tile / orphan / deferred. No silent drops.
- Classifier gate respected across all three sorts: no `kind: method`, `kind: property`, `kind: init`, `kind: func`, `kind: var`, `kind: case`, `kind: instance method` was promoted to a page entry.
- No topic-page or article surfaces in any manifest (Phase 0b + 0c archived these).
- 5 method docs misclassified as `kind: article` (clipboard / focus modifiers) are routed as tiles to their parent component pages per Phase 0b restoration.

## Status post-checkpoint

The downstream phases this manifest unlocked are tracked in [`../handoff.md`](../handoff.md). The manifest itself is locked — any further changes belong in a new dated checkpoint, not edits in place.
