# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** Phase 1 user-checkpoint **CLEARED 2026-05-07**. Manifest approved. C11 sample-code review complete. **Phase 2 dispatch unblocked** — sequential `GalleryRegistry.swift` rebuild is the next move.
**Git:** `main`, last commit `7bce9f3` *(Phase 1 closure)*. Working-tree changes from this checkpoint pass not yet committed (manifest cascade + history/handoff updates).
**Tags:** `pre-restart` → `62db021` *(full pre-strip corpus, recoverable)*.
**Build:** ✅ green *(last verified after Phase 0a)*.

## Phase progression so far

| Phase | Status | Last commit |
|---|---|---|
| Bootstrap (deploy plan to framework.md) | ✓ | `d2b7048` |
| Phase 0a (strip placeholder template, restore canonical Framework labels) | ✓ | `7ea77c8` |
| Phase 0b (archive 51 SwiftUI articles + 18 AppKit articles + 180 HIG) | ✓ | `f03cb42` / `84149fa` / `eb5bacd` / `cef1fb2` / `5d66ae5` |
| Phase 0c (archive 36 AppKit collectionGroup + 1 SwiftUI master `_index`, build unified `exclude.md`) | ✓ | `3ac3220` |
| Phase 1 — Reference sort | ✓ | `65efed1` |
| Phase 1 — AppKit sort | ✓ | `bdd80a2` |
| Phase 1 — SwiftUI sort | ✓ | `bc8033e` |
| Phase 1 closure (unified manifest) | ✓ | `7bce9f3` |
| **Phase 1 user checkpoint** | ✅ **APPROVED 2026-05-07** | (uncommitted manifest cascade) |
| **C11 sample-code review** | ✅ **22/22 deferred** | (uncommitted) |
| Phase 2 Step 1 (GalleryRegistry rebuild, sequential) | **next** | — |
| Phase 2 Step 2 (parallel page-file scaffolds per folder) | pending | — |
| Phase 2.5 (read-only scaffold audit) | pending | — |
| Phase 3 (live tile content, parallel per folder; gradient recapture B10 first) | pending | — |
| Phase 4 (polish, final code review, refresh handoff/history) | pending | — |

## Phase 1 checkpoint — final resolutions

| # | Item | Decision |
|---|---|---|
| A1 | SwiftUI > App Structure > **Environment** | ✅ Yes — TRIMMED to 3 anchor tiles (`EnvironmentValues`, `Environment`, `EnvironmentKey`); 162 property docs deferred |
| A2 | SwiftUI > App Structure > **State and Bindings** | ✅ Yes (11 tiles) |
| A3 | SwiftUI > Layout > **Custom Layout** | ✅ Yes (13 tiles — sampleCode source dropped per C11) |
| A4 | SwiftUI > App Structure > **AppKit Integration** | ✅ Yes (13 tiles) |
| A5 | SwiftUI > App Structure > **View Fundamentals** | ✅ Yes (5 minimal tiles) |
| A6 | SwiftUI > Images and Shapes > **AsyncImage** | ✅ Folded → Image |
| A7 | SwiftUI > Presentation > **FullScreenCover** | ✅ Folded → Sheet |
| A8 | SwiftUI > Animation > **Glass Effects** | ❌ No leaf — keep scattered |
| A9 | AppKit > **NSGlassEffectView** | ✅ Yes (3 tiles only) |
| B10 | Gradient recapture | ✅ Approved — runs before Phase 3 |
| C11 | 22 sampleCode docs | ✅ 22/22 deferred (none fit tile model) |
| D | Deferred large folders | ✅ Acknowledged |

Net: ~55 confirmed leaves (5 Reference + 44 SwiftUI + 6 AppKit) totaling ~1,082+ tiles.

## Phase 2 — what dispatches next

**Step 1 — sequential (single sonnet implementer + 2-stage review):** Rebuild `SwiftKit/Catalog/GalleryRegistry.swift` from the approved manifest. Use stable IDs `<heading>.<folder>.<leaf>` (lower-camel). Single-file edit; runs alone. Followed by spec-compliance reviewer + code-quality reviewer (both load `swiftui-expert-skill`).

**Step 2 — parallel batch (one cheap-model implementer per folder, then per-folder review chains):** Generate `<PageName>GalleryPage.swift` files at `SwiftKit/Pages/<Heading>/<Folder>/`. Each file uses `GalleryItemPage` + `VariantTile` placeholders matching the manifest's tile count (no live renders yet). Disjoint output paths → fully parallel-safe.

Folder set for Step 2 (15 dispatches):
- Reference (flat, 5 leaves)
- SwiftUI > App Structure (7 leaves: App and Scenes, WindowGroup, Document, Environment, State and Bindings, AppKit Integration, View Fundamentals)
- SwiftUI > Navigation (6 leaves)
- SwiftUI > Layout (9 leaves including Custom Layout)
- SwiftUI > Containers (6 leaves)
- SwiftUI > Controls (10 leaves)
- SwiftUI > Text and Input (5 leaves)
- SwiftUI > Images and Shapes (3 leaves: Image, Shapes, Gradient — AsyncImage folded)
- SwiftUI > Presentation (4 leaves: Sheet, Popover, Alert, ConfirmationDialog — FullScreenCover folded)
- SwiftUI > Toolbars and Menus (3 leaves)
- SwiftUI > Animation and Effects (4 leaves)
- SwiftUI > Accessibility (3 leaves)
- SwiftUI > Gestures and Input (3 leaves)
- AppKit (flat, 6 leaves: NSOutlineView, NSBrowser, NSPathControl, NSTokenField, NSDatePicker, NSGlassEffectView)

