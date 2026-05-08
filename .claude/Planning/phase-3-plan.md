# SwiftKit — Phase 3 Plan (Per-Page Integration)

**Status:** ✅ APPROVED 2026-05-07. Queued for execution starting 2026-05-08. This file is the canonical execution reference for Phase 3a + 3b — the detailed companion to `framework.md`'s Phase 3 summary.

## Plan Home and Sync Rule

**Project-level canonical home:** [`../framework.md`](../framework.md). The full project plan and phase log live there. Phases 0a, 0b, 0c, 1, 2, 2.5 are ✅ DONE per `framework.md`'s headers and commit refs.

**This file** is the detailed Phase 3 execution plan — held in the project Planning folder so tomorrow's controller and every dispatched agent can read it directly. The plan was approved through plan mode on 2026-05-07; the high-level summary deployed into `framework.md`'s Phase 3 + Phase 4 sections at commit `83ceb7c`. If the two ever diverge during execution, `framework.md` wins (per its Plan Sync Rule); update both in lockstep.

**Companion docs:**
- [`../handoff.md`](../handoff.md) — current state + tomorrow's queue with the dispatch playbook for Phase 3a strip + W1 Typography.
- [`../history.md`](../history.md) — 2026-05-07 dated entry for the redesign decision and Nathan's verbatim directives.
- [`page-component-map.md`](page-component-map.md) — locked 74-leaf manifest (unchanged by this plan).
- [`page-logic-log.md`](page-logic-log.md) — append-only per-page reasoning record (filled during Phase 3b; each implementer writes their entry as their final act).
- [`../PlanningTree`](../PlanningTree) — per-leaf status emojis (⬜ 🟨 ✅ 🚫); flip markers as pages move through the chain.

---

## Context — Why This Redesign

The previous Phase 3 made a critical scoping mistake: the Phase 2 scaffold pass wrapped all 63 SwiftUI pages (and the 6 AppKit pilot pages) in an identical `GalleryItemPage { VariantTile(name:, api: nil) { Color.clear } × N }` shell. That uniform-grid container constrains page layout *before* any thought about what the page is documenting.

Nathan's correction: each page should be formatted as best for its own individual requirements. Buttons want a condensed grid; sliders want horizontal breathing room; navigation views consume the entire pane and want bare full-bleed listings; typography wants hand-crafted single-column rows with side-aligned API metadata. **The current cookie-cutter shell expresses none of this.**

The OG Typography page (recoverable at commit `f3a3308`, `SwiftKit/Pages/Reference/TypographyPage.swift`, 311 lines) is concrete proof the post-strip pages can — and should — be authored as bespoke layouts. It uses `PageSection` for sectioning, a `TextStyleRow` data struct, a fixed `apiColumnWidth: 180`, custom `HStack` rows, semantic font modifiers throughout. None of that came from `VariantTile`.

The fix: **scaffold and integration merge into one phase.** Each page is authored holistically by an agent who decides its layout based on the components it documents, then writes the demos, then logs their reasoning.

## Locked Decisions Inherited From Prior Phases

(See `framework.md` for full text. Listed here for the agent briefs.)

- One page = one user-recognizable component family. No new pages or page-list changes.
- macOS 26 only, Apple primitives only, no third-party UI, no SwiftData (`@State` only), dark-first.
- Semantic color/font tokens only (L-001/L-012). No hex, no `Color(red:green:blue:)`.
- L-011 expression complexity ceiling: imperative `+=` over chained `+`; break dense pages into `private struct` / `private let` subviews.
- File placement under `SwiftKit/SwiftKit/<subdir>/` auto-syncs via `PBXFileSystemSynchronizedRootGroup` (L-010).
- No Claude-authored wrapper views. AppKit `NSViewRepresentable` bridges and per-page specialty demo wrappers (à la `AnimationDemoTile`) are the documented exceptions.
- Subagents are blocked from Write/Bash; they return fenced code blocks; the controller writes.
- Two-stage review per page: spec compliance → code quality.
- **Mandatory baseline skill kit on EVERY Phase 3 agent dispatch (including the mechanical 3a strip):** `superpowers:using-superpowers` AND `swiftui-expert-skill`. These are non-negotiable floor — task-specific skills (`ui-ux-pro-max`, `find-docs`, `superpowers:brainstorming`, `superpowers:requesting-code-review`, `superpowers:test-driven-development`, `superpowers:verification-before-completion`) layer on top. The controller MUST announce both baseline skills in the brief before any task-specific instructions, and the agent MUST invoke them at start-of-task.

