---
url: https://developer.apple.com/documentation/appkit/nsappearancecustomization
framework: AppKit
category: Appearance customization
title: NSAppearanceCustomization
kind: protocol
captured: 2026-05-02
---

# NSAppearanceCustomization

A set of methods for getting and setting the appearance attributes of a view.

## Declaration

```swift
protocol NSAppearanceCustomization : NSObjectProtocol
```

### Overview

When an object adopts this protocol, assigning a value to the `NSAppearanceCustomization/appearance` property causes that object to use the appearance attributes you specified instead of any inherited attributes. You can access the current attributes for the object from the `NSAppearanceCustomization/effectiveAppearance` property, which reflects any inherited attributes.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSApplication`, `NSBackgroundExtensionView`, `NSBox`, `NSBrowser`, `NSButton`, `NSClipView`, `NSCollectionView`, `NSColorPanel`, `NSColorWell`, `NSComboBox`, `NSComboButton`, `NSControl`, `NSDatePicker`, `NSFontPanel`, `NSForm`, `NSGlassEffectContainerView`, `NSGlassEffectView`, `NSGridView`, `NSImageView`, `NSLevelIndicator`, `NSMatrix`, `NSMenu`, `NSOpenGLView`, `NSOpenPanel`, `NSOutlineView`, `NSPanel`, `NSPathControl`, `NSPopUpButton`, `NSPopover`, `NSPredicateEditor`, `NSProgressIndicator`, `NSRuleEditor`, `NSRulerView`, `NSSavePanel`, `NSScrollView`, `NSScroller`, `NSScrubber`, `NSScrubberArrangedView`, `NSScrubberImageItemView`, `NSScrubberItemView`, `NSScrubberSelectionView`, `NSScrubberTextItemView`, `NSSearchField`, `NSSecureTextField`, `NSSegmentedControl`, `NSSlider`, `NSSplitView`, `NSStackView`, `NSStatusBarButton`, `NSStepper`, `NSSwitch`, `NSTabView`, `NSTableCellView`, `NSTableHeaderView`, `NSTableRowView`, `NSTableView`, `NSText`, `NSTextField`, `NSTextInsertionIndicator`, `NSTextView`, `NSTokenField`, `NSView`, `NSVisualEffectView`, `NSWindow`

## Availability

- macOS ?

## Topics

### Getting and Setting Appearance

- `Choosing a Specific Appearance for Your macOS App`
- `appearance`
- `effectiveAppearance`

## See Also

- `NSAppearance`
