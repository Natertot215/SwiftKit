---
url: https://developer.apple.com/documentation/appkit/nsdraggingdestination
framework: AppKit
category: Drag and drop
title: NSDraggingDestination
kind: protocol
captured: 2026-05-02
---

# NSDraggingDestination

A set of methods that the destination object (or recipient) of a dragged image must implement.

## Declaration

```swift
protocol NSDraggingDestination : NSObjectProtocol
```

### Overview

The destination automatically receives `NSDraggingDestination` messages for pasteboard data types it has registered for as an image enters, moves around inside, and then exits or is released within the destination’s boundaries.

In macOS 10.7 and later `NSDraggingDestination` is a formal protocol with an updated interface. The OS X v10.6 behavior has been retained, but will be dropped in a future version of the operating system. The methods that are to be deprecated are marked as such.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSBackgroundExtensionView`, `NSBox`, `NSBrowser`, `NSButton`, `NSClipView`, `NSCollectionView`, `NSColorWell`, `NSComboBox`, `NSComboButton`, `NSControl`, `NSDatePicker`, `NSForm`, `NSGlassEffectContainerView`, `NSGlassEffectView`, `NSGridView`, `NSImageView`, `NSLevelIndicator`, `NSMatrix`, `NSOpenGLView`, `NSOutlineView`, `NSPathControl`, `NSPopUpButton`, `NSPredicateEditor`, `NSProgressIndicator`, `NSRuleEditor`, `NSRulerView`, `NSScrollView`, `NSScroller`, `NSScrubber`, `NSScrubberArrangedView`, `NSScrubberImageItemView`, `NSScrubberItemView`, `NSScrubberSelectionView`, `NSScrubberTextItemView`, `NSSearchField`, `NSSecureTextField`, `NSSegmentedControl`, `NSSlider`, `NSSplitView`, `NSStackView`, `NSStatusBarButton`, `NSStepper`, `NSSwitch`, `NSTabView`, `NSTableCellView`, `NSTableHeaderView`, `NSTableRowView`, `NSTableView`, `NSText`, `NSTextField`, `NSTextInsertionIndicator`, `NSTextView`, `NSTokenField`, `NSView`, `NSVisualEffectView`

## Availability

- macOS ?

## Topics

### Managing a Dragging Session Before an Image Is Released

- `draggingEntered(_:)`
- `wantsPeriodicDraggingUpdates()`
- `draggingUpdated(_:)`
- `draggingExited(_:)`
- `draggingEnded(_:)`

### Managing a Dragging Session After an Image Is Released

- `prepareForDragOperation(_:)`
- `performDragOperation(_:)`
- `concludeDragOperation(_:)`

### Updating Dragging Images

- `updateDraggingItemsForDrag(_:)`

## See Also

- `NSDraggingInfo`
- `NSSpringLoadingDestination`
