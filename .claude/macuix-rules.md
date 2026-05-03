# Mac UIX Rules

Applies to any task touching Swift, SwiftUI, AppKit, or macOS frontend code generally. Both SwiftUI and AppKit are first-class — default to whichever Apple-documented API best fits the description of the feature. These rules override default behavior.

## Documentation lookup — local mirror first, Context7 fallback (MANDATORY for every UIX feature)

**Every** task that implements, modifies, or extends a UIX feature must begin with a documentation lookup. Training memory is stale. The order:

1. **Local `Documentation/` mirror.** SwiftKit's `Documentation/SwiftUI/`, `Documentation/AppKit/`, `Documentation/HIG/` are populated mirrors of Apple's docs as of capture date. Grep or read directly. Fastest, authoritative.
2. **Context7 MCP** (`mcp__plugin_context7_context7__resolve-library-id` + `mcp__plugin_context7_context7__query-docs`) — fallback if the local mirror is missing the page.
3. **Apple online docs (WebFetch)** — last resort. Apple's HIG site is a JS SPA so WebFetch sometimes returns nothing; the JSON variant (`/tutorials/data/...json`) is more reliable.

Cite the source (file path in the mirror, or doc URL) in the code change description.

When this is mandatory (non-exhaustive):
- Before any SwiftUI **or AppKit** modifier, initializer, type, protocol, or behavior use.
- Before answering a technical "how does X work" question that involves library/SDK behavior.
- Before picking between SwiftUI and AppKit for a feature.

The lookup does not replace the `.swiftinterface` check (Source authority §1) or the HIG check. Treat them as complementary:
- **Local mirror / Context7** → narrative docs, behavior, current usage.
- **`.swiftinterface`** → exact signatures, generics, defaults, `@available`.
- **HIG** → visual correctness, spacing, control sizing, accessibility.

## Search → Identify → Confirm — the procedure for any UI behavior we don't already know

**Rule (non-optional):** Before implementing any UI behavior or look that isn't trivially obvious, follow this three-step pattern. Do NOT re-create the look from scratch. Find the actual Apple component first.

1. **Search.** Look for which existing macOS app already does the thing (Mail, Finder, Notes, Music, Settings, Xcode). Inspect its binary if useful (`nm /System/Applications/<App>.app/Contents/MacOS/<App> | grep -i NSOutlineView` etc.). Search the local `Documentation/` mirror; fall back to Context7 (`find-docs` skill) for current Apple docs; verify exact signatures in the macOS 26 SDK `swiftinterface`. Cite all sources.
2. **Identify.** Name the EXACT Apple-documented component (SwiftUI view, modifier, AppKit class) that produces the look. State its full API path and availability. If no component does it natively, declare that explicitly and propose the closest documented bridge (e.g., `NSViewRepresentable` over an AppKit class).
3. **Confirm.** Present the identified component to the user with citation BEFORE writing implementation code. Get explicit go-ahead. Do not reinvent.

**Why:** Re-implementing system UI from scratch is the project's #1 anti-pattern (see `feedback.md` Apple-only rule). Six folders of Pommora wrappers had to be deleted because of this. Even when the user says "make it look like X," the right path is identify-the-component-X-uses-then-use-that, not "build a custom view that approximates X."

**Example (worked once, 2026-05-02):** User wanted Mail-style sidebar selection (subtle gray bg + accent foreground). First attempts re-implemented the look with `.tint`, `.listRowBackground`, custom row chrome — all wrong. The Search step revealed Mail.app uses `NSOutlineView` (confirmed via `nm` symbol inspection of the Mail binary). The Identify step pinpointed `NSOutlineView.style = .sourceList` (macOS 11.0+, AppKit). Subsequent SwiftUI workarounds (`.environment(\.appearsActive, false)`, semantic-token `.listRowBackground`) all failed — see [`sidebar-plan.md`](sidebar-plan.md) for full session log. The work is deferred; the lesson stands: **don't reach for `.listRowBackground` / custom chrome before exhausting Search → Identify → Confirm against actual Apple components**.

## Source authority

Authoritative sources in priority order:
1. Apple Human Interface Guidelines — `Documentation/HIG/...` locally; <https://developer.apple.com/design/human-interface-guidelines/> upstream.
2. Apple SwiftUI Documentation — `Documentation/SwiftUI/...` locally; <https://developer.apple.com/documentation/swiftui/> upstream.
3. Apple AppKit Documentation — `Documentation/AppKit/...` locally; <https://developer.apple.com/documentation/appkit/> upstream.
4. macOS 26 SDK swiftinterface (exact signatures, generics, defaults, `@available`).
5. URLs Nathan provides in-conversation.

Never rely on training memory alone. Community sources (Stack Overflow, blogs, GitHub issues) are not authoritative — they may seed an approach, but every claim must be verified against Apple before committing to code.

## Component constraints

