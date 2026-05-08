# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Status:** Phase 3 **REDESIGNED 2026-05-07**. Plan approved by Nathan; **queued for execution tomorrow**. The previous Phase 3 (uniform-grid scaffold + per-folder live-tile authoring) was scrapped after the cookie-cutter shell was identified as the wrong move. The new Phase 3 is per-page bespoke integration on opus with per-folder Nathan checkpoints. Build remains green; no code changes landed today — only docs + plan-file infrastructure.

**Git:** `main`, last shipped commit `c1a2cd7` *(.claude cleanup: drop stale Phase 0b artifacts + refresh framework.md)*. Today's working-tree changes (uncommitted at handoff time): `framework.md`, `handoff.md`, `history.md`, `Planning/page-logic-log.md` (new, empty seed), and `~/.claude/plans/rippling-wiggling-widget.md` (Phase 3 redesign draft, lives outside the repo).

**Build:** ✅ green (verified post-AppKit-pilot at `c2179b7`; no code touched since).

## Phase progression so far

| Phase | Status | Last commit |
|---|---|---|
| Bootstrap (deploy plan to framework.md) | ✓ | `d2b7048` |
| Phase 0a (strip placeholder template, restore canonical Framework labels) | ✓ | `7ea77c8` |
| Phase 0b (archive 51 SwiftUI articles + 18 AppKit articles + 180 HIG) | ✓ | `f03cb42` … `5d66ae5` |
| Phase 0c (archive 36 AppKit collectionGroup + 1 SwiftUI master `_index`, build unified `exclude.md`) | ✓ | `3ac3220` |
| Phase 1 — Reference / AppKit / SwiftUI sorts + closure | ✓ | `7bce9f3` |
| Phase 1 user-checkpoint + C11 sample-code review | ✅ APPROVED | `5aec288` |
| Phase 2 Step 1 — `GalleryRegistry.swift` rebuild (74 entries) | ✓ | `d297d96` |
| Phase 2 Step 2 — 69 page-file scaffolds generated | ✓ | `72c3f78` |
| Phase 2.5 — read-only audit | ✅ PASS (74/74) | `488fe28` |
| B10 — gradient recapture | ✅ CLOSED | `420a19c` |
| Phase 3 pilot — AppKit folder | ✅ DONE (6 leaves × 29 tiles) — **now folded into W6 for re-layout under new methodology** | `c2179b7` |
| **Phase 3 redesign — Phase 3a strip + Phase 3b per-page integration, 6-wave plan** | **APPROVED 2026-05-07; queued for tomorrow** | — |
| Phase 4 — post-wave cleanup, polish, closure | pending | — |

## Why Phase 3 was redesigned

The scaffold pass wrapped every page in an identical `GalleryItemPage { VariantTile { Color.clear } × N }` shell, regardless of what the page documents. Buttons want a condensed grid; sliders want horizontal breathing room; navigation views consume the entire pane and want bare full-bleed listings; typography wants hand-crafted single-column rows with side-aligned API metadata. The OG Typography page (recoverable at `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift`) is concrete proof that bespoke per-page layout works. Phase 2's scaffold + the AppKit pilot still landed in the cookie-cutter shell; both are now treated as starting reference for re-authoring under the redesign.

Nathan's directive verbatim:
> "Each page should not be like typography — but each page should be formatted as best for their own individual requirements... and that's what the og typo page did well. We need to strip the page contents while keeping the filetree the same; and re-scope how we should engrain the scaffolding phase alongside the integration phase to be one in the same."

> "Each agent must be pre loaded with the using-superpowers skill and swift-ui skill."

> "Each page should be given the most care as possible."

> "Open items will be sorted out after the waves; so after I'm happy with the implementation phase; we will then sort and integrate any orphans or uncertain components."

## What dispatches first tomorrow

### Step 1 — Phase 3a strip (mechanical)

**Goal:** clear the 63 SwiftUI placeholder page bodies to `EmptyView()` while leaving the `static let item = GalleryItem(...)` extension intact so `GalleryRegistry` keeps resolving. Reference + AppKit pages NOT touched.

