# SwiftKit — Framework

## Vision and Purpose

A personal Apple-component reference library, native to macOS. Two outputs:

1. **`SwiftKit.app`** — a macOS gallery app. Each page documents one user-recognizable component with every documented variant rendered as a tile alongside its exact API call. Light/dark toggle on the detail pane (default dark).
2. **`Documentation/`** (project-root sibling of the Xcode app target) — a complete local mirror of Apple's documentation as flat markdown files. The authoring source for every gallery page.

The motivation is concrete: Pommora's UI shell rebuild stalled because there was no confirmed visual reference for what Apple's primitives actually render as on macOS 26. Every "build the sidebar" task became a guessing game off after-the-fact screenshots. SwiftKit is the reference. When Pommora needs a component, Nathan points at SwiftKit and says "that one." No invention. No interpretation.

## Current State

Live state lives in [`handoff.md`](handoff.md). Chronological record lives in [`history.md`](history.md). The 2026-05-07 strip baseline (21 Swift files, empty registry, 2,535-file doc mirror) is preserved at git tag `pre-restart` → `62db021` for recovery via `git show pre-restart:<path>`.

## MVP Plan — Foundation to Completion

> **Plan Sync Rule.** This section is the canonical home for the SwiftKit MVP plan. Any change to phasing, dispatch, manifests, or constraints during execution updates this section *immediately* — never out of band. Plan changes are logged as dated entries in [`history.md`](history.md) per the project memory protocol.

### MVP Definition

A navigable macOS gallery with three top-level headings (Reference, SwiftUI, AppKit). Each leaf page presents a grid of tiles for one user-recognizable component family — folder/leaf names are grammatical (e.g. "Lists" → "Tables"), tile headers are verbatim Apple type names (e.g. `TableColumnContent`), and each tile carries a brief description plus a live render. Detail pane defaults to dark; sidebar tracks system colorScheme.

### Locked Decisions (do not revisit)

- **Sidebar UI:** 3 tiers — Heading → Folder → Page — with single-folder collapse. Locked at commit `753f4d9`.
- **Page model:** one page = one user-recognizable component family. Modifiers and sub-types fold in as tiles. Pages are Figma-design-system-style groupings of similar items.
- **Tile model:** verbatim Apple type-name header + brief description (sourced from doc Abstract) + live SwiftUI render.
- **PlanningTree** at `.claude/PlanningTree` is the **starting hypothesis** for the page list — sorting confirms or adjusts; user approves the final manifest before scaffolding.
- **Catalog data model:** Section → Folder → Leaf (no sub-headings). Drop the optional sub-heading tier from `GalleryItem`.
- **HIG default:** all 180 HIG docs go to the guides list. Cross-checked during sort for any components found nowhere else.
- **Stack constraints unchanged.** See `## Hard Constraints` below.

---

### Execution Methodology

Every phase is executed via fresh subagents per task. The controller (orchestrator session) holds no implementation context — each subagent is briefed with exactly what it needs and nothing more. Tasks dispatch in **parallel batches when their files are disjoint**, and **sequentially when they share a file** (e.g. `GalleryRegistry.swift`). This combines `superpowers:subagent-driven-development` with `superpowers:dispatching-parallel-agents`.

**Per-task workflow** *(applies to every task in every phase)*

1. **Dispatch implementer.** Briefed with: full task spec, scoped file list, mandatory skill kit, phase rules. Implements, runs build, commits, self-reviews. Returns one of `DONE`, `DONE_WITH_CONCERNS`, `NEEDS_CONTEXT`, `BLOCKED`.
2. **Spec compliance review.** Fresh reviewer subagent. Verifies code matches the spec — no gaps, no extras. If issues, implementer fixes; reviewer re-reviews until ✅.
3. **Code quality review.** Fresh reviewer subagent. Verifies build green, naming, semantic tokens, L-001/L-007/L-010/L-011/L-012 compliance, no Claude-authored wrapper views. Loop until ✅.
4. **Mark complete; advance.** No "should I continue?" check-ins.

**Parallel batches** *(parallel-safe phases only)*

| Phase | Dispatch | Why parallel-safe |
|---|---|---|
| 0b — Doc triage | 3 parallel (SwiftUI articles / AppKit articles / HIG) | Disjoint folders; each writes its own archive subtree |
| 1 — Sorting | 3 parallel (Reference / SwiftUI / AppKit) | Each writes a disjoint section of `Planning/page-component-map.md` |
| 2 — Page-file scaffold *(after registry build)* | N parallel (one per folder) | Each generates page files in its own `Pages/<Heading>/<Folder>/` subtree |
| 3 — Implementation | N parallel (one per folder) | Each authors its own folder's page files; no shared file edits |

Sequential-only tasks: Phase 0a (catalog tier change), Phase 2 registry build, Phase 2.5 audit, Phase 4 closure.

**Model selection**

| Task complexity | Model |
|---|---|
| Mechanical (1–2 files, scaffold generation, read-only audit) | Cheap (haiku-tier) |
| Integration (sort manifests, registry build, page authoring) | Standard (sonnet-tier) |
| Architecture / final review / ambiguity resolution | Most capable (opus-tier) |

**Mandatory skill kit per agent type**

- **All implementers:** `superpowers:test-driven-development`, `superpowers:verification-before-completion`.
- **Sort agents (Phase 0b/1):** `find-docs` (Context7 fallback for type lookups).
- **Phase 2 and Phase 3 agents — ALL of them, no exceptions:** `swiftui-expert-skill` is **mandatory**. Every implementer agent dispatched in Phase 2 (registry rebuild, per-folder page-file scaffold generation) and Phase 3 (per-folder live-tile authoring) MUST invoke `swiftui-expert-skill` via the Skill tool at the start of its work, before writing any Swift. This applies to spec-compliance reviewers and code-quality reviewers in those phases too — they review SwiftUI code against the skill's standards. Plus `find-docs` for any API lookup. Phase 0a's single implementer also loads `swiftui-expert-skill`.
- **All reviewers:** `superpowers:requesting-code-review` (the canonical review template).

