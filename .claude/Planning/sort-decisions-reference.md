# Sort Decisions — Reference heading

Audit trail for Phase 1 sorting of the Reference heading. One bullet per decision.

## Page-list adjustments
- **None.** PlanningTree's 5 Reference leaves (Typography, Color, Materials, Motion, SF Symbols) all map to canonical content already on disk at `SwiftKit/SwiftKit/Pages/Reference/`. No additions, no removals, no renames.

## Source authority
- Reference pages are user-defined synthesis pages, not 1:1 with Apple's type-doc URLs. The 5 existing `*GalleryPage.swift` files at `SwiftKit/SwiftKit/Pages/Reference/` are the authoritative content shape — every `VariantTile` and `ReferenceTile` declared in those files becomes a manifest tile entry.
- `Documentation/HIG/foundations/{typography,color,materials,motion,sf-symbols}.md` are the docPath references in each page's `GalleryItem`. These HIG docs are now archived under `Documentation/_archive/guides/HIG/` per Phase 0b — but the Reference pages don't read them at runtime, only at authoring time. No action needed.

## Classifier-gate compliance
- No `kind: method` / `kind: property` / `kind: instance method` / `kind: instance-method` / `kind: init` / `kind: func` doc was promoted to a Reference page entry.
- All Reference page entries are conceptual groupings (design tokens, semantic roles, accessibility hooks) — not Apple type names or method signatures. The classifier gate is structurally satisfied because Reference pages don't take type-doc inputs at all.

## Tile-naming convention
- Tile headers for Reference are written as the API expression they demonstrate (e.g. `.font(.largeTitle)`, `.background(.thinMaterial, in: Capsule())`, `Image(systemName: "heart")`) rather than as bare type names. This matches the user's stated rule: "the headings of the items on-page mirror official documentation" — for Reference, the documentation expression IS the API call form, since these pages document patterns of use rather than type definitions.
- `ReferenceTile` entries (the boxed conceptual notes near the bottom of each page) keep their canonical type names as headers (e.g. `Material`, `Animation`, `SymbolRenderingMode`, `HierarchicalShapeStyle`) — those ARE Apple type names and follow the standard verbatim-type-name rule.

## Decisions on guide-orphan candidates routed to Reference
- `SymbolEffect` (HIG orphan) — deferred. May warrant a tile on SF Symbols if macOS supports it; verify in Phase 3 against `Documentation/SwiftUI/symbols/symboleffect.md` (or wherever it lives). Not promoted for MVP scaffold.
- `SymbolScale` (HIG orphan) — same as above.
- `RequestReviewAction` (HIG orphan) — out of scope for Reference. Routed to SwiftUI sort agent's deferred list (likely belongs near Presentation if anywhere).
- `LinearGradient` (SwiftUI orphan candidate from Phase 0b) — out of scope for Reference; the SwiftUI sort agent owns its routing. The Materials page's `LinearGradient` usage in `MaterialsGalleryPage.swift` is incidental layout chrome, not a documented tile.

## Tile counts
- Typography: 26 tiles (11 TextStyle + 8 Weight + 4 Design + 3 Reference)
- Color: 15 tiles (4 hierarchy + 3 accent/tint + 4 surface/separator + 2 scheme swatches + 2 reference)
- Materials: 12 tiles (6 standard materials + 3 Liquid Glass + 3 reference)
- Motion: 19 tiles (10 curves + 5 transitions + 1 reduce-motion + 3 reference)
- SF Symbols: 21 tiles (4 basics + 4 rendering modes + 4 variants + 4 weights + 3 image scales + 2 reference)
- **Total: 93 Reference tiles across 5 pages.**

## Open questions / for Nathan checkpoint
- Reference pages don't have an "Apple type" anchor in the same way SwiftUI/AppkKit pages do — the `signature` field on each `GalleryItem` is a freeform descriptor. Confirm this is the intended shape before Phase 2 scaffolding.
- The `ReferenceTile` view type used by these 5 pages is a Reference-specific scaffold not used elsewhere (yet). It's defined inline (Materials/Motion/etc. each declare or share their own tile views). Phase 2 will need to confirm whether Reference shares the standard `VariantTile` scaffold or keeps its specialized tiles.