## What Survives, What Strips, What Gets Deleted

| Surface | Status | Rationale |
|---|---|---|
| `Catalog/GalleryItem.swift`, `Catalog/GalleryRegistry.swift` | Untouched | Already canonical from Phase 2; every page registered with stable `<framework>.<folder>.<leaf>` IDs. |
| `Detail/PageScaffold/{GalleryItemPage,VariantTile,ReferenceTile,PageSection,APICallout,DemoTiles}.swift` | Untouched | Available as a **toolkit** for page agents to compose when it fits. Not a template. |
| `Pages/Reference/*.swift` (5 files) | **Untouched** during strip; re-authored in their Phase 3 wave | Current on-disk content (and, for Typography, the OG at `f3a3308`) serves as reference material for the implementer. |
| `Pages/AppKit/*.swift` (6 files) | **Untouched** during strip; re-authored in the AppKit wave | Live tiles + `NSViewRepresentable` bridges from the pilot stay as reference material. |
| `Pages/SwiftUI/<Folder>/*.swift` (63 files) | **Stripped** in Phase 3a; rewritten in Phase 3b | These hold `Color.clear` placeholders; nothing of value to preserve. |
| `Detail/PageScaffold/GalleryPageScaffold.swift` (34 lines) | **Defer to Phase 4** | Old "Default/Variants/States/Notes" 4-section scaffold. Only used by `DescribePage` (also orphan). Not referenced by any current page. Documented now; cleaned up after Nathan signs off on the implementation phase. |
| `Pages/_Shared/DescribePage.swift` (141 lines) | **Defer to Phase 4** | Uses orphan scaffold; not registered in `GalleryRegistry`. The "old gallery contents" half-deletion remnant. |
| `Pages/_Shared/PlaceholderGalleryPage.swift` (55 lines) | **Defer to Phase 4** | No longer referenced by `GalleryRegistry` post-Phase 2; deleted as part of post-wave cleanup. |
| `SwiftKit/ContentView.swift` (7 lines) | **Defer to Phase 4** | Trivial wrapper around `RootView()`; redundant indirection. Inlined post-waves. |
| `Detail/DetailPane.swift` line 32 ("Reusable across both sidebar modes") | **Defer to Phase 4** | Comment outlived the implementation; second sidebar mode no longer exists. Cleaned up post-waves. |

## Phase 3a — Strip (mechanical)

**Scope.** The 63 SwiftUI page files at `SwiftKit/SwiftKit/Pages/SwiftUI/<Folder>/<Leaf>GalleryPage.swift`. Reference + AppKit + scaffold primitives are NOT touched.

**Effect per file.** Replace the body with `EmptyView()`; delete the placeholder `VariantTile` dump. The `extension <Leaf>GalleryPage { @MainActor static let item = GalleryItem(...) }` block stays byte-for-byte intact so every `GalleryRegistry` reference keeps resolving.

Resulting shape (every stripped file):
```swift
import SwiftUI

struct ButtonGalleryPage: View {
    var body: some View { EmptyView() }
}

extension ButtonGalleryPage {
    @MainActor static let item = GalleryItem(/* unchanged */)
}
```

**Dispatch.** One mechanical agent (haiku-tier), single batch. Allowlist of 63 file paths. Must not touch `Pages/Reference/`, `Pages/AppKit/`, `Pages/_Shared/`, `Detail/PageScaffold/`.