**Mandatory for every Phase 2 agent:** invoke `swiftui-expert-skill` via Skill tool before writing any Swift. Inline-output protocol applies because subagents can't Write/Bash — agents return file contents as fenced code blocks; controller writes them.

After Phase 2: Phase 2.5 (read-only manifest-vs-scaffold audit) → Phase 3 (live tile content, parallel per folder, mandatory `swiftui-expert-skill`). Run gradient recapture (B10) before Phase 3.

## Rules added during this session (durable)

- **`swiftui-expert-skill` is mandatory** for every Phase 0a, Phase 2, and Phase 3 implementer AND reviewer agent. Codified in `framework.md` Execution Methodology.
- **Subagents are blocked from `Write` and `Bash`** by something in this user's permission stack. Workaround: agents do all research using Read/Grep/Glob/Skill, return their full output as fenced code blocks in their final report, and the controller (this session) writes the canonical files. Phase 2 implementers will hit the same block — anticipate it, brief them with the inline-output protocol from the start.
- **Component descriptions MAY reference excluded URLs** (Phase 0c rule) — exclusion governs gallery surface, not citation scope. A Phase 3 tile description can cite an article in `_archive/guides/` if it adds context.
- **22 sampleCode docs deferred from tiles** (C11 outcome) — none fit the single-primitive-render tile model. Phase 3 implementers may cite them in tile descriptions.
- **No topic pages, no overviews, no guides in the gallery.** Only components, code, and their descriptions. Articles + HIG + collectionGroups + framework-root + `_index.md` files all archived. Unified index at [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).
- **Variant consolidation rule rejected** (post-V1 revisit) — Phase 3 keeps per-variant tile pattern.

## Key file locations

- **Plan canonical home:** [`framework.md`](framework.md) (Plan Sync Rule).
- **Phase 1 unified manifest (APPROVED):** [`Planning/page-component-map.md`](Planning/page-component-map.md) — locked 2026-05-07.
- **Per-framework manifests:** [`Planning/page-component-map-{reference,swiftui,appkit}.md`](Planning/).
- **Sort decisions audit trail:** [`Planning/sort-decisions.md`](Planning/sort-decisions.md) + per-framework variants (C11 outcomes appended).
- **Exclusion index (286 URLs):** [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).
- **Archive subtrees:** `Documentation/_archive/guides/` (articles + HIG) and `Documentation/_archive/topic-pages/` (collectionGroup + master `_index`).
- **Active-corpus `kind` inventory** (16 distinct values, 2,249 docs): in `framework.md` Execution Methodology.

## Standing constraints *(unchanged across this session)*

- macOS 26 only. Dark mode first. Apple primitives only. No SwiftData. *(`Guidelines/feedback.md`, L-007.)*
- Drop `.swift` files into `SwiftKit/<subdir>/` — `PBXFileSystemSynchronizedRootGroup` auto-syncs. *(L-010.)*
- `Documentation/` stays a project-root sibling, never inside `SwiftKit/SwiftKit/`. *(L-010.)*
- Keep `GalleryRegistry.allItems` flat (currently `[]` after Phase 0a strip; rebuilt in Phase 2 Step 1). *(L-011.)*
- Semantic tokens only. *(`Guidelines/visual-rules.md`, L-001/L-012.)*
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.
- Sidebar mechanic locked at commit `753f4d9`: 3-tier disclosure (Heading → Folder → Item) with single-folder collapse.
- Catalog data model: Section → Folder → Leaf (no sub-headings). `GalleryItem` already in this shape.

## Working-tree state (uncommitted at handoff time)

- `.claude/Planning/page-component-map.md` — checkpoint resolutions baked in.
- `.claude/Planning/page-component-map-swiftui.md` — 5 new leaves added; AsyncImage and FullScreenCover folded; resolution log replaces unmapped section.
- `.claude/Planning/page-component-map-appkit.md` — NSGlassEffectView promoted out of PROPOSED.
- `.claude/Planning/sort-decisions.md` — top-level adjustments table marked resolved.
- `.claude/Planning/sort-decisions-swiftui.md` — C11 outcomes appended.
- `.claude/Planning/sort-decisions-appkit.md` — C11 outcomes appended.
- `.claude/history.md` — Phase 1 closure + variant-consolidation-rejected entries appended to 2026-05-07 section.
- `.claude/handoff.md` — this file.

Pre-existing Nathan-side curation:
- `.claude/CLAUDE.md` — Nathan's mid-plan-mode edits (his content; left for him to commit).
- `Screen Recordings/*.png` deletions (2 files) — pre-existing tree state; Nathan's call.
- `.claude/PlanningTree` — untracked; Nathan's planning artifact.

## Quick-resume after compaction

1. Read this `handoff.md` first.
2. Read [`framework.md`](framework.md) — full plan + classifier + kind inventory + per-phase methodology.
3. Read [`Planning/page-component-map.md`](Planning/page-component-map.md) — the approved manifest (locked 2026-05-07).
4. Check `git log --oneline -10` to confirm latest commit.
5. Phase 2 Step 1 dispatches next: rebuild `SwiftKit/Catalog/GalleryRegistry.swift` via single sonnet implementer (sequential). Stable IDs `<heading>.<folder>.<leaf>` (lower-camel). Then 2-stage review chain. Both reviewer agents load `swiftui-expert-skill`. Inline-output protocol applies.
6. After Step 1 returns ✅, dispatch Phase 2 Step 2: 15 parallel cheap-model implementers (one per folder set listed above) generating `<PageName>GalleryPage.swift` files with `VariantTile` placeholders matching tile count.
