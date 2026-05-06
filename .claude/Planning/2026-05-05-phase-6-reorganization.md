# Phase 6 — SwiftKit Reorganization (Type-Page Gallery Consolidation)

> Plan written 2026-05-05. Successor to `2026-05-04-phase-5-batch-5.md`. Executes via Ralph Loop with stacked-skill subagents.

## Context

SwiftKit currently mirrors Apple's developer-docs sidebar 1:1: one catalog leaf per documented symbol. After Phase 5, the SwiftUI catalog has ~1,264 real leaves and the AppKit catalog has ~166, with another ~300+ placeholder leaves still pending. The structure surfaces every modifier and every supporting type as a separate sidebar row, which produces three problems Nathan wants solved:

1. **Excessive page count.** Modifier siblings (e.g. six SafeArea variants, six ColorScheme variants, five Frame overloads, five ContainerRelativeFrame overloads) inflate the sidebar without educational benefit — each "page" is a thin doc wrapper for one method.
2. **Categorical fragmentation.** Related concepts get split across files because Apple's docs split them by symbol, not by component. `Color`/`ColorScheme`/`PreferredColorScheme`/`ToolbarColorScheme` live in three different sections; a Gradient discussion fragments across `Gradient`, `MeshGradient`, `AnyGradient`, and `LinearGradient` leaves.
3. **Click-through-to-detail browsing.** To compare three button styles a user must navigate to three different leaves. The reference library should let you scroll one Button page and see every documented variant inline.

This plan reorganizes SwiftKit around **dense type-pages**: one page per Apple type, with every related modifier, every supporting type, every describe-track variant absorbed as inline subsections. The model is the existing [TypographyPage.swift](../../SwiftKit/Pages/Reference/TypographyPage.swift) — bypass `GalleryPageScaffold`, compose `ScrollView { VStack { PageSection(...) ... } }` directly. Outcome: substantially fewer sidebar rows, every page is browsable rather than click-through, no new abstractions.

## Strategy

### The dense type-page

Every consolidated page follows this shell — exactly TypographyPage's rhythm:

```
ScrollView {
    VStack(alignment: .leading, spacing: 32) {
        Header(title, summary, availability, apiSignature)
        PageSection("First subsection") { … bespoke demo … }
        PageSection("Second subsection") { … bespoke demo … }
        …
        PageSection("Reference") { … signatures + describe-only content … }
        PageSection("Notes") { … HIG references … }
    }
    .padding(.horizontal, 32)
    .padding(.vertical, 24)
    .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
    .frame(maxWidth: .infinity, alignment: .leading)
}
```

Existing infrastructure to reuse (no new files needed):

- [PageSection.swift](../../SwiftKit/Detail/PageScaffold/PageSection.swift) — title + divider + content. The repeated building block.
- [APICallout.swift](../../SwiftKit/Detail/PageScaffold/APICallout.swift) — monospaced API code label.
- [GalleryPageScaffold.swift](../../SwiftKit/Detail/PageScaffold/GalleryPageScaffold.swift) — `galleryReadableContentWidth` (880pt) constant lives here. Scaffold itself is **not** used by dense pages but stays for the small number of pages that genuinely fit its 5-slot rhythm.

### The consolidation unit is the Apple type

Per Nathan's direction: pages collapse around a *type*, not a section. Examples:

- `Gradient` page → absorbs `MeshGradient`, `AnyGradient`, `LinearGradient`, `RadialGradient`, `AngularGradient`, `EllipticalGradient`. Stays under "Drawing and graphics" — does NOT swallow the whole section.
- `SafeArea` page → absorbs `safeAreaPadding`, `safeAreaInset`, `safeAreaBar`, `ignoresSafeArea`, `SafeAreaRegions` describe leaf. Stays under "Layout adjustments".
- `ColorScheme` page → absorbs `preferredColorScheme`, `toolbarColorScheme`, environment values, contrast variants. Stays under "View configuration".

Section/subsection hierarchy in `Catalog+SwiftUI.swift`/`Catalog+AppKit.swift` is preserved. What changes is the leaf set within each subsection.

### Describe-track placement