**Status handling**

- `DONE` → advance to spec review.
- `DONE_WITH_CONCERNS` → read concerns; address scope/correctness items before reviews; note observations.
- `NEEDS_CONTEXT` → controller provides; re-dispatch same agent type.
- `BLOCKED` → diagnose: (a) context gap → more context + re-dispatch; (b) capability gap → upgrade model; (c) scope gap → split task; (d) plan gap → **escalate to Nathan** (only stop condition).

**Mandatory user checkpoints** *(only stop conditions)*

- **End of Phase 1:** Nathan approves `Planning/page-component-map.md` before Phase 2.
- **End of Phase 2.5:** Nathan reviews `Planning/scaffold-audit.md` if any fail rows are present.
- **BLOCKED status the controller can't resolve.**

Everything else runs continuously.

---

### Phase 0a — Strip Placeholder Template, Restore Canonical Framework Labels *(✅ DONE — commit `7ea77c8`)*

**Dispatch:** 1 sequential implementer (cheap model — single mechanical refactor) → spec review → code review.

**Goal:** Reset the catalog and sidebar to a clean baseline before Phase 0b touches docs. Empty registry, canonical framework labels (no more "Folder 1/2/3" placeholder masking), single source-of-truth shape ready to be repopulated from the Phase 1 manifest in Phase 2.

**Reality check (post-strip).** `GalleryItem.swift` is already `Section → Folder → Leaf` — there is no sub-heading field to drop. `SidebarView.swift`'s two-branch render is the locked single-folder-collapse mechanic (`history.md` 2026-05-02), not a sub-heading flatten. Phase 0a's actual work is stripping the 81-item placeholder template and restoring canonical framework display data. The original plan text said "remove optional sub-heading field" based on history.md's design-intent description; that field never made it into post-strip code.

**Critical files:**
- `SwiftKit/Catalog/GalleryRegistry.swift` — delete the `makePlaceholderTemplate()` and `makePlaceholder(...)` private functions; replace `static let allItems: [GalleryItem] = makePlaceholderTemplate()` with `static let allItems: [GalleryItem] = []`. Existing `byFramework`, `item(forID:)`, `idToItem`, and `groupByFolder(items:)` work unchanged with an empty `allItems`. Update the doc-comment header to describe the empty-registry-pending-Phase-2 state.
- `SwiftKit/Catalog/GalleryItem.swift` — restore canonical `Framework.displayName` and `Framework.sidebarSymbolName`: `.reference → "Reference" / "book.closed"`, `.swiftUI → "SwiftUI" / "swift"`, `.appKit → "AppKit" / "square.grid.2x2"`. *(Currently this extension lives at the bottom of `GalleryRegistry.swift`, not `GalleryItem.swift` — update wherever it actually is.)* Drop the placeholder-mode comment block.

**Files NOT touched (locked):**
- `SwiftKit/Catalog/GalleryItem.swift` struct definition — already `Section → Folder → Leaf`.
- `SwiftKit/App/SidebarView.swift` — two-branch render is the locked single-folder-collapse mechanic. Do not change.
- `SwiftKit/Pages/_Shared/PlaceholderGalleryPage.swift` — stays on disk (no longer referenced after 0a) until Phase 4 cleanup.

**Verification:** `xcodebuild` green. App launches. Sidebar List renders empty (zero rows) — correct, because `allItems = []` and `byFramework` filters out empty frameworks. No regression elsewhere.

---

### Phase 0b — Documentation Triage *(✅ DONE — commits `f03cb42` … `5d66ae5`)*

**Dispatch:** 3 **parallel** implementers (standard model). Disjoint scope — no file conflicts.
- Agent A: SwiftUI articles (~56 `kind: article` files under `Documentation/SwiftUI/`)
- Agent B: AppKit articles (~all `kind: article` files under `Documentation/AppKit/`)
- Agent C: HIG corpus (180 files under `Documentation/HIG/`)

Each agent runs its own implementer → spec review → code review chain. After all three return `DONE`, the controller merges their findings into the unified outputs below.

**Goal:** Separate guides from API references without losing any component coverage. Reversible — guides are archived, not deleted, until Phase 1's manifest confirms full component coverage.

**Mechanical pass:**
- Identify every doc with `kind: article` (~56 in SwiftUI) and every HIG doc (180 files).
- Move (not delete) those files to `Documentation/_archive/guides/<framework>/...` preserving relative path.
- Write `Documentation/_links/guides.md` — ordered list of guide URLs + titles, mirroring the format of existing `_links/swiftui-urls.md`.

**Manual review pass:**
- Skim each guide for inline component types not present elsewhere in the type-doc folders. Maintain a short list (`Planning/guide-orphan-components.md`) of any components found only in guides — these flow into Phase 1's sort.

**Critical files / outputs:**
- New: `Documentation/_links/guides.md`
- New: `Documentation/_archive/guides/...` (the archived markdowns)
- New: `Planning/guide-orphan-components.md`
- Existing reference: `Documentation/_links/swiftui-urls.md`, `Documentation/_links/appkit-urls.md`, `Documentation/_links/hig-urls.md`.

**Verification:** `find Documentation -name "*.md" | wc -l` accounts for every original file as either still-in-place or archived. No file unaccounted for. `Documentation/_links/guides.md` URL count matches `_archive/guides` file count.

---

### Phase 0c — Topic-Page Archival *(✅ DONE — commit `3ac3220`)*

