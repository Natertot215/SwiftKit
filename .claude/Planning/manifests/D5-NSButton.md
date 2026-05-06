# D5 — NSButton Family Consolidation Manifest

**Date:** 2026-05-05  
**Status:** Implementing

---

## Scope

Consolidate the NSButton family into a single dense page. NSButtonPage exists with good content. NSPopUpButtonPage and NSComboButtonPage are real separate pages that must be absorbed as subsections and then deleted.

---

## Absorbed Leaves (4 absorbed, parent kept)

| Type | Catalog Section | Registry Key | Action |
|------|-----------------|--------------|--------|
| NSPopUpButton | `appkit.views-and-controls.controls.nspopupbutton` (line 133) | `"NSPopUpButton"` (line 326) | Delete catalog leaf + registry entry + page file |
| NSComboButton | `appkit.views-and-controls.controls.nscombobutton` (line 119) | `"NSComboButton"` (line 297) | Delete catalog leaf + registry entry + page file |
| NSStatusBarButton | `appkit.menus-cursors-and-the-dock.menu-bar-items.nsstatusbarbutton` (line 362) | none (.placeholder) | Delete catalog leaf |
| NSButtonTouchBarItem | `appkit.touch-bar.touch-bar-items.nsbuttontouchbaritem` (line 416) | none (.placeholder) | Delete catalog leaf |

---

## Kept

- **Catalog leaf:** `appkit.views-and-controls.controls.nsbutton` (line 111) — unchanged
- **Registry entry:** `"NSButton"` → `NSButtonPage()` (line 250) — unchanged
- **Page file:** `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSButtonPage.swift` — rewritten

---

## Deleted Page Files

- `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSPopUpButtonPage.swift`
- `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSComboButtonPage.swift`

---

## Page Section Plan (TypographyPage rhythm)

1. **Header** — NSButton, subtitle, doc path
2. **Reference** — Subclass hierarchy note: NSButton → NSPopUpButton, NSButton → NSStatusBarButton
3. **Default NSButton** — title + target/action + keyEquivalent (existing bridge, enriched)
4. **Button types (bezel styles)** — .push, .toolbar, .circular, .helpButton, .accessoryBar, .glass, etc.
5. **NSPopUpButton** — pop-up vs pull-down, item management, bound selectedIndex (content from NSPopUpButtonPage absorbed)
6. **NSComboButton** — .split vs .unified, menu construction (content from NSComboButtonPage absorbed)
7. **NSStatusBarButton** — statusItem.button usage, image, toolTip, appearsDisabled
8. **NSButtonTouchBarItem** — describe-only (no renderable demo without hardware); type signatures
9. **Notes** — tri-state checkbox, tintProminence, hasDestructiveAction

---

## File Changes

- **Rewrite:** `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSButtonPage.swift`
- **Delete:**
  - `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSPopUpButtonPage.swift`
  - `SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSComboButtonPage.swift`
- **Catalog edits:** Delete 4 leaves (NSPopUpButton from controls, NSComboButton from controls, NSStatusBarButton from menu-bar-items, NSButtonTouchBarItem from touch-bar-items)
- **Registry edits:** Remove 2 entries (NSPopUpButton, NSComboButton)

---

## Risk Notes

- NSStatusBarButton and NSButtonTouchBarItem are `.placeholder` — no registry entries. Catalog delete only.
- NSPopUpButton and NSComboButton have both existing `.real` pages and registry entries — page files, catalog leaves, and registry entries all need cleanup.
- NSComboButton is macOS 13.0+ — bridge must be gated with `if #available(macOS 13.0, *)`; however since the project is macOS 26 only this is guaranteed available.
- NSButtonTouchBarItem cannot show a live demo without Touch Bar hardware — describe-only is correct.
- NSStatusBarButton lives in `NSStatusItem.button` — a live demo requires creating an `NSStatusBar.system.statusItem(withLength:)`. Include a renderable bridge using `NSViewRepresentable` to show the concept.
