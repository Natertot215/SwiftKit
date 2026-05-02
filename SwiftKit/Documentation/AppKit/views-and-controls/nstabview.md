---
url: https://developer.apple.com/documentation/appkit/nstabview
framework: AppKit
category: Views and controls
title: NSTabView
kind: class
captured: 2026-05-01
---

# NSTabView

## Declaration

```swift
class NSTabView : NSView
```

## Abstract

A multipage interface that displays one page at a time.

## Overview

A tab view contains a row of tabs that give the appearance of folder tabs. The user selects the desired page by clicking the appropriate tab or using the arrow keys to move between pages. Each page displays a view hierarchy provided by your app.

## Inheritance

- Inherits from: `NSView`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAnimatablePropertyContainer`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSDraggingDestination`
- `NSObject`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `Sendable`
- `SendableMetatype`

## Topics

### Handling the Selection of Tabs
- `delegate` — The tab view's delegate
- `NSTabViewDelegate` — The protocol defining optional delegate methods

### Adding and Removing Tabs
- `addTabViewItem(_:)` — Adds the specified tab item
- `insertTabViewItem(_:at:)` — Inserts the specified item at the specified index
- `removeTabViewItem(_:)` — Removes the specified item

### Accessing Tabs
- `indexOfTabViewItem(_:)` — Returns the index of the specified item
- `indexOfTabViewItem(withIdentifier:)` — Returns the index matching the identifier or `NSNotFound`
- `numberOfTabViewItems` — The number of items in the tab view's array
- `tabViewItem(at:)` — Returns the tab view item at the specified index
- `tabViewItems` — The tab view's array of tab view items

### Configuring the Tab Attributes
- `tabViewType` — The tab type to display
- `TabType` — Constants specifying the tab view's type
- `tabPosition` — The position of the tabs
- `TabPosition` — Enum for tab position options
- `tabViewBorderType` — The border type of the tab view
- `TabViewBorderType` — Enum for border type options

### Selecting a Tab
- `selectFirstTabViewItem(_:)` — Selects the first tab view item
- `selectLastTabViewItem(_:)` — Selects the last tab view item
- `selectNextTabViewItem(_:)` — Selects the next tab view item in sequence
- `selectPreviousTabViewItem(_:)` — Selects the previous tab view item in sequence
- `selectTabViewItem(_:)` — Selects the specified tab view item
- `selectTabViewItem(at:)` — Selects the tab view item at the specified index
- `selectTabViewItem(withIdentifier:)` — Selects the tab view item with the specified identifier
- `selectedTabViewItem` — The tab view item for the currently selected tab
- `takeSelectedTabViewItemFromSender(_:)` — Sets the selected tab from the sender

### Modifying the Font
- `font` — The font used for the tab view's label text

### Modifying Controls Tint
- `controlTint` — The tab view's control tint (deprecated)

### Manipulating the Background
- `drawsBackground` — A Boolean value indicating if the tab view draws a background color when its type is `NSNoTabsNoBorder`

### Determining the Size
- `minimumSize` — The minimum size necessary for the tab view to display tabs usefully
- `contentRect` — The rectangle describing the content area of the tab view
- `controlSize` — The size of the tab view

### Truncating Tab Labels
- `allowsTruncatedLabels` — A Boolean value indicating if truncation is allowed for labels that don't fit on a tab

### Event Handling
- `tabViewItem(at:)` — Returns the tab view item at the specified point

## See Also

- `NSTabViewController` — A container view controller that manages a tab view interface
- `NSTabViewItem` — An item in a tab view
