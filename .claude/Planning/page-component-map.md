# Page-Component Map — Phase 1 Manifest

This is the unified manifest for the SwiftKit MVP page list. Per-framework details (every tile, every Apple type name) live in the linked sub-files; this document is for the Phase 1 user-checkpoint review.

**Status:** Awaiting Nathan's approval before Phase 2 scaffolding begins.

## Summary

| Heading | Folders | Leaves | Tiles (approx) | Per-framework manifest |
|---|---|---|---|---|
| Reference | flat (single-folder collapse) | 5 | 93 | [`page-component-map-reference.md`](page-component-map-reference.md) |
| SwiftUI | 12 | 39 confirmed + 5 proposed | ~926 (tile-gate) + ~340 (type-gate routed) | [`page-component-map-swiftui.md`](page-component-map-swiftui.md) |
| AppKit | flat (single-folder collapse) | 5 confirmed + 1 proposed | 26 confirmed + 3 proposed | [`page-component-map-appkit.md`](page-component-map-appkit.md) |

**Total:** ~49 confirmed leaves, ~6 proposed leaves, ~1,300+ tiles.

Sort-decisions audit trail: [`sort-decisions.md`](sort-decisions.md) (and per-framework variants).

## Open questions for Nathan checkpoint

The following items need explicit decisions before Phase 2 dispatches. Each is a yes/no / pick-one. Per-framework manifests carry the rationale.

### A. PlanningTree adjustments (yes/no per item)

1. **SwiftUI > App Structure > Environment** *(new leaf, 165 tiles)* — `EnvironmentValues`, `Environment` property wrapper, `EnvironmentKey` protocol, plus 162 individual environment property docs. Heavily-used API. Without approval, all 165 docs are deferred.
2. **SwiftUI > App Structure > State and Bindings** *(new leaf, 11 tiles)* — `State`, `Binding`, `ObservedObject`, `StateObject`, `EnvironmentObject`, `Bindable`, `DynamicProperty`. Core state-management primitives. Without approval, all 11 are deferred.
3. **SwiftUI > Layout > Custom Layout** *(new leaf, 14 tiles)* — `Layout` protocol, `AnyLayout`, layout helpers. Concrete user-facing API. Without approval, all 14 are deferred.
4. **SwiftUI > App Structure > AppKit Integration** *(new leaf, 13 tiles)* — `NSViewRepresentable`, `NSViewControllerRepresentable`, `NSHostingView`, `NSHostingController`. macOS-specific bridges. Without approval, all 13 are deferred.
5. **SwiftUI > App Structure > View Fundamentals** *(new minimal leaf, ~5 tiles)* — `AnyView`, `EmptyView`, plus a description-only tile each for `View`, `ViewModifier`, `ViewBuilder`. Recommend yes (minimal page).
6. **SwiftUI > Images and Shapes — fold AsyncImage into Image** — Drop AsyncImage as a separate leaf (only one struct + one enum); fold tiles onto Image page.
7. **SwiftUI > Presentation — fold FullScreenCover into Sheet** — Only 2 method docs in FullScreenCover. Drop the leaf, fold tiles onto Sheet.
8. **SwiftUI > Animation and Effects > Glass Effects** *(new optional leaf)* — macOS 26 Liquid Glass APIs (`GlassBackgroundEffect`, `GlassEffectContainer`, `GlassEffectTransition`, `GlassButtonStyle`, `GlassProminentButtonStyle`). Currently scattered as tiles on Button/Canvas; could be its own page.
9. **AppKit > NSGlassEffectView** *(new leaf, 3 tiles)* — macOS 26 Liquid Glass AppKit primitive. No SwiftUI equivalent. Directly relevant to Pommora.

### B. Mirror gap (action required before Phase 3)

10. **`LinearGradient`, `RadialGradient`, `AngularGradient`** — Real macOS SwiftUI types absent from `Documentation/SwiftUI/`. Recommend running a targeted recapture (`Documentation/_index/recapture-targets.sh`) for these 3 URLs before Phase 3 begins. They tile onto the Gradient page once captured.

### C. Sample-code case-by-case review (per Phase 0c rule)

11. **13 SwiftUI sampleCode docs were blanket-deferred by the SwiftUI sort agent** (it operated on the pre-Phase-0c rule). Per the Phase 0c spec update, sampleCode is now case-by-case. The 13 docs need a targeted review pass — promote each as a tile if it illustrates a focused component pattern; defer if it's a tutorial or full-app demo. Same applies for the 9 AppKit sampleCode docs flagged as deferred.

### D. Other deferred large folders

These are deferred entirely (no tiles surface) and need only your acknowledgment:

- `technology-specific-views/` (112 docs) — MapKit/StoreKit/HealthKit/PhotosPicker/TipKit/WebKit/Wallet integration; out of scope for a macOS SwiftUI primitive gallery.
- `previews-in-xcode/` (22 docs) — Xcode tooling, not UI primitives.
- `immersive-spaces/` (22 docs) — visionOS only.
- `uikit-integration/` (14 docs), `watchkit-integration/` (4 docs) — non-macOS bridges.
- `app-extensions/` (19 docs), `system-events/` (17 docs), `persistent-storage/` (8 docs), `preferences/` (11 docs) — non-UI infrastructure.

### E. AppKit secondary considerations

- **`NSBackgroundExtensionView`** (macOS 26 layout helper) — too narrow for its own page; would tile naturally on NSGlassEffectView page if approved.
- **`NSHostingMenu`** — would tile on a hypothetical NSMenu page (not in PlanningTree); deferred.
- **`NSVisualEffectView`** — SwiftUI material modifiers cover most use cases, but AppKit version exposes more blending modes. Currently deferred.

## Verification

- Every doc kind in the active corpus (16 distinct values, 2,249 docs total) is bucketed: tile / orphan / deferred. No silent drops.
- Classifier gate respected across all three sorts: no `kind: method`, `kind: property`, `kind: init`, `kind: func`, `kind: var`, `kind: case`, `kind: instance method` was promoted to a page entry.
- No topic-page or article surfaces in any manifest (Phase 0b + 0c archived these).
- 5 method docs misclassified as `kind: article` (clipboard / focus modifiers) are routed as tiles to their parent component pages per Phase 0b restoration.

## What you're approving

By approving this manifest, you agree to:
1. The 49 confirmed leaves listed in per-framework manifests.
2. Your decisions on items A–E above.
3. The recapture step (item B) before Phase 3 if you accept the recommendation.
4. The classifier-gate routing of every doc into tile / orphan / deferred buckets.

Once approved, Phase 2 dispatches: rebuild `GalleryRegistry` from this manifest (sequential, single agent), then generate per-folder page-file scaffolds (parallel, one agent per folder).
