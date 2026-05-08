# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** Phase 2 (Scaffold) ✅ complete. Phase 2.5 (read-only audit) ✅ PASS — 74/74 leaves verified, registry clean, build green. **Phase 3 unblocked**, but **B10 (gradient recapture) must run before Phase 3 dispatches**.
**Git:** `main`, last commit `72c3f78` *(Phase 2 Step 2 — 69 page-file scaffolds)*; pending audit-report commit at session-end.
**Tags:** `pre-restart` → `62db021` *(full pre-strip corpus, recoverable)*.
**Build:** ✅ green *(verified post-Phase-2 commit `72c3f78` — `xcodebuild` exited 0)*.

## Phase progression so far

| Phase | Status | Last commit |
|---|---|---|
| Bootstrap (deploy plan to framework.md) | ✓ | `d2b7048` |
| Phase 0a (strip placeholder template, restore canonical Framework labels) | ✓ | `7ea77c8` |
| Phase 0b (archive 51 SwiftUI articles + 18 AppKit articles + 180 HIG) | ✓ | `f03cb42` … `5d66ae5` |
| Phase 0c (archive 36 AppKit collectionGroup + 1 SwiftUI master `_index`, build unified `exclude.md`) | ✓ | `3ac3220` |
| Phase 1 — Reference / AppKit / SwiftUI sorts + closure | ✓ | `7bce9f3` |
| Phase 1 user-checkpoint + C11 sample-code review | ✅ APPROVED 2026-05-07 | `5aec288` |
| Phase 2 Step 1 — `GalleryRegistry.swift` rebuild (74 entries) | ✓ | `d297d96` |
| Phase 2 Step 2 — 69 page-file scaffolds generated | ✓ | `72c3f78` |
| Phase 2.5 — read-only audit | ✅ PASS (74/74) | (uncommitted: `Planning/scaffold-audit.md`) |
| **B10 — gradient recapture** | **next, must run before Phase 3** | — |
| Phase 3 — live tile authoring (parallel per folder) | pending | — |
| Phase 4 — polish, final review, refresh handoff/history | pending | — |

## Phase 2 outcome (locked in code)

**Registry:** `SwiftKit/Catalog/GalleryRegistry.swift` composes 74 `GalleryItem` references in sidebar order — 5 Reference extensions reused directly + 69 references to the new page-file scaffolds. `allItems` built imperatively with `+=` to dodge L-011 expression-complexity ceiling.

**Page files:** 69 new scaffold files at:
- `SwiftKit/Pages/SwiftUI/<FolderPascal>/<LeafName>GalleryPage.swift` — 63 files across 12 folders
- `SwiftKit/Pages/AppKit/<LeafName>GalleryPage.swift` — 6 files (flat, single-folder collapse)

Each scaffold is uniformly templated:
- `struct <LeafName>GalleryPage: View` with `body` calling `GalleryItemPage` using `Self.item.*` metadata
- `extension <LeafName>GalleryPage` declaring `@MainActor static let item = GalleryItem(...)` with stable ID, framework enum, folder display name, absorbed-symbols set, placeholder blurb, and the page closure
- One `VariantTile(name: "<verbatim Apple symbol>", api: nil) { Color.clear }` per manifest tile — Phase 3 fills the API string and the live render

**Audit verdict:** [`Planning/scaffold-audit.md`](Planning/scaffold-audit.md) reports **74/74 PASS**. Tile counts match manifest counts exactly; tile names verbatim-equal manifest entries; stable IDs follow `<framework>.<folder>.<leaf>` lower-camel format; no `PlaceholderGalleryPage` references survive in the registry; no placeholder name strings (`Page A1`, `Folder N Sub`) survive anywhere.

## Folder display values (for Phase 3 awareness)

| Framework | Folder display value | Leaves |
|---|---|---|
| Reference | `"Reference"` (uniform — single-folder collapse) | 5 |
| SwiftUI | `"App Structure"` | 7 |
| SwiftUI | `"Navigation"` | 6 |
| SwiftUI | `"Layout"` | 9 |
| SwiftUI | `"Containers"` | 6 |
| SwiftUI | `"Controls"` | 10 |
| SwiftUI | `"Text and Input"` | 5 |
| SwiftUI | `"Images and Shapes"` | 3 |
| SwiftUI | `"Presentation"` | 4 |
| SwiftUI | `"Toolbars and Menus"` | 3 |
| SwiftUI | `"Animation and Effects"` | 4 |
| SwiftUI | `"Accessibility"` | 3 |
| SwiftUI | `"Gestures and Input"` | 3 |
| AppKit | `"AppKit"` (uniform — single-folder collapse) | 6 |

Filesystem path uses `<FolderPascal>` (e.g., `Pages/SwiftUI/AppStructure/`) — no spaces in directory names.

## Phase 3 — what dispatches next

**Prerequisite (B10):** Run `Documentation/_index/recapture-targets.sh` for `LinearGradient`, `RadialGradient`, `AngularGradient` URLs. The 3 captured docs land in `Documentation/SwiftUI/gradients/` (or wherever the script puts them) and are tile candidates for `GradientGalleryPage`. Without recapture, Gradient page is missing 3 tiles relative to "real" Apple coverage.

**Dispatch shape:** parallel per folder (one agent per folder) — 14 dispatches (12 SwiftUI folders + 1 AppKit + Reference is already authored). Per-agent chain: implementer → spec-compliance review → code-quality review. Mandatory `swiftui-expert-skill` on every implementer AND reviewer.

