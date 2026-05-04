# Guidelines — API Lookup & Layout

Rules for verifying SwiftUI/AppKit APIs and applying correct layout patterns. Apply before introducing or modifying any modifier, initializer, or layout structure.

---

## L-002 · Verify SwiftUI APIs against the source — never invent from memory

**Applies before:** introducing or modifying any SwiftUI modifier, initializer, type, or protocol conformance.

**The mistake:** Writing SwiftUI code based on what the API "probably" looks like, then having it fail to compile or — worse — compile but behave wrong because the modifier doesn't exist on macOS 26, the signature has different parameter labels, or it does something subtly different than assumed.

**The rule — source-of-truth hierarchy:**
1. **Local `Documentation/` mirror first.** SwiftKit's mirror under `Documentation/SwiftUI/...` and `Documentation/AppKit/...` is the fastest authoritative source.
2. SwiftUI `.swiftinterface` in the macOS 26 SDK: `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.4.sdk/System/Library/Frameworks/SwiftUI.framework/Modules/SwiftUI.swiftmodule/arm64e-apple-macos.swiftinterface` — use `grep -n` for exact signatures.
3. Apple SwiftUI docs (online) — fall back to (1) and (2) if unreachable.
4. Apple HIG — visual correctness.
5. Shipped macOS apps (Finder, Mail, Notes, Photos, Settings, Xcode) — when HIG doesn't pixel-spec something, the canonical apps are the reference.

**Verification protocol:**
1. Name the modifier/type you're about to use.
2. Grep the local mirror or `.swiftinterface`. Confirm: it exists, signature matches, available on macOS 26.
3. If the source is unreachable, **say so to Nathan**. Don't guess.

**Incidents (Pommora):**
- 2026-04-28 — Drag-reorder rewrite spiral (4 rejected iterations). Root cause: `.listStyle(.sidebar)` delegates to `NSOutlineView`, which forces the legacy blue insertion bar regardless of which SwiftUI drag modifiers are applied. Never verified against the swiftinterface before starting.

---

## L-003 · NavigationSplitView — use `.prominentDetail` for independent columns

**Applies before:** any change to `NavigationSplitView` layout, column widths, or split-view style.

**The mistake:** Leaving `NavigationSplitView` at its default `.balanced` style when the design intent is independent column resizing.

**The rule:** Add `.navigationSplitViewStyle(.prominentDetail)`. The detail column becomes the flexible absorber.

```swift
NavigationSplitView { ... } detail: { ... }
    .navigationSplitViewStyle(.prominentDetail)
```

**Note for SwiftKit:** SwiftKit's main 2-column NavigationSplitView should use `.prominentDetail` so dragging the sidebar divider only affects the detail pane (where the rendered primitive lives), not vice versa.

**Incidents (Pommora):**
- 2026-04-28 — Walking skeleton shipped with default `.balanced`. Fixed by adding `.navigationSplitViewStyle(.prominentDetail)`.

---

## L-008 · `.windowResizeAnchor` + `.windowResizability(.contentSize)` does NOT auto-grow the window when `.inspector(...)` adds a sibling column

**Applies before:** any task where you intend to grow the macOS window in response to a SwiftUI state change — adding a column, opening a panel, expanding a section that should push the window wider rather than compress siblings.

**The rule:** When the documented Apple SwiftUI pattern doesn't achieve a desired outcome empirically:
1. Documented Apple method wins, full stop. **Do not** reach for `NSWindow` access (or any AppKit shim) as a workaround.
2. Accept the default behavior. Document the limitation. Move on.
3. Surface the finding to Nathan so the project's mental model stays accurate.

**Incidents (Pommora):**
- 2026-04-30 — Tried `.windowResizability(.contentSize)` + `.frame(idealWidth:)` + `.windowResizeAnchor(.leading)` to grow the window when an inspector opened. Built fine; on toggle, the inspector animated in but the window stayed at its current width. Accepted compression as the shipped behavior. Inspector was subsequently rewound for unrelated UX reasons.

---

## L-009 · Pin sidebar width with `.navigationSplitViewColumnWidth(min:ideal:max:)` when collapsing other columns conditionally

**Applies before:** any task that toggles a `NavigationSplitView` column's width based on selection — or, more generally, any time one column's width changes dynamically while another column should stay visually stable.

**The rule:** If any column's width is conditional, pin the sidebar with explicit `.navigationSplitViewColumnWidth(min:ideal:max:)`. Pick values that match HIG sidebar widths (typical: `min: 220, ideal: 240, max: 320`).

**SwiftKit note:** SwiftKit's sidebar should be pinned to `min: 240, ideal: 280, max: 360` — slightly wider than Pommora's because it carries 3-level hierarchy (Framework → Category → Primitive).

**Incidents (Pommora):**
- 2026-05-01 — Adding the `Library` sidebar item that collapses the middle column to 0. Sidebar fluctuated between ~140 and ~240 px until pinned with explicit min/ideal/max widths.