When a describe-only leaf describes the same thing as the parent type (e.g. `ScrollTransitionPhase` for `ScrollTransition`), its signatures + blurb + notes get transcribed into a `PageSection("Reference")` placed **above** the demo subsections of the parent page. Open the page, see the type definition first, then scroll into renderable variants. Per Nathan's note.

Exception: when a describe-only leaf describes its own *thing* (e.g. `Color` describing the value type, plus `ColorScheme` describing the enum) and both have substantive renderable content, they become two adjacent `PageSection` blocks — `Color type` + `ColorScheme type` — within the same dense page. They are not split into two pages.

### Catalog model: hard-delete

Absorbed modifier leaves and absorbed describe leaves are **deleted outright** from `Catalog+SwiftUI.swift` and `Catalog+AppKit.swift`. No sidebar entry, no anchor link, no fragment infrastructure. Search continues to match the absorbed API names because the parent page's `PageSection` titles are the exact API strings (e.g. `"View/safeAreaInset(edge:alignment:spacing:content:)"`).

### Treatment of remaining placeholder leaves

The pending todo items (SwiftUI Shapes 29, ViewGroupings 18, CustomLayout 14, Tables 3, Animations 1; AppKit AccessibilityForAppKit 56, TextKit 42, TouchBar 32, WindowsPanelsAndScreens 27, Drawing 20, TextDisplay 19, plus medium and small AppKit subsections) are NOT populated as 300+ separate pages. They are designed as dense type-pages from the start, applying the same consolidation rule. Per-leaf "populate" work converts to per-type "consolidate-and-populate" work.

## Coverage manifest (mandatory step zero)

**Problem this solves:** Free-form "absorb the SafeArea family into SafeAreaPage" is a verbal instruction. If the implementer drops a variant, forgets a notes paragraph, or skips a describe leaf's signature table, the loss is silent — the absorbed leaves are deleted and the source content is gone. Reviewers cannot verify "did everything land?" without a checklist.

**Solution:** Every consolidation task starts by producing a **coverage manifest** at `.claude/Planning/manifests/<TaskID>.md` (e.g. `A1-ColorScheme.md`). The manifest is the precondition for any catalog or page edits and the source of truth that the spec-compliance reviewer audits against. Manifests are committed alongside their task's code commit.

### Manifest structure

```markdown
# <TaskID> — <ParentPageName> Coverage Manifest

**Parent page:** SwiftKit/Pages/<...>/<ParentPageName>.swift
**Parent leaf:** Catalog+<Framework>.swift line ~<n>
**Status:** drafted | implementing | reviewed | merged

## Absorbed leaves

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | ColorScheme | Pages/SwiftUI/ColorSchemeTypePage.swift | enum ColorScheme | Documentation/SwiftUI/colorscheme.md | gallery | "ColorScheme type" |
| 2 | preferredColorScheme(_:) | …/PreferredColorSchemePage.swift | … | … | gallery | "preferredColorScheme(_:)" |
| ... | | | | | | |

## Per-leaf coverage checklist

For each absorbed leaf:

- [ ] **<Leaf displayName>**
  - [ ] Header info captured (title, availability, apiSignature)
  - [ ] All signatures from source page transcribed
  - [ ] Default demo transferred (or replaced with equivalent in new context)
  - [ ] Variant demos transferred (count expected: <n>)
  - [ ] States demos transferred (count expected: <n>)
  - [ ] Notes paragraphs preserved
  - [ ] Source page deleted from filesystem
  - [ ] Catalog leaf removed from Catalog+<Framework>.swift
  - [ ] PageRegistry entry removed
  - [ ] Lands in subsection: "<exact subsection title in parent page>"

## Parent page section plan

Ordered list of `PageSection` titles in the new dense page, with one-line description of what each contains. Drives the implementer's structure and the reviewer's audit.

1. (Reference) — describe-only content for absorbed type leaves
2. ColorScheme type — enum cases with swatches
3. ColorSchemeContrast type — enum cases with swatches
4. preferredColorScheme(_:) — three demos: nil, light, dark
5. ...

## Sign-off

- Implementer checks every box above.
- Spec-compliance reviewer re-verifies every box, marks "reviewed".
- Code-quality reviewer signs off, marks "merged".
- Manifest committed alongside the code commit.
```

