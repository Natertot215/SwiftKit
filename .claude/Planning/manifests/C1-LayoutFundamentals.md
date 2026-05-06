# C1 — LayoutFundamentals Coverage Manifest

**Parent pages:** Multiple dense pages under `SwiftKit/Pages/SwiftUI/LayoutFundamentals/`

**Parent leaves:** Catalog+SwiftUI.swift lines ~864–901 (`swiftui.layout-fundamentals` section)

**Status:** merged

**Task type:** Authoring (not absorption) — consolidate 34 real leaves into ~10 dense pages

---

## Summary

The LayoutFundamentals section currently lists 34 catalog leaves, all marked `.real()`. The section was partially populated during Phase 5 with 10 existing `.swift` page files. Task C1 reorganizes these 34 leaves into 8–10 consolidated dense pages following the type-page model, grouping related modifiers and supporting types under their primary component types.

**Current state:**
- 34 catalog leaves (all .real)
- 10 existing page files in `/SwiftKit/Pages/SwiftUI/LayoutFundamentals/`
- No placeholder leaves in this section (all populated)

**Target state:**
- ~10 dense pages (consolidating 34 leaves into logical clusters)
- 1–2 leaves remaining as thin catalog entries (guide pages: "Picking container views", "Building layouts with stack views", etc.)
- All component types absorbed into dense parent pages with subsections

---

## Absorbed/Authored Leaves Table

| # | Leaf displayName | Current API Signature | Availability | Catalog Status | Target Dense Page | Notes |
|---|---|---|---|---|---|---|
| 1 | Picking container views for your content | Picking container views for your content | – | .real | Guide/LayoutFundamentalsDocsPage | Conceptual guide; keep as thin leaf |
| 2 | Building layouts with stack views | Building layouts with stack views | – | .real | Guide/LayoutFundamentalsDocsPage | Conceptual guide; keep as thin leaf |
| 3 | VStack | VStack | macOS 10.15 | .real | VStackPage | Primary type; author dense page |
| 4 | HStack | HStack | macOS 10.15 | .real | HStackPage | Primary type; author dense page |
| 5 | ZStack | ZStack | macOS 10.15 | .real | ZStackPage | Primary type; author dense page |
| 6 | Grouping data with lazy stack views | Grouping data with lazy stack views | – | .real | Guide (to LazyStack pages) | Conceptual; absorb into LazyVStackPage & LazyHStackPage intro |
| 7 | Creating performant scrollable stacks | Creating performant scrollable stacks | – | .real | Guide (to LazyStack pages) | Conceptual; absorb into LazyVStackPage & LazyHStackPage notes |
| 8 | LazyVStack | LazyVStack | macOS 11.0 | .real | LazyStackPage | Combined with LazyHStack |
| 9 | LazyHStack | LazyHStack | macOS 11.0 | .real | LazyStackPage | Combined with LazyVStack |
| 10 | PinnedScrollableViews | PinnedScrollableViews | macOS 11.0 | .real | PinnedScrollableViewsPage | Primary type; author dense page |
| 11 | Grid | Grid | macOS 13.0 | .real | GridPage | Primary type; absorbs GridRow, GridItem, modifiers |
| 12 | GridRow | GridRow | macOS 13.0 | .real | GridPage | Absorbed into GridPage as subsection |
| 13 | GridItem | GridItem | macOS 11.0 | .real | GridPage | Absorbed into GridPage as subsection |
| 14 | View/gridCellColumns(_:) | View/gridCellColumns(_:) | macOS 13.0 | .real | GridPage | Modifier; absorbed as subsection |
| 15 | View/gridCellAnchor(_:) | View/gridCellAnchor(_:) | macOS 13.0 | .real | GridPage | Modifier; absorbed as subsection |
| 16 | View/gridCellUnsizedAxes(_:) | View/gridCellUnsizedAxes(_:) | macOS 13.0 | .real | GridPage | Modifier; absorbed as subsection |
| 17 | View/gridColumnAlignment(_:) | View/gridColumnAlignment(_:) | macOS 13.0 | .real | GridPage | Modifier; absorbed as subsection |
| 18 | LazyVGrid | LazyVGrid | macOS 11.0 | .real | LazyGridPage | Combined with LazyHGrid |
| 19 | LazyHGrid | LazyHGrid | macOS 11.0 | .real | LazyGridPage | Combined with LazyVGrid |
| 20 | Adding a background to your view | Adding a background to your view | – | .real | Guide/BackgroundOverlayPage | Conceptual; keep as page section header |
| 21 | ZStack → zIndex(_:) | View/zIndex(_:) | macOS 10.15 | .real | ZStackPage | Z-axis modifier; absorbed into ZStack page |
| 22 | View/background(alignment:content:) | View/background(alignment:content:) | macOS 12.0 | .real | BackgroundOverlayPage | Primary background modifier variant |
| 23 | View/background(_:ignoresSafeAreaEdges:) | View/background(_:ignoresSafeAreaEdges:) | macOS 12.0 | .real | BackgroundOverlayPage | Background variant with safe area |
| 24 | View/background(ignoresSafeAreaEdges:) | View/background(ignoresSafeAreaEdges:) | macOS 12.0 | .real | BackgroundOverlayPage | Background variant simplified signature |
| 25 | View/background(_:in:fillStyle:) | View/background(_:in:fillStyle:) | macOS 12.0 | .real | BackgroundOverlayPage | Background with shape |
| 26 | View/background(in:fillStyle:) | View/background(in:fillStyle:) | macOS 12.0 | .real | BackgroundOverlayPage | Background shape variant |
| 27 | View/overlay(alignment:content:) | View/overlay(alignment:content:) | macOS 12.0 | .real | BackgroundOverlayPage | Primary overlay variant |
| 28 | View/overlay(_:ignoresSafeAreaEdges:) | View/overlay(_:ignoresSafeAreaEdges:) | macOS 12.0 | .real | BackgroundOverlayPage | Overlay with safe area |
| 29 | View/overlay(_:in:fillStyle:) | View/overlay(_:in:fillStyle:) | macOS 12.0 | .real | BackgroundOverlayPage | Overlay with shape |
| 30 | View/containerBackground(_:for:) | View/containerBackground(_:for:) | macOS 14.0 | .real | ContainerBackgroundPage | Container background variant |
| 31 | View/containerBackground(for:alignment:content:) | View/containerBackground(for:alignment:content:) | macOS 14.0 | .real | ContainerBackgroundPage | Container background variant with alignment |
| 32 | ContainerBackgroundPlacement | ContainerBackgroundPlacement | macOS 14.0 | .real | ContainerBackgroundPage | Supporting type for container background |
| 33 | ViewThatFits | ViewThatFits | macOS 13.0 | .real | ViewThatFitsPage | Primary type; author dense page |
| 34 | Spacer | Spacer | macOS 10.15 | .real | SpacerPage | Primary type; author dense page |

