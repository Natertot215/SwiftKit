# Sidebar Plan — Deferred Mail-Style Selection Chrome

**Status:** Deferred 2026-05-02. Current sidebar works architecturally; visual selection chrome is the macOS 26 framework default, not Mail's signature look. Revisit when comfortable with AppKit-bridging tradeoffs.

---

## Current state (works, ship-ready)

[`SwiftKit/App/SidebarView.swift`](../SwiftKit/App/SidebarView.swift) — pure SwiftUI:

- `List(selection: $selection) { ForEach(GalleryCatalog.allNodes) { … } }.listStyle(.sidebar)` inside `NavigationSplitView`.
- 3-tier `DisclosureGroup` shape: toggle heading (Reference / SwiftUI / AppKit) → label/folder (Modal presentations / Images / Controls / …) → item (the leaves).
- AppKit `Subheading` data tier flattens into the parent Folder's item list — not surfaced as a 4th sidebar disclosure level.
- Each row is `Label(title, systemImage:).lineLimit(1).truncationMode(.middle).tag(node.id)`.
- **Zero chrome overrides** — no `.listRowBackground`, no `.foregroundStyle`, no `.tint`, no `.background`, no per-row sizing.
- Selection chrome = framework default. On a focused window: solid `Color.accentColor` fill + white text/icon (the "emphasized" state).

This works, ships, and matches what stock SwiftUI produces. Apple's Liquid Glass sample (Landmarks) renders the same way.

---

## Target (deferred)

Mail.app, Finder, and Notes deliberately render sidebar selection differently than the SwiftUI default:

| State | SwiftUI default (`List(.sidebar)`, focused) | Mail / Finder / Notes (any focus state) |
|---|---|---|
| Background | Solid `Color.accentColor` fill | Translucent gray fill (`NSColor.unemphasizedSelectedContentBackgroundColor`) |
| Text | White (auto-contrast on accent fill) | Accent color |
| Icon | White (same auto-contrast) | Accent color |

Mail's look is achieved at the AppKit level — `NSOutlineView` with `selectionHighlightStyle = .sourceList` plus suppression of the emphasized state. SwiftUI doesn't expose a public knob for this.

---

## What was tried this session and why each failed

All attempted in order during 2026-05-02:

### Attempt 1: `.environment(\.appearsActive, false)` on the List
**Result:** No visible change.
**Cause:** `appearsActive` (the macOS 15+ replacement for the deprecated `controlActiveState`) does not propagate to `List(.sidebar)` selection rendering on macOS 26. Verified empirically by changing the system accent color to orange — selection still rendered as solid orange fill + white text in both states.
**Citation:** `Documentation/SwiftUI/environment-values/controlactivestate.md` (deprecated; appearsActive is the new path, but it doesn't reach `List(.sidebar)` row chrome).

### Attempt 2: Custom `.listRowBackground` with semantic token
```swift
.listRowBackground(isSelected
    ? Color(nsColor: .unemphasizedSelectedContentBackgroundColor)
    : Color.clear)
```
**Result:** Produced an unwanted "pure grey rectangle" container chrome — a single light-gray rounded rectangle visually grouping all the rows together, on top of which the actual selection fill drew. Looked broken.
**Cause:** The act of setting `.listRowBackground` at all (even with `Color.clear` for unselected rows) triggers macOS 26 source-list grouping chrome around the rows. Suppressing the framework default by replacing it produces a different chrome layer instead of removing it cleanly.

### Attempt 3: Explicit `Label { Text } icon: { Image }` builder + per-element `.foregroundStyle`
```swift
Label {
    Text(title).foregroundStyle(Color.accentColor)
} icon: {
    Image(systemName: systemImage).foregroundStyle(Color.accentColor)
}
```
**Result:** Click-to-select stopped working entirely — sidebar rows became unresponsive.
**Cause (suspected):** The explicit Label builder + per-element `.foregroundStyle` modifiers change the View's structural identity in a way that breaks `List(selection:)` hit testing on macOS 26. Reverting to `Label(title, systemImage:)` with no per-element styling restored selection.

---

## Two paths forward when this is revisited

### Path A — `NSViewControllerRepresentable` wrapping `NSOutlineView` (pixel-perfect)

Bridge to AppKit. Pixel-perfect Mail/Finder look. Re-introduces L-012-class risk (the deleted `Sidebar/CatalogOutlineView.swift` was the previous attempt at this and produced the original L-012 incident — `NSColor.unemphasizedSelectedContentBackgroundColor` was overridden with `NSColor.black.withAlphaComponent(0.7)` and rendered the inverse of Mail).

**Estimated cost:** ~150 lines for the bridge + selection-state management + DisclosureGroup-equivalent expansion handling in AppKit.

**Discipline required:**
- Strict semantic-token discipline per L-012 — `NSColor.unemphasizedSelectedContentBackgroundColor` only, no eyedropped values.
- Selection state synchronization between SwiftUI's `@Binding` and `NSOutlineView`'s `selectedRowIndexes`.
- Disclosure expansion state synchronization.
- Full keyboard navigation must still work (arrow keys, expand/collapse via right/left arrows).

**Reference:** `macuix-rules.md` "Search → Identify → Confirm" — Mail.app's binary inspection (`nm /System/Applications/Mail.app/Contents/MacOS/Mail | grep -i NSOutlineView`) confirms the AppKit class. `Documentation/AppKit/views-and-controls/nsoutlineview.md` is the authoritative reference.

### Path B — Less-explored SwiftUI APIs (cheap experiments first)

Things to try before committing to Path A's complexity:

- **`.tint(Color(nsColor: .unemphasizedSelectedContentBackgroundColor))` on the List.** SwiftUI's `.tint` modifier overrides what "accent" means for descendants. Possibly tricks the framework into using gray instead of accent for the fill — but text color would also follow tint, so might break the foreground.
- **`.preferredColorScheme(.dark)` toggle dance.** The unemphasized state may render differently per color scheme; experimenting with explicit color scheme overrides on the List might reveal a way to lock the unemphasized appearance.
- **Liquid Glass material modifiers** (`backgroundExtensionEffect()`, `glassEffect()`) — macOS 26 introduced new material APIs. Whether any of them affect `List(.sidebar)` selection chrome specifically is unverified.
- **Custom `ListStyle`.** SwiftUI has `ListStyle` as a protocol but documents only the standard conformers (`SidebarListStyle`, `PlainListStyle`, etc.). Whether a third-party conforming type works at all on macOS, and whether it could selectively override emphasis, is unverified.

None guaranteed. Path A is known to work (bridge to NSOutlineView, accept the cost). Path B is a sequence of cheap experiments with unknown payoff.

---

## When to revisit

- Nathan is comfortable with the AppKit-bridging tradeoffs (chooses Path A), OR
- An hour or two of Path B experimentation feels worthwhile (lower risk, lower payoff).

Until then, the current framework-default selection chrome ships.

## Pointer entries

- `framework.md` future-plans section has a one-line TODO pointing to this file.
- `lessons.md` L-012 will catch any future attempt to use literal-color overrides instead of semantic tokens.
- `feedback.md` "Apple-only" rule will catch any attempt to re-implement the sidebar from scratch instead of wrapping NSOutlineView.