### Manifest production workflow

1. **Pre-task discovery agent (read-only).** Before any deletion, a discovery subagent reads each absorbed page in full, extracts the apiSignature/blurb/demo descriptions, and emits the manifest's "Absorbed leaves" table + "Per-leaf coverage checklist" + draft "Parent page section plan". The implementer subagent receives the manifest as part of its briefing — it does not author the manifest, only consumes it.
2. **Implementer fills checkboxes** as it transcribes content into the new dense page. Self-review fails the task if any unchecked box remains.
3. **Spec-compliance reviewer audits the manifest** against the diff: every checked box must be verifiable in the produced page. Unverifiable checks fail the review.
4. **Manifest is committed** in the same commit as the dense page so historical reconstruction is possible.

### Catalog and registry edits (per task)

After the manifest is drafted and the dense page authored:

1. **`Catalog+SwiftUI.swift` or `Catalog+AppKit.swift`:** Delete the absorbed `.leaf(...)` lines. Keep one leaf — the parent type — using the parent's existing `displayName` and `pageBuilder: .real(symbol: "<TypeName>")`.
2. **`PageRegistry.swift`:** Remove the absorbed entries from `realPages`. Either keep the parent's existing entry (if the parent already had a registered page) or add one new entry mapping `"<TypeName>"` → `<TypeName>Page()`.
3. **Page files:** Delete the absorbed page `.swift` files only after the manifest checklist is complete. Create or expand the parent page. The parent page lives at the parent's existing path (do not move) or, for newly-created dense pages, in the most logical subsection folder.

## Task sequence

Tasks ordered lowest-risk-highest-value first, then by section.

### Phase A — SwiftUI modifier-family collapses (existing populated pages)

| # | Parent page | Absorbs | Notes |
|---|---|---|---|
| A1 | `ColorSchemePage` (new, under [Pages/SwiftUI/ViewConfiguration/](../../SwiftKit/Pages/SwiftUI/ViewConfiguration/)) | `PreferredColorSchemePage`, `ToolbarColorSchemePage`, `ColorSchemeEnvironmentPage`, `ColorSchemeTypePage`, `ColorSchemeContrastEnvironmentPage`, `ColorSchemeContrastTypePage` | Subsections: ColorScheme type, ColorSchemeContrast type, environment-driven scheme, `preferredColorScheme(_:)`, `toolbarColorScheme(_:for:)`, HIG dark-mode notes. |
| A2 | `SafeAreaPage` (rewrite existing under [LayoutAdjustments/](../../SwiftKit/Pages/SwiftUI/LayoutAdjustments/)) | `SafeAreaPaddingPage`, `SafeAreaPaddingEdgesPage`, `SafeAreaInsetPage`, `IgnoresSafeAreaPage`, `SafeAreaBarPage` (currently in ScrollViews — move into LayoutAdjustments or absorb in place), `SafeAreaRegionsDescribePage` | Subsections: Reference (SafeAreaRegions describe content above), `ignoresSafeArea`, `safeAreaPadding`, `safeAreaInset`, `safeAreaBar`, Notes. |
| A3 | `PaddingPage` (new under [LayoutAdjustments/](../../SwiftKit/Pages/SwiftUI/LayoutAdjustments/)) | `PaddingInsetsPage`, `PaddingEdgesAmountPage`, `ScenePaddingEdgesPage`, `ScenePaddingKindEdgesPage`, `ScenePaddingDescribePage`, `ContentMarginsPage`, `ContentMarginsForPage`, `ContentMarginsEdgesForPage` | Subsections: `padding(_:)`, `padding(_:_:)`, ScenePadding reference, `scenePadding`, `contentMargins` family, `EdgeInsets` reference, Notes. SafeArea-prefixed padding stays in A2. |
| A4 | `FramePage` (new under [LayoutAdjustments/](../../SwiftKit/Pages/SwiftUI/LayoutAdjustments/)) | `FrameFixedPage`, `FrameMinIdealMaxPage`, `ContainerRelativeFrameAxesPage`, `ContainerRelativeFrameClosurePage`, `ContainerRelativeFrameGridPage` | Subsections: fixed frame, flexible frame, ContainerRelativeFrame axes/closure/grid, sizing precedence, Notes. |
| A5 | `ScrollTransitionPage` (rewrite existing under [ScrollViews/](../../SwiftKit/Pages/SwiftUI/ScrollViews/)) | `ScrollTransitionTopBottomPage`, `ScrollTransitionPhaseDescribePage`, `ScrollTransitionConfigurationDescribePage` | Subsections: Reference (Phase + Configuration describe content above), default transition, top/bottom variants, Notes. |

