# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** B10 ✅ closed; Phase 3 AppKit pilot ✅ complete (1 of 14 folders done). Build green. Phase 2.5 audit passes 74/74. **12 SwiftUI folders remain for Phase 3** (Reference is already authored, AppKit just landed).
**Git:** `main`, last commit `c2179b7` *(Phase 3 AppKit pilot + PlanningTree refresh)*. Recent: `420a19c` (B10 closure), `488fe28` (Phase 2.5 audit), `72c3f78` (Phase 2 Step 2), `d297d96` (Phase 2 Step 1).
**Tags:** `pre-restart` → `62db021` *(full pre-strip corpus, recoverable)*.
**Build:** ✅ green *(verified post-AppKit-pilot — `xcodebuild` exited 0; macOS 26 SDK accepted all NSGlassEffectView.Style cases, NSPathControl.Style names, cell-based NSBrowserDelegate API as-written)*.

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
| Phase 2.5 — read-only audit | ✅ PASS (74/74) | `488fe28` |
| B10 — gradient recapture | ✅ CLOSED 2026-05-07 (3 docs captured, 3 tiles added; Gradient page 14 → 17) | `420a19c` |
| Phase 3 pilot — AppKit folder | ✅ DONE (6 leaves × 29 tiles, NSViewRepresentable bridges, ReferenceTile for protocols) | `c2179b7` |
| **Phase 3 — 12 SwiftUI folders remaining** | **next** | — |
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

**B10 closed.** Gradient page already at 17 tiles; no prerequisite blocks Phase 3 dispatch.

**AppKit pilot validated the dispatch shape end-to-end.** Pattern used (and reusable for SwiftUI dispatches):