**Dispatch:** one haiku-tier agent, single batch. Mandatory baseline skills: `superpowers:using-superpowers` + `swiftui-expert-skill` (yes, even on the mechanical strip — non-negotiable per Nathan's rule).

**Allowlist:** the 63 files at `SwiftKit/SwiftKit/Pages/SwiftUI/<Folder>/<Leaf>GalleryPage.swift`. Must NOT touch `Pages/Reference/`, `Pages/AppKit/`, `Pages/_Shared/`, `Detail/PageScaffold/`.

**Expected resulting shape per file:**
```swift
import SwiftUI

struct ButtonGalleryPage: View {
    var body: some View { EmptyView() }
}

extension ButtonGalleryPage {
    @MainActor static let item = GalleryItem(/* unchanged */)
}
```

**Verification:** `xcodebuild` green; `grep -rn "Color.clear" SwiftKit/SwiftKit/Pages/SwiftUI` returns zero; `grep -rn "static let item" SwiftKit/SwiftKit/Pages/SwiftUI | wc -l` returns 63; sidebar still navigates to every leaf, body just renders empty.

**Commit message:** `Phase 3a — strip 63 SwiftUI placeholder bodies (Phase 3b unblocked)`.

### Step 2 — Phase 3b W1: Reference (warm-up)

5 leaves, sequential single-folder. Typography goes first as the shape exercise that prompted the redesign. Order: Typography → SF Symbols → Color → Motion → Materials.

Per-page chain (4 stages, all on opus-tier, baseline skills + stage-specific skills layered):

1. **Layout design** — opus + `ui-ux-pro-max` + `find-docs` + optional `superpowers:brainstorming`. Output: design doc with chosen layout shape, rationale, sketched code structure. **Nathan checkpoint** for the FIRST page in each folder.
2. **Implementation** — opus + `find-docs` + `superpowers:test-driven-development` + `superpowers:verification-before-completion`. Output: full page file as fenced Swift block.
3. **Spec compliance review** — opus + `superpowers:requesting-code-review`. Iterates with implementer until ✅.
4. **Code quality review** — opus + `superpowers:requesting-code-review` + `ui-ux-pro-max`. Iterates until ✅.
5. **Logic-log entry** — same agent as stage 2, after both reviews ✅. Append to `Planning/page-logic-log.md`.

**Folder-close checkpoint:** Nathan does manual click-through (dark + light) of all 5 Reference pages before W2 dispatches.

### Wave plan (full Phase 3b)

| Wave | Folders | Leaves | Notes |
|---|---|---|---|
| **W1** (warm-up, sequential) | Reference | 5 | Typography first; logs seed prior art for SwiftUI waves |
| **W2** (parallel folders) | Presentation, Toolbars and Menus, Gestures and Input, Accessibility, Images and Shapes | 16 | Mid-complexity, well-bounded |
| **W3** (parallel folders) | Text and Input, Animation and Effects, Containers | 15 | Higher tile-density |
| **W4** (parallel folders) | Controls, Layout, Navigation | 25 | Highest variation; bare full-bleed cases live here |
| **W5** (parallel folders) | App Structure | 7 | App-shell primitives |
| **W6** (parallel pages, single folder) | AppKit | 6 | Re-layout pilot pages; bridges + tiles stay |

**Within-folder rule:** sequential — each successive page benefits from the previous page's logic-log entry.
**Across-folder rule:** parallel within a wave — folders are disjoint; logic-log writes serialized by controller.

### Nathan checkpoints (the only stop conditions)

- **Design pre-flight** — first page in each folder shows its layout-design doc to Nathan for approval before implementation.
- **Folder-close visual review** — after every page in a folder commits, Nathan does dark+light click-through and approves before next folder dispatches.
- **Per-page interrupt** — any agent can flag "this page raises a question I need a human on" and the controller surfaces it.

### Review iteration ceiling

**None.** Reviewers loop with implementer until both ✅.

## Open items — DEFERRED to Phase 4

Per Nathan's direction: orphans, uncertain components, and any open architectural questions are NOT pre-decided. They get sorted out post-waves once Nathan signs off on the implementation phase. Includes (documented for tomorrow's awareness, no action):

