# D4 — NSWindowPage Coverage Manifest

**Parent page:** SwiftKit/Pages/AppKit/WindowsPanelsAndScreens/NSWindowPage.swift (CREATE NEW)
**Parent leaf location:** Catalog+AppKit.swift, `appkit.windows-panels-and-screens.windows` subsection, lines 296–300 — promote all 4 placeholders to `.real(symbol: "NSWindow")`; NSWindow (line 296) becomes the parent leaf, NSWindowDelegate (298), NSWindowTab (299), NSWindowTabGroup (300) are absorbed; NSPanel (297) is kept as placeholder (D7 scope)
**Status:** pending

## Absorbed Leaves

| # | Leaf displayName | Catalog line | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | NSWindowDelegate | 298 | protocol NSWindowDelegate | Documentation/AppKit/windows-panels-and-screens/nswindowdelegate.md | describe-only | Reference — NSWindowDelegate protocol |
| 2 | NSWindowTab | 299 | class NSWindowTab : NSObject | Documentation/AppKit/windows-panels-and-screens/nswindowtab.md | describe-only | Window Tabs |
| 3 | NSWindowTabGroup | 300 | class NSWindowTabGroup : NSObject | Documentation/AppKit/windows-panels-and-screens/nswindowtabgroup.md | describe-only | Window Tabs |

## Leaves NOT Absorbed

- **NSPanel** (line 297) — remains `.placeholder`; separate HIG concept (ancillary panel vs. primary window); deferred to D7

## Parent Page Section Plan

1. **Header** — Title: "NSWindow"; class : NSResponder; doc path; brief summary (macOS primary window surface)
2. **Reference — NSWindowDelegate protocol** — Key event methods: windowWillClose(_:), windowDidBecomeKey(_:), windowDidResignKey(_:), windowWillResize(_:to:), windowDidResize(_:), windowShouldClose(_:), windowWillMiniaturize(_:), windowDidMiniaturize(_:), windowDidDeminiaturize(_:)
3. **Reference — NSWindowTab** — macOS 10.13+; properties: title, toolTip, userInfo; accessed via window.tab
4. **Reference — NSWindowTabGroup** — macOS 10.13+; properties: windows, selectedWindow, identifier, isTabBarVisible, isOverviewVisible; methods: addWindow(_:), moveTabToNewWindow(_:)
5. **NSWindow Creation** — Code snippet: NSWindow(contentRect:styleMask:backing:defer:); key styleMask options (.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView); makeKeyAndOrderFront(_:); orderFront(_:)
6. **Window Tabs** — Snippet: window.tab.title; window.tabGroup; NSWindowTabGroup.windows; window.addTabbedWindow(_:ordered:); window.toggleTabBar(_:)
7. **Window Delegate Hooks** — Snippet: implementing NSWindowDelegate methods; willClose pattern; resize constraints via windowWillResize(_:to:)
8. **Notes** — NSWindow vs NSPanel (utility vs. primary); NSHostingController for embedding SwiftUI in NSWindow.contentViewController; window level (NSWindow.Level); isReleasedWhenClosed trap; SwiftUI WindowGroup preferred for new apps

## Catalog Edits

**Promote 4 leaves from `.placeholder` to `.real(symbol: "NSWindow")`:**
- `appkit.windows-panels-and-screens.windows.nswindow` (line 296) — parent leaf, remains with symbol "NSWindow"
- `appkit.windows-panels-and-screens.windows.nswindowdelegate` (line 298) → `.real(symbol: "NSWindow")`
- `appkit.windows-panels-and-screens.windows.nswindowtab` (line 299) → `.real(symbol: "NSWindow")`
- `appkit.windows-panels-and-screens.windows.nswindowtabgroup` (line 300) → `.real(symbol: "NSWindow")`

**Unchanged:** `appkit.windows-panels-and-screens.windows.nspanel` (line 297) — stays `.placeholder`

## Registry Edits

**Add 1 entry:**
- `"NSWindow"` → NSWindowPage()

## New Directory Required

- `SwiftKit/Pages/AppKit/WindowsPanelsAndScreens/` — create this directory

## Manifest Metadata

- **Task ID:** D4
- **Parent type:** NSWindow
- **Framework:** AppKit
- **Section:** windows-panels-and-screens / windows
- **Absorbed leaf count:** 3 (NSWindowDelegate, NSWindowTab, NSWindowTabGroup)
- **NSPanel:** NOT absorbed — stays placeholder for D7
- **Pages to delete:** none (all previously placeholder, no existing Describe pages)
- **New directory:** SwiftKit/Pages/AppKit/WindowsPanelsAndScreens/
- **Created:** 2026-05-05