### Phase B — SwiftUI type-page absorptions

| # | Parent page | Absorbs | Notes |
|---|---|---|---|
| B1 | `ButtonPage` (rewrite existing) | `ButtonStyle`, `ButtonStyleConfiguration`, `View/buttonStyle(_:)`, `ButtonRole`, `ButtonBorderShape`, `ButtonRepeatBehavior`, `ButtonSizing`, `GlassButtonStyle`, `GlassProminentButtonStyle` | Keep `SignInWithAppleButton` separate (different framework). |
| B2 | `PickerPage`, `DatePickerPage`, `ColorPickerPage` (each rewrites existing) | Per-style and per-config siblings of each | Three small consolidations, not one mega-page. |
| B3 | `ShapesGalleryPage` (expand existing `CircleEllipseCapsulePage` in place) | `CirclePage`, `EllipsePage`, `RectanglePage`, `RoundedRectanglePage`, `CapsulePage`, `UnevenRoundedRectanglePage`, `AnyShapePage` if they exist | Subsections one per primitive. The 0-leaf "Shapes" section becomes populated by this one parent leaf. |
| B4 | `MenuPage` (rewrite existing) | `MenuStyle`, `MenuStyleConfiguration`, `MenuOrder`, `MenuIndicator`, `ToolbarTitleMenu` | `MenuBarExtra` stays separate (it's a Scene). |
| B5 | `TablePage` (rewrite existing) | `TableColumn`, `TableColumnContent`, `TableStyle`, `TableStyleConfiguration`, `View/tableStyle(_:)` | Pulls SwiftUI/Tables down to ~3 leaves. |
| B6 | `GradientPage` (new under [DrawingAndGraphics/](../../SwiftKit/Pages/SwiftUI/DrawingAndGraphics/)) | `MeshGradient`, `AnyGradient`, `LinearGradient`, `RadialGradient`, `AngularGradient`, `EllipticalGradient` if present as separate leaves | Per Nathan's example. |
| B7 | `TextPage` + `TextFieldPage` + `TextEditorPage` (rewrite existing where present) | `TextFieldStyle`, `TextEditorStyle`, `TextEditorStyleConfiguration` and per-style siblings; font modifiers stay on `FontModifiersPage`/`TypographyPage` | Three small consolidations. |
| B8 | `GaugePage`, `ProgressViewPage`, `StepperPage`, etc. (rewrite each in place) | Each absorbs its style/configuration siblings | One small consolidation per control. |

### Phase C — SwiftUI sections currently mostly placeholder

These were on the populate todo list. They become dense-page authoring instead of per-leaf populate.

| # | Section | Strategy |
|---|---|---|
| C1 | `LayoutFundamentals` (35 placeholders, currently in_progress) | Author dense pages: `VStackPage`, `HStackPage`, `ZStackPage`, `LazyVStackPage`/`LazyHStackPage` combined, `GridPage` (absorbs `GridRow`, `GridItem`), `LazyVGridPage`/`LazyHGridPage` combined, `ViewThatFitsPage`, `SpacerPage`, `DividerPage`, plus a few describe leaves consolidated into reference subsections of their parents. Target: ~10 pages instead of 35 leaves. |
| C2 | `Shapes` (29 placeholders) | Becomes the B3 `ShapesGalleryPage` above. Section ends with ~3 leaves: ShapesGallery, Path, ShapeStyle. |
| C3 | `ViewGroupings` (18 placeholders) | `GroupPage` (absorbs Group element variants), `SectionPage`, `FormPage`, `LabeledContentPage` (already exists thin — expand). Target: ~5 pages. |
| C4 | `CustomLayout` (14 placeholders) | `CustomLayoutPage` (the Layout protocol — absorbs `LayoutSubview`, `LayoutSubviews`, `LayoutProperties`, `LayoutDirection`, `LayoutDirectionBehavior`, `LayoutPriority`, `LayoutValueKey`, `AnyLayout`). Target: ~2 pages. |
| C5 | `Tables` remaining (3) + `Animations` (1) | Roll into TablePage (B5) and existing Animation pages. |

### Phase D — AppKit consolidations

| # | Parent page | Absorbs | Notes |
|---|---|---|---|
| D1 | `NSTextViewPage` | NSText, NSTextStorage, NSTextContainer, NSTextLayoutManager, NSTextContentStorage, NSTextSelection, NSTextFinder, NSTextFinderClient, NSTextFinderBarContainer, plus per-method modifier leaves | Largest single consolidation in the project. ~25–30 leaves absorb. Keep NSTextField, NSSecureTextField separate (different controls). |
| D2 | `NSCollectionViewPage` (rewrite existing) | NSCollectionViewDataSource, NSCollectionViewDelegate, NSCollectionViewDiffableDataSource, NSCollectionViewSectionHeaderView, NSCollectionReusableView, NSCollectionViewFlowLayout, NSCollectionViewLayoutAttributes, compositional layout DSL types | ~19 leaves → 1 page. |
| D3 | `NSTableViewPage` (rewrite existing) | NSTableViewDataSource, NSTableViewDelegate, NSTableViewDiffableDataSource, NSTableCellView, NSTableRowView, NSTableColumn, NSTableViewRowAction | ~13 leaves → 1 page. |
| D4 | `NSWindowPage` (rewrite existing) | NSWindowController, NSWindowDelegate, NSWindowTab, NSWindowTabGroup | ~6 leaves → 1 page. |
| D5 | `NSButtonPage` (rewrite existing) | NSPopUpButton, NSComboButton, NSStatusBarButton, NSButtonTouchBarItem, NSButtonCell as subsections | Mild absorption. |
| D6 | `NSImagePage` + `NSImageViewPage` | NSAccessibilityImage, NSScrubberImageItemView, image properties | Two consolidations. |
| D7 | AppKit remaining placeholder sections (per todo): AccessibilityForAppKit 56, TextKit 42, TouchBar 32, WindowsPanelsAndScreens 27, Drawing 20, TextDisplay 19, Menus 12, Fonts 12, WritingTools 11, ImagesAndPDF 11, ViewMgmt 9, ViewLayout 7, Gestures 7, Essentials 4, Color 4, AppearanceCustomization 2 | Author dense pages directly: `NSAccessibilityElementPage` family (~5 pages absorbing 56 leaves), `NSLayoutManagerPage` + `NSTextStoragePage` + remaining TextKit splits (~6 pages absorbing 42), `NSTouchBarPage` (~4 pages absorbing 32), `NSWindowPage` (folded into D4) plus `NSScreenPage` and `NSPanelPage` (~5 pages absorbing 27), and so on. Target reduction across these sections: 270+ planned leaves → ~50 dense pages. |

### Phase E — Final verification

Single verification agent after Phase D completes. Per the [Guidelines/feedback.md](../Guidelines/feedback.md) 2026-05-05 verification-tiering rule and 2026-05-04 window-handling rule: agent launches the app once, toggles Appearance via `osascript`, captures dark/light screenshots per dense page without moving the window, reports per-page verdicts.

## Verification (per task)

1. **Manifest coverage:** every checkbox in `.claude/Planning/manifests/<TaskID>.md` is checked. No "TODO" or empty rows. The reviewer compares the manifest's "Per-leaf coverage checklist" against the produced page; unverifiable checks fail.
2. `xcodebuild -project SwiftKit.xcodeproj -scheme SwiftKit -configuration Debug build` — clean, no warnings.
3. `grep -rn '"<absorbed-symbol>"' SwiftKit/` returns zero hits outside the catalog/registry edits we just made.
4. L-001 grep on the new dense page: `grep -nE 'Color\(red:|\.system\(size:' <new-page>.swift` returns zero hits.
5. `swiftui-expert-skill` review on the new dense page only.
6. No app launch, no screenshot, no sidebar navigation per the verification-tiering rule. Final screenshot pass happens in Phase E.

## Out of scope

- Sidebar chrome, [Sidebar/](../../SwiftKit/App/Sidebar/), `RootView`, `DetailPane.swift`, `CatalogFilters.swift`, `GalleryCatalog.swift` traversal logic.
- The four Accessibility sections (`swiftUI_accessible_appearance`, `swiftUI_accessible_controls`, `swiftUI_accessible_descriptions`, `swiftUI_accessible_value`) remain structurally untouched in this pass — they already group by function, not by symbol.
- AppKit Animation section (already populated and clean per session 1).
- [CatalogNode.swift](../../SwiftKit/Catalog/CatalogNode.swift) model: no new fields on Leaf, no anchor IDs, no scroll-to-fragment.
- `GalleryPageScaffold`, `PageSection`, `APICallout` source: no edits. Reuse only.
- [DescribePage.swift](../../SwiftKit/Pages/_Shared/DescribePage.swift): stays for the remaining standalone describe leaves that don't fold into a parent type.
- [Documentation/](../../../Documentation/) markdown mirror.
- Cross-section moves that don't serve a consolidation (e.g. don't move `Toolbar` into Navigation — it stays in Toolbars).
- Push to remote until Phase E verification passes.