- `Pages/_Shared/PlaceholderGalleryPage.swift` — orphan, deletion deferred to Phase 4.
- `Pages/_Shared/DescribePage.swift` — orphan (uses `GalleryPageScaffold`, not in `GalleryRegistry`); the "old gallery toggle" half-deletion remnant. Deletion deferred to Phase 4.
- `Detail/PageScaffold/GalleryPageScaffold.swift` — only used by `DescribePage`. Deletion deferred to Phase 4.
- `SwiftKit/ContentView.swift` — trivial 7-line wrapper around `RootView()`. Inline into `SwiftKitApp.swift` deferred to Phase 4.
- `Detail/DetailPane.swift` line 32 comment ("Reusable across both sidebar modes") — stale; second mode no longer exists. Comment cleanup deferred to Phase 4.
- `BareItemPage` extraction timing — let first W4 Navigation agent write it locally; revisit post-W4.
- Any uncertain-component decisions held open during waves — gathered and resolved at start of Phase 4.

## Folder display values (for Phase 3 awareness — unchanged)

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

## Logic log (new — Phase 3b discipline)

**Location:** [`Planning/page-logic-log.md`](Planning/page-logic-log.md). Single append-only file. Empty seed will be created tomorrow before W1 Typography dispatches. Each implementer reads the entire log before drafting layout, then appends their own entry as the final act before handing back code.

**Entry format (≤12 lines):**
```markdown
### <Heading> > <Folder> > <Leaf> — <YYYY-MM-DD>
- Layout: <chosen shape + key parameters>.
- Why: <component-driven rationale>.
- Tile/row shape: <heights, widths, metadata column, special wrappers>.
- Demos: <live vs reference, dark+light verified, any unusual rendering choices>.
- New primitive proposed: <none | name + brief>.
- Heads-up for siblings: <what the next agent should know>.
```

## Key file locations

- **Plan canonical home:** [`framework.md`](framework.md) (Plan Sync Rule). Phase 3 redesign now lives here.
- **Phase 3 redesign draft:** `~/.claude/plans/rippling-wiggling-widget.md` (lives outside the repo; archive after tomorrow's work begins).
- **Phase 1 manifest (APPROVED):** [`Planning/page-component-map.md`](Planning/page-component-map.md) — locked 2026-05-07.
- **Per-framework manifests:** [`Planning/page-component-map-{reference,swiftui,appkit}.md`](Planning/).
- **Sort decisions audit trail:** [`Planning/sort-decisions.md`](Planning/sort-decisions.md) + per-framework variants.
- **Phase 2.5 scaffold audit:** [`Planning/scaffold-audit.md`](Planning/scaffold-audit.md) — 74/74 PASS.
- **Logic log (new, Phase 3b):** [`Planning/page-logic-log.md`](Planning/page-logic-log.md).
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
- **Mandatory baseline skill kit on every Phase 3 dispatch (incl. mechanical 3a):** `superpowers:using-superpowers` + `swiftui-expert-skill`.

## Quick-resume tomorrow

1. Read this `handoff.md` first.
2. Read [`framework.md`](framework.md) — full plan with the redesigned Phase 3.
3. Confirm `git log --oneline -5` shows `c1a2cd7` at top.
4. **Step 1: dispatch Phase 3a strip** — one haiku-tier agent, baseline skills loaded, allowlist of 63 SwiftUI page files. Verify with `xcodebuild` + `grep` checks. Commit.
5. **Step 2: dispatch W1 Typography (layout design stage)** — opus + baseline skills + `ui-ux-pro-max` + `find-docs` + `superpowers:brainstorming` (optional). Output: design doc. Show to Nathan for approval before stage 2 fires.
6. After Nathan approves the W1 layout pattern, run stages 2–5 for Typography autonomously, then move to SF Symbols sequentially, etc.
7. After all 5 Reference pages commit, Nathan does folder-close click-through. Then W2 dispatches in parallel across 5 folders.

## Working-tree state (uncommitted at handoff time)

- `.claude/framework.md` — Phase 3 redesign deployed; Phase 4 absorbs orphans; Critical Reused Code reframed as toolkit; Components log entry appended.
- `.claude/handoff.md` — this file.
- `.claude/history.md` — 2026-05-07 redesign entry to be appended.
- `.claude/Planning/page-logic-log.md` — empty seed (file to be created next).
