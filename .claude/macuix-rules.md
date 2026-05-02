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

## Build → screenshot → review loop

Run after every UI-affecting change. No exceptions.

1. Build. Resolve all errors and UI-related warnings before proceeding.
2. Launch the app.
3. Navigate to the screen affected by the change.
4. Capture screenshots in **both dark and light** (the toggle is built into SwiftKit's detail pane). Use `screencapture` with window-region targeting:
   ```bash
   pkill -x SwiftKit || true
   open ~/Library/Developer/Xcode/DerivedData/SwiftKit-<hash>/Build/Products/Debug/SwiftKit.app
   osascript -e 'tell application "SwiftKit" to activate'
   sleep 1
   BOUNDS=$(osascript -e 'tell application "System Events" to tell process "SwiftKit" to return (position of window 1) & (size of window 1)')
   # parse x,y,w,h, then:
   screencapture -o -R${x},${y},${w},${h} "Screen Recordings/$(date +%s)-<state>-dark.png"
   # toggle to light, repeat
   screencapture -o -R${x},${y},${w},${h} "Screen Recordings/$(date +%s)-<state>-light.png"
   ```
5. View every screenshot. Compare against:
   - the intended change
   - the relevant HIG page (re-fetch if not loaded this session)
   - an adjacent unmodified gallery page for cohesion (typography, spacing, color, control style)
6. If anything is off, iterate. Return to step 1.

If the change involves multiple states (default / hover / selected / disabled / focused), capture each state separately.

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