## Critical files

- [Catalog+SwiftUI.swift](../../SwiftKit/Catalog/Catalog+SwiftUI.swift) — every Phase A/B/C task edits this. Per task: 5–15 leaf deletions, 1 leaf retained or repurposed.
- [Catalog+AppKit.swift](../../SwiftKit/Catalog/Catalog+AppKit.swift) — every Phase D task edits this.
- [PageRegistry.swift](../../SwiftKit/Catalog/PageRegistry.swift) — every task edits. Net shrinks substantially after all phases.
- [TypographyPage.swift](../../SwiftKit/Pages/Reference/TypographyPage.swift) — read-only model. Do not edit.
- [PageSection.swift](../../SwiftKit/Detail/PageScaffold/PageSection.swift) — read-only building block.
- [GalleryPageScaffold.swift](../../SwiftKit/Detail/PageScaffold/GalleryPageScaffold.swift) — `galleryReadableContentWidth` constant only; scaffold itself stays untouched.
- [Pages/SwiftUI/](../../SwiftKit/Pages/SwiftUI/) — Phase A/B/C delete and create.
- [Pages/AppKit/](../../SwiftKit/Pages/AppKit/) — Phase D delete and create.

## Execution model

**Driver:** `ralph-loop:ralph-loop` runs as the outer loop in this session. Each Ralph iteration picks the next pending task from the sequence in this plan, dispatches the implementer + reviewer subagents for that task, commits on success, then yields back. The loop terminates when all tasks across Phases A–E are complete or a subagent reports `BLOCKED`.

