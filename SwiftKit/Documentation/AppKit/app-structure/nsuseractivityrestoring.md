---
url: https://developer.apple.com/documentation/appkit/nsuseractivityrestoring
framework: AppKit
category: App structure
title: NSUserActivityRestoring
kind: protocol
captured: 2026-05-02
---

# NSUserActivityRestoring

A protocol that marks classes to restore the state of your app to continue a user activity.

## Declaration

```swift
protocol NSUserActivityRestoring : NSObjectProtocol
```

### Overview

Don’t conform your classes to `NSUserActivityRestoring`, as it’s a marker protocol adopted by `NSResponder` and `NSDocument` for user activity state restoration.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSApplication`, `NSBackgroundExtensionView`, `NSBox`, `NSBrowser`, `NSButton`, `NSClipView`, `NSCollectionView`, `NSCollectionViewItem`, `NSColorPanel`, `NSColorWell`, `NSComboBox`, `NSComboButton`, `NSControl`, `NSDatePicker`, `NSDocument`, `NSDrawer`, `NSFontPanel`, `NSForm`, `NSGlassEffectContainerView`, `NSGlassEffectView`, `NSGridView`, `NSImageView`, `NSLevelIndicator`, `NSMatrix`, `NSOpenGLView`, `NSOpenPanel`, `NSOutlineView`, `NSPageController`, `NSPanel`, `NSPathControl`, `NSPersistentDocument`, `NSPopUpButton`, `NSPopover`, `NSPredicateEditor`, `NSProgressIndicator`, `NSResponder`, `NSRuleEditor`, `NSRulerView`, `NSSavePanel`, `NSScrollView`, `NSScroller`, `NSScrubber`, `NSScrubberArrangedView`, `NSScrubberImageItemView`, `NSScrubberItemView`, `NSScrubberSelectionView`, `NSScrubberTextItemView`, `NSSearchField`, `NSSecureTextField`, `NSSegmentedControl`, `NSSlider`, `NSSplitView`, `NSSplitViewController`, `NSSplitViewItemAccessoryViewController`, `NSStackView`, `NSStatusBarButton`, `NSStepper`, `NSSwitch`, `NSTabView`, `NSTabViewController`, `NSTableCellView`, `NSTableHeaderView`, `NSTableRowView`, `NSTableView`, `NSText`, `NSTextField`, `NSTextInsertionIndicator`, `NSTextView`, `NSTitlebarAccessoryViewController`, `NSTokenField`, `NSView`, `NSViewController`, `NSVisualEffectView`, `NSWindow`, `NSWindowController`

## Availability

- macOS ?

## Topics

### Restoring App State

- `restoreUserActivityState(_:)`

## See Also

- `NSUserActivity`
