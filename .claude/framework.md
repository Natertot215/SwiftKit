# SwiftKit — Framework

## Vision and Purpose

A personal Apple-component reference library, native to macOS. Two outputs:

1. **`SwiftKit.app`** — a macOS gallery app. Sidebar navigates HIG → framework → category → primitive. Detail pane shows that primitive in every documented variant and state (default, hover, selected, disabled, focused), with the exact API call labeled beside each rendering. Light/dark toggle on the detail pane (default dark).
2. **`Documentation/`** (project-root sibling of the Xcode app target) — a complete local mirror of Apple's HIG, SwiftUI, and AppKit documentation as flat markdown files, with a master URL index (`access-links.md`). Lives outside the app target so it isn't bundled into `SwiftKit.app`.

The motivation is concrete: Pommora's UI shell rebuild stalled because there was no confirmed visual reference for what Apple's primitives actually render as on macOS 26. Every "build the sidebar" task became a guessing game off after-the-fact screenshots. SwiftKit is the reference. When Pommora needs a component, Nathan points at SwiftKit and says "that one." No invention. No interpretation.

## Current State

Scaffolded 2026-05-01. Phase 0 (Xcode SwiftData template strip) complete:

- `SwiftKitApp.swift` — minimal `@main`, single `WindowGroup`, no SwiftData, `.windowToolbarStyle(.unified(showsTitle: false))`, `.defaultSize(width: 1100, height: 720)`.
- `ContentView.swift` — placeholder shell ("SwiftKit" label centered).
- `Item.swift` — deleted.
- `Documentation/_links/` — three URL lists captured by parallel agents on 2026-05-01:
  - `hig-urls.md` — 170 HIG URLs across Foundations, Patterns, Components (8 sub-groups), Inputs, Technologies.
  - `swiftui-urls.md` — 1,722 SwiftUI URLs across 49 topic groupings (1,675 unique).
  - `appkit-urls.md` — 636 AppKit URLs across 30 topic groupings (top-level types/articles; per-property pages not recursed yet).
- `Documentation/access-links.md` — consolidated master index of all three frameworks.

## Future Plans

Captured in the project plan at `~/.claude/plans/yeah-lets-do-it-synchronous-dongarra.md`. Phases:

- **Phase 1 — `.claude/` scaffold.** *(In progress 2026-05-01.)*
- **Phase 2 — URL manifest gathering.** Done. Lists captured to `Documentation/_links/`.
- **Phase 3 — Page capture.** Walk every URL in the manifest, fetch via WebFetch (Firecrawl fallback), write to `Documentation/<framework>/<category>/<slug>.md` with frontmatter (url, framework, category, symbol, kind, captured, available_macos). Many parallel agents. No human-review gates — run straight through.
- **Phase 4 — Gallery scaffold.** 2-column `NavigationSplitView` with `Section`-grouped sidebar over a static `GalleryCatalog.allNodes` tree, `.searchable(placement: .sidebar)` for filter, light/dark toggle on detail pane (default dark). Every node points to a placeholder until its real page is written.
- **Phase 5 — Gallery pages.** One file per primitive in `SwiftKit/Pages/<Framework>/<Category>/<Name>Page.swift`. Each composes the universal `GalleryPageScaffold` (Header / Default / Variants / States / Notes). Priority order: SwiftUI Lists & Tables → Navigation → Materials & Effects → Controls → Layout → Text & Symbols → Toolbars & Menus → Sheets/Popovers/Alerts → everything else → AppKit.
- **Phase 6 — Cleanup & finalize.** Verify every node has a real page, every page passes `swiftui-expert-skill`, every page has dark+light screenshots.

### Deferred TODOs

- **Sidebar selection redo (deferred 2026-05-02).** Current `SidebarView.swift` uses framework-default selection chrome on macOS 26 (solid accent fill + white text/icon when window is focused). Target is the Mail/Finder pattern (translucent gray fill + accent text/icon, regardless of focus). See [`.claude/sidebar-plan.md`](sidebar-plan.md) for full context, what was tried, and the two implementation paths (AppKit `NSOutlineView` bridge vs. less-explored SwiftUI APIs). Revisit when comfortable with AppKit-bridging tradeoffs.

### Resume next session (2026-05-03+)

The 2026-05-02 session ended after committing SwiftKit's Phase 4 baseline + `.claude/` audit (commit `f096456`). Pommora's cross-sync was started but **not committed** — see "Pommora cross-sync — finish + commit" below for the situation. Pick up in this order:

