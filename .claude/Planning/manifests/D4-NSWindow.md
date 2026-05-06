# D4 — NSWindow Family Consolidation Manifest

**Parent page:** SwiftKit/Pages/AppKit/WindowsPanelsAndScreens/NSWindowPage.swift
**Status:** merged

## Absorbed leaves

| # | Type | Kind | Absorbed Into |
|---|------|------|---------------|
| 1 | NSWindowDelegate | protocol | Reference — Variants tab |
| 2 | NSWindowTab | class : NSObject (macOS 10.13+) | Reference — Variants tab |
| 3 | NSWindowTabGroup | class : NSObject (macOS 10.13+) | Reference — Variants tab |

**Not absorbed:** NSPanel — remains `.placeholder`; separate HIG concept (ancillary panel vs. primary window); deferred to later batch.

**Total absorbed:** 3 leaves (1 parent promoted from placeholder, 3 siblings documented inline)

## Per-leaf coverage checklist

### Leaf 1: NSWindowDelegate
- [x] Header info captured (protocol : NSObjectProtocol)
- [x] Lifecycle methods documented (windowShouldClose, windowWillClose, windowWillMiniaturize, windowDidMiniaturize, windowDidDeminiaturize)
- [x] Focus methods documented (windowDidBecomeKey, windowDidResignKey, windowDidBecomeMain, windowDidResignMain)
- [x] Resize methods documented (windowWillResize(_:to:), windowDidResize, windowWillStartLiveResize, windowDidEndLiveResize)
- [x] Full screen methods documented (willEnterFullScreen, didEnterFullScreen, willExitFullScreen, didExitFullScreen)
- [x] Full wiring example: MyWindowController : NSWindowController, NSWindowDelegate with windowShouldClose + save prompt + windowWillResize enforcement
- [x] Catalog leaf promoted from .placeholder to .real (symbol: "NSWindow")
- [x] Registry entry "NSWindowDelegate" not separately registered — routed via NSWindow entry
- [x] Lands in: Reference — Variants tab (NSWindowDelegate block)

### Leaf 2: NSWindowTab
- [x] Header info captured (class : NSObject, macOS 10.13+)
- [x] Properties documented (title, toolTip, userInfo)
- [x] Access pattern documented (window.tab)
- [x] Programmatic tab management documented (addTabbedWindow, moveTabToNewWindow, toggleTabBar, selectNextTab, selectPreviousTab)
- [x] Catalog leaf promoted from .placeholder to .real (symbol: "NSWindow")
- [x] Lands in: Reference — Variants tab (NSWindowTab block)

### Leaf 3: NSWindowTabGroup
- [x] Header info captured (class : NSObject, macOS 10.13+)
- [x] Properties documented (windows, selectedWindow, identifier, isTabBarVisible, isOverviewVisible)
- [x] Methods documented (addWindow, moveTabToNewWindow)
- [x] NSWindowTabGroup.selectionDidChangeNotification documented
- [x] Access guard pattern documented (guard let group = window.tabGroup)
- [x] Catalog leaf promoted from .placeholder to .real (symbol: "NSWindow")
- [x] Lands in: Reference — Variants tab (NSWindowTabGroup block)

## Page section plan

Rendered via GalleryPageScaffold (defaultRender / variants / states / notes tabs):

1. **Header** — NSWindow, subtitle (primary macOS window surface), inheritance : NSResponder, doc path
2. **Default render tab (NSWindow Creation)** — Designated init snippet (contentRect:styleMask:backing:defer:); styleMask enum values; makeKeyAndOrderFront/orderFront/orderOut/close; center/setFrameAutosaveName/setFrame; window level; backgroundColor/hasShadow/collectionBehavior/titlebarAppearsTransparent; embedding SwiftUI via NSHostingController; APICallouts for backing:.buffered and isReleasedWhenClosed
3. **Variants tab (Reference)** — NSWindowDelegate protocol; NSWindowTab (macOS 10.13+); NSWindowTabGroup (macOS 10.13+)
4. **States tab (Tabs + Delegate)** — Window delegate wiring and patterns (full class example); Window tabs creating and managing (tabbingMode, tabbingIdentifier, addTabbedWindow, group iteration, notification observation); Key notifications reference
5. **Notes** — NSWindow vs NSPanel; isReleasedWhenClosed trap; window level guidance; NSWindowTabGroup system management preference; setFrameAutosaveName usage; backgroundColor semantic token requirement

## Code quality review

- [x] L-001 clean: zero hits for `Color(red:` or `.system(size:`
- [x] No NSViewRepresentable bridge — correct; NSWindow lifecycle cannot safely be exercised in a SwiftUI preview without full application context; comment at top of file documents this decision
- [x] All sections are code-snippet only (no live bridge needed for window-level API)
- [x] Semantic color noted in snippet (.windowBackgroundColor) with comment "semantic token"
- [x] GalleryPageScaffold tabs used correctly (default/variants/states/notes)
- [x] Reference sections appear in Variants tab before States tab
- [x] Private Block helper struct defined locally (no duplicate in file)
- [x] @State properties: none needed — page is reference-only
- [x] Build: SUCCEEDED

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05

## Manifest metadata

- **Task ID:** D4
- **Parent type:** NSWindow
- **Framework:** AppKit
- **Section:** windows-panels-and-screens / windows
- **Absorbed leaves:** 3 (NSWindowDelegate, NSWindowTab, NSWindowTabGroup)
- **NSPanel:** NOT absorbed — stays placeholder
- **Registry entries added:** "NSWindow" → NSWindowPage()
- **Files deleted:** none (all previously placeholder, no existing Describe pages)
- **New directory created:** SwiftKit/Pages/AppKit/WindowsPanelsAndScreens/
- **Created:** 2026-05-05
