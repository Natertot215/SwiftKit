# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** Phase 1 (Sorting) closed. **Awaiting Nathan's Phase 1 checkpoint approval** of [`Planning/page-component-map.md`](Planning/page-component-map.md) before Phase 2 (Scaffold) dispatches.
**Git:** `main`, last commit `7bce9f3` *(Phase 1 closure — unified manifest + checkpoint summary, swiftui-expert mandate)*.
**Tags:** `pre-restart` → `62db021` *(full pre-strip corpus, recoverable)*.
**Build:** ✅ green *(last verified after Phase 0a)*.

## Phase progression so far

| Phase | Status | Last commit |
|---|---|---|
| Bootstrap (deploy plan to framework.md) | ✓ | `d2b7048` |
| Phase 0a (strip placeholder template, restore canonical Framework labels) | ✓ | `7ea77c8` |
| Phase 0b (archive 51 SwiftUI articles + 18 AppKit articles + 180 HIG, build per-framework manifests, restore 5 misclassified method docs) | ✓ | `f03cb42` / `84149fa` / `eb5bacd` / `cef1fb2` / `5d66ae5` |
| Phase 0c (archive 36 AppKit collectionGroup + 1 SwiftUI master `_index`, build unified `exclude.md`, classifier rewrite, sample-code case-by-case rule) | ✓ | `3ac3220` |
| Phase 1 — Reference sort | ✓ | `65efed1` |
| Phase 1 — AppKit sort | ✓ | `bdd80a2` |
| Phase 1 — SwiftUI sort | ✓ | `bc8033e` |
| Phase 1 closure (unified manifest, swiftui-expert mandate) | ✓ | `7bce9f3` |
| **Phase 1 user checkpoint** | **awaiting Nathan** | — |
| Phase 2 (rebuild GalleryRegistry + parallel page-file scaffold) | pending | — |
| Phase 2.5 (read-only scaffold audit) | pending | — |
| Phase 3 (live tile content, parallel per folder) | pending | — |
| Phase 4 (polish, final code review, refresh handoff/history) | pending | — |

## Current open items for Nathan

### A. PlanningTree adjustments — **answers needed before Phase 2**