**Meta-skill:** `superpowers:subagent-driven-development` governs the per-task workflow inside each Ralph iteration: discovery → implementer → spec-compliance review → code-quality review → mark complete.

### Per-task subagent sequence

Each Ralph iteration dispatches subagents in this order. Every subagent receives the prior subagent's output as part of its briefing.

1. **Discovery subagent (read-only).** Produces the coverage manifest at `.claude/Planning/manifests/<TaskID>.md`. Reads every absorbed page in full, extracts apiSignature/blurb/notes/demo descriptions, drafts the absorbed-leaves table, the per-leaf coverage checklist (all unchecked), and the parent page section plan. Commits the manifest in `drafted` state. No code edits.
2. **Implementer subagent.** Receives the manifest. Authors the new dense page following TypographyPage rhythm. Edits Catalog and PageRegistry. Deletes absorbed page files. Checks every box in the manifest as content lands. Commits code + checked-manifest together; updates manifest status to `implementing`.
3. **Spec-compliance reviewer.** Audits the manifest against the diff: every checked box must be verifiable in the produced page. Re-loop until ✅, then updates manifest status to `reviewed`.
4. **Code-quality reviewer.** Reviews the produced page for code quality, L-001/L-012 violations, Apple-only compliance. Re-loop until ✅, then updates manifest status to `merged`.

### Agent skill stacks