- Use only official SwiftUI components and modifiers available on macOS 26. Confirm via the "Availability" section of each component's Apple doc page.
- No third-party UI libraries.
- AppKit is encouraged where SwiftUI doesn't cover a needed macOS surface. Use `NSViewRepresentable` / `NSViewControllerRepresentable` (or full AppKit). Default to SwiftUI when both produce equivalent results; otherwise pick whichever Apple-documented API best matches.
- **SwiftKit-specific:** gallery pages must *render* primitives, not *replace* them. A "Button" gallery page contains real `Button(...)` calls; a "SearchBar" gallery page must use `.searchable(...)` — do not build a `TextField` + magnifying-glass `HStack` to simulate one.

## HIG adherence

Before designing or modifying any UI surface, fetch the relevant HIG page(s) for macOS and the specific component category (sidebars, toolbars, menus, sheets, popovers, controls). Match HIG specs for spacing, typography, color, control sizing, window chrome, and accessibility. Dynamic Type, light/dark mode, and full keyboard accessibility are non-optional.

## Semantic tokens over sampled RGB

**Rule (non-optional):** For any styling value that exists *because it is system look-and-feel* (color, font, material, system metric), use the Apple-documented semantic token — never a hardcoded RGB/hex/pixel literal sampled from Figma, a screenshot, or a community reference. Semantic tokens passed through `.foregroundStyle`, `.tint`, `.foregroundColor`, etc. ARE encouraged; the anti-pattern is committing a literal that *replaces* what a token would resolve to.

Full rationale (Figma-vs-vibrancy, screenshot eyedropping pitfalls, focus-state confounds, the 2026-05-02 sidebar incident, and the verification protocol) lives in [`lessons.md` L-012](lessons.md). Read it before writing any system-UI styling value.

## SF Symbol weight mirrors typography weight

**Rule (non-optional):** When an SF Symbol sits next to text, the symbol's weight must match the text's weight. A bold title gets a bold symbol; a thin caption gets a thin symbol. Mismatches read as broken hierarchy.

**How to apply:**
- Always compose with `Label(_, systemImage:)` — never hand-roll `HStack { Image; Text }`. The `Label` form lets symbol weight inherit from `.fontWeight()` automatically.
- Set weight on the `Label` (or its container), never on the `Image` independently. If you find yourself writing `Image(systemName:).fontWeight(...)` separate from the adjacent `Text`, you've broken the rule — restructure as a `Label`.
- Apply the cascade per row in lists/sidebars: section headers `.fontWeight(.semibold)` → semibold symbols; body rows `.regular` → regular symbols; footnote captions `.thin` or `.light` → thin/light symbols.
- The HIG calls this out at `Documentation/HIG/foundations/typography.md` line 61: *"SF Symbols ... weights match the system fonts at every size, ensuring optical alignment."*

**Anti-pattern:** Using a `.bold` symbol next to `.body.regular` text "for emphasis" — that's not emphasis, that's incoherence. If you need the symbol to feel heavier, raise the entire row's weight.

## Always focus the window before screenshotting

**Rule (non-optional):** Window focus changes sidebar selection chrome (emphasized vs unemphasized) and many other macOS visual states. Before any `screencapture`, the target window must be frontmost. Same applies when sampling reference apps (Mail, Finder, Notes) — capture them frontmost or sampled values will be off by the focus delta.

Activation pattern: `osascript -e 'tell application "<App>" to activate'` + `tell process "<App>" to set frontmost to true` + brief sleep + `screencapture -o -R<x>,<y>,<w>,<h>`. Verify focus by checking the traffic-light state in the captured image (colored = focused, gray = unfocused).

**Why:** Established 2026-05-02 after a screenshot agent captured both Mail and SwiftKit unfocused, sampled colors that mismatched, and reported a fix that was actually applying the wrong rule.

## Build → screenshot → review loop

Run after every UI-affecting change. No exceptions.

1. Build clean (`xcodebuild -scheme SwiftKit -derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-<hash>`, no UI-related warnings).
2. Launch the app, navigate to the affected screen.
3. Capture window-region screenshots in **both dark and light** (toggle is in SwiftKit's detail pane). Save under `Screen Recordings/<unix-ts>-<state>-{dark|light}.png`. For multi-state UI (default/hover/selected/disabled/focused), capture each state.
4. Compare each screenshot against the intended change, the relevant HIG page, and an adjacent unmodified gallery page for cohesion.
5. If anything is off, iterate from step 1.

Note (2026-05-02): some sessions verify code-based + Nathan's reference screenshots instead of capturing new ones — when that happens, the `screencapture` step is skipped but the comparison-against-references step is not.

## Stopping criteria

Work is not complete until ALL are true:
- Build succeeds with zero warnings related to the change.
- Every modified gallery page has dark + light screenshots, all viewed.
- Every UI element on every modified page has been cross-referenced against its HIG / SwiftUI / AppKit doc.
- An adjacent unmodified page has been compared for app-wide cohesion.
- All HIG deviations are explicitly justified and surfaced.

If any fail, work is not done. Continue iterating.

## Reporting

On completion, report:
- Every screenshot captured (path + what it shows + state).
- Every Apple doc URL or local mirror path cross-referenced.
- Any HIG deviation and its justification.
- One of these closing lines, verbatim:
  - **`Build clean, screenshots reviewed, HIG verified — finalized.`** (truly done)
  - **`Outstanding: <list>`** (not done; list what remains)
