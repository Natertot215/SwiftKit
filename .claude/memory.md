# SwiftKit — Memory

Non-obvious project state and architectural decisions. Things that aren't visible in the code itself — why something was done a particular way, what was tried and rejected, what constraints to respect.

## Format

`YYYY-MM-DD — decision or constraint — reason`

---

## 2026-05-01 — Created as a sibling to Pommora to unblock UI work

**Reason:** Pommora's UI shell rebuild kept failing because no one had a confirmed visual reference for what Apple's primitives render as on macOS 26 — selection styling iterated 8+ times, materials behaved differently than expected, custom components silently re-introduced. SwiftKit exists to be that reference. Once SwiftKit's gallery covers a primitive, Pommora work for that primitive is unblocked.

## 2026-05-02 — Two-column `NavigationSplitView` with a 3-tier disclosure sidebar

**Reason:** Two columns: sidebar + detail. Sidebar shape (Nathan's terminology, locked 2026-05-02): **toggle heading > label/folder > item**. Concretely: "Reference" / "SwiftUI" / "AppKit" are the toggle headings (each a `DisclosureGroup` whose label is tagged for selection — Mail.app's "All Inboxes" pattern); "Modal presentations" / "Images" / "Controls" / etc. are the label/folders (also `DisclosureGroup`s with tagged labels); the leaves are the items. AppKit's `Subheading` catalog tier flattens into the parent Folder's item list — it does not surface as a 4th sidebar disclosure level. Reference's shape is `heading → item` (no Folder layer; its catalog children are Leaves directly). Both shapes coexist in the same sidebar without issue. HIG-compliant: folder + item ARE the two disclosure levels HIG permits; the heading row is a clickable parent like Mail's, which HIG allows when the deeper data isn't being pushed further into nested disclosures.

**How to apply:** `NavigationSplitView { sidebar } detail: { … }` with `.navigationSplitViewStyle(.prominentDetail)` (L-003) and `.navigationSplitViewColumnWidth(min: 240, ideal: 280, max: 360)` on the sidebar (L-009). Sidebar `List(selection:)` uses `.listStyle(.sidebar)`. Each tier renders as `DisclosureGroup` (heading + folder) or `Label(...).tag(node.id)` (item), all inside the same root `List`. Implementation in `SwiftKit/App/SidebarView.swift`.

## 2026-05-02 — Catalog data ≠ sidebar depth

**Reason:** The catalog tree (Section → Folder → optional Sub-heading → Leaf) is a data model. The sidebar maps these tiers to UI rows: catalog Section → sidebar toggle heading; catalog Folder → sidebar label/folder; catalog Leaf → sidebar item. Catalog Sub-headings (AppKit only) currently flatten into the parent Folder's item list — they do not become a 4th sidebar disclosure level. If a future iteration wants Sub-headings to surface, the options are: (a) split each AppKit Folder into multiple Folders by Sub-heading, (b) introduce a content list (3-column NavigationSplitView) with Sub-headings as Section dividers there. Both stay HIG-compliant. The depth difference between SwiftUI (`heading → folder → item`) and AppKit (same, with sub-headings absorbed into folders) is Apple's own taxonomy and intentional.

## 2026-05-02 — Implementation-agent skill kit for SwiftKit page work

**Reason:** When dispatching future implementation agents to write Phase 5 gallery pages (or any SwiftUI/macOS feature work), Nathan wants them equipped with these four skills so each agent has the same baseline as the orchestrator. Each Page-author dispatch should explicitly load these in the agent's prompt.

| Skill | Purpose |
|---|---|
| `swiftui-expert-skill` | Code review and review of new SwiftUI files for state management, view composition, performance, macOS-specific APIs, Liquid Glass adoption. Globally installed at `~/.agents/skills/swiftui-expert-skill/` |
| `find-docs` (Context7) | Authoritative Apple/SwiftUI doc lookup — fall back from local mirror when needed |
| `superpowers:subagent-driven-development` | When the implementation has independent sub-tasks; dispatches further sub-agents while keeping shared state |
| `superpowers:executing-plans` | When the agent receives a written implementation plan and needs to execute it with review checkpoints |

**How to apply:** Every Agent dispatch for a Phase 5 page (or any meaningful Swift implementation in this project) must include in the prompt: "Load and use these skills as needed: `swiftui-expert-skill`, `find-docs`, `superpowers:subagent-driven-development`, `superpowers:executing-plans`." Don't pre-invoke them on the agent's behalf — let the agent decide when each applies, but make sure they're aware.

