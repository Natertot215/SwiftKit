# Tile-Content Migration Handoff

**Date written:** 2026-05-07
**Picks up:** when the next tile-content session begins
**Strategy:** **migration, not greenfield authoring**

---

## The premise (corrected)

The orphan audit on 2026-05-07 inverted the project's mental model. The 562 unregistered `*Page.swift` files in `Pages/SwiftUI/` are NOT stale leftovers — they are **the original authored gallery content from the pre-gallery era**. The registered `*GalleryPage.swift` files are mostly 40-50 line placeholder stubs.

Concrete examples:
- `Tables/TablePage.swift` — **953 lines** of full Table/TableColumn/TableStyle gallery
- `ControlsAndIndicators/ButtonPage.swift` — **1380 lines** of dense Button reference
- `InputEvents/KeyboardInputPage.swift` — **1385 lines** of keyboard-input gallery
- `ViewConfiguration/ColorSchemePage.swift` — **993 lines**

Versus their registered counterparts which render `ContentUnavailableView "In progress"`.

**Implication:** the tile-content sweep is a **port-and-fold** operation, not authoring from scratch.

---

## The migration unit

For each registered `<Name>GalleryPage.swift`:

1. Find the matching orphan source. Usually `<Name>Page.swift` in the same folder.
2. **For family-master pages** (post-consolidation), the master should absorb content from *multiple* orphans. Examples:
   - `TableGalleryPage` should fold in: `TablePage.swift` (953 lines), `TableColumnCustomizationPage.swift` (110 lines), `DisclosureTableRowPage.swift` (92 lines), `BuildingGreatMacAppPage.swift` (46 lines, DescribePage)
   - `MenuGalleryPage` should fold in: `MenuPage.swift`, `ContextMenuPage.swift`, `MenuModifiersPage.swift`
   - `TextGalleryPage` should fold in: `TextPage.swift`, `TextStylingPage.swift`, plus the deleted Bold/Italic/Underline/Strikethrough orphans (if their content survives elsewhere)
3. Port the orphan's body content into the gallery's `GalleryItemPage { ... }` tile slot. Tile vocabulary:
   - `VariantTile` — generic demo
   - `ReferenceTile` — protocols, deprecated types, iOS-only APIs
   - `MaterialDemoTile`, `AnimationDemoTile`, `TransitionDemoTile`, `ShapeStyleDemoTile`, `EnvironmentValueDemoTile` — pre-baked canvases for non-renderable APIs
4. Update `absorbedSymbols` if migration surfaces symbols not yet listed.
5. `rm` the orphan source files once content is fully ported.

---

## Per-folder triage list

Source: `/tmp/orphan_linecounts.txt` (full sorted manifest from the orphan audit). High-value folders, ranked by approximate content density:

### Tier 1 — biggest content per page (start here)

| Folder | Notable orphans (lines) | Migration target |
|---|---|---|
| `InputEvents/` | `KeyboardInputPage.swift` (1385) | `KeyboardInputGalleryPage` |
| `ControlsAndIndicators/` | `ButtonPage.swift` (1380), `PickerPage.swift` (602), `DatePickerPage.swift` (478) | `ButtonGalleryPage`, `PickerGalleryPage`, `DatePickerGalleryPage` |
| `Tables/` | `TablePage.swift` (953) + 3 smaller siblings | `TableGalleryPage` (consolidated master) |
| `ViewConfiguration/` | `ColorSchemePage.swift` (993) | `ColorSchemeGalleryPage` |
| `Layout/` (was LayoutAdjustments) | `SafeAreaPage.swift` (852), `PaddingPage.swift` (787), `FramePage.swift` (648) | matching `*GalleryPage`s |

### Tier 2 — substantial content

| Folder | Notable orphans (lines) | Migration target |
|---|---|---|
| `MenusAndCommands/` | `MenuPage.swift` (728), `ContextMenuPage.swift`, `MenuModifiersPage.swift` | `MenuGalleryPage` (consolidated master) |
| `ScrollViews/` | `ScrollTransitionPage.swift` (691) | `ScrollTransitionGalleryPage` |
| `DrawingAndGraphics/` | `GradientPage.swift` (560) | `GradientGalleryPage` |
| `Layout/` (CustomLayout) | `CustomLayoutPage.swift` (533), `AnyLayoutPage.swift` (462) | matching gallery pages |
| `LayoutFundamentals/` | `StacksPage.swift` (508), `BackgroundOverlayPage.swift` (493), `GridPage.swift` (487) | matching gallery pages |
| `ViewGroupings/` | `SectionPage.swift` (489), `GroupPage.swift` (470), `LabeledContentPage.swift` (463), `ControlGroupPage.swift` (459), `FormPage.swift` (436) | matching gallery pages |

### Tier 3 — describe-style orphans (`*DescribePage.swift`, `_Describe/`)

~80 files using the `DescribePage` helper for protocols, deprecated types, iOS-only APIs that can't render. Each fits as a `ReferenceTile` row in its parent gallery page.

