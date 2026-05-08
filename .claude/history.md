# SwiftKit — History

Chronological log of features implemented, decisions made, and constraints established. Add a concise entry after every successful implementation. Check for retired features and reversed decisions before planning new work.

---

## 2026-05-01

**SwiftKit created as a sibling to Pommora**
Pommora's UI shell rebuild kept failing because no one had a confirmed visual reference for what Apple's primitives render as on macOS 26 — selection styling iterated 8+ times, materials behaved differently than expected, custom components silently re-introduced. SwiftKit exists to be that reference. Once SwiftKit's gallery covers a primitive, Pommora work for that primitive is unblocked.

**Gallery catalog is a static Swift tree, not data-driven from the doc mirror**
The doc mirror under `Documentation/` is the source of truth for *variants*; the catalog tree is the source of truth for *what gallery pages exist*. Keeping them separate means catalog node ordering, custom titles, and "promote this primitive to a top-level entry" decisions can be made without re-deriving from Apple's taxonomy every time.

**Light/dark toggle scoped to detail pane only**
The sidebar always looks like a native macOS sidebar (system colorScheme); only the rendered primitive in the detail pane needs the toggle so Nathan can compare appearance. Toggle drives `.preferredColorScheme(.dark)` or `.light` on the detail container, defaulting to dark.

**AppKit URL list intentionally captured at the framework-topic level (636 URLs)**
Not deep-recursed to per-method (~10K URLs). Per-method pages exist as sub-symbols of larger types; gallery entries operate at the type level (NSView, NSTableView, NSWindow). If a future need surfaces (e.g., a gallery page enumerating every NSColor system property), the deeper recursion can be triggered for that subtree.

---

## 2026-05-02

**Two-column NavigationSplitView with a 3-tier disclosure sidebar**
Sidebar shape (locked 2026-05-02): **toggle heading > label/folder > item**. The top tier is a `DisclosureGroup` whose label is tagged for selection — Mail.app's "All Inboxes" pattern; the middle tier is the folder; the leaves are the items. Single-folder collapse: when a top-level group has only one folder, items hang directly off the heading. HIG-compliant. Implementation in `SwiftKit/App/SidebarView.swift`. Uses `.navigationSplitViewStyle(.prominentDetail)` and `.navigationSplitViewColumnWidth(min: 240, ideal: 280, max: 360)`.

**Catalog data ≠ sidebar depth**
The catalog tree (Section → Folder → optional Sub-heading → Leaf) is a data model. Sidebar maps these tiers to UI rows: catalog Section → toggle heading; catalog Folder → label/folder; catalog Leaf → item. Sub-headings flatten into the parent Folder's item list when present. If future iteration wants Sub-headings to surface, options are: (a) split each Folder into multiple Folders by Sub-heading, or (b) introduce a content list (3-column NavigationSplitView) with Sub-headings as Section dividers there.

**Implementation-agent skill kit established for Phase 5 page work**
When dispatching future implementation agents to write Phase 5 gallery pages, agents must be equipped with: `swiftui-expert-skill` (code review, SwiftUI best practices), `find-docs` (Context7 doc lookup), `superpowers:subagent-driven-development` (independent sub-tasks), `superpowers:executing-plans` (written plans with checkpoints). Each Page-author dispatch loads these explicitly in the agent's prompt.

**Single-folder collapse rule established for the sidebar**
A top-level group with only one folder collapses the folder tier and renders items directly under the heading. Multi-folder groups render full 3-tier (heading → folder → item). Both shapes coexist via the same `SidebarView` logic — no special-casing per group.

**`.safeAreaInset(edge: .bottom)` is the documented Apple pattern for bottom-anchored sidebar actions**
Apple's SwiftUI tutorial sidebar uses `List { Sections } .safeAreaInset(edge: .bottom) { Button(...) .buttonStyle(.borderless) .foregroundColor(.accentColor) }` for any persistent action below the sidebar list. The inset hooks into the source-list material correctly. SwiftKit's sidebar does NOT currently have a bottom action (an earlier "About SwiftKit" placeholder was removed 2026-05-02). Empty `.safeAreaInset(edge: .bottom) { }` reserves dead space and interferes with row hit testing — only apply when there's actual content.

