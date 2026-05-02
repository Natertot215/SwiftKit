---
url: https://developer.apple.com/documentation/appkit/nssplitview
framework: AppKit
category: Views and controls
title: NSSplitView
kind: class
captured: 2026-05-01
---

# NSSplitView

## Declaration

```swift
class NSSplitView
```

## Abstract

A view that arranges two or more views in a linear stack running horizontally or vertically.

## Overview

A split view manages the dividers and orientation for a split view controller (`NSSplitViewController`). By default, dividers have a horizontal orientation so that the split view arranges its panes vertically from top to bottom.

Divider indices are zero-based. If the `isVertical` property is `false`, which is the default value, the top divider has an index of `0`. If `isVertical` is `true`, the leading divider has an index of `0`.

## Inheritance

Inherits from: `NSView`

## Conformances

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

### Customizing the Split View Behavior
- `delegate` – The split view's delegate
- `NSSplitViewDelegate` – Protocol for delegate methods

### Arranging Subviews
- `arrangesAllSubviews` – Boolean for whether the split view arranges all subviews
- `arrangedSubviews` – Array of views arranged as split panes
- `addArrangedSubview(_:)` – Adds a view as an arranged pane
- `insertArrangedSubview(_:at:)` – Adds a view at a specified index
- `removeArrangedSubview(_:)` – Removes a view as an arranged pane

### Managing Subviews
- `adjustSubviews()` – Adjusts subview sizes to fill the split view
- `isSubviewCollapsed(_:)` – Returns whether a subview is collapsed
- `holdingPriorityForSubview(at:)` – Returns the subview's resize priority
- `setHoldingPriority(_:forSubviewAt:)` – Sets the resize priority

### Managing Divider Orientation
- `isVertical` – Boolean for the geometric orientation of dividers

### Configuring and Drawing Dividers
- `dividerStyle` – The style of dividers
- `DividerStyle` – Enum of divider style constants
- `dividerColor` – Color of the dividers
- `dividerThickness` – Thickness of the dividers
- `drawDivider(in:)` – Draws a divider in a specified rect

### Saving Subview Positions
- `autosaveName` – Name for automatic divider configuration saving
- `AutosaveName` – Type alias for autosave name

### Constraining Split Position
- `minPossiblePositionOfDivider(at:)` – Returns minimum divider position
- `maxPossiblePositionOfDivider(at:)` – Returns maximum divider position
- `setPosition(_:ofDividerAt:)` – Updates divider location

### Managing Notifications
- `willResizeSubviewsNotification` – Posts before subview resize
- `didResizeSubviewsNotification` – Posts after subview resize

## See Also

- `NSSplitViewController` – Object managing an array of adjacent child views
- `NSSplitViewItem` – Item in a split view controller