**Verification.** `xcodebuild` green; `grep -rn "Color.clear" SwiftKit/SwiftKit/Pages/SwiftUI` returns zero; `grep -rn "static let item" SwiftKit/SwiftKit/Pages/SwiftUI | wc -l` returns 63; sidebar still navigates to every leaf, body just renders empty.

**Commit.** `Phase 3a — strip 63 SwiftUI placeholder bodies (Phase 3b unblocked)`.

## Phase 3b — Per-Page Integration

**One agent per page. Sequential within a folder. Parallel across folders within a wave.**

### Agent budget — "most care possible" per page

Care is expressed through model tier, scope of expertise, and review depth — not through ceremony.

**Model assignment (every dispatch in this phase):** **most-capable model (opus-tier)**. No haiku- or sonnet-tier substitution for design, implementation, or review work in Phase 3b. Mechanical strip + scaffold-evolution dispatches stay haiku/sonnet.

**Per-page chain (4 stages, sequential):**

Baseline skills on every dispatch (mandatory, non-negotiable): **`superpowers:using-superpowers` + `swiftui-expert-skill`**. The "Skills layered on top" column lists what's added on top of that floor.

| # | Stage | Model | Skills layered on top | Output |
|---|---|---|---|---|
| 1 | **Layout design** | opus | `ui-ux-pro-max`, `find-docs`, optional `superpowers:brainstorming` | A design doc (markdown, returned in fenced block): chosen layout shape, component-driven rationale, sketched-in-code structure, anticipated risk areas, specialty-wrapper proposals. No production code yet. |
| 2 | **Implementation** | opus | `find-docs`, `superpowers:test-driven-development`, `superpowers:verification-before-completion` | The full page file as a fenced Swift block; xcodebuild green; self-review notes. |
| 3 | **Spec compliance review** | opus | `superpowers:requesting-code-review` | Verifies code matches the approved design + manifest. Iterates with implementer until ✅ (no implicit ceiling). |
| 4 | **Code quality review** | opus | `superpowers:requesting-code-review`, `ui-ux-pro-max` | Verifies build, naming, semantic tokens, L-001/L-007/L-010/L-011/L-012, ui-ux/swiftui patterns. Iterates until ✅. |

**Stage 5 — logic log entry** (same agent as stage 2, after both reviews ✅): captures THEIR layout/UI reasoning. See Logic-log spec below.

**Per-folder Nathan checkpoints (the only stop conditions):**
- **Design pre-flight (folder-first page only):** the layout-design doc for the first page in each folder is shown to Nathan. He approves the pattern or redirects. Once approved, subsequent pages in the same folder run autonomously through stages 1–5; their design docs are still produced and folded into the logic log.
- **Visual review (folder-close):** after every page in a folder lands its commit, Nathan does a manual click-through (dark + light) and approves the folder before the next folder's first page dispatches. **This is the per-page "most care" pressure valve** — Nathan sees every page render in the actual app within ~6 pages of when it's authored.
- **Per-page interrupt:** any agent at any stage may flag "this page raises a question I need a human on" — the controller surfaces the question to Nathan immediately. Default is autonomy; explicit interrupts are allowed.

**Review iteration ceiling:** **none.** Reviewers loop with implementer until both ✅.

### Pre-work (every page agent, in order)

1. Read this page's manifest entry in `.claude/Planning/page-component-map-{reference,swiftui,appkit}.md` — component list + verbatim Apple type names.
2. Read every contributing Apple doc under `Documentation/<framework>/<topic>/` referenced by the manifest entry.
3. Read any pre-existing implementation as reference material:
   - **Typography:** read both the current `Pages/Reference/TypographyGalleryPage.swift` (the wrong tile-grid form) AND the OG at `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift` — study the OG's principles (data struct per row, fixed metadata column width, `PageSection`-driven sectioning, semantic font modifiers throughout); do NOT copy verbatim.
   - **SF Symbols, Color, Motion, Materials:** read the current on-disk page as starting reference; decide whether the existing layout still serves and refine, or rebuild.
   - **AppKit pilot pages:** read the current on-disk page (live tiles + bridges intact); the layout-decision pass may keep, restructure, or split sections, but the bridges stay.
   - **Fresh SwiftUI pages (post-strip):** no on-disk content; start from manifest + Apple docs.