**Sidebar selection chrome reality on macOS 26 — framework default shipped**
Verified empirically: SwiftUI's `List(selection:).listStyle(.sidebar)` on a focused window draws the emphasized state (solid `Color.accentColor` fill + white text/icon); on unfocused, the unemphasized state (translucent `NSColor.unemphasizedSelectedContentBackgroundColor` + accent text/icon). Mail.app, Finder, and Notes deliberately render selection as if always unemphasized — that's a custom AppKit-level behavior on `NSOutlineView`, NOT SwiftUI default. SwiftUI exposes no public knob to suppress emphasized state on macOS 26. SwiftKit currently ships framework default. Three confirmed anti-patterns: `.environment(\.appearsActive, false)` (no-op), custom `.listRowBackground(...)` (triggers source-list grouping chrome), explicit `Label { Text } icon: { Image }` builder + per-element `.foregroundStyle` (breaks click-to-select hit testing). Mail-style override deferred — see `Planning/sidebar-plan.md`.

**UI terminology rule established**
UI labels used in planning/description are descriptive hints, not canonical API names. Claude must identify the Apple primitive being described rather than treating the label as the spec.

**Doc mirror verified clean — 4 URL typos fixed**
Initial Phase 3 capture left 4 `status: failed` stubs caused by URL-list typos in the original manifest gather, not capture failures. Fixes: `nssliderccessory` → `nsslideraccessory`; `nsseguperforming` → `nsseguePerforming` (camelCase); `manipulableresponermodifier` → `manipulablerespondermodifier`; HIG root reached via `tutorials/data/design/human-interface-guidelines.json`. Mirror total: 2,540 markdown files. Canonical "is this complete" check: `grep -r -l "status: failed\|status: stub" Documentation/` excluding the script source.

**`Documentation/` placement confirmed: project root, not Xcode target**
Originally nested at `SwiftKit/SwiftKit/Documentation/`, all 2,540 markdown files were swept into the .app bundle's flat `Resources/` folder by `PBXFileSystemSynchronizedRootGroup`, causing duplicate-filename collisions (Apple cross-references mean `width.md`, `windowgroup.md`, `tabviewstyle(_:).md` etc. exist in multiple framework subfolders) → BUILD FAILED. Resolved by `git mv SwiftKit/Documentation Documentation` — `Documentation/` is now a peer of `SwiftKit/`, not a child. Bundle size dropped from 6+ MB to 332 KB. Path canonical going forward: `/SwiftKit/Documentation/...`. See `Guidelines/build-and-process.md` L-010.

**Capture scripts moved into `Documentation/_index/`**
Original capture script was at `/tmp/swiftkit_capture.sh` — non-portable and untrusted by some sandboxes. Moved into project at `Documentation/_index/capture.sh` (full-mirror, idempotent, MIN_BYTES=2500 skip) and `Documentation/_index/recapture-targets.sh` (small TARGETS array for surgical re-fetches that bypasses size-skip). For one-off URL fixes, edit `recapture-targets.sh`'s TARGETS array. For full re-walk after manifest changes, run `./capture.sh all`.

---

## 2026-05-07

**Strip-and-restart executed**
After a complete project retrospective *(filed at `// The Nexus // Claude // SwiftKit — Where The Mess Came From.md`)* surfaced that the project had drifted from "one page per primitive" to "one page per Apple URL" — producing 836 page files / 141,656 lines / 43 sidebar folders — Nathan authorized a strip-and-restart. Procedure:

1. Pre-strip snapshot committed as `62db021`, tagged `pre-restart` so the full corpus stays recoverable via `git show pre-restart:<path>`.
2. Stripped: `SwiftKit/Pages/SwiftUI/` (678 files), `SwiftKit/Pages/AppKit/` (140 files), `SwiftKit/Pages/Documentation/` (11 mis-placed Describe pages), `SwiftKit/Pages/Reference/TypographyPage.swift` (legacy duplicate of TypographyGalleryPage).
3. `GalleryRegistry.allItems` reset to the 5 Reference pages (Materials, Motion, Color, SF Symbols, Typography) — the canonical "right shape" pages.
4. Clean build verified green.
5. Strip commit landed as `ee95864`: 831 files changed, 5 insertions, 141,056 deletions.

