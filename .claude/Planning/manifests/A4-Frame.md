# A4 — FramePage Coverage Manifest

**Parent page:** SwiftKit/Pages/SwiftUI/LayoutAdjustments/FramePage.swift (new)
**Parent leaf location:** Catalog+SwiftUI.swift, `swiftui.layout-adjustments` subsection, lines 961–967 (5 leaves to consolidate into 1)
**Status:** reviewed

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | View/frame(width:height:alignment:) | Pages/SwiftUI/LayoutAdjustments/FrameFixedPage.swift | View/frame(width:height:alignment:) — fixed-size invisible frame | Documentation/SwiftUI/layout-adjustments/frame(width:height:alignment:).md | gallery | "frame(width:height:alignment:) — fixed frame" |
| 2 | View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:) | Pages/SwiftUI/LayoutAdjustments/FrameMinIdealMaxPage.swift | View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:) — flexible frame with min/ideal/max | Documentation/SwiftUI/layout-adjustments/frame(minwidth:idealwidth:maxwidth:minheight:idealheight:maxheight:alignment:).md | gallery | "frame(minWidth:…maxHeight:alignment:) — flexible frame" |
| 3 | View/containerRelativeFrame(_:alignment:) | Pages/SwiftUI/LayoutAdjustments/ContainerRelativeFrameAxesPage.swift | View/containerRelativeFrame(_:alignment:) — axes variant | Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:).md | gallery | "containerRelativeFrame(_:alignment:) — axes variant" |
| 4 | View/containerRelativeFrame(_:alignment:_:) | Pages/SwiftUI/LayoutAdjustments/ContainerRelativeFrameClosurePage.swift | View/containerRelativeFrame(_:alignment:_:) — closure variant (custom sizing math) | Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:_:).md | gallery | "containerRelativeFrame(_:alignment:_:) — closure variant" |
| 5 | View/containerRelativeFrame(_:count:span:spacing:alignment:) | Pages/SwiftUI/LayoutAdjustments/ContainerRelativeFrameGridPage.swift | View/containerRelativeFrame(_:count:span:spacing:alignment:) — grid variant (count/span slots) | Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:count:span:spacing:alignment:).md | gallery | "containerRelativeFrame(_:count:span:spacing:alignment:) — grid variant" |

## Per-leaf coverage checklist

### Leaf 1: View/frame(width:height:alignment:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 3 — alignment values, width-only, height-only, shape filling frame)
- [x] States demos transferred (count expected: 1 — both nil no-op)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "frame(width:height:alignment:) — fixed frame"

### Leaf 2: View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 4 — min/max bounded text, fill horizontal fixed height, both axes flexible, idealWidth + fixedSize)
- [x] States demos transferred (count expected: 1 — single-bound shorthand)
- [x] Notes paragraphs preserved (3 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "frame(minWidth:…maxHeight:alignment:) — flexible frame"

### Leaf 3: View/containerRelativeFrame(_:alignment:)
- [x] Header info captured (title, availability macOS 14.0+, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — horizontal-only, alignment parameter explained)
- [x] States demos transferred (count expected: 1 — defaults to .center alignment)
- [x] Notes paragraphs preserved (3 notes present: container definition, safe-area subtracting, closure/grid variant guidance)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "containerRelativeFrame(_:alignment:) — axes variant"

### Leaf 4: View/containerRelativeFrame(_:alignment:_:)
- [x] Header info captured (title, availability macOS 14.0+, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — per-axis math, aspect ratio + container width)
- [x] States demos transferred (count expected: 1 — alignment parameter)
- [x] Notes paragraphs preserved (3 notes present: closure semantics, use case, per-axis invocations)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "containerRelativeFrame(_:alignment:_:) — closure variant"

### Leaf 5: View/containerRelativeFrame(_:count:span:spacing:alignment:)
- [x] Header info captured (title, availability macOS 14.0+, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 2 — span > 1 wide tiles, single-card paged layout equivalent)
- [x] States demos transferred (count expected: 1 — sizing formula breakdown)
- [x] Notes paragraphs preserved (3 notes present: safeAreaPadding pairing, aspectRatio composition, axis-set semantics)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed
- [x] Lands in subsection: "containerRelativeFrame(_:count:span:spacing:alignment:) — grid variant"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense FramePage, with one-line description of contents.

1. **Header** — Title ("Frame"), summary ("Fixed and flexible frame sizing, container-relative frames with axes/closure/grid variants"), availability (macOS 10.15+ base; macOS 14.0+ for containerRelativeFrame), primary apiSignatures
2. **frame(width:height:alignment:) — fixed frame** — Fixed-size invisible frame; alignment within frame; width/height/both/neither variants; no-op when both nil; shapes fill frame
3. **frame(minWidth:…maxHeight:alignment:) — flexible frame** — Flexible frame with min/ideal/max constraints; all parameters optional; .infinity pattern; interaction with fixedSize(); sizing proposal semantics
4. **containerRelativeFrame(_:alignment:) — axes variant** — Size relative to nearest container (window, NavigationSplitView, TabView, scroll view); axes selector; safe-area subtraction; centering by default
5. **containerRelativeFrame(_:alignment:_:) — closure variant** — Custom sizing math via closure receiving container length and axis; per-axis branching; proportional and fractional sizing patterns
6. **containerRelativeFrame(_:count:span:spacing:alignment:) — grid variant** — Grid-style sizing: divide container into count slots, claim span slots; carousel and multi-column patterns; spacing math; aspectRatio pairing
7. **Notes from the HIG** — Consolidated guidance: frame() wraps without clipping (child can overshoot), alignment only visible when frame size differs from child, shapes always fill proposed frame, containerRelativeFrame safe-area semantics, use closure/grid overloads for custom math, sizing precedence and layout hierarchy

## Sign-off

- **Implementer:** Claude (Opus 4.7, Phase 6 A4 — 2026-05-05)
- **Spec-compliance reviewer:** Claude (Opus 4.7, Phase 6 A4 — 2026-05-05) — all 50 boxes verified against commit 1121303
- **Code-quality reviewer:** (to be filled)

---

## Manifest metadata

- **Manifest created:** 2026-05-05
- **Task ID:** A4
- **Parent type:** Frame (modifier family consolidation)
- **Framework:** SwiftUI
- **Target location:** SwiftKit/Pages/SwiftUI/LayoutAdjustments/FramePage.swift
- **Catalog subsection:** swiftui.layout-adjustments
- **Leaf count:** 5 (all gallery, no describe-only type leaves)
- **Related but not absorbed:** FixedSizeAxesPage.swift and FixedSizeBothPage.swift exist in LayoutAdjustments but are part of the separate fixedSize(_:) modifier family (not frame variants); they remain separate. View/frame(depth:alignment:) and View/frame(minDepth:idealDepth:maxDepth:alignment:) are 3D variants in Catalog but not yet implemented as pages.
- **Notes:** No describe-only type leaves (SafeAreaRegions in A2, ScenePadding in A3 pattern). Frame consolidation is purely modifier-family overload grouping. Frame sizing interacts with fixedSize() in the flexible-frame demo (Leaf 2 variant 4); notes clarify precedence. ContainerRelativeFrame has three distinct overloads (axes, closure, grid); grouping by parent type rather than by overload count.