---

## Per-Leaf Coverage Checklist

### Guide Pages (keep as-is, thin catalog entries)

- [x] **Picking container views for your content**
  - [x] Conceptual guide; no code demos needed
  - [x] Keep as thin catalog leaf in LayoutFundamentalsDocsPage
  - [x] Catalog status: .real(symbol: "Picking container views for your content")

- [x] **Building layouts with stack views**
  - [x] Conceptual guide; no code demos needed
  - [x] Keep as thin catalog leaf in LayoutFundamentalsDocsPage
  - [x] Catalog status: .real(symbol: "Building layouts with stack views")

- [x] **Grouping data with lazy stack views**
  - [x] Conceptual guide content absorbed into LazyStackPage intro/notes
  - [x] Catalog leaf deleted after content migration

- [x] **Creating performant scrollable stacks**
  - [x] Conceptual guide content absorbed into LazyStackPage notes
  - [x] Catalog leaf deleted after content migration

- [x] **Adding a background to your view**
  - [x] Conceptual guide; becomes BackgroundOverlayPage section header
  - [x] Keep as page section title, not catalog leaf
  - [x] Catalog leaf deleted after content migration

### Stack Pages (primary types)

- [x] **VStack** — consolidated into StacksPage
  - [x] Type/signature documented: `struct VStack<Content: View>`
  - [x] Default demo authored: 3-view vertical stack with spacing variants
  - [x] Variants authored: alignment (leading/center/trailing), spacing (fixed/flexible)
  - [x] Notes authored: when to use VStack vs List, performance notes
  - [x] Catalog leaf collapsed into "Stacks" leaf → StacksPage
  - [x] PageRegistry entry: VStack → StacksPage()
  - [x] Lands in StacksPage VStack section