**Per-page agent brief (mandatory inclusions):**
- Read this page's manifest entry (`Planning/page-component-map-{swiftui,appkit}.md` per folder)
- Read every contributing reference doc from `Documentation/<framework>/<topic>/<file>.md`
- For each tile: fill in `api: "<exact .modifier(...) call>"` parameter and the demo closure body with a live SwiftUI invocation of the documented type with the documented parameters. No invented variants. No Claude-authored wrapper views (`Guidelines/feedback.md`)
- Replace the placeholder `blurb` and `signature` (currently `"<Leaf> — Phase 3 fills this..."` and `nil`) with values drawn from the doc's `## Abstract` block (lightly grammar-edited if needed)
- Use semantic color/font tokens only. No hex, no `Color(red:green:blue:)` (L-001/L-012)
- Render dark + light both
- Page-size discipline: keep nested SwiftUI under a few hundred symbols per binding; break dense pages into `private let` subviews (L-011)

**Inline-output protocol** still applies (subagents blocked from `Write`/`Bash`) — agents return updated file contents as fenced code blocks; controller writes them.

## Rules added during this session (durable)

- **`swiftui-expert-skill` mandatory** for every Phase 0a, Phase 2, and Phase 3 implementer AND reviewer agent.
- **Subagents blocked from `Write` and `Bash`** by this user's permission stack. Workaround: agents return file content as fenced code blocks; controller writes the canonical files. Phase 2 controller-implemented when subagent dispatch added no value (mechanical templating); Phase 3 will dispatch real agents because tile authoring needs per-doc judgment per-tile.
- **Component descriptions MAY reference excluded URLs** (Phase 0c rule) — exclusion governs gallery surface, not citation scope.
- **22 sampleCode docs deferred from tiles** (C11 outcome) — none fit single-primitive-render tile model; Phase 3 may cite them in tile descriptions.
- **No topic pages, no overviews, no guides in the gallery.** Unified index at [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).
- **Variant consolidation rule rejected** (post-V1 revisit) — Phase 3 keeps per-variant tile pattern.
- **Imperative `+=` over chained `+`** for `[GalleryItem]` aggregations of >5 sub-arrays — chained `+` trips L-011 expression-complexity ceiling once forward-references span 14+ unresolved view types.

## Key file locations

- **Plan canonical home:** [`framework.md`](framework.md) (Plan Sync Rule).
- **Phase 1 manifest (APPROVED):** [`Planning/page-component-map.md`](Planning/page-component-map.md) — locked 2026-05-07.
- **Per-framework manifests:** [`Planning/page-component-map-{reference,swiftui,appkit}.md`](Planning/).
- **Sort decisions audit trail:** [`Planning/sort-decisions.md`](Planning/sort-decisions.md) + per-framework variants.
- **Phase 2.5 scaffold audit:** [`Planning/scaffold-audit.md`](Planning/scaffold-audit.md) — 74/74 PASS.
- **Exclusion index (286 URLs):** [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).
- **Active-corpus `kind` inventory** (16 distinct values, 2,249 docs): in `framework.md` Execution Methodology.
- **Reusable scaffold-generation script** (one-shot, kept for reference): `/tmp/swiftkit_generate_step2.py` (NOT in repo).
- **Reusable scaffold-audit script** (one-shot): `/tmp/swiftkit_audit_step2.py` (NOT in repo).

## Standing constraints *(unchanged)*

- macOS 26 only. Dark mode first. Apple primitives only. No SwiftData. *(L-007.)*
- Drop `.swift` files into `SwiftKit/<subdir>/` — `PBXFileSystemSynchronizedRootGroup` auto-syncs. *(L-010.)*
- `Documentation/` stays a project-root sibling, never inside `SwiftKit/SwiftKit/`. *(L-010.)*
- Keep `GalleryRegistry.allItems` flat. Imperative `+=` accumulator stays inside the closure init. *(L-011.)*
- Semantic tokens only. *(L-001/L-012.)*
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.
- Sidebar mechanic locked at commit `753f4d9`: 3-tier disclosure with single-folder collapse.
- Catalog data model: Section → Folder → Leaf.

## Working-tree state (uncommitted at handoff time)

- `.claude/Planning/scaffold-audit.md` — Phase 2.5 audit report.
- `.claude/handoff.md` — this file.

Pre-existing Nathan-side curation (untouched):
- `.claude/CLAUDE.md` — Nathan's mid-plan-mode edits.
- `Screen Recordings/*.png` deletions.
- `.claude/PlanningTree` — untracked Nathan artifact.

## Quick-resume after compaction

1. Read this `handoff.md` first.
2. Read [`framework.md`](framework.md) — full plan.
3. Confirm `git log --oneline -10` shows commits through `72c3f78` (Phase 2 Step 2) plus the audit-closure commit (this session-end).
4. **Run B10 first:** `Documentation/_index/recapture-targets.sh` for the 3 gradient URLs. Then verify the new doc files landed under `Documentation/SwiftUI/gradients/` (or wherever Apple's URL structure puts them). Append the 3 new tiles to `GradientGalleryPage.swift` (currently 14 tiles → 17 expected).
5. Phase 3 dispatch: 14 parallel implementer agents (one per folder), each authoring tiles for the 3-10 leaves in their folder. Each agent:
   - Loads `swiftui-expert-skill` first
   - Reads the manifest section + each tile's source doc under `Documentation/<fw>/<topic>/<file>.md`
   - Returns updated `<LeafName>GalleryPage.swift` files as fenced output
   - Controller writes; spec + code reviewers per folder verify
6. After all 14 folders pass review, manual click-through dark + light, then Phase 4 closure.

The 5 Reference pages already have full live-tile content and are the canonical authoring template for Phase 3's pattern (`Pages/Reference/MaterialsGalleryPage.swift` is a representative example).