**Root cause of the mess (decided permanently)**
The Phase 5 triage on 2026-05-03 took Apple's 1,722 SwiftUI URLs, classified 990 of them as "leaves," and treated each leaf as a sidebar page. That conflated *variant enumeration* (the role `Documentation/` was supposed to play) with *page list* (the role it should not have played). One modifier per page produced 358 SwiftUI pages where ~60 belonged. Family consolidation arrived May 6 — 3 days late — and was applied to only 8 of ~60 families. The lesson is now codified: **Apple's URL count is not the page count. Modifiers belong as variant tiles inside their primitive's page, not as their own pages.**

**Restart spec direction (initial sketch — un-locked same day)**
A first-pass sketch targeted ~70 pages across ~14 folders, with content sourced from `Documentation/` and a pilot-first cadence (no parallel agents authoring pages without per-page approval). The sketch was un-locked the same day for a fresh planning phase.

**Spec un-locked, planning phase reset (same day).** After the placeholder template landed, Nathan reset the project posture to a blank-slate planning phase — `framework.md` Future Plans and `handoff.md` were trimmed back to broad-idea only. The two dated pre-strip Planning docs (`finish-line-handoff`, `tile-migration-handoff`) were hard-deleted later the same session for the clean-slate. Sidebar mechanics + 81-item placeholder template stay locked at commit `753f4d9` as the structural template; everything else (page count, folder count, naming, cadence) re-opens for design.

**`swiftui-expert-skill` mandated for all Phase 2/3 agents.** Per Nathan's mid-Phase-1 instruction: every implementer AND every reviewer dispatched in Phase 2 (registry rebuild, page-file scaffold) and Phase 3 (live-tile authoring) MUST invoke `swiftui-expert-skill` via the Skill tool at the start of its work, before writing any Swift. Phase 0a's single implementer also loads it. `framework.md` Execution Methodology updated with explicit "ALL of them, no exceptions" language; Phase 2 and Phase 3 sections each carry a "Mandatory" reminder pointing back at the skill-kit table.

**Phase 0c added — topic-page archival + unified `exclude.md`.** Mid-Phase-1, Nathan reinforced the "only components" rule with successive clarifications:

1. *"the articles and guides should not be implemented into this project; only components, code, and their descriptions"*
2. *"this page would NOT be included in the app at all"* (re: `developer.apple.com/documentation/swiftui/menus-and-commands`, a `kind: collectionGroup` topic-group landing)
3. *"No topic pages"*
4. *"the sorting process must find the topic pages; and sort them in an exclude.md; this should include articles, guides, and topic pages... only the components will be in the project; their descriptions MAY be referencing this excluded pages if needed"*
5. *"We're targeting Type Properties, Type Methods, Functions, Instances, Instance Methods, Instance Properties, Structures, and any actual component parts; not topics, overviews, guides or anything like that"*
6. *"Sample code could be useful; analyze on a case-by-case basis"*
7. *"If any other types exist, please disclose and add them"*