4. Read `.claude/Planning/page-logic-log.md` start-to-finish — every prior log entry. The brief instructs: "cite at least one prior entry's decision in your reasoning, OR explain why your page diverges."
5. Confirm baseline skills loaded (`superpowers:using-superpowers` + `swiftui-expert-skill`) and stage-specific skills per the chain table above (e.g., `ui-ux-pro-max` + `find-docs` for the layout-design stage).

### Layout decision (BEFORE any demo code)

The implementer commits in writing — as the first lines of their logic-log entry — to a layout shape. Available shapes (not exhaustive; agent may invent):

| Shape | When | How |
|---|---|---|
| Bespoke long-form rows | Pages where each variant wants horizontal breathing room + side-aligned metadata (Typography, possibly Slider, ProgressView, TextEditor) | Custom `VStack` of `HStack` rows; data-struct ForEach; fixed metadata column width; `PageSection` for grouping. **No `GalleryItemPage` wrapper required.** |
| Condensed grid | Many small same-shape variants (Buttons, Toggles, small Pickers) | `GalleryItemPage(..., minTileWidth: 160)` with `VariantTile`s. Tighter packing than default. |
| Default adaptive grid | Mixed-size demos, no special needs | `GalleryItemPage(...)` (220 default) with `VariantTile`s and/or specialty `*DemoTile`s. |
| Specialty-tile grid | Effects/animations needing a stable shared canvas (à la Motion, Materials) | Either reuse existing `*DemoTile` from `DemoTiles.swift`, or write a `private struct LocalDemoTile: View` in the page file. |
| Hybrid | One headline interactive + supporting variants | `PageSection` to stack: a single full-width tile, then a grid section underneath. |
| Bare full-bleed | Pane-consuming primitives (NavigationSplitView, NavigationStack, Inspector, Sidebar, TabView, possibly Table) | Bypass `GalleryItemPage` entirely. Author a custom view: header (title + blurb + signature + availability + docPath) stacked above a single live example occupying the pane width. |

### Demo authoring rules

- Live SwiftUI invocations of the documented type with documented parameters. No invented variants. No Claude-authored wrapper views (semantic exceptions: `NSViewRepresentable` bridges for AppKit primitives; per-page specialty `*DemoTile` private structs).
- Semantic color/font tokens only (L-001/L-012). Dark + light verified.
- Per-tile `height:` set when content has a natural intrinsic size (charts, pickers, sliders); otherwise default.
- L-011: dense pages broken into `private let` / `private struct` subviews; imperative `+=` over chained `+`.
- API parameter on every renderable variant — verbatim Apple call. Optional API on `VariantTile` is for genuinely non-named variants only.

### Specialty wrappers — when and where

If the agent finds **3+ tiles on its own page** sharing a canvas pattern, propose a wrapper:
- **Local (default):** `private struct <Name>DemoTile: View` in the same file. Composes `VariantTile` with a stable demo body. No primitive-evolution dispatch needed.
- **Shared (rare):** if the wrapper is clearly reusable across multiple pages, the agent flags it in the logic-log entry under "New primitive proposed." The controller batches accepted proposals into a separate **Primitive Evolution dispatch** between waves — single sequential implementer edits `Detail/PageScaffold/DemoTiles.swift`. Spec + code review chain. Page agents may NOT edit `Detail/PageScaffold/` directly.

### Deliverables per page

1. The page file (full rewrite, single Swift file under `Pages/<Heading>/<Folder>/<Leaf>GalleryPage.swift`).
2. Logic-log entry appended to `.claude/Planning/page-logic-log.md` (format below).
3. Any new shared-primitive proposal (logged, not implemented).

### Logic-log spec

**Location:** `.claude/Planning/page-logic-log.md` (single append-only file).

