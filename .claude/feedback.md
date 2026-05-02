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

*(no further entries yet)*
