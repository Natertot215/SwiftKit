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

*(no further entries yet)*