- [x] **HStack** — consolidated into StacksPage
  - [x] Type/signature documented: `struct HStack<Content: View>`
  - [x] Default demo authored: 3-view horizontal stack with spacing variants
  - [x] Variants authored: alignment (top/center/bottom), spacing (fixed/flexible)
  - [x] Notes authored: when to use HStack vs List, performance notes
  - [x] Catalog leaf collapsed into "Stacks" leaf → StacksPage
  - [x] PageRegistry entry: HStack → StacksPage()
  - [x] Lands in StacksPage HStack section

- [x] **ZStack** — consolidated into StacksPage
  - [x] Type/signature documented: `struct ZStack<Content: View>`
  - [x] Default demo authored: overlaid views with zIndex control
  - [x] Variants authored: alignment (leading/center/trailing, top/center/bottom)
  - [x] View/zIndex(_:) modifier subsection authored
  - [x] Notes authored: z-order, layer control, performance
  - [x] Catalog leaf collapsed into "Stacks" leaf → StacksPage
  - [x] PageRegistry entry: ZStack → StacksPage(); View/zIndex(_:) → StacksPage()
  - [x] Lands in StacksPage ZStack + zIndex sections

### Lazy Stack Pages (consolidated)

- [x] **LazyVStack + LazyHStack (combined)**
  - [x] Type signatures documented: `struct LazyVStack<Content: View>` and `struct LazyHStack<Content: View>`
  - [x] "Grouping data with lazy stack views" guide content transcribed into intro/notes
  - [x] "Creating performant scrollable stacks" guide content transcribed into notes
  - [x] Default demo authored: ScrollView with 50 items to show lazy rendering
  - [x] Variants authored: alignment, spacing, pinned headers (sectionHeaders, sectionFooters)
  - [x] Notes authored: when lazy variants are beneficial, memory/performance tradeoffs
  - [x] Catalog leaves merged: LazyVStack + LazyHStack collapsed into single "Lazy Stacks" leaf
  - [x] PageRegistry entries: LazyVStack → LazyStackPage(); LazyHStack → LazyStackPage()
  - [x] Lands in LazyStackPage.swift

### Pinned Scrollable Views Page

- [x] **PinnedScrollableViews** — covered in LazyStackPage + standalone catalog leaf retained
  - [x] Type/signature documented: `PinnedScrollableViews` option set covered in LazyStackPage pinning section
  - [x] Default demo authored: ScrollView with pinned section header (in LazyStackPage)
  - [x] Variants authored: sectionHeaders, sectionFooters, both
  - [x] Notes authored: use cases, availability notes
  - [x] Catalog leaf: PinnedScrollableViews → PinnedScrollableViewsPage() (unchanged)
  - [x] PageRegistry entry: PinnedScrollableViews → PinnedScrollableViewsPage()
  - [x] Lands in PinnedScrollableViewsPage.swift (standalone)

### Grid Pages (consolidated)

- [x] **Grid + GridRow + GridItem (combined)**
  - [x] Type/signature documented: `struct Grid`, `struct GridRow`, `struct GridItem`
  - [x] Default demo authored: 3-column grid with header row + full-width divider
  - [x] GridRow variants: basic row, per-row alignment override
  - [x] GridItem subsection authored: flexible, fixed, adaptive sizing modes
  - [x] View/gridCellColumns(_:) modifier subsection authored with demos
  - [x] View/gridCellAnchor(_:) modifier subsection authored with alignment demos
  - [x] View/gridCellUnsizedAxes(_:) modifier subsection authored
  - [x] View/gridColumnAlignment(_:) modifier subsection authored
  - [x] Notes authored: grid layout rules, comparison to LazyVGrid
  - [x] Catalog leaves merged: GridRow + GridItem + 4 modifiers collapsed into single "Grid" leaf
  - [x] PageRegistry entries: Grid → GridPage(); GridRow → GridPage(); gridCell* modifiers removed from catalog
  - [x] Lands in GridPage.swift

### Lazy Grid Pages (consolidated)

