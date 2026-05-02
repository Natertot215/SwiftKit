# SwiftKit — Session Handoff

**Read this first if you are a fresh Claude opening this project.** This file is your orientation. After reading it, read `CLAUDE.md`, `framework.md`, `feedback.md`, `lessons.md`, `macuix-rules.md` in that order.

---

## Why this project exists

Nathan is a solo dev (self-described non-coder) who has been trying to build **Pommora**, a native macOS Obsidian-clone markdown editor on macOS 26. Pommora's UI shell rebuild stalled across multiple sessions because **neither Nathan nor Claude had a confirmed visual reference for what Apple's primitives actually render as on macOS 26**. Selection styling iterated 8+ times. Custom components silently re-introduced themselves despite an explicit "Apple-only" rule. Materials and tints behaved differently than expected. Every "build the sidebar" task became a guessing game off after-the-fact screenshots.

**SwiftKit is the fix.** It is a personal Apple-component reference library — a native macOS gallery app where every SwiftUI and AppKit primitive gets one screen showing every documented variant rendered side-by-side, labeled with its exact API call. Like a Figma component library, but for Apple's native frameworks. Its companion is `Documentation/`, a complete local mirror of Apple's HIG, SwiftUI, and AppKit documentation as flat markdown files.

When Pommora (or any future macOS project) needs a primitive, Nathan points at SwiftKit and says "use that one." No invention. No interpretation. Claude reads the local Apple docs from disk instead of round-tripping to apple.com. The whole point is to eliminate the failure mode that produced the 8 sidebar iterations.

## The non-negotiable rule

**Apple-only.** If a component is not written by Apple themselves or provided as an official Apple-documented component, it cannot be used. This applies to SwiftKit identically to Pommora — even thin Claude-authored wrapper structs that re-implement system UI behavior (search bars, tab bars, glass panels, sidebars) are forbidden by name. The `~/.claude/settings.json` PreToolUse hook enforces this with a deny check on Swift writes/edits. Do not fight the hook — rename, restructure, use the documented Apple primitive.

SwiftKit's job is to *render* Apple primitives, not *replace* them. A "Button" gallery page contains real `Button(...)` calls in a `VStack`. A "SearchBar" gallery page must use `.searchable(...)` — never a hand-rolled `TextField` + magnifying-glass `HStack`.

## What happened in the session that created this project (2026-05-01)

1. **Pommora UI shell stalled** after 8+ iterations on sidebar selection styling. Root cause analysis surfaced that the recurring failure was lack of ground-truth visual reference for Apple primitives.

2. **Decision: pause Pommora, build SwiftKit instead** — a reference library that future Pommora work can point at. Nathan: "lets call it SwiftKit; light dark toggle dark default; everything; ill run many agents; appkit gets its own section."

3. **Phase 0 — strip Xcode SwiftData template.** Xcode generated SwiftKit with the stock `App with SwiftData` template (Item.swift, ModelContainer, Schema). On macOS 26, attaching `.modelContainer(for: [])` to a `WindowGroup` with no `@Model` types causes the container init to fail silently — app launches, no window renders. (See L-007 in `lessons.md`.) Stripped:
   - `SwiftKitApp.swift` rewritten without SwiftData (just `@main`, `WindowGroup`, `.windowToolbarStyle(.unified(showsTitle: false))`, `.defaultSize(width: 1100, height: 720)`).
   - `ContentView.swift` rewritten to a minimal placeholder.
   - `Item.swift` deleted.

4. **Phase 2 — URL manifest gathering.** Three parallel agents walked Apple's framework topic indexes (using the JSON variant API at `developer.apple.com/tutorials/data/...json` for speed) to enumerate every reachable doc URL:
   - HIG: 170 URLs across Foundations, Patterns, Components (8 sub-groups), Inputs, Technologies. Captured to `Documentation/_links/hig-urls.md`.
   - SwiftUI: 1,722 URLs (1,675 unique) across 49 topic groupings. Captured to `Documentation/_links/swiftui-urls.md`.
   - AppKit: 636 URLs across 30 topic groupings (top-level types/articles only — per-method/per-property pages were not recursed; that would push the count to 10,000+ and was deferred per `memory.md`). Captured to `Documentation/_links/appkit-urls.md`.
   - Consolidated into `Documentation/access-links.md` (2,528 URLs total).

