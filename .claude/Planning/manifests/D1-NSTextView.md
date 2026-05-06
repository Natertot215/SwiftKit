# D1 — NSTextView Family Consolidation Manifest

**Date:** 2026-05-05  
**Status:** Implementing

---

## Scope

Consolidate the NSTextView family into a single dense page. NSTextViewPage already exists and has good renderable content; this rewrite adds Reference sections for absorbed type families and enriches existing sections per the TypographyPage rhythm.

---

## Absorbed Leaves (8 total — all deleted from catalog + registry)

| Type | Catalog Section | Registry Key | Action |
|------|-----------------|--------------|--------|
| NSText | `appkit.text-display.text-views.nstext` (line 605) | none | Delete catalog leaf; no registry entry |
| NSTextContainer | `appkit.textkit.layout.nstextcontainer` (line 666) | none | Delete catalog leaf; no registry entry |
| NSTextLayoutManager | `appkit.textkit.layout.nstextlayoutmanager` (line 665) | none | Delete catalog leaf; no registry entry |
| NSTextContentStorage | `appkit.textkit.text-management.nstextcontentstorage` (line 640) | none | Delete catalog leaf; no registry entry |
| NSTextSelection | `appkit.textkit.location-and-selection.nstextselection` (line 660) | none | Delete catalog leaf; no registry entry |
| NSTextFinder | `appkit.views-and-controls.controls.nstextfinder` (line 140) | `"NSTextFinder"` (line 365) | Delete catalog leaf + registry entry |
| NSTextFinderClient | `appkit.views-and-controls.controls.nstextfinderclient` (line 142) | `"NSTextFinderClient"` (line 367) | Delete catalog leaf + registry entry |
| NSTextFinderBarContainer | `appkit.views-and-controls.controls.nstextfinderbarcontainer` (line 141) | `"NSTextFinderBarContainer"` (line 366) | Delete catalog leaf + registry entry |

**Excluded (per spec):** NSTextField, NSSecureTextField (separate controls). NSTextStorage, NSLayoutManager (TextKit D7 scope — not absorbed here).

---

## Kept

- **Catalog leaf:** `appkit.views-and-controls.content-views.nstextview` (line 108) — unchanged
- **Registry entry:** `"NSTextView"` → `NSTextViewPage()` (line 368) — unchanged
- **Page file:** `SwiftKit/Pages/AppKit/ViewsAndControls/ContentViews/NSTextViewPage.swift` — rewritten

---

## Page Section Plan (TypographyPage rhythm)

1. **Header** — NSTextView, subtitle, doc path
2. **Reference A** — Abstract class + layout types: NSText (abstract base), NSTextContainer (geometry), NSTextLayoutManager (modern TextKit 2 coordinator), NSTextContentStorage (text+attribute model), NSTextSelection (range + affinity)
3. **Reference B** — Find infrastructure: NSTextFinder (controller), NSTextFinderClient (protocol), NSTextFinderBarContainer (protocol)
4. **Default render** — Editable rich text inside NSScrollView (existing bridge, keep)
5. **Text formatting** — font, color, paragraph style via NSTextStorage
6. **Selection and ranges** — setSelectedRange, selectedRanges, selectionGranularity
7. **Find & replace** — usesFindBar, isIncrementalSearchingEnabled
8. **Editing** — isEditable, isFieldEditor, allowsUndo
9. **Notes**

---

## File Changes

- **Rewrite:** `SwiftKit/Pages/AppKit/ViewsAndControls/ContentViews/NSTextViewPage.swift`
- **Delete pages** (NSTextFinder describe pages already exist and must be removed):
  - `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSTextFinderDescribePage.swift`
  - `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSTextFinderBarContainerDescribePage.swift`
  - `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSTextFinderClientDescribePage.swift`
- **Catalog edits:** Delete 8 leaf entries across content-views, controls, textkit, text-display sections
- **Registry edits:** Remove 3 entries (NSTextFinder, NSTextFinderBarContainer, NSTextFinderClient)

---

## Risk Notes

- NSText, NSTextContainer, NSTextLayoutManager, NSTextContentStorage, NSTextSelection are in textkit section — they have no registry entries (all `.placeholder`). Deleting the catalog leaf is sufficient.
- NSTextFinder family has both catalog leaves AND existing DescribePage files + registry entries — all three must be cleaned up.
- D7 TextKit batch will cover NSLayoutManager (TextKit 1), NSTextStorage (TextKit 1), NSTextLayoutFragment, NSTextLineFragment, etc. — those are NOT absorbed here.