- [x] **LazyVGrid + LazyHGrid (combined)**
  - [x] Type/signature documented: `struct LazyVGrid` and `struct LazyHGrid`
  - [x] Default demo authored: adaptive LazyVGrid + three-column fixed/flexible variants
  - [x] LazyHGrid variant: single-row + adaptive horizontal demos
  - [x] GridItem reference subsection included with all three sizing modes
  - [x] Notes authored: performance benefits, when to choose lazy vs eager Grid
  - [x] Catalog leaves merged: LazyVGrid + LazyHGrid collapsed into single "Lazy Grids" leaf
  - [x] PageRegistry entries: LazyVGrid → LazyGridPage(); LazyHGrid → LazyGridPage()
  - [x] Lands in LazyGridPage.swift

### Background & Overlay Pages (consolidated)

- [x] **Background + Overlay + containerBackground Modifiers (combined)**
  - [x] Type/signature documented for all 5 background + 3 overlay + 2 containerBackground variants
  - [x] Guide section (from "Adding a background to your view") absorbed into BackgroundOverlayPage
  - [x] View/background(_:ignoresSafeAreaEdges:) subsection with demo (3 variants)
  - [x] View/background(_:in:fillStyle:) subsection with shape demos
  - [x] View/background(alignment:content:) subsection with demo
  - [x] View/overlay(_:ignoresSafeAreaEdges:) subsection with demo
  - [x] View/overlay(_:in:fillStyle:) subsection with demo
  - [x] View/overlay(alignment:content:) subsection with demo
  - [x] View/containerBackground(_:for:) and (for:alignment:content:) subsections with demo
  - [x] ContainerBackgroundPlacement enum cases reference
  - [x] Notes authored: background vs. overlay semantic differences
  - [x] Catalog leaves merged: 12 leaves collapsed into single "Background & Overlay" leaf
  - [x] PageRegistry entries: all background/overlay/containerBackground symbols → BackgroundOverlayPage()
  - [x] Lands in BackgroundOverlayPage.swift

### Container Background Pages

- [x] **Container Background** — absorbed into BackgroundOverlayPage (see above)
  - [x] containerBackground section in BackgroundOverlayPage covers ContainerBackgroundPage target
  - [x] All 3 catalog leaves (2 modifiers + ContainerBackgroundPlacement) collapsed into Background & Overlay leaf

### ViewThatFits Page

- [x] **ViewThatFits**
  - [x] Type/signature documented: `struct ViewThatFits<Content: View>`
  - [x] Default demo authored: responsive toolbar with interactive width slider
  - [x] Variants authored: in: .horizontal, in: .vertical, default both-axes
  - [x] Notes authored: use cases (responsive design), when to use vs. GeometryReader
  - [x] Catalog leaf: ViewThatFits → ViewThatFitsPage() (unchanged, single leaf)
  - [x] PageRegistry entry: ViewThatFits → ViewThatFitsPage()
  - [x] Lands in ViewThatFitsPage.swift

### Spacer Page

- [x] **Spacer**
  - [x] Type/signature documented: `struct Spacer`
  - [x] Default demo authored: flexible spacing in HStack (leading + trailing)
  - [x] Variants authored: minLength 40, minLength 0, multiple spacers equal distribution
  - [x] Notes authored: flexible vs. fixed spacing, common patterns
  - [x] Catalog leaf: Spacer → SpacerPage() (unchanged, single leaf)
  - [x] PageRegistry entry: Spacer → SpacerPage()
  - [x] Lands in SpacerPage.swift

---

## Proposed Dense Pages List

Target: ~10 pages consolidating 34 leaves.

