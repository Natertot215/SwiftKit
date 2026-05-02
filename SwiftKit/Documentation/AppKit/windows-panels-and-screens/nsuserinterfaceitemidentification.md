---
url: https://developer.apple.com/documentation/appkit/nsuserinterfaceitemidentification
framework: AppKit
category: Windows, panels, and screens
title: NSUserInterfaceItemIdentification
kind: protocol
captured: 2026-05-02
---

# NSUserInterfaceItemIdentification

A set of methods used to associate a unique identifier with objects in your user interface.

## Declaration

```swift
protocol NSUserInterfaceItemIdentification
```

### Overview

The protocol is adopted by AppKit interface objects to support window restoration, whereby information about window and other interface-related objects is preserved and used to restore the application’s interface during the next launch cycle.





## Relationships

**Inherited By**: `NSCollectionViewElement`, `NSCollectionViewSectionHeaderView`

**Conforming Types**: `NSActionCell`, `NSBackgroundExtensionView`, `NSBox`, `NSBrowser`, `NSBrowserCell`, `NSButton`, `NSButtonCell`, `NSCell`, `NSClipView`, `NSCollectionView`, `NSCollectionViewItem`, `NSColorPanel`, `NSColorWell`, `NSComboBox`, `NSComboBoxCell`, `NSComboButton`, `NSControl`, `NSDatePicker`, `NSDatePickerCell`, `NSFontPanel`, `NSForm`, `NSFormCell`, `NSGlassEffectContainerView`, `NSGlassEffectView`, `NSGridView`, `NSImageCell`, `NSImageView`, `NSLayoutGuide`, `NSLevelIndicator`, `NSLevelIndicatorCell`, `NSMatrix`, `NSMenu`, `NSMenuItem`, `NSMenuItemCell`, `NSOpenGLView`, `NSOpenPanel`, `NSOutlineView`, `NSPageController`, `NSPanel`, `NSPathCell`, `NSPathComponentCell`, `NSPathControl`, `NSPopUpButton`, `NSPopUpButtonCell`, `NSPredicateEditor`, `NSProgressIndicator`, `NSRuleEditor`, `NSRulerView`, `NSSavePanel`, `NSScrollView`, `NSScroller`, `NSScrubber`, `NSScrubberArrangedView`, `NSScrubberImageItemView`, `NSScrubberItemView`, `NSScrubberSelectionView`, `NSScrubberTextItemView`, `NSSearchField`, `NSSearchFieldCell`, `NSSecureTextField`, `NSSecureTextFieldCell`, `NSSegmentedCell`, `NSSegmentedControl`, `NSSlider`, `NSSliderCell`, `NSSplitView`, `NSSplitViewController`, `NSSplitViewItemAccessoryViewController`, `NSStackView`, `NSStatusBarButton`, `NSStepper`, `NSStepperCell`, `NSSwitch`, `NSTabView`, `NSTabViewController`, `NSTableCellView`, `NSTableColumn`, `NSTableHeaderCell`, `NSTableHeaderView`, `NSTableRowView`, `NSTableView`, `NSText`, `NSTextAttachmentCell`, `NSTextField`, `NSTextFieldCell`, `NSTextInsertionIndicator`, `NSTextView`, `NSTitlebarAccessoryViewController`, `NSTokenField`, `NSTokenFieldCell`, `NSView`, `NSViewController`, `NSVisualEffectView`, `NSWindow`

## Availability

- macOS ?

## Topics

### Accessing the User Interface Identifier

- `identifier`
- `NSUserInterfaceItemIdentifier`

## See Also

- `Restoring your app’s state with AppKit`
- `NSWindowRestoration`