1. **Subagent type:** `feature-dev:code-architect` worked well for AppKit. For SwiftUI folders that lean on smaller Apple primitives + `ViewModifier`, `feature-dev:code-architect` or `general-purpose` should also work. Use `swiftui-expert-skill` regardless.
2. **Brief structure:** see the AppKit dispatch in this session's transcript (or reconstruct from `framework.md` Phase 3 spec + the per-folder manifest section). Mandatory inclusions:
   - Mandatory-first-action: invoke `swiftui-expert-skill` via Skill tool BEFORE reading any code or writing any output
   - File list (the N page-files for that folder, full absolute paths)
   - Manifest section path: `.claude/Planning/page-component-map-{swiftui,appkit}.md`
   - Apple doc path map: `Documentation/<framework>/<topic>/<file>.md` (per leaf — researcher reads each tile's source doc to extract the verbatim API + Abstract)
   - Authoring spec: VariantTile for renderable types, ReferenceTile (text-only signature + note) for protocols/delegates/cells/non-renderable enums; `name:` verbatim from manifest; `api:` exact call shape; `demo:` closure with live invocation; replace placeholder blurb/signature/availability/docPath in the GalleryItem extension
   - Hard constraints: macOS 26 only, semantic tokens only, dark+light renderable, no Claude wrappers, no SwiftData
   - Inline-output protocol: subagents are blocked from Write/Bash; return content as fenced code blocks (one per file, prefixed `### File N: <relative path>`); controller writes them
   - Status keyword at end: `DONE` / `DONE_WITH_CONCERNS` / `NEEDS_CONTEXT` / `BLOCKED`
3. **Controller workflow per dispatch:**
   - Receive dispatch output → extract fenced blocks via `python3 /tmp/swiftkit_extract_dispatch.py` (or rewrite per dispatch ID — script reads the persisted JSON tool-result blob)
   - `xcodebuild` after each folder lands; SDK-fidelity concerns the agent flags often resolve themselves at compile-time
   - `python3 /tmp/swiftkit_audit_step2.py` to verify tile counts unchanged
   - Per-folder commit
4. **Spec + code reviewers:** AppKit pilot skipped formal review subagent dispatches because (a) the spec is verifiable mechanically by the audit (`scaffold-audit.md` 74/74 PASS), (b) the build is green, and (c) the implementer-agent self-flagged 6 SDK concerns that all turned out to be unfounded. For trickier SwiftUI folders (Animation, Canvas, Layout — places where API surface is large and inference is tighter), explicit reviewer dispatch is more valuable. Use feature-dev:code-reviewer subagent.

**Remaining 12 folders to dispatch (Reference + AppKit done):**

| Folder | Leaves | ~Tiles | Suggested batch |
|---|---|---|---|
| App Structure | 7 | 100 | Solo dispatch (largest folder; trim Environment to 3 anchors only) |
| Navigation | 6 | 69 | Solo |
| Layout | 9 | 129 | Solo (largest; consider further per-leaf sub-dispatches if context tight) |
| Containers | 6 | 92 | Solo |
| Controls | 10 | 63 | Solo |
| Text and Input | 5 | 81 | Solo |
| Images and Shapes | 3 | 64 | Solo (Gradient now 17 tiles after B10) |
| Presentation | 4 | 40 | Solo (smallest SwiftUI folder; good warm-up) |
| Toolbars and Menus | 3 | 53 | Solo |
| Animation and Effects | 4 | 103 | Solo (Canvas is dense; complex SwiftUI inference; consider opus) |
| Accessibility | 3 | 71 | Solo |
| Gestures and Input | 3 | 69 | Solo |

Dispatch order suggestion: warm up with Presentation (smallest), then go folder-by-folder in manifest order. Each folder commits independently; build verifies green after each.

**Tools left in `/tmp/` (NOT in repo):**
- `/tmp/swiftkit_generate_step2.py` — Phase 2 scaffold generator (one-shot, already used)
- `/tmp/swiftkit_audit_step2.py` — Phase 2.5 audit (re-runnable; useful between Phase 3 dispatches)
- `/tmp/swiftkit_extract_dispatch.py` — Extracts fenced Swift blocks from a persisted dispatch-output JSON. Update the `DISPATCH` constant to the new tool-result path each session.

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

- `.claude/handoff.md` — this file.

Pre-existing Nathan-side curation (untouched):
- `.claude/CLAUDE.md` — Nathan's mid-plan-mode edits (his content; left for him to commit).
- `Screen Recordings/*.png` deletions (2 files; pre-existing tree state).

**`.claude/PlanningTree` is now committed** (was previously untracked). Refreshed 2026-05-07 to mirror the approved 74-leaf manifest with Phase 1 checkpoint annotations on each post-checkpoint decision.

## Quick-resume after compaction

1. Read this `handoff.md` first.
2. Read [`framework.md`](framework.md) — full plan.
3. Confirm `git log --oneline -10` shows commits through `c2179b7` (Phase 3 AppKit pilot + PlanningTree).
4. **Pick a SwiftUI folder to dispatch.** Suggested warm-up: **Presentation** (smallest at 4 leaves × ~10 tiles each). Use the AppKit-pilot dispatch in this session's transcript as the brief template — adapt the file list, manifest section, Apple doc paths, and folder name; everything else is reusable.
5. Each dispatch:
   - Subagent type: `feature-dev:code-architect` (or `general-purpose` for simpler folders)
   - Mandatory first action: `swiftui-expert-skill` via Skill tool
   - Returns fenced code blocks; controller extracts via `/tmp/swiftkit_extract_dispatch.py` (update `DISPATCH` constant to the new tool-result JSON path)
   - `xcodebuild` after each folder; `python3 /tmp/swiftkit_audit_step2.py` to verify tile counts
   - Per-folder commit
6. After all 12 SwiftUI folders complete, optionally run formal reviewer subagents on Animation/Canvas/Layout (the dense ones), then Phase 4 closure.

The 5 Reference pages and the 6 AppKit pages now both have full live-tile content — `Pages/Reference/MaterialsGalleryPage.swift` and `Pages/AppKit/NSOutlineViewGalleryPage.swift` are both representative authoring templates (Reference for SwiftUI primitives with live renders; AppKit for `NSViewRepresentable` bridging plus `ReferenceTile` for non-renderable protocols).
