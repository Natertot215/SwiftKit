# SwiftKit Page Logic Log — Phase 3b

Per-page record of layout/UI decisions made during Phase 3b. Append-only. Each entry written by the implementer of that page as their **final act** after the code is constructed and reviewed — closer to a postmortem than a plan. Subsequent agents read the entire log before drafting their own page's layout.

## Discipline

- **READ-BEFORE.** Every implementer reads the entire log before drafting their page's layout. The agent brief instructs: "cite at least one prior entry's decision in your reasoning, OR explain why your page diverges."
- **WRITE-AFTER.** The implementer's last act before handing back code is appending the entry. Spec reviewer verifies the entry exists and contains all six required lines.
- **APPEND-ONLY.** Never edit prior entries. If a later page contradicts an earlier decision, the new entry explains the divergence.

## Entry format (≤12 lines)

```markdown
### <Heading> > <Folder> > <Leaf> — <YYYY-MM-DD>
- Layout: <chosen shape + key parameters>.
- Why: <component-driven rationale; what it is about these components that motivated the choice>.
- Tile/row shape: <heights, widths, metadata column, special wrappers, etc.>.
- Demos: <live vs reference, dark+light verified, any unusual rendering choices>.
- New primitive proposed: <none | name + brief>.
- Heads-up for siblings: <what the next agent in this folder / cross-folder should know>.
```

## Available layout shapes (from Phase 3b spec)

| Shape | When | How |
|---|---|---|
| Bespoke long-form rows | Pages where each variant wants horizontal breathing room + side-aligned metadata (Typography, possibly Slider, ProgressView, TextEditor) | Custom `VStack` of `HStack` rows; data-struct ForEach; fixed metadata column width; `PageSection` for grouping. No `GalleryItemPage` wrapper required. |
| Condensed grid | Many small same-shape variants (Buttons, Toggles, small Pickers) | `GalleryItemPage(..., minTileWidth: 160)` with `VariantTile`s. |
| Default adaptive grid | Mixed-size demos, no special needs | `GalleryItemPage(...)` (220 default) with `VariantTile`s and/or specialty `*DemoTile`s. |
| Specialty-tile grid | Effects/animations needing a stable shared canvas (à la Motion, Materials) | Reuse existing `*DemoTile` from `DemoTiles.swift`, or write a `private struct LocalDemoTile: View` in the page file. |
| Hybrid | One headline interactive + supporting variants | `PageSection` to stack: a single full-width tile, then a grid section underneath. |
| Bare full-bleed | Pane-consuming primitives (NavigationSplitView, NavigationStack, Inspector, Sidebar, TabView, possibly Table) | Bypass `GalleryItemPage` entirely. Author a custom view: header (title + blurb + signature + availability + docPath) stacked above a single live example occupying the pane width. |

## Reference material

- **OG Typography (gold-standard for bespoke long-form):** `git show f3a3308:SwiftKit/Pages/Reference/TypographyPage.swift`. 311 lines, `apiColumnWidth: CGFloat = 180`, `TextStyleRow` data struct, custom `HStack` rows, `PageSection` sectioning. Reference for the W1 Typography implementer (do NOT copy verbatim — study principles).
- **Specialty wrapper precedent:** `Detail/PageScaffold/DemoTiles.swift` ships `AnimationDemoTile`, `TransitionDemoTile`, `MaterialDemoTile`, `ShapeStyleDemoTile`, `EnvironmentValueDemoTile`. They prove the "shared canvas per content type" pattern.

---

<!-- Entries below, in completion order. Each implementer appends here as their final act. -->
