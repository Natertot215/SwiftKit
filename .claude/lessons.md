# Lessons — SwiftKit

Carried from Pommora — these failure patterns apply universally to any Apple/SwiftUI/macOS work. Each entry includes the mistake, why it's wrong, the rule going forward, and the incident(s) that proved it. Append new SwiftKit-specific incidents to the matching L-00X. New patterns get a new L-00X.

---

## L-001 · Don't hand-tune UI dimensions — use SwiftUI semantic primitives

**Applies before:** any UI change — sizing, fonts, icon scale, padding, row heights, color, materials, drag/drop, animations.

**The mistake:** Reaching for hand-coded dimensions instead of SwiftUI's semantic modifiers:
- `.frame(width: 22)` on an Image to "make the icon bigger"
- `.font(.system(size: 13))` to size a label
- `.font(.title3)` applied directly to an icon (instead of letting `Label` + `.imageScale` handle it)
- Hand-rolled `HStack { Image; Text }` instead of `Label`
- Manual row paddings to fake `.controlSize(.regular)` behavior
- Nested `ScrollView` hacks instead of `.listSectionSeparator(.hidden)`
- Manual width math on title vs. detail instead of `.layoutPriority` + `.lineLimit().truncationMode(.tail)`
- Hand-rolled `RoundedRectangle` selection highlights instead of letting `List`/`.tag` handle selection

**Why it's wrong:** Apple's semantic modifiers automatically scale with `.controlSize`, the system Sidebar size setting, and Dynamic Type. Hand-tuned literals silently break all three.

**The rule:**

| Want this | Use this | Don't do this |
|---|---|---|
| Bigger icon in a row | `.imageScale(.large)` on the `Label`/`List` | `.frame(width: 22)` on `Image` |
| Bigger icon + text together | `Label` + `.font(.headline)` + `.imageScale(.large)` | `.font(.system(size: 16))` |
| Sidebar size variants | `.controlSize(.small/.regular/.large)` | hand-tuned row paddings |
| Hide section dividers in a `List` | `.listSectionSeparator(.hidden)` | nested `ScrollView` hacks |
| Detail wins over title in a row | `.layoutPriority(1)` on detail + `.lineLimit(1).truncationMode(.tail)` on title | manual width math |
| Selection highlight in a row | `List` + `.tag(...)` selection | `RoundedRectangle.fill(Color.accentColor)` + `onTapGesture` |
| Color | `Color.accentColor`, `.primary`, `.secondary`, `Color(nsColor: .systemX)` | hex literals from Figma |
| Material backgrounds | `.regularMaterial`, `.thinMaterial`, etc. | hand-mixed RGBA |

**Incidents (Pommora):**
- 2026-04-26 — `.frame(width: 22)` + `.font(.title3)` on sidebar icons. Rewritten with `Label` + `.imageScale(.large)` + `.controlSize(.regular)`.
- 2026-04-28 — Orphan-row overflow path with hand-rolled selection (`RoundedRectangle.fill(.accentColor.opacity(0.85))`, hardcoded `26pt` row height). Scrapped; rendered all rows in the normal `ForEach` so `List` handled selection.

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

## L-005 · Pin DerivedData before behavioral debugging

**Applies before:** debugging any unexpected app behavior.

**The mistake:** Building to one DerivedData hash while the running app came from a different build. Changes are invisible in the running binary.

**The rule:** Before debugging: `ls ~/Library/Developer/Xcode/DerivedData/ | grep SwiftKit`. Confirm exactly one entry. Pin: `-derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-<hash>`.

**Incidents (Pommora):**
- 2026-04-28 — `xcodebuild` wrote to one hash while running app was from another. Multiple debug rounds wasted.

---

## L-006 · Surface architectural constraints before writing code, not after four failures

**Applies before:** any drag/drop, animation, layout rewrite, or complex interaction feature.

**The mistake:** Attempting multiple implementations of a feature blocked by an architectural constraint, without surfacing the constraint first.

**The rule:** After the second rejection of the same feature: stop and explain the constraint before attempting another implementation.

**Incidents (Pommora):**
- 2026-04-28 — Finder-style displacement drag rejected 4 times. Constraint (`.listStyle(.sidebar)` → `NSOutlineView`) was never surfaced upfront.

---

## L-007 · Don't scaffold an empty `.modelContainer(for: [])`

**Applies before:** stripping SwiftData out of an app skeleton, or scaffolding a new SwiftUI macOS app where SwiftData is anticipated but no `@Model` types are defined yet.

**The mistake:** Leaving `.modelContainer(for: [], inMemory: false)` on the `WindowGroup` when no `@Model` types exist.

**Why it's wrong:** On macOS 26, attaching `.modelContainer(for: [])` to a `WindowGroup` causes the container init to fail silently — the app launches, the process is alive, but **no window renders**. Looks like the app is broken; `xcodebuild` builds fine. Failure is invisible until launch.

**The rule:** No `.modelContainer(...)` until at least one `@Model` type is registered. Minimum viable skeleton is `WindowGroup { ContentView() }` with no `import SwiftData`.

**SwiftKit-specific:** SwiftKit will never have a `ModelContainer` — there's no persistent state. `@AppStorage` is fine for the light/dark toggle preference; that's `UserDefaults`-backed and unrelated to SwiftData.

**Incidents (Pommora):**
- 2026-04-30 — Skeleton setup left `.modelContainer(for: [], inMemory: false)`. App launched but no window rendered. Removed the modifier and `import SwiftData` — window rendered.

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