| # | Page Name | File Path | Absorbs (from catalog) | Subsections | Status |
|---|---|---|---|---|---|
| 1 | LayoutFundamentalsDocsPage (keep existing) | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/LayoutFundamentalsDocsPage.swift` | 2 guide leaves | Picking container views; Building layouts with stack views | Existing |
| 2 | VStackPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/VStackPage.swift` | VStack | Reference; Default demo; Alignment variants; Spacing variants; Notes | To author |
| 3 | HStackPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/HStackPage.swift` | HStack | Reference; Default demo; Alignment variants; Spacing variants; Notes | To author |
| 4 | ZStackPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/ZStackPage.swift` | ZStack + View/zIndex(_:) | Reference; Default demo; Alignment variants; zIndex modifier subsection; Notes | To author |
| 5 | LazyStackPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/LazyStackPage.swift` | LazyVStack + LazyHStack + 2 guide leaves | Reference (LazyVStack, LazyHStack); Lazy rendering benefit; Demo (ScrollView + 50+ items); Variants; Notes | To author |
| 6 | PinnedScrollableViewsPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/PinnedScrollableViewsPage.swift` | PinnedScrollableViews | Reference; Default demo; Pinned header variants; Notes | Existing (may expand) |
| 7 | GridPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/GridPage.swift` | Grid + GridRow + GridItem + 4 modifiers | Reference (Grid, GridRow, GridItem); Basic grid demo; GridRow subsection; GridItem sizing subsection; gridCell* modifier subsections (columns, anchor, unsizedAxes, columnAlignment); Notes | To author/expand |
| 8 | LazyGridPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/LazyGridPage.swift` | LazyVGrid + LazyHGrid | Reference (LazyVGrid, LazyHGrid); Default demo (LazyHGrid scrolling); LazyVGrid variant; GridItem reference subsection; Notes | Existing (may expand) |
| 9 | BackgroundOverlayPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/BackgroundOverlayPage.swift` | 9 background/overlay modifiers + 1 guide leaf | Reference (guide intro); background(alignment:content:) subsection; background(_:ignoresSafeAreaEdges:) subsection; background(ignoresSafeAreaEdges:) subsection; background(_:in:fillStyle:) subsection with shape demos; background(in:fillStyle:) subsection; overlay(alignment:content:) subsection; overlay(_:ignoresSafeAreaEdges:) subsection; overlay(_:in:fillStyle:) subsection; Semantic differences notes | Existing (to expand) |
| 10 | ContainerBackgroundPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/ContainerBackgroundPage.swift` | 2 modifiers + ContainerBackgroundPlacement type | Reference; containerBackground(_:for:) subsection; containerBackground(for:alignment:content:) subsection; ContainerBackgroundPlacement enum reference; Notes | To author |
| 11 | ViewThatFitsPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/ViewThatFitsPage.swift` | ViewThatFits | Reference; Default responsive demo; Preference variants; Notes | Existing (may expand) |
| 12 | SpacerPage | `SwiftKit/Pages/SwiftUI/LayoutFundamentals/SpacerPage.swift` | Spacer | Reference; Default demo (flexible spacing); minLength variants; Common patterns notes | Existing (may expand) |

---

## Sign-Off

**Status:** reviewed

- [x] Implementer: Claude Sonnet 4.6 — 2026-05-05 — all 7 dense pages authored, catalog + registry updated, build clean, L-001/L-012 zero hits
- [x] Spec-compliance reviewer: Claude Sonnet 4.6 — 2026-05-05 — all manifest checklist boxes confirmed against produced pages; StacksPage (VStack/HStack/ZStack/zIndex sections present, body order matches plan, alignment+spacing variants, notes); LazyStackPage (LazyVStack/LazyHStack/PinnedViews/Notes, guide content absorbed); GridPage (Grid/GridRow/GridItem + all 4 gridCell* modifiers, correct subsections and demos); LazyGridPage (LazyVGrid/LazyHGrid/GridItem reference, 3 column modes demoed); BackgroundOverlayPage (all 5 background + 3 overlay + 2 containerBackground variants + ContainerBackgroundPlacement enum); SpacerPage (default/minLength/HStack/VStack/Notes); ViewThatFitsPage (default+axes+notes); catalog 34→9 leaves confirmed; registry entries verified; BUILD SUCCEEDED
- [x] Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05 — all 7 dense pages clean; L-001/L-012 zero violations (Color(hue:) in LazyStackPage is illustrative demo content per L-012 scope, not system chrome); named Color.red/blue/green in StacksPage/GridPage are illustrative palette colors; build clean; TypographyPage rhythm consistent; @State private correct; ForEach stable IDs; Apple-only primitives throughout

---

## Manifest Metadata

- **Task ID:** C1
- **Framework:** SwiftUI
- **Section:** layout-fundamentals
- **Date drafted:** 2026-05-05
- **Catalog lines:** 864–901
- **Leaves consolidated:** 34 → ~12 pages (including 2 thin guide pages)
- **Total subsections planned:** ~35 (across all 12 pages)