Every dispatched subagent loads the relevant skills as part of its briefing. Skills are referenced by name; the implementer/reviewer is told to invoke them via the Skill tool at the start of its turn.

**Discovery subagent (every task):**
- `find-docs` (verify Apple API signatures while extracting from absorbed pages)
- Read-only tools (Read, Grep, Glob). No Edit/Write except the manifest file.
- Briefing: the task's row from the Phase A/B/C/D table, the manifest template above, the absorbed leaves' file paths.

**Implementer subagents (every task):**
- `superpowers:test-driven-development` (governs the per-task discipline)
- `swiftui-expert-skill` (mandatory for any Swift/SwiftUI work — covers state management, view composition, macOS-specific APIs, perf patterns)
- `find-docs` (verify Apple API signatures before composing demos — replaces guessing from training data)
- `simplify` (final pass on the dense page before handoff to reviewers)
- Briefing supplements: Apple-only rule from [Guidelines/feedback.md](../Guidelines/feedback.md), L-001/L-012 visual rules from [Guidelines/visual-rules.md](../Guidelines/visual-rules.md), TypographyPage as the dense-page model, the per-task subsection breakdown from this plan, the verification-tiering rule (no screenshots per task).

**Spec-compliance reviewer (after every implementer task):**
- `swiftui-expert-skill`
- Briefing: the task's spec text from this plan, the manifest at `.claude/Planning/manifests/<TaskID>.md`, plus the implementer's diff. The reviewer's primary job is auditing the manifest against the diff — every checked box must be verifiable. Verdict: spec compliant ✅ / issues ❌. Re-loop until ✅.

**Code-quality reviewer (after spec compliance ✅):**
- `swiftui-expert-skill`
- `simplify`
- Briefing: read the diff via `git show`, evaluate strengths and issues. Verdict: approved ✅ / issues at severity Critical/Important/Suggestion. Re-loop until ✅.

**Final verification agent (Phase E only, single dispatch):**
- `swiftui-expert-skill`
- Briefing: full Apple-only rule, the 2026-05-04 window-handling rule (do NOT move/resize/relaunch the SwiftKit window), the 2026-05-05 verification-tiering rule (one launch, system Appearance toggle via `osascript`, `screencapture -o -R<bounds>`), the full list of dense pages authored across Phases A–D. Output: per-page verdict (readable / blank / clipped / Apple-only-violated / L-001-violated) + follow-up fix list.

### Per-task git rhythm

Implementer commits with a `Phase 6 — <task name>` message after self-review. Reviewers do not commit; their feedback drives implementer fix-up commits if needed. No squash. Push happens once at the end of Phase E.

### Master manifest registry

`.claude/Planning/manifests/` is the registry. The loop's "next task" picker reads this folder:

- A `<TaskID>.md` file with status `merged` is complete; skip.
- Status `reviewed` → re-run code-quality reviewer.
- Status `implementing` → re-run spec-compliance reviewer.
- Status `drafted` → dispatch implementer.
- No `<TaskID>.md` exists → dispatch discovery agent for that task.

This makes the reorganization restartable across sessions. A new Claude session can pick up by listing `.claude/Planning/manifests/` and running the next `pending` or `drafted` task.

### Loop termination conditions

Ralph stops when:
1. Every task in Phases A–D has a manifest in `merged` status, and Phase E final verification has run (success).
2. A subagent reports `BLOCKED` and the controller cannot resolve it (Nathan input needed).
3. Build fails twice in a row on the same task (regression — Nathan input needed).
4. Discovery agent reports an absorbed leaf cannot be located, or the parent type is ambiguous — Nathan input needed.
5. Spec-compliance reviewer fails the same task three times in a row — escalation, Nathan input needed.
6. Nathan invokes `ralph-loop:cancel-ralph` (manual stop).

## End-state expectations

- SwiftUI catalog: ~1,264 + ~100 pending leaves → estimated ~600–700 leaves after consolidation.
- AppKit catalog: ~166 + ~270 pending leaves → estimated ~120–160 leaves after consolidation.
- Total page-file count drops by an estimated 35–45%.
- Every dense page is browsable end-to-end without leaving it. Sidebar surfaces types; pages surface variants.
- No new abstractions introduced. No existing scaffolds changed. No catalog model changes.