**Dispatch:** 1 sequential controller pass — no subagent needed (mechanical archival + single index file write). Was inserted mid-Phase-1 after Nathan reinforced "only components in the project; articles, guides, and topic pages all go in `exclude.md`."

**Goal:** Move every navigation/landing/topic-group file out of the active doc tree alongside the Phase 0b article archive, and consolidate every excluded URL into a single `Documentation/_links/exclude.md` index.

**Scope:**
- AppKit `kind: collectionGroup` files (~36) — sub-topic landings like `views-and-controls/slider.md`, `cocoa-bindings/nsplaceholders.md`. Move to `Documentation/_archive/topic-pages/AppKit/<topic>/...`.
- SwiftUI master `_index/_index.md` (`kind: framework`, 1 file) — move to `Documentation/_archive/topic-pages/SwiftUI/_index/_index.md`.
- Any `_index.md` files anywhere else in the active SwiftUI/AppKit tree (current count is 0 elsewhere; verify before move).

**Outputs:**
- New: `Documentation/_links/exclude.md` — unified index of every excluded URL, sectioned: Articles (SwiftUI + AppKit), Guides (HIG), Topic Pages (SwiftUI + AppKit). Replaces and supersedes `Documentation/_links/guides.md` (which can be deleted or kept as a redirect note).
- New: `Documentation/_archive/topic-pages/<framework>/...` — archived markdowns.

**Component description rule:** Phase 3 implementation agents authoring tile descriptions MAY reference excluded URLs (articles/guides/topic pages) for context — they're allowed to cite Apple's broader documentation for a component, even though those URLs themselves don't get gallery pages. The exclusion is about WHAT BECOMES A GALLERY PAGE, not what a description can cite.

**Verification:**
- `grep -rl "^kind: collectionGroup" Documentation/SwiftUI/ Documentation/AppKit/ --exclude-dir=_archive` returns zero matches.
- `find Documentation/SwiftUI Documentation/AppKit -name "_index.md" -not -path "*/_archive/*"` returns zero results.
- `find Documentation/_archive/topic-pages -name "*.md" | wc -l` matches the archived file count (~37).
- `Documentation/_links/exclude.md` exists with sections covering articles, guides, and topic pages.

---

### Phase 1 — Sorting and Manifest Authoring *(✅ DONE — sorts `65efed1` / `bdd80a2` / `bc8033e`; closure `7bce9f3`; checkpoint cleared `5aec288`; B10 closed `420a19c`)*

**Dispatch:** 3 **parallel** sort agents (standard model). Each writes a disjoint section of the manifest — no file conflicts.
- Agent R: Reference heading
- Agent S: SwiftUI heading
- Agent K: AppKit heading

Each agent's chain: implementer → spec review → code review. Spec reviewer here verifies the **classifier gate** is honored (no `kind: method`/`property` doc became a page) and every doc in scope is bucketed. Code reviewer verifies markdown structure and the audit trail in `sort-decisions.md`.

**Goal:** Produce the single source of truth for the page list and per-page component composition. Output is a markdown manifest that the user reviews and approves before any scaffolding begins.

**Approach:** Per-heading sort agents read every reference doc in their scope and output one section of the manifest.

**Agent brief (mandatory inclusions for every sort agent):**

- Treat `.claude/PlanningTree` as the starting page list. Adjust only when a doc clearly doesn't fit any proposed page or when a proposed page has no docs.

**Gallery targets** *(every doc-kind below IS gallery content — most as tiles inside their parent type's page; user-recognizable types as pages)*:

- `kind: struct`, `kind: class`, `kind: enum`, `kind: protocol`, `kind: macro`, `kind: typealias` → **page or tile**, decided by user-recognizability. Bias toward tile inside an existing page; promote to page only when the type is independently recognizable AND fits a PlanningTree leaf.
- `kind: method`, `kind: instance method`, `kind: instance-method`, `kind: type method` → **tile** under the parent type's page (Apple's "Type Methods" and "Instance Methods" sections).
- `kind: property`, `kind: instance property`, `kind: type property` → **tile** under the parent type's page (Apple's "Type Properties" and "Instance Properties" sections).
- `kind: init` → **tile** under the parent type's page (Apple's "Initializers" section).
- `kind: func` → **tile** — free function or convenience function. Routed to the closest topical page or its own page if independently user-recognizable.
- `kind: var` → **tile** — global or type-scoped property.
- `kind: case` → **tile** under the parent enum's page.
- `kind: subscript`, `kind: instance subscript` → **tile** under the parent type's page.
- `kind: sampleCode` → **case-by-case**. Sample code can be useful — evaluate each one on its merits. If the sample illustrates a concrete component pattern that warrants a tile, route it as a tile on the relevant page. If it's just a tutorial or full-app demo without a focused component scope, defer it. Not a blanket-deferral.

These are the targets per Nathan's explicit rule: *"We're targeting Type Properties, Type Methods, Functions, Instances, Instance Methods, Instance Properties, Structures, and any actual component parts."* All of them are gallery content. Tiles inside a page is the dominant placement; standalone pages are reserved for the user-recognizable primitives that anchor a page.

**Excluded entirely** *(NEVER a tile, NEVER a page, NEVER in any manifest)*:

- `kind: article` — articles and guides. Already archived in Phase 0b at `Documentation/_archive/guides/<framework>/...`.
- `kind: collectionGroup` — topic-group landing pages (e.g. `https://developer.apple.com/documentation/swiftui/menus-and-commands`). Archived in Phase 0c at `Documentation/_archive/topic-pages/<framework>/...`.
- `kind: framework` — framework root pages. Archived in Phase 0c.
- Any `_index.md` file — navigation aids. Archived in Phase 0c.
- The entire HIG corpus — all 180 docs archived in Phase 0b.

