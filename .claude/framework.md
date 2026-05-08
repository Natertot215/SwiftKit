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

### Phase 3 — Implementation *(in progress — AppKit pilot ✅ DONE `c2179b7`; 12 SwiftUI folders queued)*

**Dispatch:** **Parallel** — one agent per folder. ~14 folders total (12 SwiftUI + 1 Reference + 1 AppKit assuming PlanningTree holds). Each implementer (standard model, upgrade to most-capable for visually complex pages) authors its own folder's leaf files. Disjoint output → no conflicts. Per-folder chain: implementer → spec review → code quality review → loop until ✅. Folders may dispatch in waves rather than all-at-once if model capacity is constrained — the parallel-safety is a property of the work, not a mandate to fan out maximally.

**Goal:** Author the live tile content for every leaf page.

**Batching rationale:** One folder per agent — 4–8 pages per dispatch. Large enough for stylistic consistency across siblings, small enough to fit doc context comfortably. Per-page batching is too fine (dispatch overhead); per-heading is too coarse (context fills mid-batch and later pages get less attention).

**Per-page agent brief (mandatory inclusions):**
- Read this page's manifest entry and every contributing reference doc from `Documentation/<framework>/<topic>/<file>.md`.
- For each tile: header is the verbatim Apple type name from the manifest; description is one short sentence drawn from the doc's `## Abstract` block (lightly grammar-edited if needed); render is a live SwiftUI invocation of the documented type with the documented parameters. No invented variants. No Claude-authored wrapper views (`Guidelines/feedback.md`).
- Use semantic color/font tokens only. No hex, no `Color(red:green:blue:)` (L-001/L-012).
- Render dark + light both (detail pane appearance toggle is wired; verify both states visually).
- Page-size discipline: keep nested SwiftUI under a few hundred symbols per binding; break dense pages into `private let` subviews (L-011).
- **Mandatory skill kit per dispatch:** `swiftui-expert-skill` (review/best practices — invoke via Skill tool before writing any Swift), `find-docs` (API verification when Apple's frontmatter is sparse), `superpowers:subagent-driven-development` (independent sub-tasks), `superpowers:executing-plans` (checkpoints), `superpowers:test-driven-development`, `superpowers:verification-before-completion`. Every Phase 3 implementer AND every Phase 3 reviewer (spec + code-quality) loads `swiftui-expert-skill`.

**Verification (per-page, before merging the batch):**
- `xcodebuild` green.
- Manual click-through, dark + light.
- Tile count and headers match the manifest.

---

### Phase 4 — MVP Polish and Closure

**Dispatch:** Sequential — closure work touches docs and shared registry, not parallel-safe.
- 1 cleanup implementer (cheap model) — handle deletions and registry final-state.
- 1 final code reviewer (most-capable model) — full-app review against the original spec, mirroring the `subagent-driven-development` "final code reviewer subagent for entire implementation" step.
- 1 docs implementer (cheap model) — refresh `framework.md`, `handoff.md`, `history.md`.

**Goal:** Final sweep, prove MVP completeness, clean up vestigial scaffolding.

**Tasks:**
- Sidebar audit — every leaf navigates, no placeholder leftovers, single-folder collapse works for Reference and AppKit headings.
- Cross-page consistency — tile spacing, header grammar, description tone all uniform; spot-fix outliers.
- Delete `SwiftKit/Pages/_Shared/PlaceholderGalleryPage.swift` once `xcodebuild` confirms no references.
- If Phase 1 confirmed full component coverage outside guides: delete `Documentation/_archive/guides/` and keep only `Documentation/_links/guides.md`. If any orphan components were sourced from guides, retain the archive.
- Refresh `framework.md`, `handoff.md`, `history.md` — log the MVP completion, page count, folder count, decisions made.

**Verification:** Full app build and click-through, dark + light, every leaf renders. `git status` clean. Commit cadence preserved (one commit per phase or per folder batch).

---

### Critical Reused Code (do not re-author)

| Surface | File | Role |
|---|---|---|
| App shell | `SwiftKitApp`, `RootView`, `SidebarView`, `AppearanceController` | Locked. |
| Catalog | `GalleryItem`, `GalleryRegistry` | Locked (Phase 0a strip + Phase 2 Step 1 repopulation done). |
| Detail | `DetailPane` | Locked. |
| Page scaffolds | `GalleryItemPage`, `VariantTile`, `ReferenceTile`, `PageSection`, `APICallout`, `DemoTiles` | Locked. Reuse for every Phase 3 page (AppKit pilot proved ReferenceTile pattern for non-renderable protocols/delegates). |
| Reference pages | `MaterialsGalleryPage`, `MotionGalleryPage`, `ReferenceColorGalleryPage`, `SFSymbolsGalleryPage`, `TypographyGalleryPage` | Canonical authoring model — registered in Phase 2 Step 1. |
| AppKit pages | 6 files at `Pages/AppKit/` (NSOutlineView/NSBrowser/NSPathControl/NSTokenField/NSDatePicker/NSGlassEffectView) | Live tiles authored in Phase 3 pilot — second canonical authoring template (NSViewRepresentable bridges). |
| Scratch (delete) | `PlaceholderGalleryPage`, `DescribePage` | Remove in Phase 4. |

### End-to-End Verification (post-Phase 4)

1. `xcodebuild -derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-dqolyhtwikfvruchpznkybfwhsmy ...` — clean build, no warnings introduced by this plan.
2. Launch app — every sidebar leaf clickable; every page renders; both dark + light verified on the detail pane appearance toggle.
3. `find SwiftKit/SwiftKit/Pages -name "*.swift" | wc -l` matches the leaf count from `Planning/page-component-map.md`.
4. `find Documentation -name "*.md" | wc -l` accounts for archive + active set.
5. `git status` clean; `git log` shows one commit per phase or per folder batch with descriptive messages.

### Open for Phase-Time Decisions (not blocking)

- Whether `Documentation/_archive/guides/` is fully deleted in Phase 4 or kept as historical record.
- Whether a future post-MVP phase introduces a 3-column NavigationSplitView with section dividers (the place sub-headings would re-enter — explicitly out of MVP scope).

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

Chronological record of what's in the app. **No code** — just name + date.

| Component | Date |
|---|---|
| `SwiftKitApp` (stripped) | 2026-05-01 |
| `ContentView` (placeholder) | 2026-05-01 |
| `Documentation/_links/{hig,swiftui,appkit}-urls.md` | 2026-05-01 |
| `Documentation/access-links.md` | 2026-05-01 |
| `Documentation/_index/capture.sh` (full-mirror capture, idempotent) | 2026-05-02 |
| `Documentation/_index/recapture-targets.sh` (targeted recapture) | 2026-05-02 |
| `SidebarView` (3-tier disclosure + single-folder collapse) | 2026-05-02 |
| `GalleryItem`, `GalleryRegistry` (descriptor + flat allItems) | 2026-05-06 |
| `GalleryItemPage`, `VariantTile`, `PageSection`, `APICallout`, `DemoTiles` (page scaffolds) | 2026-05-06 |
| 5 reference pages: `Typography`, `Color`, `Materials`, `Motion`, `SF Symbols` | 2026-05-06 |
| **Strip-and-restart** — 836 pre-strip page files removed; corpus reset to 5 reference pages | **2026-05-07** |
| `PlaceholderGalleryPage` + 81-item placeholder template (sidebar mechanics validation) | 2026-05-07 |
| Phase 0a — strip placeholder template, restore canonical Framework labels | 2026-05-07 |
| Phase 0b/0c — archive 51 SwiftUI articles + 18 AppKit articles + 180 HIG + 36 AppKit collectionGroup + 1 SwiftUI master `_index`; build unified `Documentation/_links/exclude.md` | 2026-05-07 |
| Phase 1 — sort + checkpoint resolutions (74 leaves locked: 5 Reference + 63 SwiftUI + 6 AppKit) | 2026-05-07 |
| Phase 2 Step 1 — `GalleryRegistry.swift` rebuilt with 74 entries | 2026-05-07 |
| Phase 2 Step 2 — 69 `<LeafName>GalleryPage.swift` scaffolds generated | 2026-05-07 |
| Phase 2.5 — read-only manifest-vs-scaffold audit (74/74 PASS) | 2026-05-07 |
| B10 — gradient mirror-gap closed (LinearGradient/RadialGradient/AngularGradient captured + tiled) | 2026-05-07 |
| Phase 3 AppKit pilot — 6 page files authored with live tiles, NSViewRepresentable bridges, ReferenceTile for non-renderable protocols | 2026-05-07 |

## Planning checklist

- [ ] If a new gallery page: does the corresponding markdown exist under `Documentation/<framework>/<topic>/`?
- [ ] Is the page name a user-recognizable component, not a modifier? Modifiers belong as tiles inside their primitive's page.
- [ ] Is the folder a macro-grouping with at least ~4 pages? Single-page folders are not allowed.
- [ ] Does this introduce a Claude-authored helper view? **Stop.** Compose Apple primitives directly. (`NSViewRepresentable` bridges to AppKit primitives are the one allowed exception per the Phase 3 AppKit pattern.)
- [ ] Are dark + light renderings both planned for the change?
