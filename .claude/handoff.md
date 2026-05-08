# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** Phase 3 **REDESIGNED 2026-05-07**. Plan approved by Nathan; **queued for execution starting 2026-05-08**. The previous Phase 3 (uniform-grid scaffold + per-folder live-tile authoring) was scrapped after the cookie-cutter shell was identified as the wrong move. Build remains green; no code changes landed today — only docs + plan-file infrastructure.

**Plan canonical home:** [`Planning/phase-3-plan.md`](Planning/phase-3-plan.md). Tomorrow's controller and every dispatched agent reads from there. **`framework.md` carries the summary only;** anything you need to act on lives in the plan file. This handoff is state + pointers only — no Phase 3 detail duplicated here.

**Git:** `main`, last shipped commit `83ceb7c` *(Phase 3 redesign infrastructure)*. Two commits ahead of `origin/main` (`c1a2cd7` cleanup + `83ceb7c` redesign infra) — push at start of tomorrow's session if desired.

**Build:** ✅ green (verified post-AppKit-pilot at `c2179b7`; no code touched since).

## Phase progression

| Phase | Status | Last commit |
|---|---|---|
| Bootstrap (deploy plan to framework.md) | ✓ | `d2b7048` |
| Phase 0a (strip placeholder template, restore canonical Framework labels) | ✓ | `7ea77c8` |
| Phase 0b (archive 51 SwiftUI articles + 18 AppKit articles + 180 HIG) | ✓ | `f03cb42` … `5d66ae5` |
| Phase 0c (archive 36 AppKit collectionGroup + 1 SwiftUI master `_index`) | ✓ | `3ac3220` |
| Phase 1 — Reference / AppKit / SwiftUI sorts + closure | ✓ | `7bce9f3` |
| Phase 1 user-checkpoint + C11 sample-code review | ✅ APPROVED | `5aec288` |
| Phase 2 Step 1 — `GalleryRegistry.swift` rebuild (74 entries) | ✓ | `d297d96` |
| Phase 2 Step 2 — 69 page-file scaffolds generated | ✓ | `72c3f78` |
| Phase 2.5 — read-only audit | ✅ PASS (74/74) | `488fe28` |
| B10 — gradient recapture | ✅ CLOSED | `420a19c` |
| Phase 3 pilot — AppKit folder | ✅ DONE — folded into W6 for re-layout | `c2179b7` |
| **Phase 3 redesign infrastructure** | ✅ APPROVED 2026-05-07; **queued for tomorrow** | `83ceb7c` |
| Phase 4 — post-wave cleanup, polish, closure | pending | — |

## Why Phase 3 was redesigned

Short version: each page should be formatted as best for its own individual requirements; the previous uniform-grid scaffold violated that discipline. Full narrative in [`history.md`](history.md) (2026-05-07 entry "Phase 3 redesigned — per-page bespoke integration replaces uniform-grid scaffold"). Nathan's directives, decision context, and findings all preserved there.

## Quick-resume tomorrow

1. Read this `handoff.md` first.
2. Read [`Planning/phase-3-plan.md`](Planning/phase-3-plan.md) — full execution playbook for Phase 3a + 3b. Everything you need to dispatch is in there.
3. Read [`framework.md`](framework.md) — project-level context (Phase 3 summary only).
4. Confirm `git log --oneline -5` shows `83ceb7c` at top.
5. **Step 1: dispatch Phase 3a strip** per plan § Phase 3a. Verify with `xcodebuild` + `grep` checks. Commit.
6. **Step 2: dispatch W1 Typography (layout design stage)** per plan § Phase 3b. Show design doc to Nathan for approval (folder-first design pre-flight) before stage 2 fires.
7. After W1's 5 Reference pages all commit, Nathan does folder-close click-through. Then W2 dispatches in parallel across 5 folders.

## Open items — DEFERRED to Phase 4

Per Nathan: orphans, uncertain components, and any open architectural questions are sorted out post-waves once Nathan signs off on the implementation phase. Detail in [`Planning/phase-3-plan.md`](Planning/phase-3-plan.md) § Phase 4 + the "What Survives, What Strips, What Gets Deleted" table. Items include the orphan files (`PlaceholderGalleryPage`, `DescribePage`, `GalleryPageScaffold`, `ContentView` inline) and the `BareItemPage` extraction timing.

## Key file locations

- **Phase 3 execution plan:** [`Planning/phase-3-plan.md`](Planning/phase-3-plan.md) — canonical reference for tomorrow's work.
- **Project framework:** [`framework.md`](framework.md) — project-level summary; defers to plan file for Phase 3 detail.
- **Components log:** [`components-log.md`](components-log.md) — chronological inventory.
- **History:** [`history.md`](history.md) — 2026-05-07 entry covers the redesign decision.
- **Phase 1 manifest (APPROVED, locked):** [`Planning/page-component-map.md`](Planning/page-component-map.md).
- **Per-framework manifests:** [`Planning/page-component-map-{reference,swiftui,appkit}.md`](Planning/).
- **Sort decisions audit trail:** [`Planning/sort-decisions.md`](Planning/sort-decisions.md) + per-framework variants.
- **Phase 2.5 scaffold audit:** [`Planning/scaffold-audit.md`](Planning/scaffold-audit.md) — 74/74 PASS.
- **Phase 3b logic log:** [`Planning/page-logic-log.md`](Planning/page-logic-log.md) — empty seed; first entry written by tomorrow's W1 Typography implementer.
- **Page status tree:** [`PlanningTree`](PlanningTree) — per-leaf ⬜/🟨/✅/🚫 emojis.
- **OG Typography (git-recoverable):** `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift`.
- **Exclusion index (286 URLs):** [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).

## Standing constraints *(unchanged)*

- macOS 26 only. Dark mode first. Apple primitives only. No SwiftData. *(L-007.)*
- Drop `.swift` files into `SwiftKit/<subdir>/` — `PBXFileSystemSynchronizedRootGroup` auto-syncs. *(L-010.)*
- `Documentation/` stays a project-root sibling, never inside `SwiftKit/SwiftKit/`. *(L-010.)*
- Keep `GalleryRegistry.allItems` flat. Imperative `+=` accumulator stays inside the closure init. *(L-011.)*
- Semantic tokens only. *(L-001/L-012.)*
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.
- Sidebar mechanic locked at commit `753f4d9`: 3-tier disclosure with single-folder collapse.
- Catalog data model: Section → Folder → Leaf.
- **Subagents blocked from `Write` and `Bash`** — return fenced code blocks; controller writes.
- **Mandatory baseline skill kit on every Phase 3 dispatch (incl. mechanical 3a):** `superpowers:using-superpowers` + `swiftui-expert-skill` (per [`Planning/phase-3-plan.md`](Planning/phase-3-plan.md)).

## Working-tree state (uncommitted at handoff time)

Two screenshot deletions in `Screen Recordings/` from a previous session — pre-existing tree state, untouched by this work. Nathan-side cleanup; commit at his discretion.