Sort agents will not encounter the excluded kinds in the active doc tree (they're already archived). If one shows up unexpectedly, defer it and flag in `sort-decisions-<framework>.md`.

**Component descriptions MAY reference excluded URLs** when citing Apple's broader documentation helps explain a component (per the Phase 0c rule). Exclusion governs what becomes a gallery page; it does not govern what a description can cite.

The unified exclusion index lives at [`Documentation/_links/exclude.md`](../Documentation/_links/exclude.md).

**Active-corpus `kind` inventory** *(post Phase 0b + 0c, full audit run 2026-05-07)*. Every value below is covered by the classifier above:

| `kind` | Count | Disposition |
|---|---|---|
| `method` | 739 | Tile |
| `struct` | 574 | Page or tile |
| `class` | 298 | Page or tile |
| `protocol` | 225 | Page or tile |
| `property` | 193 | Tile |
| `enum` | 81 | Page or tile |
| `var` | 36 | Tile |
| `func` | 32 | Tile |
| `sampleCode` | 22 | Case-by-case |
| `case` | 14 | Tile |
| `typealias` | 11 | Page or tile |
| `macro` | 11 | Page or tile |
| `instance method` | 5 | Tile |
| `article` | 5 | **Edge case** — see note below |
| `init` | 2 | Tile |
| `instance-method` | 1 | Tile |
| **Total** | **2,249** | |

**The 5 remaining `kind: article` files** are method docs whose Apple frontmatter is incorrect — `copyable(_:)`, `cuttable(for:action:)`, `pastedestination(for:action:validator:)`, `focused(_:equals:)`, `prefersdefaultfocus(_:in:)`. Phase 0b's mechanical pass moved them to archive; the controller restored them during the Phase 0b merge step (commit `eb5bacd`). They're classified as **tiles**, routed to their parent component pages (Clipboard / Focus). Sort agents treating them as tiles is correct.

If a future doc capture introduces a `kind` value not in this table, the sort agent must defer it to the orphan list and flag in `sort-decisions-<framework>.md` — never silently bucket it.
- Every doc must end up in one of three buckets: (1) a tile inside a named page, (2) the orphan list with reason, (3) the deferred list (e.g. internal helper types not for gallery surface).
- Reuse Phase 0b's `guide-orphan-components.md` — components found only in guides need a tile home in the manifest.
- Skill kit: `find-docs` (Context7 fallback for ambiguous types), `swiftui-expert-skill` (for naming/categorization sanity checks).

**Output:** `Planning/page-component-map.md` with this shape:

```markdown
## SwiftUI > Containers > Tables
- `Table` — A container that presents rows of data arranged in columns
- `TableColumn` — A column that displays a view for each row in a table
- `TableColumnContent` — A type used to define a TableColumn's content
- `TableColumnAlignment` — ...
```

Plus an "Unmapped / needs decision" appendix.

**User checkpoint (mandatory):** Nathan reviews `Planning/page-component-map.md`. Resolves the unmapped appendix. Approves explicitly before Phase 2.

**Critical files / outputs:**
- New: `Planning/page-component-map.md` (the manifest)
- New: `Planning/sort-decisions.md` (running log of every promotion/demotion/orphan decision the sort agents made — auditable trail)

**Verification:** Every reference doc (post-Phase 0b count) appears exactly once across the manifest's tiles, the orphan list, or the deferred list. No double-counting, no missing files.

---

### Phase 2 — Scaffold *(✅ DONE — Step 1 `d297d96`, Step 2 `72c3f78`)*

**Dispatch:** Sequential registry build, then **parallel** page-file generation.
- **Step 1 (sequential, standard model):** 1 implementer rebuilds `GalleryRegistry.swift` from the approved manifest. Single-file edit — must be sequential. → spec review → code review.
- **Step 2 (parallel, cheap model):** N implementers (one per folder in the manifest, e.g. ~12 SwiftUI folders + 1 Reference + 1 AppKit). Each generates page files in its own `Pages/<Heading>/<Folder>/` subtree. Disjoint output paths — fully parallel-safe. Each runs implementer → spec review → code review.

**Goal:** Stand up the entire app shell against the approved manifest with empty pages and correctly-named tile placeholders. App is fully navigable; no component renders yet.

**Tasks (covered by the dispatch above):**
- Rebuild `GalleryRegistry.swift` from the manifest. Use stable IDs derived from `<heading>.<folder>.<leaf>`.
- Generate one `<PageName>GalleryPage.swift` per leaf at `SwiftKit/Pages/<Heading>/<Folder>/`. Each file uses `GalleryItemPage` with `VariantTile` placeholders — one tile per component in the manifest, named with the verbatim Apple type name and an empty description string. No live renders yet.
- The 5 existing reference pages (Materials, Motion, Color, SF Symbols, Typography) get registered in the new tree under the Reference heading — they already hold the canonical authoring shape.

**Reuse, don't duplicate:**
- `GalleryItemPage`, `VariantTile`, `PageSection`, `APICallout`, `DemoTiles` — all already proven; do not re-author scaffolding.
- File placement under `SwiftKit/<subdir>/` — `PBXFileSystemSynchronizedRootGroup` auto-syncs (L-010).

**Mandatory:** Every Phase 2 implementer and reviewer agent must load `swiftui-expert-skill` via the Skill tool at the start of its work (see Execution Methodology > Mandatory skill kit).

**Verification:** `xcodebuild` green. Every sidebar entry navigates to a real (placeholder-content) page. No `PlaceholderGalleryPage` references remain in `GalleryRegistry`.

---

### Phase 2.5 — Scaffold Audit *(✅ DONE — 74/74 PASS, commit `488fe28`)*

**Dispatch:** 1 read-only audit agent (cheap model — pure verification, no edits). No spec/code review chain — the audit *is* the review. Reports `PASS` or `FAIL` with per-page table.

**Goal:** Verify scaffold faithfully realizes the approved manifest before content authoring begins. This gate is the structural firewall that prevents drift back into the 836-page failure mode.

**Audit checks (read-only):**
- Per-page tile count matches the manifest's component count for that page.
- Tile headers in each scaffold match the verbatim Apple type names from the manifest.
- `GalleryItem` IDs match the manifest's `<heading>.<folder>.<leaf>` slugs.
- No `GalleryRegistry` entry still points at `PlaceholderGalleryPage`.
- No placeholder page name strings survive (e.g. "Page A1", "Folder 2 Sub").
- Sidebar renders every heading, every folder, every leaf — manual click-through.

**Output:** `Planning/scaffold-audit.md` — pass/fail table per page. Any fail blocks Phase 3.

**Critical files:** read-only review of `GalleryRegistry.swift` and every `<PageName>GalleryPage.swift`.

---

### Phase 3 — Per-Page Integration *(REDESIGNED 2026-05-07; queued for execution)*

**Why redesigned:** the previous Phase 3 ("uniform-grid scaffold + per-folder live-tile authoring") wrapped every page in an identical `GalleryItemPage { VariantTile { Color.clear } × N }` shell, constraining layout *before* any thought about what the page is documenting. Buttons want a condensed grid; sliders want horizontal breathing room; navigation views consume the entire pane and want bare full-bleed listings; typography wants hand-crafted single-column rows with side-aligned API metadata. The OG Typography page (recoverable at `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift`) is the proof-of-concept for bespoke per-page layout. Phase 2's scaffold + a previous AppKit pilot still landed in the cookie-cutter shell; both are now treated as starting reference for re-authoring under this redesign.

The fix: **scaffold and integration merge into one phase.** Each page is authored holistically by an agent who decides its layout based on the components it documents, then writes the demos, then logs their reasoning.

#### Phase 3a — Strip (mechanical)

**Scope.** The 63 SwiftUI page files at `SwiftKit/SwiftKit/Pages/SwiftUI/<Folder>/<Leaf>GalleryPage.swift`. Reference + AppKit + scaffold primitives are NOT touched.

**Effect per file.** Replace the body with `EmptyView()`; delete the placeholder `VariantTile` dump. The `extension <Leaf>GalleryPage { @MainActor static let item = GalleryItem(...) }` block stays byte-for-byte intact so every `GalleryRegistry` reference keeps resolving.

Resulting shape:
```swift
import SwiftUI

struct ButtonGalleryPage: View {
    var body: some View { EmptyView() }
}

extension ButtonGalleryPage {
    @MainActor static let item = GalleryItem(/* unchanged */)
}
```

**Dispatch.** One mechanical agent (haiku-tier), single batch. Allowlist of 63 file paths. Must not touch `Pages/Reference/`, `Pages/AppKit/`, `Pages/_Shared/`, `Detail/PageScaffold/`. Baseline skills (`superpowers:using-superpowers` + `swiftui-expert-skill`) still mandatory.

**Verification.** `xcodebuild` green; `grep -rn "Color.clear" SwiftKit/SwiftKit/Pages/SwiftUI` returns zero; `grep -rn "static let item" SwiftKit/SwiftKit/Pages/SwiftUI | wc -l` returns 63; sidebar still navigates, body just renders empty.

#### Phase 3b — Per-page integration (one agent per page)

**Sequential within a folder. Parallel across folders within a wave.**

**Agent budget — "most care possible" per page.** Care is expressed through model tier, scope of expertise, and review depth, not ceremony. **Every dispatch in Phase 3b uses the most-capable model (opus-tier).** Mechanical strip and any later scaffold-evolution dispatches stay haiku/sonnet.

**Per-page chain (4 stages, sequential).** Baseline skills on every dispatch (mandatory): **`superpowers:using-superpowers` + `swiftui-expert-skill`**. Stage-specific skills layer on top.

| # | Stage | Model | Skills layered on top | Output |
|---|---|---|---|---|
| 1 | **Layout design** | opus | `ui-ux-pro-max`, `find-docs`, optional `superpowers:brainstorming` | A design doc (markdown, fenced): chosen layout shape, component-driven rationale, sketched-in-code structure, anticipated risk areas, specialty-wrapper proposals. No production code yet. |
| 2 | **Implementation** | opus | `find-docs`, `superpowers:test-driven-development`, `superpowers:verification-before-completion` | The full page file as a fenced Swift block; xcodebuild green; self-review notes. |
| 3 | **Spec compliance review** | opus | `superpowers:requesting-code-review` | Verifies code matches the approved design + manifest. Iterates with implementer until ✅ (no implicit ceiling). |
| 4 | **Code quality review** | opus | `superpowers:requesting-code-review`, `ui-ux-pro-max` | Verifies build, naming, semantic tokens, L-001/L-007/L-010/L-011/L-012, ui-ux/swiftui patterns. Iterates until ✅. |

**Stage 5 — logic-log entry** (same agent as stage 2, after both reviews ✅): captures their layout/UI reasoning. See Logic-log spec below.

**Per-folder Nathan checkpoints (the only stop conditions):**
- **Design pre-flight (folder-first page only):** the layout-design doc for the first page in each folder is shown to Nathan. He approves the pattern or redirects. Once approved, subsequent pages in the same folder run autonomously through stages 1–5; their design docs are still produced and folded into the logic log.
- **Visual review (folder-close):** after every page in a folder lands its commit, Nathan does a manual click-through (dark + light) and approves the folder before the next folder's first page dispatches. **This is the per-page "most care" pressure valve** — Nathan sees every page render in the actual app within ~6 pages of when it's authored.
- **Per-page interrupt:** any agent at any stage may flag "this page raises a question I need a human on" — the controller surfaces it to Nathan immediately. Default is autonomy; explicit interrupts are allowed.

**Review iteration ceiling:** **none.** Reviewers loop with implementer until both ✅.

**Pre-work (every page agent, in order):**
1. Read this page's manifest entry in [`Planning/page-component-map-{reference,swiftui,appkit}.md`](Planning/) — component list + verbatim Apple type names.
2. Read every contributing Apple doc under `Documentation/<framework>/<topic>/` referenced by the manifest entry.
3. Read any pre-existing implementation as reference material:
   - **Typography:** read both the current `Pages/Reference/TypographyGalleryPage.swift` AND the OG at `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift`. Study the OG's principles (data struct per row, fixed metadata column width, `PageSection`-driven sectioning, semantic font modifiers throughout); do NOT copy verbatim.
   - **SF Symbols, Color, Motion, Materials:** read the current on-disk page as starting reference; decide whether the existing layout still serves and refine, or rebuild.
   - **AppKit pilot pages:** read the current on-disk page (live tiles + bridges intact); the layout-decision pass may keep, restructure, or split sections, but the bridges stay.
   - **Fresh SwiftUI pages (post-strip):** no on-disk content; start from manifest + Apple docs.
4. Read [`Planning/page-logic-log.md`](Planning/page-logic-log.md) start-to-finish — every prior log entry. The brief instructs: "cite at least one prior entry's decision in your reasoning, OR explain why your page diverges."
5. Confirm baseline skills loaded (`superpowers:using-superpowers` + `swiftui-expert-skill`) and stage-specific skills per the chain table above.

**Layout decision (BEFORE any demo code).** Implementer commits in writing — as the first lines of their logic-log entry — to a layout shape:

| Shape | When | How |
|---|---|---|
| Bespoke long-form rows | Pages where each variant wants horizontal breathing room + side-aligned metadata (Typography, possibly Slider, ProgressView, TextEditor) | Custom `VStack` of `HStack` rows; data-struct ForEach; fixed metadata column width; `PageSection` for grouping. **No `GalleryItemPage` wrapper required.** |
| Condensed grid | Many small same-shape variants (Buttons, Toggles, small Pickers) | `GalleryItemPage(..., minTileWidth: 160)` with `VariantTile`s. |
| Default adaptive grid | Mixed-size demos, no special needs | `GalleryItemPage(...)` (220 default) with `VariantTile`s and/or specialty `*DemoTile`s. |
| Specialty-tile grid | Effects/animations needing a stable shared canvas (à la Motion, Materials) | Either reuse existing `*DemoTile` from `DemoTiles.swift`, or write a `private struct LocalDemoTile: View` in the page file. |
| Hybrid | One headline interactive + supporting variants | `PageSection` to stack: a single full-width tile, then a grid section underneath. |
| Bare full-bleed | Pane-consuming primitives (NavigationSplitView, NavigationStack, Inspector, Sidebar, TabView, possibly Table) | Bypass `GalleryItemPage` entirely. Author a custom view: header (title + blurb + signature + availability + docPath) stacked above a single live example occupying the pane width. |

**Demo authoring rules.**
- Live SwiftUI invocations of the documented type with documented parameters. No invented variants. No Claude-authored wrapper views (semantic exceptions: `NSViewRepresentable` bridges for AppKit primitives; per-page specialty `*DemoTile` private structs).
- Semantic color/font tokens only (L-001/L-012). Dark + light verified.
- Per-tile `height:` set when content has a natural intrinsic size (charts, pickers, sliders); otherwise default.
- L-011: dense pages broken into `private let` / `private struct` subviews; imperative `+=` over chained `+`.
- API parameter on every renderable variant — verbatim Apple call.

**Specialty wrappers — when and where.** If the agent finds **3+ tiles on its own page** sharing a canvas pattern, propose a wrapper:
- **Local (default):** `private struct <Name>DemoTile: View` in the same file. Composes `VariantTile` with a stable demo body.
- **Shared (rare):** if reusable across multiple pages, the agent flags it in the logic-log entry under "New primitive proposed." The controller batches accepted proposals into a separate **Primitive Evolution dispatch** between waves — single sequential implementer edits `Detail/PageScaffold/DemoTiles.swift`. Page agents may NOT edit `Detail/PageScaffold/` directly.

**Deliverables per page.**
1. The page file (full rewrite, single Swift file under `Pages/<Heading>/<Folder>/<Leaf>GalleryPage.swift`).
2. Logic-log entry appended to [`Planning/page-logic-log.md`](Planning/page-logic-log.md).
3. Any new shared-primitive proposal (logged, not implemented).

**Logic-log spec.** Single append-only file at [`Planning/page-logic-log.md`](Planning/page-logic-log.md). **Written by** the same agent that implements the page, as their **final act** after the code is constructed and self-reviewed. Captures THEIR reasoning at the moment of conviction — closer to a postmortem than a plan. Subsequent agents read it as evidence ("here's what worked / here's what surprised me"), not as instructions.

Entry format (≤12 lines):
```markdown
### <Heading> > <Folder> > <Leaf> — <YYYY-MM-DD>
- Layout: <chosen shape + key parameters>.
- Why: <component-driven rationale; what it is about these components that motivated the choice>.
- Tile/row shape: <heights, widths, metadata column, special wrappers, etc.>.
- Demos: <live vs reference, dark+light verified, any unusual rendering choices>.
- New primitive proposed: <none | name + brief>.
- Heads-up for siblings: <what the next agent in this folder / cross-folder should know>.
```

**Discipline.** READ-BEFORE every implementer reads the entire log before drafting layout. WRITE-AFTER the implementer's last act before handing back code is appending the entry. Spec reviewer verifies the entry exists with all six required lines and that it cites at least one prior entry (or explains divergence).

**Wave plan.** Sequential within a folder; parallel across folders within a wave.

| Wave | Folders | Leaves | Why |
|---|---|---|---|
| **W1 (warm-up, sequential single-folder)** | Reference | 5 | Typography (the page that prompted this redesign) goes first as a shape exercise; SF Symbols + Color + Motion + Materials follow. Pre-existing on-disk content + OG `TypographyPage.swift` provide concrete reference material. The 5 logs become seed prior art for SwiftUI waves. |
| **W2 (parallel folders)** | Presentation, Toolbars and Menus, Gestures and Input, Accessibility, Images and Shapes | 4+3+3+3+3 = 16 | Mid-complexity, well-bounded. |
| **W3 (parallel folders)** | Text and Input, Animation and Effects, Containers | 5+4+6 = 15 | Higher tile-density; some pages will want bespoke long-form (TextEditor, ProgressView). |
| **W4 (parallel folders)** | Controls, Layout, Navigation | 10+9+6 = 25 | Highest variation. Controls = condensed grids + bespoke rows; Layout = pedagogical flow; Navigation = bare full-bleed cases. |
| **W5 (parallel folders)** | App Structure | 7 | App-shell primitives; some bare full-bleed (Scene, WindowGroup demos may need full-pane treatment). |
| **W6 (parallel pages within single folder)** | AppKit | 6 | Re-layout pilot pages. Bridges + tiles stay; layout shape + section structure may change. |

**Within-folder rule:** SEQUENTIAL — each successive page benefits from the previous page's log entry.
**Across-folder rule:** PARALLEL within a wave — folders are disjoint subtrees; agents in different folders cannot collide. The shared logic-log file is appended-only — controller serializes log writes by appending each agent's entry in completion order.

**Primitive evolution policy.** Page agents are FORBIDDEN from editing `Detail/PageScaffold/`. They may: define `private struct` / `private let` helpers in their own page file, bypass `GalleryItemPage` entirely with custom view code (the OG Typography pattern), propose a shared primitive in their logic-log entry. Likely candidates already visible: `BareItemPage` (chromeless full-bleed page wrapper). Recommendation: let the first W4 agent write it locally in their own page; extract to `Detail/PageScaffold/` only if 3+ pages need it.

**Page-complete verification (per page).**
1. `xcodebuild` green.
2. Manual click-through; both dark + light via the appearance toggle.
3. Tile/row count matches the manifest entry, OR the logic-log entry justifies the deviation.
4. Verbatim Apple type names for tile/row headers; descriptions sourced from doc Abstract.
5. Semantic-token compliance — `grep -E "Color\(red:|#[0-9a-fA-F]{6}"` in the page returns zero.
6. Logic-log entry appended with all six required lines and cites prior art (or justifies divergence).
7. No edit outside `Pages/<Heading>/<Folder>/<Leaf>GalleryPage.swift` and `Planning/page-logic-log.md`.

Two-stage review: spec reviewer checks 3, 4, 6; code reviewer checks 1, 2, 5, 7 + L-rules + ui-ux/swiftui-expert pattern compliance.

---

### Phase 4 — Post-Wave Cleanup, Polish, and Closure

After all six waves close AND Nathan signs off on the implementation phase. Per Nathan: open items, orphans, and uncertain components are sorted out post-waves — not pre-decided.

**Tasks:**
1. **Orphan and uncertain-component sort.** Pull together everything previously deferred:
   - Delete `Pages/_Shared/PlaceholderGalleryPage.swift`.
   - Delete `Pages/_Shared/DescribePage.swift` (uses orphan scaffold; not registered in `GalleryRegistry`).
   - Delete `Detail/PageScaffold/GalleryPageScaffold.swift` (only used by `DescribePage`).
   - Inline `SwiftKit/ContentView.swift` into `SwiftKitApp.swift`; delete the file.
   - Update `Detail/DetailPane.swift` `DetailEmptyState` comment to drop the stale "both sidebar modes" reference (the second mode is gone).
   - Search the whole `SwiftKit/SwiftKit/` tree for any remaining references to deleted symbols; resolve.
   - Re-survey the manifest + completed pages for any uncertain-component decisions held open during waves; resolve and integrate as agreed with Nathan.
2. **Sidebar audit** — every leaf navigates, no placeholder leftovers, single-folder collapse works for Reference + AppKit.
3. **Cross-page consistency check** — section-header tone, log-driven recurring patterns, dark+light spot-check.
4. **Refresh** `framework.md`, `handoff.md`, `history.md`. Log MVP completion, final page count, commit refs.

**Verification:** `xcodebuild` green and warning-free; `grep -rn "DescribePage\|GalleryPageScaffold\|PlaceholderGalleryPage\|ContentView" SwiftKit/SwiftKit` returns zero; full app click-through dark+light passes; `git status` clean.

---

### Critical Reused Code (toolkit, not template)

Phase 3 page agents compose these primitives when they fit; they're a toolkit, not a mandatory shell. Bespoke per-page view code (à la OG `TypographyPage.swift`) is allowed and expected.

| Surface | File | Role |
|---|---|---|
| App shell | `SwiftKitApp`, `RootView`, `SidebarView`, `AppearanceController` | Locked. |
| Catalog | `GalleryItem`, `GalleryRegistry` | Locked (Phase 0a strip + Phase 2 Step 1 repopulation done). |
| Detail | `DetailPane` | Locked. |
| Page entry | `Detail/PageScaffold/GalleryItemPage.swift` | Compose when grid layout fits (`minTileWidth` is the lever). Bypass for bespoke / bare layouts. |
| Tiles | `Detail/PageScaffold/{VariantTile,ReferenceTile}.swift` | Card chrome for renderable / non-renderable variants. |
| Section | `Detail/PageScaffold/PageSection.swift` | Header + content; used heavily by OG Typography for grouping. |
| API code | `Detail/PageScaffold/APICallout.swift` | Inline API code text. |
| Specialty demos | `Detail/PageScaffold/DemoTiles.swift` | `AnimationDemoTile`, `TransitionDemoTile`, `MaterialDemoTile`, `ShapeStyleDemoTile`, `EnvironmentValueDemoTile` — proof of the "shared canvas per content type" pattern. |
| Reference pages | `MaterialsGalleryPage`, `MotionGalleryPage`, `ReferenceColorGalleryPage`, `SFSymbolsGalleryPage`, `TypographyGalleryPage` | Pre-Phase-3b on-disk content. Re-authored under the new methodology in W1; current files serve as starting reference for that wave. |
| AppKit pilot pages | 6 files at `Pages/AppKit/` (NSOutlineView/NSBrowser/NSPathControl/NSTokenField/NSDatePicker/NSGlassEffectView) | Live tiles + bridges from the pilot. Re-laid-out in W6 under the new methodology; bridges + tile content stay. |
| OG reference (git-recoverable) | `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift` | Hand-crafted long-form rows with side-aligned metadata. Reference for the W1 Typography implementer. |
| Orphans (Phase 4 cleanup) | `Pages/_Shared/PlaceholderGalleryPage.swift`, `Pages/_Shared/DescribePage.swift`, `Detail/PageScaffold/GalleryPageScaffold.swift`, `SwiftKit/ContentView.swift` | Documented now; deleted post-waves. |

### End-to-End Verification (post-Phase 4)

1. `xcodebuild -derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-dqolyhtwikfvruchpznkybfwhsmy ...` — clean build, no warnings introduced by this plan.
2. Launch app — every sidebar leaf clickable; every page renders; both dark + light verified on the detail pane appearance toggle.
3. `find SwiftKit/SwiftKit/Pages -name "*.swift" | wc -l` matches the leaf count from `Planning/page-component-map.md`.
4. `find Documentation -name "*.md" | wc -l` accounts for archive + active set.
5. `git status` clean; `git log` shows one commit per phase or per folder batch with descriptive messages.

### Open for Phase-Time Decisions (not blocking)

Per Nathan's 2026-05-07 redesign direction: **all open items, orphans, and uncertain components are sorted out in Phase 4 once he signs off on the implementation phase** — not pre-decided. The handful of long-running open questions below remain on the post-MVP horizon and do not block Phase 3:

- Whether `Documentation/_archive/guides/` is fully deleted in Phase 4 or kept as historical record.
- Whether a future post-MVP phase introduces a 3-column NavigationSplitView with section dividers (the place sub-headings would re-enter — explicitly out of MVP scope).
- Bare full-bleed primitive timing (`BareItemPage`): defer extraction; let first W4 Navigation agent write it locally; revisit after W4.
- Commit cadence in Phase 3b: per-page commits (atomic page + log entry).

## Hard Constraints

- **Apple-only.** Every view, modifier, type, and style must come from Apple's documented APIs. No third-party UI libraries. No Claude-authored wrapper views — see `Guidelines/feedback.md`.
- **macOS 26 only** — no backward compat.
- **Dark mode first.**
- **No SwiftData.** SwiftKit has no `@Model` types, no `.modelContainer(...)`. (L-007)
- **No re-implementing primitives that SwiftKit is documenting.** SwiftKit must *render* primitives, not *replace* them. Gallery pages are layout containers — `Button(...)` in a `VStack` is fine; `MyCustomSearchBar` is not.
- **`Documentation/` mirror is the authoring input.** Read the markdown for each primitive before writing the page. The mirror's *content* drives variant enumeration; the mirror's *structure* is NOT the page list. (This was the original drift cause — see `history.md` 2026-05-07.)

## Standing constraints

- **`PBXFileSystemSynchronizedRootGroup`.** New `.swift` files in `SwiftKit/SwiftKit/` compile automatically — no `project.pbxproj` edit needed.
- **DerivedData hash to pin.** `SwiftKit-dqolyhtwikfvruchpznkybfwhsmy` (captured 2026-05-02). Use `-derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-dqolyhtwikfvruchpznkybfwhsmy` for any debugging session per L-005.
- **Skills location.** All globally-installed skills live at `~/.claude/skills/`. Relevant for SwiftKit: `find-docs` (Context7) and `swiftui-expert-skill`. Invoke via `Skill` tool.
- **L-011 page-size rule.** Keep nested SwiftUI trees under a few hundred symbols per binding; break dense pages into `private let` subviews.
- **SourceKit diagnostics are stale** — clear after `xcodebuild`. Trust build.

## Components log

Lives in [`components-log.md`](components-log.md). Chronological record of what's in the app — append a row there after every successful implementation or phase milestone.

## Planning checklist

- [ ] If a new gallery page: does the corresponding markdown exist under `Documentation/<framework>/<topic>/`?
- [ ] Is the page name a user-recognizable component, not a modifier? Modifiers belong as tiles inside their primitive's page.
- [ ] Is the folder a macro-grouping with at least ~4 pages? Single-page folders are not allowed.
- [ ] Does this introduce a Claude-authored helper view? **Stop.** Compose Apple primitives directly. (`NSViewRepresentable` bridges to AppKit primitives are the one allowed exception per the Phase 3 AppKit pattern.)
- [ ] Are dark + light renderings both planned for the change?