**Written by:** the same agent that implements the page, as their **final act** after the code is constructed and self-reviewed. The entry captures THEIR reasoning at the moment of conviction — closer to a postmortem than a plan. Subsequent agents read it as evidence ("here's what worked / here's what surprised me"), not as instructions.

**Entry format (≤12 lines):**
```markdown
### <Heading> > <Folder> > <Leaf> — <YYYY-MM-DD>
- Layout: <chosen shape + key parameters>.
- Why: <component-driven rationale; what it is about these components that motivated the choice>.
- Tile/row shape: <heights, widths, metadata column, special wrappers, etc.>.
- Demos: <live vs reference, dark+light verified, any unusual rendering choices>.
- New primitive proposed: <none | name + brief>.
- Heads-up for siblings: <what the next agent in this folder / cross-folder should know>.
```

**Discipline.**
- READ-BEFORE: every implementer reads the entire log before drafting layout.
- WRITE-AFTER: implementer's last act before handing back code is appending the entry.
- Spec reviewer verifies the entry exists with all six required lines and that it cites at least one prior entry (or explains divergence).

## Wave Plan

Sequential within a folder; parallel across folders within a wave.

| Wave | Folders | Leaves | Why |
|---|---|---|---|
| **W1 (warm-up, sequential single-folder)** | Reference | 5 | Typography (the page that prompted this redesign) goes first as a shape exercise; SF Symbols + Color + Motion + Materials follow. Pre-existing on-disk content + OG `TypographyPage.swift` provide concrete reference material. Their logs become the seed prior art for SwiftUI waves. |
| **W2 (parallel folders)** | Presentation, ToolbarsAndMenus, GesturesAndInput, Accessibility, ImagesAndShapes | 4+3+3+3+3 = 16 | Mid-complexity, well-bounded. |
| **W3 (parallel folders)** | TextAndInput, AnimationAndEffects, Containers | 5+4+6 = 15 | Higher tile-density; some pages will want bespoke long-form (TextEditor, ProgressView). |
| **W4 (parallel folders)** | Controls, Layout, Navigation | 10+9+6 = 25 | Highest variation. Controls = condensed grids + bespoke rows; Layout = pedagogical flow; Navigation = bare full-bleed cases. |
| **W5 (parallel folders)** | AppStructure | 7 | App-shell primitives; some bare full-bleed (Scene, WindowGroup demos may need full-pane treatment). |
| **W6 (parallel pages within single folder)** | AppKit | 6 | Re-layout pilot pages. Bridges + tiles stay; layout shape + section structure may change. |

**Within-folder rule: SEQUENTIAL.** Each successive page benefits from the previous page's log entry. This is the central reason for the log's existence.

**Across-folder rule: PARALLEL within a wave.** Folders are disjoint subtrees; agents in different folders cannot collide. The shared logic-log file is appended-only — controller serializes log writes by appending each agent's entry in completion order.

**Why Reference is W1 (warm-up):** Typography prompted this redesign and benefits most from a careful first pass; SF Symbols has an "easy" reference (existing app on file); Color/Motion/Materials use specialty wrappers that demonstrate the principle. The 5 Reference logs then seed every SwiftUI wave.

**CustomLayout folder.** Per Phase 1 checkpoint A3 it has 13 tiles. W4 implementer creates the file.

## Primitive Evolution Policy

Page agents are FORBIDDEN from editing `Detail/PageScaffold/`. They may:
- Define `private struct` / `private let` helpers in their own page file (any local view code).
- Bypass `GalleryItemPage` entirely with custom view code (the OG Typography pattern).
- Propose a shared primitive in their logic-log entry.

Likely shared-primitive candidates already visible:
- **`BareItemPage`** — chromeless full-bleed page wrapper (header + single full-pane slot). Probably needed for W4 Navigation. **Recommendation: let the first W4 agent write it locally in their own page; extract to `Detail/PageScaffold/` only if 3+ pages need it.**

## Page-Complete Verification