The 9 yes/no decisions are listed in `Planning/page-component-map.md` § A and the prior chat. None have been answered yet (Nathan's mid-checkpoint reply addressed a different concern; see "Rejected design rule" below). These remain open:

1. SwiftUI > App Structure > **Environment** leaf (165 tiles)
2. SwiftUI > App Structure > **State and Bindings** leaf (11 tiles)
3. SwiftUI > Layout > **Custom Layout** leaf (14 tiles)
4. SwiftUI > App Structure > **AppKit Integration** leaf (13 tiles)
5. SwiftUI > App Structure > **View Fundamentals** leaf (~5 tiles, minimal)
6. SwiftUI > Images and Shapes — **fold AsyncImage** into Image
7. SwiftUI > Presentation — **fold FullScreenCover** into Sheet
8. SwiftUI > Animation and Effects > **Glass Effects** leaf *(optional)*
9. AppKit > **NSGlassEffectView** leaf (3 tiles, macOS 26 Liquid Glass)

### B. Mirror gap — **APPROVED**

Run `Documentation/_index/recapture-targets.sh` for `LinearGradient`, `RadialGradient`, `AngularGradient` URLs before Phase 3 begins. They tile onto the SwiftUI Gradient page once captured.

### C. SampleCode review — **assigned to controller (me)**

22 sampleCode docs (13 SwiftUI + 9 AppKit) were blanket-deferred by Phase 1 sort agents (operating on pre-Phase-0c rules). Per Phase 0c, sampleCode is case-by-case. I do the review pass after the A-decisions land — promote each as a tile if it illustrates a focused component pattern; defer if tutorial/full-app demo.

### D. Deferred large folders — **acknowledged**

Out of scope, no tiles surface:
- `technology-specific-views/` (112 docs — MapKit/StoreKit/HealthKit/PhotosPicker/TipKit/WebKit/Wallet)
- `previews-in-xcode/` (22)
- `immersive-spaces/` (22 — visionOS only)
- `uikit-integration/` (14), `watchkit-integration/` (4)
- `app-extensions/` (19), `system-events/` (17), `persistent-storage/` (8), `preferences/` (11)

## Rejected design rule (deferred to post-V1)

Mid-Phase-1, Nathan considered a "variant consolidation" rule — multi-variant APIs (`Material` cases, `Animation` presets, `SymbolRenderingMode` cases, `TableStyle` values) would render as a **single tile with an in-tile selector** rather than separate tiles per variant. This was **rejected** before being committed: *"too consolidating; let's not scope this out now and see how the V1 looks after scaffolding and implementation."* Phase 3 keeps the existing per-variant tile pattern from the canonical reference pages. Revisit after V1 ships.

## Rules added during this session (durable)

- **`swiftui-expert-skill` is mandatory** for every Phase 0a, Phase 2, and Phase 3 implementer AND reviewer agent. Invoke via `Skill` tool at the start of any agent dispatch involving Swift/SwiftUI work. Codified in `framework.md` Execution Methodology > Mandatory skill kit, plus duplicated reminders in Phase 2 and Phase 3 sections.
- **Subagents are blocked from `Write` and `Bash`** by something in this user's permission stack (verified against three different subagents — Reference, AppKit, SwiftUI). Workaround: agents do all research using Read/Grep/Glob/Skill, return their full output as fenced code blocks in their final report, and the controller (this session) writes the canonical files. The Phase 1 sort manifests were all written this way. Phase 2 implementers will hit the same block — anticipate it, brief them with the inline-output protocol from the start.
- **Component descriptions MAY reference excluded URLs** (Phase 0c rule) — exclusion governs gallery surface, not citation scope. A Phase 3 tile description can cite an article in `_archive/guides/` if it adds context.
- **`kind: sampleCode` is case-by-case** (Phase 0c rule, Nathan's correction). Not blanket-deferred. Evaluate each on merit.
- **No topic pages, no overviews, no guides in the gallery.** Only components, code, and their descriptions. Articles + HIG + collectionGroups + framework-root + `_index.md` files are all archived. Unified index at [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).

## Key file locations

- **Plan canonical home:** [`framework.md`](framework.md) (Plan Sync Rule: any plan change updates here immediately + dated `history.md` entry).
- **Phase 1 unified manifest:** [`Planning/page-component-map.md`](Planning/page-component-map.md) — Nathan reviews this.
- **Per-framework manifests:** [`Planning/page-component-map-{reference,swiftui,appkit}.md`](Planning/).
- **Sort decisions audit trail:** [`Planning/sort-decisions.md`](Planning/sort-decisions.md) + per-framework variants.
- **Exclusion index (286 URLs):** [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).
- **Archive subtrees:** `Documentation/_archive/guides/` (articles + HIG) and `Documentation/_archive/topic-pages/` (collectionGroup + master `_index`).
- **Active-corpus `kind` inventory** (16 distinct values, 2,249 docs): in `framework.md` Execution Methodology.

## Phase 2 — what dispatches next, once Nathan approves

**Step 1 — sequential (single implementer, sonnet model):** Rebuild `SwiftKit/Catalog/GalleryRegistry.swift` from the approved manifest. Use stable IDs `<heading>.<folder>.<leaf>` (lower-camel). Single-file edit; runs alone. Followed by spec-compliance reviewer + code-quality reviewer (both load `swiftui-expert-skill`).

**Step 2 — parallel batch (one cheap-model implementer per folder, then per-folder review chains):** Generate `<PageName>GalleryPage.swift` files at `SwiftKit/Pages/<Heading>/<Folder>/`. Each file uses `GalleryItemPage` + `VariantTile` placeholders matching the manifest's tile count (no live renders yet). Disjoint output paths → fully parallel-safe.

**Mandatory for every Phase 2 agent:** invoke `swiftui-expert-skill` via Skill tool before writing any Swift. Inline-output protocol applies because subagents can't Write/Bash — agents return file contents as fenced code blocks; controller writes them.

After Phase 2: Phase 2.5 (read-only manifest-vs-scaffold audit) → Phase 3 (live tile content, parallel per folder, mandatory `swiftui-expert-skill`).

## Standing constraints *(unchanged across this session)*

- macOS 26 only. Dark mode first. Apple primitives only. No SwiftData. *(`Guidelines/feedback.md`, L-007.)*
- Drop `.swift` files into `SwiftKit/<subdir>/` — `PBXFileSystemSynchronizedRootGroup` auto-syncs. *(L-010.)*
- `Documentation/` stays a project-root sibling, never inside `SwiftKit/SwiftKit/`. *(L-010.)*
- Keep `GalleryRegistry.allItems` flat (currently `[]` after Phase 0a strip; rebuilt in Phase 2). *(L-011.)*
- Semantic tokens only. *(`Guidelines/visual-rules.md`, L-001/L-012.)*
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.
- Sidebar mechanic locked at commit `753f4d9`: 3-tier disclosure (Heading → Folder → Item) with single-folder collapse.
- Catalog data model: Section → Folder → Leaf (no sub-headings). `GalleryItem` already in this shape.

## Working-tree state (uncommitted)

At handoff time:

- `.claude/CLAUDE.md` — Nathan's mid-plan-mode edit to "Pages must reasonably contain a grouping of similar items" (his content; left for him to commit).
- `.claude/handoff.md` — this file.
- `Screen Recordings/*.png` deletions (2 files) — pre-existing tree state; Nathan's call whether to stage.
- `.claude/PlanningTree` — untracked; Nathan's planning artifact.

These are all Nathan-side curation; the controller commits only its own work via explicit `git add` paths.

## Quick-resume after compaction

1. Read this `handoff.md` first.
2. Read [`framework.md`](framework.md) — full plan + classifier + kind inventory + per-phase methodology.
3. Read [`Planning/page-component-map.md`](Planning/page-component-map.md) — the unified manifest awaiting Nathan's checkpoint review.
4. Check `git log --oneline -10` to confirm latest commit.
5. If Nathan has answered the 9 PlanningTree adjustments → proceed to Phase 2 dispatch (per the framework.md Phase 2 spec). Run the gradient recapture (B10) in parallel before Phase 3 begins.
6. If Nathan hasn't answered yet → present the open items from "Current open items" above and wait.

The session has been heavy with iterative spec refinement; the latest framework.md, history.md, and per-framework manifests reflect the canonical state.