## 2026-05-02 — "Reference" toggle heading sits at the top of the sidebar

**Reason:** Curated cross-cutting reference pages (Typography first; future Color, Iconography) live above the framework-specific catalog. In the 3-tier sidebar (per the "Two-column NavigationSplitView" entry), Reference is a toggle heading whose children are Leaves directly (no Folder layer) — `heading → item`, two tiers. SwiftUI and AppKit are `heading → folder → item`, three tiers. Both shapes coexist in the same sidebar. The order is Reference → SwiftUI → AppKit, putting cross-cutting docs above framework-specific content (matches HIG's hierarchy where Foundations precede framework references).

**How to apply:** When adding a new reference page (Color, Iconography), append it as a sibling Leaf under `referenceTree`. At 4+ leaves, restructure into named Folders inside Reference (Foundations / Patterns / Tools etc.) so it matches the 3-tier `heading → folder → item` shape used by SwiftUI and AppKit, and update this entry.

## 2026-05-02 — `.safeAreaInset(edge: .bottom)` is the documented Apple pattern for bottom-anchored sidebar actions (when one is needed)

**Reason:** Apple's SwiftUI tutorial sidebar uses `List { Sections } .safeAreaInset(edge: .bottom) { Button(...) .buttonStyle(.borderless) .foregroundColor(.accentColor) }` for any persistent action below the sidebar list (Add, Settings, About, etc.). The inset hooks into the source-list material correctly so the button sits inside the sidebar chrome rather than below it. **SwiftKit's sidebar does NOT currently have a bottom action** — an earlier "About SwiftKit" placeholder was added then removed 2026-05-02. The pattern is documented here for the next time a bottom action is needed.

**How to apply:** When adding a bottom action, use `.safeAreaInset(edge: .bottom)` on the sidebar `List`. Do NOT wrap the sidebar in `VStack { List; Button }` — that pushes the button outside the source-list material. Style the button with `.buttonStyle(.borderless).foregroundColor(.accentColor)` (both semantic tokens — encouraged, not L-012 violations). Important: an EMPTY `.safeAreaInset(edge: .bottom) { }` with no content reserves dead space and was observed to interfere with row hit testing — only apply the modifier when there's actual content.

## 2026-05-02 — Sidebar selection chrome reality (macOS 26)

**Reason:** Verified empirically 2026-05-02: SwiftUI's `List(selection:).listStyle(.sidebar)` on a **focused** window draws the **emphasized** selection state — solid `Color.accentColor` fill + white text/icon. On an **unfocused** window it draws the unemphasized state — translucent `NSColor.unemphasizedSelectedContentBackgroundColor` fill + accent text + accent icon. Both fill and text track the system accent (verified by changing system accent to orange).

Mail.app, Finder, and Notes deliberately render selection as if always unemphasized — that's a custom AppKit-level behavior on `NSOutlineView`, NOT the SwiftUI framework default. SwiftUI exposes no public knob to suppress the emphasized state for `List(.sidebar)` selection on macOS 26. SwiftKit currently ships with the framework default (deferred Mail-style override — see [`sidebar-plan.md`](sidebar-plan.md)).

**How to apply:** For SwiftKit's current shape, use `List(selection: $binding) { Label(...).tag(id) }.listStyle(.sidebar)` and apply NO row-level styling. Three known anti-patterns confirmed this session:
- `.environment(\.appearsActive, false)` — no-op for `List(.sidebar)` selection chrome on macOS 26.
- Custom `.listRowBackground(...)` — even with `Color.clear` for unselected rows, triggers macOS 26 source-list grouping chrome (a "pure grey rectangle" container around the rows).
- Explicit `Label { Text } icon: { Image }` builder + per-element `.foregroundStyle` — breaks click-to-select hit testing on sidebar rows.

If/when Mail's look is wanted, see [`sidebar-plan.md`](sidebar-plan.md) for the AppKit-bridge path. See [`SwiftKit/App/SidebarView.swift`](../SwiftKit/App/SidebarView.swift) for the canonical current structure.

---

*(no further entries yet)*

## 2026-05-01 — Gallery catalog is a static Swift tree, not data-driven from the doc mirror

**Reason:** The doc mirror under `Documentation/` is the source of truth for *variants*; the catalog tree is the source of truth for *what gallery pages exist*. Keeping them separate means catalog node ordering, custom titles, and "promote this primitive to a top-level entry" decisions can be made without re-deriving from Apple's taxonomy every time.

## 2026-05-01 — Light/dark toggle scoped to detail pane only

**Reason:** The sidebar should always look like a native macOS sidebar (system colorScheme); only the rendered primitive in the detail pane needs the toggle so Nathan can compare appearance. Toggle drives `.preferredColorScheme(.dark)` or `.light` on the detail container, defaulting to dark.

## 2026-05-01 — AppKit URL list intentionally captured at the framework-topic level (636 URLs), not deep-recursed to per-method (~10K URLs)

**Reason:** Per-method/per-property pages exist in Apple docs but are sub-symbols of larger types. Gallery entries operate at the type level (NSView, NSTableView, NSWindow). The 636-URL list captures every type/protocol/article that has standalone meaning. If a future need surfaces (e.g., a gallery page wanting to enumerate every NSColor system property), the deeper recursion can be triggered for that subtree. **Listed here so a future agent doesn't re-crawl thinking it was incomplete.**

## 2026-05-02 — Doc mirror has zero failed stubs; 4 URL typos fixed

**Reason:** Initial Phase 3 capture left 4 `status: failed` stubs caused by URL-list typos in the original manifest gather, not capture failures. Cleanup (2026-05-02): confirmed canonical URLs against Apple's JSON variant API, fixed typos in `_links/{hig,swiftui,appkit}-urls.md` + `access-links.md`, deleted old stub files, recaptured. All 4 now hold authentic Apple content. Mirror total still 2,540 markdown files.

| Original (typo) | Corrected |
|---|---|
| `appkit/nssliderccessory` | `appkit/nsslideraccessory` |
| `appkit/nsseguperforming` | `appkit/nsseguePerforming` (camelCase — only working casing) |
| `swiftui/manipulableresponermodifier` | `swiftui/manipulablerespondermodifier` |
| `design/human-interface-guidelines` (404 via default JSON URL) | reached via `tutorials/data/design/human-interface-guidelines.json` |

**How to apply:** When auditing the mirror, the canonical "is this complete" check is `grep -r -l "status: failed\|status: stub" Documentation/` excluding the script source. Many genuine Apple symbol pages are <1500 bytes (single methods, typealiases, struct-only modifiers); small size alone is not a defect signal.

## 2026-05-02 — `Documentation/` lives at project root, NOT inside the Xcode target

**Reason:** The Xcode project uses `PBXFileSystemSynchronizedRootGroup` — anything under `SwiftKit/SwiftKit/` auto-bundles. With `Documentation/` originally nested at `SwiftKit/SwiftKit/Documentation/`, all 2,540 markdown files were swept into the .app bundle's flat `Resources/` folder, causing duplicate-filename collisions (Apple cross-references mean `width.md`, `windowgroup.md`, `tabviewstyle(_:).md` etc. exist in multiple framework subfolders) → BUILD FAILED. Resolved by `git mv SwiftKit/Documentation Documentation` — Documentation/ is now a peer of `SwiftKit/`, not a child. Bundle size dropped from 6+ MB to 332 KB; zero .md leakage; single DerivedData hash. Capture scripts updated. **Path canonical going forward: `/SwiftKit/Documentation/...`, not `/SwiftKit/SwiftKit/Documentation/...`.**

**How to apply:** Never put development-only artifacts (docs, design refs, screenshots) inside `SwiftKit/SwiftKit/`. The synchronized group will bundle them into the app. Project-root peer folders (`Documentation/`, `Screen Recordings/`, etc.) stay out of the app target.

## 2026-05-02 — Capture scripts live in `Documentation/_index/`

**Reason:** Original capture script was at `/tmp/swiftkit_capture.sh` — non-portable, untrusted by some sandboxes (transcript-invisible writes get blocked), and not committed. Moved into project at `Documentation/_index/capture.sh` (full-mirror, idempotent, MIN_BYTES=2500 skip) and `Documentation/_index/recapture-targets.sh` (small TARGETS array for surgical re-fetches that bypasses the size-skip).

**How to apply:** For one-off URL fixes, edit `recapture-targets.sh`'s TARGETS array, run it. For a full re-walk after manifest changes, run `./capture.sh all`. Don't recreate the `/tmp` version — it'll be denied as untrusted.

---

*(no further entries yet)*