Per page (gates closure of that page's two-stage review):

1. `xcodebuild` green.
2. Manual click-through; both dark + light via the appearance toggle.
3. Tile/row count matches the manifest entry, OR the logic-log entry justifies the deviation (e.g., "merged two protocol tiles into one ReferenceTile").
4. Verbatim Apple type names for tile/row headers; descriptions sourced from doc Abstract.
5. Semantic-token compliance — `grep -E "Color\(red:|#[0-9a-fA-F]{6}"` in the page returns zero.
6. Logic-log entry appended with all six required lines and cites prior art (or justifies divergence).
7. No edit outside `Pages/<Heading>/<Folder>/<Leaf>GalleryPage.swift` and `Planning/page-logic-log.md`.

**Two-stage review:**
- Spec reviewer checks 3, 4, 6.
- Code reviewer checks 1, 2, 5, 7 + L-001/L-007/L-010/L-011/L-012 + ui-ux/swiftui-expert pattern compliance.

## Phase 4 — Post-Wave Cleanup, Polish, and Closure

After all six waves close AND Nathan signs off on the implementation phase:

1. **Orphan and uncertain-component sort.** Pull together everything previously deferred:
   - Delete `Pages/_Shared/PlaceholderGalleryPage.swift`.
   - Delete `Pages/_Shared/DescribePage.swift`.
   - Delete `Detail/PageScaffold/GalleryPageScaffold.swift`.
   - Inline `SwiftKit/ContentView.swift` into `SwiftKitApp.swift`; delete the file.
   - Update `Detail/DetailPane.swift` comment on `DetailEmptyState` to drop the stale "both sidebar modes" reference.
   - Search the whole `SwiftKit/SwiftKit/` tree for any remaining references to deleted symbols; resolve.
   - Re-survey the manifest + completed pages for any uncertain-component decisions held open during waves; resolve and integrate as agreed with Nathan.
2. Sidebar audit — every leaf navigates, no placeholder leftovers, single-folder collapse works for Reference + AppKit.
3. Cross-page consistency check — section-header tone, log-driven recurring patterns, dark+light spot-check.
4. Refresh `framework.md`, `handoff.md`, `history.md`. Log MVP completion + final page count + commit refs.

**Verification:** `xcodebuild` green and warning-free; `grep -rn "DescribePage\|GalleryPageScaffold\|PlaceholderGalleryPage\|ContentView" SwiftKit/SwiftKit` returns zero; full app click-through dark+light passes; `git status` clean.

## Critical Reused Code (toolkit, not template)

| Surface | File | Role |
|---|---|---|
| Page entry | `Detail/PageScaffold/GalleryItemPage.swift` | Compose when grid layout fits (`minTileWidth` is the lever). Bypass for bespoke / bare layouts. |
| Tiles | `Detail/PageScaffold/{VariantTile,ReferenceTile}.swift` | Card chrome for renderable / non-renderable variants. |
| Section | `Detail/PageScaffold/PageSection.swift` | Header + content; used heavily by OG Typography for grouping. |
| API code | `Detail/PageScaffold/APICallout.swift` | Inline API code text. |
| Specialty demos | `Detail/PageScaffold/DemoTiles.swift` | `AnimationDemoTile`, `TransitionDemoTile`, `MaterialDemoTile`, `ShapeStyleDemoTile`, `EnvironmentValueDemoTile` — proof of the "shared canvas per content type" pattern. |
| OG reference | `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift` | Hand-crafted long-form rows with side-aligned metadata. Reference for the Typography implementer. |

## Open Items

Deferred to Phase 4. Per Nathan: open items, orphans, and uncertain components are sorted out after the implementation waves once he signs off — not pre-decided here.

## Verification (post-Phase 4)

1. `xcodebuild` clean, no warnings introduced.
2. Launch app — every sidebar leaf clickable, every page renders, dark + light verified.
3. `find SwiftKit/SwiftKit/Pages -name "*.swift" | wc -l` matches the leaf count from `Planning/page-component-map.md` (74).
4. `Planning/page-logic-log.md` contains 74 entries, one per leaf, in completion order.
5. `git status` clean; `git log` shows per-page commits with descriptive messages.