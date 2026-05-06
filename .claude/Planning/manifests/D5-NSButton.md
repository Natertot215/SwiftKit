# D5 — NSButton Family Consolidation Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/Controls/NSButtonPage.swift
**Status:** merged

## Absorbed leaves

| # | Type | Kind | Absorbed Into |
|---|------|------|---------------|
| 1 | NSPopUpButton | class : NSButton (macOS 10.0+) | NSPopUpButton section |
| 2 | NSComboButton | class : NSControl (macOS 13.0+) | NSComboButton section |
| 3 | NSStatusBarButton | class : NSButton (macOS 10.10+) | NSStatusBarButton section |
| 4 | NSButtonTouchBarItem | class : NSTouchBarItem (macOS 10.15+) | NSButtonTouchBarItem section (describe-only) |

**Total absorbed:** 4 leaves (1 parent kept, 4 siblings documented inline)

## Per-leaf coverage checklist

### Leaf 1: NSPopUpButton
- [x] Header info captured (class : NSButton, macOS 10.0+)
- [x] Hierarchy note: NSButton → NSPopUpButton in Reference section
- [x] Pop-up vs pull-down modes documented (pullsDown: Bool)
- [x] All initializers documented (frame:pullsDown:, image:pullDownMenu:, popUpMenu:target:action:, title:image:pullDownMenu:)
- [x] Item management documented (addItem, addItems, insertItem, removeItem, removeAllItems)
- [x] Selection API documented (selectItem(at:), selectItem(withTitle:), selectItem(withTag:), select(_:))
- [x] Properties documented (selectedItem, titleOfSelectedItem, indexOfSelectedItem, altersStateOfSelectedItem, usesItemFromMenu, preferredEdge, autoenablesItems)
- [x] Live NSViewRepresentable bridge with pullsDown toggle and selectedIndex Stepper
- [x] Coordinator pattern with @objc selectionChanged(_:)
- [x] Catalog leaf removed from Catalog+AppKit.swift (controls section, line 133)
- [x] Registry entry "NSPopUpButton" removed from PageRegistry.swift (line 326)
- [x] NSPopUpButtonPage.swift deleted from disk

### Leaf 2: NSComboButton
- [x] Header info captured (class : NSControl, macOS 13.0+)
- [x] Clarification: NSComboButton is NOT an NSButton subclass — separate NSControl
- [x] .split vs .unified styles documented with semantic distinction
- [x] All initializers documented (title:menu:target:action:, image:menu:target:action:, title:image:menu:target:action:)
- [x] Menu construction pattern documented (NSMenu + addItem)
- [x] Primary action wiring documented (target + action)
- [x] image and imageScaling properties documented
- [x] Live NSViewRepresentable bridge with title TextField and style RadioGroup picker
- [x] Catalog leaf removed from Catalog+AppKit.swift (controls section, line 119)
- [x] Registry entry "NSComboButton" removed from PageRegistry.swift (line 297)
- [x] NSComboButtonPage.swift deleted from disk

### Leaf 3: NSStatusBarButton
- [x] Header info captured (class : NSButton, macOS 10.10+)
- [x] Never-instantiate-directly rule documented — always via NSStatusItem.button
- [x] NSStatusItem creation patterns documented (squareLength, variableLength)
- [x] Key properties documented (image, alternateImage, title, toolTip, isEnabled, appearsDisabled, sendAction(on:))
- [x] Menu assignment pattern documented (statusItem.menu vs button.action exclusion noted)
- [x] No live bridge — correct; status bar items require an application context outside a SwiftUI preview
- [x] Code snippets document full usage pattern
- [x] Catalog leaf removed from Catalog+AppKit.swift (menu-bar-items section, line 362, was .placeholder)
- [x] No registry entry existed — no action needed

### Leaf 4: NSButtonTouchBarItem
- [x] Header info captured (class : NSTouchBarItem, macOS 10.15+)
- [x] Describe-only note explaining no live demo possible without Touch Bar hardware
- [x] Class type signatures documented (init, withTitleAndTarget, withImage factory methods)
- [x] Properties documented (title, image, bezelColor, isEnabled, target, action, customizationLabel)
- [x] Touch Bar setup context documented (makeTouchBar(), touchBar(_:makeItemForIdentifier:))
- [x] Catalog leaf removed from Catalog+AppKit.swift (touch-bar-items section, line 416, was .placeholder)
- [x] No registry entry existed — no action needed

## Page section plan

Rendered via ScrollView + VStack + PageSection rhythm (TypographyPage style):

1. **Header** — NSButton, subtitle, inheritance : NSControl : NSView, availability (macOS 10.0+), doc path
2. **Reference — NSButton Subclass Hierarchy** — refBlock for NSButton (root); refBlock for NSPopUpButton (subclass); refBlock for NSStatusBarButton (subclass); refBlock for NSComboButton (separate NSControl, NOT NSButton subclass)
3. **Default — NSButton** — Live bridge with title/bezelStyle/state/isBordered/isTransparent/allowsMixedState controls; NSButtonStandardSet showing 4 convenience initializers; construction snippet
4. **Button Types (Bezel Styles)** — Semantic bezel style enum values; image/tint/prominence properties; keyEquivalent and tri-state
5. **NSPopUpButton** — Pop-up vs pull-down live bridge; pullsDown RadioGroup; selectedIndex Stepper; all initializers; item management; pull-down configuration
6. **NSComboButton** — .split vs .unified live bridge; title TextField; style RadioGroup; initializers; menu construction
7. **NSStatusBarButton** — Status bar item integration snippet; key properties; right-click/long-press menu pattern
8. **NSButtonTouchBarItem** — Describe-only block; type signatures; Touch Bar setup context
9. **Notes** — inheritance hierarchy summary; bezelStyle semantic guidance; tri-state checkbox; tintProminence; NSStatusBarButton always via NSStatusItem; NSButtonTouchBarItem hardware requirement

## Code quality review

- [x] L-001 clean: zero hits for `Color(red:` or `.system(size:`
- [x] Bridges use NSViewRepresentable (NSButtonDemo, NSButtonStandardSet, NSPopUpButtonDemo, NSComboButtonDemo)
- [x] No custom wrapper structs beyond NSViewRepresentable bridges
- [x] @State properties are private (title, bezelStyle, isBordered, isTransparent, allowsMixedState, state, selectedIndex, pullsDown, comboTitle, comboStyle)
- [x] NSPopUpButtonDemo Coordinator correctly guards sender.pullsDown before updating selectedIndex
- [x] NSComboButtonDemo makeNSView creates menu with NSMenuItem.separator() — correct AppKit pattern
- [x] NSButtonStandardSet correctly uses all 4 convenience initializers
- [x] popUpItems is a private let constant — not state
- [x] Semantic tokens only (no hand-mixed colors)
- [x] ScrollView + VStack + PageSection rhythm followed
- [x] Reference section appears above demos
- [x] galleryReadableContentWidth applied
- [x] Build: SUCCEEDED

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05

## Manifest metadata

- **Task ID:** D5
- **Parent type:** NSButton
- **Framework:** AppKit
- **Section:** views-and-controls / controls
- **Absorbed leaves:** 4 (NSPopUpButton, NSComboButton, NSStatusBarButton, NSButtonTouchBarItem)
- **Registry entries removed:** NSPopUpButton, NSComboButton
- **Files deleted:** NSPopUpButtonPage.swift, NSComboButtonPage.swift
- **Created:** 2026-05-05
