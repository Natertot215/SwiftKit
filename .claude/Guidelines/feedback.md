# SwiftKit — Feedback

Nathan's direct behavior corrections for this project. Append the moment Nathan corrects something — never let a correction pass without recording it.

## Format

`YYYY-MM-DD — what was corrected — what to do instead`

---

## Apple-only — anything not written by Apple is forbidden

**Carried from Pommora — applies to SwiftKit identically and is the load-bearing rule of the project.**

**Rule:** If a component is not written by Apple themselves or provided as an official Apple-documented component, it cannot be used. This is stricter than "no custom components": even thin Claude-authored wrapper examples that *use* Apple primitives are not allowed unless explicitly sanctioned by Nathan. Every view struct in the codebase must directly compose Apple primitives. There is no in-between layer.

**Why:** On 2026-05-01, an audit of the Pommora codebase found six folders of Claude-authored Swift wrappers that re-implemented system UI behavior (search bars, tab bars, glass panels, sidebars). Hours of work across multiple sessions had to be deleted. A separate audit of `~/.claude/settings.json` found a global PreToolUse hook that fetched documentation from `exploreswiftui.com` (third-party) on every Swift edit, contradicting the Apple-only rule. Nathan's direct quote: *"anything thats not provided from Apple officially; if its not written by apple themselves or provided as an official component, its not allowed to be used."*

**How to apply (SwiftKit-specific):**
1. SwiftKit *renders* and *labels* Apple primitives. It must not *replace* them. A "Button" gallery page contains real `Button(...)` calls in a `VStack` — fine. A "SearchBar" gallery page that builds a custom `HStack { Image; TextField }` — forbidden.
2. The PreToolUse hook in `~/.claude/settings.json` enforces this with a deny check on Swift writes/edits — name patterns like `*SearchBar`, `*TabBar`, `*SidebarPanel*`, `*GlassPanel`, `*SegmentedControl` are blocked. Don't fight the hook; rename, restructure, and use the documented Apple primitive.
3. Documentation lookups go to the local `Documentation/` mirror first, then Context7 if missing. No third-party sources, ever.

---

## 2026-05-02 — Nathan's UI terminology is descriptive, not canonical

**Rule:** Treat every UI term Nathan uses ("items," "pills," "rows," "tabs," "panels," "nested," "compact barrier," "spacing between each layer," "selected items stay selected," etc.) as a *description of intent*, not a *spec name*. Translate it into the Apple-documented component before writing code (per `macuix-rules.md` "Search → Identify → Confirm"). When Nathan cites a system app by name (Mail, Finder, Notes) OR sends a screenshot, those ARE valid pointers — they trigger the Search step against that app's actual implementation, which is the documented and intended workflow.

**Push back, don't comply silently.** If Nathan describes a UI element in a way that contradicts the screenshot he just sent, or names a component that doesn't exist as a primitive, or asks for a behavior that contradicts HIG, the right response is to surface the contradiction with citations — not to invent an implementation that satisfies the literal words. Reference apps (Mail, Finder, Notes) and reference screenshots are the source of truth for what to build; Nathan's verbal description is a hint about what HE'S looking at, which may or may not match what HE'S asking for.

**Why:** Nathan's direct instruction (2026-05-02): *"DO NOT trust me to correctly identify components or UI."* Verbatim continuation: *"consider that terms I may have used 'items' 'pills' and other things may not be correct."* Past failures (the deleted `Sidebar/CatalogOutlineView.swift`, the multiple iterations of "fix the selection coloring" that kept replacing semantic tokens with literals) all stem from agents implementing the literal terminology instead of identifying the underlying Apple primitive. The meta-rule prevents the recurrence.

**How to apply:**
1. When Nathan uses any UI term, ask yourself "what Apple-documented component does he mean?" before reaching for an implementation.
2. When Nathan sends a screenshot, treat the screenshot as the spec, not his verbal description of it.
3. When Nathan names a system app, run "Search → Identify → Confirm" against that app's actual implementation.
4. When Nathan's terminology contradicts the screenshot or the docs, surface the contradiction in plain language with citations and let him redirect.

---

## 2026-05-05 — Verification tiering: skip per-batch screenshot loops; one final verification agent at the end

**Rule:** Per-batch populate agents do NOT take screenshots, do NOT relaunch the app, do NOT navigate the sidebar at all. Verification per batch = `xcodebuild` clean build + `swiftui-expert-skill` review of any new Gallery pages. Describe pages skip the swiftui-expert-skill pass too. A single dedicated verification agent runs once at the very end of all populate work — after the last placeholder is flipped — to walk every newly-authored leaf, capture a representative screenshot, and report any blank/clipped/broken pages for fix.

**Why:** Nathan's direct instruction (2026-05-05) after the batch-5 efficiency review: *"the screenshotting rule is not that important anyways and only slows down the work — we're not building UI here."* Empirically the per-batch screenshot loop burned ~25–35% of each agent's wall time on a workflow where 99%+ of leaves are doc-style content (Describe pages, statically-composed Gallery pages with simple `NSViewRepresentable` bridges). The batch-4 NSSplitView constraint catch was the ONE bug screenshots caught in 207 leaves (~0.5% rate). One end-of-job sweep catches the same bugs at a fraction of the cost.

**How to apply:**
1. Populate agent prompts must NOT include a screenshot loop, NOT include sidebar navigation, NOT include `pkill+open` instructions. Verification = build clean + L-001 grep + skill review of Gallery pages only.
2. Track which leaves have been populated since the last full verification pass. When the catalog reaches 0 placeholders (or at session end), dispatch ONE verification agent for all newly-authored leaves at once.
3. The final verification agent gets the full Apple-only and screenshot-rule briefing; it's the one that walks the running app, captures representative states, and reports per-leaf verdicts.
4. The 2026-05-04 "don't move/relaunch the SwiftKit window" rule still applies — but only inside that one final verification agent, since populate agents no longer touch the app at all.

---

## 2026-05-04 — Don't move or relaunch the SwiftKit window during screenshot loops

**Rule:** When capturing dark/light screenshots, **do not move, resize, or relaunch** the SwiftKit window. Query its current `osascript` bounds in place and `screencapture -o -R<x>,<y>,<w>,<h>` over those bounds. If the app is already running and the build hasn't changed, do NOT `pkill -x SwiftKit; open …SwiftKit.app` between captures — that respawns the window at its default position and steals focus from whatever the user had on screen.

**Why:** Nathan said directly (2026-05-04, mid-batch-5): *"dont mpve the app from its current position; i need to see my screen."* Subagents had been pkill+open looping the app between dark and light captures, repeatedly stealing the foreground and displacing his actual workspace. He needs to keep his terminal/IDE/whatever else visible while the screenshot loop runs.

**How to apply (for every screenshot-bearing agent):**
1. Launch the app **once per agent run**, after the final build, only if it isn't already running.
2. To toggle dark/light, flip system Appearance via `osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true|false'` — this does NOT move or refocus SwiftKit.
3. Query window bounds in place with `osascript`; do not call `osascript` to move/resize the window.
4. Before any `pkill`, ask whether it's actually needed (a build change requires relaunch; a sidebar navigation does not).
5. The `-o` flag on `screencapture` already prevents the screenshot from opening in Preview. Use it.