Resulting work:
- **Phase 0c added to `framework.md`** as a reversible archival step (mirrors Phase 0b's pattern). Moves all `kind: collectionGroup` files (36 AppKit) and the master `_index/_index.md` (1 SwiftUI, `kind: framework`) into `Documentation/_archive/topic-pages/<framework>/...` via `git mv`.
- **`Documentation/_links/exclude.md` created** — unified index of every excluded URL (51 SwiftUI articles + 18 AppKit articles + 180 HIG + 36 AppKit topic pages + 1 SwiftUI master = 286 total). Replaces `Documentation/_links/guides.md` (deleted).
- **Classifier-gate rewrite** in `framework.md` Phase 1 brief: explicit "Gallery targets" list (kind: struct/class/enum/protocol/macro/typealias as page-or-tile; method/property/init/func/var/case/instance methods/instance subscript as tile); explicit "Excluded entirely" list (article/collectionGroup/framework/_index/HIG); `kind: sampleCode` switched from blanket-defer to **case-by-case** evaluation per Nathan's correction.
- **Active-corpus `kind` inventory table** added to `framework.md` (post-archival audit: 16 distinct values, 2,249 total docs). Every value covered by classifier; future captures with new kinds must be deferred + flagged.
- **Component descriptions may reference excluded URLs** when citing Apple's broader documentation helps explain a component — exclusion governs gallery surface, not citation scope.

**Phase 1 sort rule clarified — only components in the gallery, no topic pages.** Nathan reinforced mid-Phase-1 that "the articles and guides should not be implemented into this project; only components, code, and their descriptions." Cited example: `https://developer.apple.com/documentation/swiftui/menus-and-commands` (a `kind: collectionGroup` topic-group landing page) — explicitly NOT a gallery page. `framework.md` Phase 1 brief updated with a "hard rule" line at the top of the agent inclusions and explicit deferral entries for `kind: collectionGroup` and any `_index.md` navigation files. Phase 0b already archived all `kind: article` docs; this clarification covers the remaining navigation-style content (collection-group landing pages, sample-code wrappers, topic indices). Sort agents already in flight (SwiftUI retry running at this writing) inherit the rule via the manifest review step; AppKit's existing manifest already complies and one informational `sampleCode` line was removed for purity.

**Phase 0a scope corrected.** Initial plan called for "removing the optional sub-heading field from `GalleryItem`" and "removing the sub-heading flatten branch from `SidebarView`." Code reality: post-strip `GalleryItem.swift` is already `Section → Folder → Leaf` (framework + folder string + leaf item) — there is no sub-heading field. `SidebarView.swift`'s two-branch render is the locked single-folder-collapse mechanic, not a sub-heading flatten. The "drop sub-heading tier" language in `history.md` 2026-05-02 described design intent that never landed in code. Phase 0a's actual work is narrower: strip the 81-item placeholder template generator from `GalleryRegistry.swift` (replace `allItems` with `[]`), and restore canonical `Framework.displayName` / `Framework.sidebarSymbolName` ("Reference"/"SwiftUI"/"AppKit" with `book.closed`/`swift`/`square.grid.2x2` symbols). `GalleryItem.swift` struct + `SidebarView.swift` are untouched — both already correct. Plan in `framework.md` updated to reflect actual scope.

**MVP plan settled — Foundation-to-Completion phasing in `framework.md`.** Seven-phase plan (0a → 0b → 1 → 2 → 2.5 → 3 → 4) replaces the prior blank-slate `## Future Plans` section. Methodology codified: fresh subagent per task with two-stage review (spec compliance → code quality), parallel batches when files are disjoint (Phases 0b/1/2-step-2/3), sequential when shared (0a/2-step-1/2.5/4). Three drift-prevention firewalls baked in: (1) Phase 1's `kind:`-frontmatter classifier gate (any `method`/`property`/`init`/`func` doc is a tile candidate, never a page), (2) Phase 1 user-checkpoint on `Planning/page-component-map.md` before any code, (3) Phase 2.5 read-only manifest-vs-scaffold audit before Phase 3 dispatch. Guides handled reversibly — articles + HIG move to `Documentation/_archive/guides/` and `Documentation/_links/guides.md`, deletion only after Phase 1 confirms no component coverage gap. Sub-heading tier dropped from `GalleryItem` (catalog now Section → Folder → Leaf, mirroring the locked UI). Folder/leaf names grammatical; tile headers verbatim Apple type names. Plan sync rule: `framework.md` is canonical home; any change updates it immediately and gets a dated `history.md` entry.

**Phase 1 user-checkpoint cleared — manifest APPROVED.** Nathan resolved the 9 PlanningTree adjustments (A1–A9), confirmed item B (gradient recapture before Phase 3), and acknowledged item D (out-of-scope deferred folders). Outcomes: A1 Environment leaf added but TRIMMED to 3 anchor tiles (`EnvironmentValues`, `Environment`, `EnvironmentKey`) — the 162 individual environment property docs deferred to post-V1 to keep the leaf focused on the mechanism. A2/A3/A4/A5 added as proposed (State and Bindings 11 / Custom Layout 14 → 13 post-C11 / AppKit Integration 13 / View Fundamentals 5 minimal). A6 fold AsyncImage→Image and A7 fold FullScreenCover→Sheet executed in `page-component-map-swiftui.md`. A8 rejected — Liquid Glass APIs stay scattered as tiles on Button/Canvas. A9 NSGlassEffectView leaf added (3 tiles only; NSBackgroundExtensionView NOT included). C11 sample-code review pass (controller-side, post-checkpoint): 22/22 deferred — none fit the single-primitive-render tile model; most are stub references to downloadable WWDC sample apps and the two substantive ones span multiple primitives. Phase 3 implementers MAY cite specific samples in tile descriptions per the descriptions-may-reference-excluded-URLs rule. Net post-checkpoint manifest: ~55 confirmed leaves (5 Reference + 44 SwiftUI + 6 AppKit) totaling ~1,082+ tiles. Phase 2 dispatch unblocked.

**Variant consolidation rule rejected (post-V1 revisit).** Mid-checkpoint, controller proposed a Phase 3 rendering rule for multi-variant APIs (`Material` cases, `Animation` presets, `SymbolRenderingMode` cases, `TableStyle` values) — render as a single tile with an in-tile selector instead of separate tiles per variant. Nathan rejected: *"too consolidating; let's not scope this out now and see how the V1 looks after scaffolding and implementation."* Phase 3 keeps the existing per-variant tile pattern from the canonical reference pages (Materials, Motion, etc.). Revisit after V1 ships if visual density becomes a concern.

**Phase 3 redesigned — per-page bespoke integration replaces uniform-grid scaffold.** End-of-day session after the AppKit pilot landed at `c2179b7`, Nathan flagged that Phase 2's scaffold pass had wrapped every page in an identical `GalleryItemPage { VariantTile { Color.clear } × N }` shell, and the AppKit pilot continued in that shape. The cookie-cutter container constrains layout *before* any thought about what the page is documenting — buttons want a condensed grid; sliders want horizontal breathing room; navigation views consume the entire pane and want bare full-bleed listings; typography wants hand-crafted single-column rows with side-aligned API metadata. Nathan also discovered an OG Typography page surviving in older app builds, recoverable from git history at `f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift` (311 lines, hand-crafted single-column rows, fixed `apiColumnWidth: 180`, `PageSection`-based, no `VariantTile` chrome). That OG is the proof-of-concept for bespoke per-page layout.

Nathan's directives across the redesign session:

1. *"Each page should not be like typography — but each page should be formatted as best for their own individual requirements... and that's what the og typo page did well."* → Per-page tailoring discipline, not "copy Typography." Typography exemplifies the principle (it's tailored to typography's needs); each new page must make its own conscious layout decision.
2. *"We need to strip the page contents while keeping the filetree the same; and re-scope how we should engrain the scaffolding phase alongside the integration phase to be one in the same."* → Phase 3a (mechanical strip of 63 SwiftUI placeholder bodies to `EmptyView()`) + Phase 3b (per-page integration where layout + demos + log entry happen in one pass per agent).
3. *"Each page should be given the most care as possible."* → Per-page chain upgraded to 4 stages on opus-tier (layout-design → implementation → spec compliance review → code quality review), no review iteration ceiling, per-folder Nathan checkpoints (design pre-flight on first page in folder + visual click-through at folder close).
4. *"Each agent must be pre loaded with the using-superpowers skill and swift-ui skill."* → Mandatory baseline skill kit on EVERY Phase 3 agent dispatch, including the mechanical 3a strip: `superpowers:using-superpowers` + `swiftui-expert-skill`. Task-specific skills (`ui-ux-pro-max`, `find-docs`, `superpowers:brainstorming`, `superpowers:requesting-code-review`, `superpowers:test-driven-development`, `superpowers:verification-before-completion`) layer on top.
5. *"Open items will be sorted out after the waves; so after I'm happy with the implementation phase; we will then sort and integrate any orphans or uncertain components."* → Phase 4 absorbs all orphan deletions (`PlaceholderGalleryPage`, `DescribePage`, `GalleryPageScaffold`, `ContentView` inline, `DetailPane` "both sidebar modes" comment) and any uncertain-component decisions held open during waves. No pre-decided cleanups; nothing pulled forward into Phase 3a.

**Investigation findings folded into the redesign:**

- **The "old gallery toggle" half-deletion remnant.** Nathan recalled an earlier appearance toggle that swapped between two gallery modes; a previous agent removed the toggle button but not the view contents. Investigation confirmed: `Pages/_Shared/DescribePage.swift` (141 lines) + `Detail/PageScaffold/GalleryPageScaffold.swift` (34 lines, the old "Default/Variants/States/Notes" 4-section scaffold) survive as orphans (not registered in `GalleryRegistry`, only `DescribePage` references `GalleryPageScaffold`). The `DetailEmptyState` comment in `DetailPane.swift` line 32 ("Reusable across both sidebar modes") confirms the second mode used to exist. All deferred to Phase 4 cleanup per Nathan's directive #5 above.
- **Reference pages diverge by content type, not by template.** Typography (OG): hand-crafted rows. Color: `VariantTile`s with locked-frame swatches. Motion: custom `AnimationDemoTile`/`TransitionDemoTile` with stable canvases + tap-to-trigger. Materials: custom `MaterialDemoTile` with baked-in gradient backdrop so the filter effect is legible. SF Symbols: `VariantTile`s with Image+modifier. The pattern: same shell choices when content allows, custom tile wrappers (or no wrapper at all) when content demands.
- **Existing primitives are a toolkit, not a template.** `GalleryItemPage(minTileWidth:)` controls grid density; `VariantTile.height` lets a tile take a tall well; `ReferenceTile` covers non-renderable types; `*DemoTile`s prove the "shared canvas" pattern; `PageSection` enables long-form section grouping. The only real gap is a chromeless full-bleed mode (defer extraction; let first W4 Navigation agent write it locally).

**Wave plan (6 waves, sequential within folder, parallel across folders):**

| Wave | Folders | Leaves |
|---|---|---|
| W1 (warm-up, sequential) | Reference (Typography first) | 5 |
| W2 (parallel folders) | Presentation, Toolbars and Menus, Gestures and Input, Accessibility, Images and Shapes | 16 |
| W3 (parallel folders) | Text and Input, Animation and Effects, Containers | 15 |
| W4 (parallel folders) | Controls, Layout, Navigation | 25 |
| W5 (parallel folders) | App Structure | 7 |
| W6 (parallel pages, single folder) | AppKit | 6 |

**Logic-log discipline (new for Phase 3b).** Single append-only file at `Planning/page-logic-log.md`. Every implementer reads the entire log before drafting layout (must cite at least one prior entry's decision in their reasoning, OR explain divergence) and appends their own entry as the final act before handing back code. Entry captures: layout shape, component-driven rationale, tile/row shape, demo notes, primitive proposals, heads-up for siblings. Closer to a postmortem than a plan; subsequent agents read it as evidence, not instructions.

**Components log split out.** Nathan directed that the Components log live as its own file (`components-log.md`) rather than embedded in `framework.md`. The framework's Components log section is now a one-line pointer.

Plan-file draft preserved at `~/.claude/plans/rippling-wiggling-widget.md` until tomorrow's Phase 3a dispatch begins, then archived. Canonical home for the redesigned Phase 3 is `framework.md`.

---

## Architectural Constraints (standing)

- **PBXFileSystemSynchronizedRootGroup** — Drop `.swift` files into `SwiftKit/<subdir>/`; Xcode auto-syncs. Never put dev-only artifacts (docs, design refs, screenshots) inside `SwiftKit/SwiftKit/` — they get bundled into the app.
- **DerivedData hash** — Capture after first build; use in all subsequent `xcodebuild` commands.
- **Skills location** — `~/.claude/skills/` (and `~/.agents/skills/` for legacy installs symlinked in); invoke via Skill tool.
- **`.safeAreaInset(edge: .bottom)`** — Pattern for bottom sidebar action rows; only apply when there's actual content.
- **Single-folder collapse rule** — when a top-level group has only one folder, items render directly under the heading (no folder tier).