5. **Phase 3 — Page capture.** Hard journey. Multiple agent waves were cut short by Anthropic usage limits and / or fabrication.

   **What worked**: a Bash script (`/tmp/swiftkit_capture.sh`) using `curl` + `jq` against Apple's JSON variant API (`developer.apple.com/tutorials/data/...json`). No AI summarizer in the loop = verbatim Apple content as markdown. Bash, not Python (Nathan banned Python specifically). The script:
   - Walks the URL list files in `Documentation/_links/`, tracking H2 + H3 section headers
   - Computes target path `Documentation/<framework>/<topic-slug>/<symbol-slug>.md`
   - Skips files already > 2500 bytes
   - Curls JSON variant API, runs jq filter to convert content+topics+seeAlso+availability+declarations+parameters to markdown
   - Writes frontmatter + body
   - On HTTP failure: writes `status: failed` stub
   - On jq filter failure: falls back to a recursive text-walker

   **Final capture run (2026-05-02)**: ~2,450+ markdown files across HIG/SwiftUI/AppKit, mostly real Apple content (median 6KB+ for HIG, similar for SwiftUI/AppKit symbol pages). Failed URLs are explicitly stubbed with `status: failed`.

   **Key lessons (record these as durable rules)**:
   - **Don't trust agent self-reports.** Agents will say "all done" with fabricated content from training data. Always verify by file size + spot-check vs raw fetched JSON.
   - **WebFetch summarizes by default.** Even with explicit "verbatim" prompts, WebFetch is an AI-mediated tool that paraphrases. For doc capture, use `curl` directly to bypass the summarizer.
   - **Apple's HTML pages are JS-rendered.** WebFetch on the HTML URL returns nothing. The JSON variant URL returns structured content reliably.
   - **Don't launch 12+ parallel agents** — burns through Anthropic usage limits in ~14 minutes. 2-3 max.
   - **No Python.** Nathan banned it specifically. Bash + curl + jq is fine.
   - **Size <2500 bytes for a SwiftUI/AppKit symbol page is suspect.** Real Apple symbol pages are 5-15KB. Anything tiny is either fabricated, jq-broken, or genuinely a near-empty index.

## What was scaffolded in `.claude/`

- `CLAUDE.md` — operational hub. Stack, workflow, file index, mandatory rules.
- `framework.md` — vision/purpose, current state, future plans (Phases 4–6 still ahead), hard constraints.
- `feedback.md` — Nathan's behavior corrections. Carries Pommora's "Apple-only" entry verbatim.
- `memory.md` — non-obvious decisions: two-column NavigationSplitView (not three), light/dark toggle scoped to detail pane, AppKit URL list intentionally captured at framework-topic level not per-method, etc.
- `lessons.md` — failure patterns L-001 through L-009 carried from Pommora. These are universal Apple/SwiftUI rules and apply to SwiftKit identically.
- `macuix-rules.md` — source authority hierarchy, component constraints, build → screenshot → review loop, dark-mode-first capture sequence. **Mandatory reading before any Swift/SwiftUI/macOS code.**
- `handoff.md` — this file.

Plus at project root: `.gitignore`, `README.md`. Git initialized on 2026-05-02, initial commit `6661ebd`.

## What's left to do

The full plan lives at `~/.claude/plans/yeah-lets-do-it-synchronous-dongarra.md`. Remaining phases:

- **Phase 3 (in progress)** — finish the doc capture. When all 13 agents complete, aggregate failure lists, re-launch a second-pass capture agent for any failed URLs (Firecrawl as primary this time), confirm 100% coverage (or explicitly marked-failed).
- **Phase 4 — Gallery scaffold.** Build `SwiftKit/Sidebar/{GalleryNode,GalleryCatalog,SidebarView}.swift` and `SwiftKit/Detail/{GalleryDetailView,GalleryPageScaffold,ColorSchemeToggle}.swift`. Wire into `ContentView` as a 2-column `NavigationSplitView` with `.navigationSplitViewStyle(.prominentDetail)` (per L-003). Sidebar pinned to `min: 240, ideal: 280, max: 360` (per L-009 — slightly wider than Pommora because of 3-level hierarchy). Search via `.searchable(placement: .sidebar)`. Light/dark toggle on detail pane via `@AppStorage("preferredScheme")` defaulting to `.dark`. Every catalog node points to a shared `PlaceholderPage` view until its real page is written.
- **Phase 5 — Gallery pages.** One file per primitive in `SwiftKit/Pages/<Framework>/<Category>/<Name>Page.swift`. Each composes `GalleryPageScaffold` (Header / Default / Variants / States / Notes). Read the corresponding markdown file under `Documentation/` to determine which variants and `@available` versions exist — do **not** enumerate variants from training memory. Priority order: SwiftUI Lists & Tables → Navigation → Materials & Effects → Controls → Layout → Text & Symbols → Toolbars & Menus → Sheets/Popovers → everything else → AppKit.
- **Phase 6 — Cleanup & finalize.** Verify every node has a real page; every page passes `swiftui-expert-skill`; every page has dark+light screenshots in `Screen Recordings/`.

## Quick orientation for your first action

Whatever you're being asked to do, run through this checklist before writing code:

1. Is this Swift / SwiftUI / macOS code? → load `macuix-rules.md`. Mandatory.
2. Does the work touch a primitive? → read its captured markdown under `Documentation/SwiftUI/<topic>/<slug>.md` or `Documentation/AppKit/<topic>/<slug>.md` first. The local mirror is the source of truth for variants and availability.
3. Are you about to write a `View` struct that re-implements system UI? → **stop.** Compose Apple primitives directly. The PreToolUse hook will deny the write if you don't.
4. Are you adding a `NavigationSplitView`? → use `.prominentDetail` (L-003). If any column's width is conditional, pin the sidebar with `.navigationSplitViewColumnWidth(min:ideal:max:)` (L-009).
5. Is SwiftData involved? → SwiftKit has no `@Model` types and no `ModelContainer`. Don't add an empty one (L-007).
6. After UI changes: build → screenshot in **dark and light** → review → close with the verbatim phrase from `macuix-rules.md`.