1. **Pommora cross-sync — finish + commit (deferred from 2026-05-02).** A general-purpose Opus agent ran on 2026-05-02 to port universal Apple/SwiftUI/macOS 26 lessons from SwiftKit into Pommora's `.claude/` (specifically: the "Nathan's UI terminology is descriptive" meta-rule into `feedback.md`, the L-012 scope clarification into `lessons.md`, and the SwiftUI-vs-AppKit decision rule + macOS 26 sidebar selection findings + "always focus before screenshotting" into `macuix-rules.md`). Edits are on disk in `/Users/nathantaichman/The Studio/Projects/Project Pommora/.claude/` but were NOT committed. The repo had ~25+ files of pre-existing uncommitted work from a prior skeleton-strip session (Swift file deletions, `.claude/*.md` modifications, screenshot deletions, etc.) that I had no context on, so I refused to commit anything. **Action:** review Pommora's `git status` and `git diff` carefully; decide what to commit from the prior session's orphaned state vs what to revert; then commit the agent's `.claude/` additions separately. Agent flagged one ambiguity: Pommora's `Pommora/Pommora/<subdir>/` path notation may be correct given Pommora's actual nested folder layout (unlike SwiftKit's path bug). Verify before "fixing."
2. **Identify the first Phase 5 page.** Read `SwiftKit/Catalog/Catalog+SwiftUI.swift`, find the section matching "Lists/Tables" in Apple's SwiftUI taxonomy (per Phase 5 priority order in this file), pick the first Leaf in that section. Surface to Nathan via `AskUserQuestion` for go-ahead.
3. **Author the first page end-to-end.** Use `SwiftKit/Detail/PageScaffold/GalleryPageScaffold.swift` (Header / Default / Variants / States / Notes). Author at `SwiftKit/Pages/<framework>/<PageName>.swift`. Wire into `SwiftKit/Catalog/PageRegistry.swift`. Use the documented skill kit per `memory.md` (`swiftui-expert-skill`, `find-docs` / Context7).
4. **Decide batching strategy** based on Step 3 timing: one-at-a-time, agent-batched, or hybrid.

## Hard Constraints

- **Apple-only.** Every view, modifier, type, and style must come from Apple's documented SwiftUI or AppKit. No third-party UI libraries. No Claude-authored wrapper views. Carrying Pommora's "Apple-only" rule verbatim — see `feedback.md`.
- **macOS 26 only** — no backward compat.
- **Dark mode first.**
- **No SwiftData.** SwiftKit has no `@Model` types, no `.modelContainer(...)`. (L-007)
- **No re-implementing primitives that SwiftKit is documenting.** SwiftKit must *render* primitives, not *replace* them. Gallery pages are layout containers — `Button(...)` in a `VStack` is fine; `MyCustomSearchBar` is not.
- **Documentation mirror is the source of truth for variant enumeration.** When writing a gallery page, read the corresponding markdown file under `Documentation/` to determine which `style`/`size`/`prominence` variants and `@available` versions exist. Do not enumerate variants from training memory.

## Standing constraints

- **`PBXFileSystemSynchronizedRootGroup`.** New `.swift` files in `SwiftKit/SwiftKit/` compile automatically — no `project.pbxproj` edit needed.
- **DerivedData hash to pin.** `SwiftKit-dqolyhtwikfvruchpznkybfwhsmy` (captured 2026-05-02 on first clean build after `Documentation/` relocation). Use `-derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-dqolyhtwikfvruchpznkybfwhsmy` for any debugging session per L-005.
- **Skills location.** `swiftui-expert-skill` and `find-docs` (Context7) installed globally at `~/.agents/skills/`. No project-local copies.

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

## Planning checklist

- [ ] Is this a SwiftKit infrastructure change (gallery scaffold, doc capture) or a gallery page?
- [ ] If a gallery page: does the corresponding markdown file exist under `Documentation/`? If not, capture it first.
- [ ] Does this introduce a new SwiftUI / AppKit symbol? Cross-reference against the local `Documentation/` mirror first; fall back to Context7 if missing.
- [ ] Does this introduce a Claude-authored helper view? **Stop.** Compose Apple primitives directly.
- [ ] Does this add a `NavigationSplitView`? Use `.prominentDetail` if the design wants independent column resizing. (L-003)
- [ ] Are dark + light screenshots both planned for the change?