Examples: `DragSessionDescribePage`, `VisionOSVolumesDescribePage`, `CameraCaptureDescribePage`, `DropDelegateDescribePage`, `DropInfoDescribePage`, `DropOperationDescribePage`, `DropProposalDescribePage`. Most map to a consolidated family master (e.g., the four Drop describe-pages all fold into `DraggableGalleryPage`).

### Tier 4 — long tail

The remaining ~400 files. Many are smaller (~30-60 lines). Includes per-shape demos, per-modifier reference cards, etc.

---

## Per-folder migration workflow (agent prompt template)

Each folder gets one agent. Agent task:

1. **List** all `*Page.swift` (orphan) and `*GalleryPage.swift` (registered) files in the folder.
2. **Match** each orphan to its registered counterpart. Account for consolidation: multiple orphans may map to one master.
3. **For each pair (or group):**
   a. Read both files.
   b. Identify orphan's tile content (`VariantBlock`/`PageSection`/etc. — older scaffold types).
   c. Port that content into the gallery's `GalleryItemPage { tiles }` slot. Translate older scaffold types into the new tile vocabulary (`VariantTile`/`ReferenceTile`/specialty tiles).
   d. Preserve the orphan's blurb/signature/docPath in the master's `GalleryItem`. Append new symbols to `absorbedSymbols` if any are surfaced.
   e. Verify the resulting `*GalleryPage.swift` compiles (or at least follows the project's L-011 rule: no nested SwiftUI trees > a few hundred symbols).
4. **Delete** the orphan(s) once content is migrated.
5. **Report** changes to the coordinator.

Constraints (for agent prompts):
- **Do NOT edit `SwiftKit/Catalog/GalleryRegistry.swift`** — registered pages stay registered; just modify in-place.
- **Do NOT touch other folders** — scope is limited to one folder per agent.
- Use semantic ShapeStyles per `Guidelines/visual-rules.md` (no hand-mixed `Color(red:green:blue:)`).
- Preserve `static let item: GalleryItem` extensions on master pages — only modify their fields if migration adds symbols.

### Output format

Each agent reports:
1. List of orphan-to-master mappings completed.
2. List of orphan files deleted.
3. Any orphan that DIDN'T map cleanly (registration gap, missing master, structural mismatch) — surface for coordinator triage.

---

## Coordinator role (main session)

1. **Per session,** dispatch 3-5 folder agents in parallel.
2. **Verify build** after each batch returns: `xcodebuild -project SwiftKit.xcodeproj -scheme SwiftKit -configuration Debug -destination 'platform=macOS' build`.
3. **Visual-check a sample** of migrated pages by running the app (optional but recommended for Tier 1).
4. **Commit** after each batch. Commit message: `Tile migration — <folder list> (<N> pages)`.
5. **Update handoff.md** at session end with which folders are done.

---

## Pacing target

- Tier 1 (5 folders): one focused session
- Tier 2 (6 folders): one focused session
- Tier 3 (~80 describe pages): one focused session (parallel agents per consolidation family)
- Tier 4 (long tail, ~25 folders): 2-3 sessions

**Total:** 5-6 focused sessions to migrate the entire corpus. With parallel agents, possibly fewer.

---

## Pre-migration checklist (before first migration session)

- [ ] **Visual QA pass on the existing 26 authored pages** — confirm the tile vocabulary (`VariantTile`/`ReferenceTile`/specialty tiles) is what we want migrated content to look like
- [ ] **Documentation/ folder audit** — verify `GalleryItem.docPath` references resolve (separate from migration but useful before authoring)
- [ ] **Pick a Tier 1 folder as pilot** — recommend `Tables/` since family is already consolidated and orphan content is well-known (953-line `TablePage`)
- [ ] **Author first migration as solo (not agent) work** — establishes the per-folder pattern, irons out the agent prompt, sets quality bar before fan-out

---

## Definition of "page migration complete"

A `<Name>GalleryPage.swift` is "complete" when:
1. ✅ Its `GalleryItemPage { ... }` body renders meaningful tile content (not `ContentUnavailableView "In progress"`)
2. ✅ Each documented Apple variant is represented as a `VariantTile`
3. ✅ Each protocol/deprecated/iOS-only sibling is represented as a `ReferenceTile`
4. ✅ `absorbedSymbols` covers every symbol the page documents
5. ✅ Build green
6. ✅ Visually inspected in dark mode (project default) and light mode

A folder is "migrated" when all its `*GalleryPage.swift` are complete AND all its orphan `*Page.swift` files are deleted.

---

## When this is done

The project hits "complete" per the finish-line handoff's definition:
- ✅ Shell works (already done)
- ✅ Every Apple primitive registered (already done after Day 2 — 399 GalleryItems)
- ⏳ Each gallery page has migrated content (this plan's scope)
- ❓ Documentation/ alignment (separate audit)
- ❓ Search / polish / README (optional)

Estimated end of tile migration: ~5-6 focused sessions from the start of Phase 1 of this plan. Once tile migration is done, only optional polish remains.
