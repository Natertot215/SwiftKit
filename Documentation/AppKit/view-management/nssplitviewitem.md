---
url: https://developer.apple.com/documentation/appkit/nssplitviewitem
framework: AppKit
category: View management
title: NSSplitViewItem
kind: class
captured: 2026-05-02
---

# NSSplitViewItem

An item in a split view controller.

## Declaration

```swift
class NSSplitViewItem
```

### Overview

A split view item represents a single pane in a split view controller (`NSSplitViewController`). Each split view item contains information about a child view controller in the split view controller, like its preferred thickness, holding priority, and collapsed state.

To add one or more accessory views to the top or bottom of a split view item, such as a search field above a list, use the `NSSplitViewItem/topAlignedAccessoryViewControllers` and `NSSplitViewItem/bottomAlignedAccessoryViewControllers` properties to specify  `NSSplitViewItemAccessoryViewController` types.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAnimatablePropertyContainer`, `NSCoding`, `NSObjectProtocol`

## Availability

- macOS 10.10

## Topics

### Creating a split view item

- `init(sidebarWithViewController:)`
- `init(contentListWithViewController:)`
- `init(viewController:)`
- `init(inspectorWithViewController:)`

### Managing the item thickness

- `automaticMaximumThickness`
- `preferredThicknessFraction`
- `minimumThickness`
- `maximumThickness`
- `unspecifiedDimension`

### Getting Auto Layout behaviors

- `holdingPriority`
- `automaticallyAdjustsSafeAreaInsets`

### Getting the item behavior

- `behavior`
- `NSSplitViewItem.Behavior`

### Collapsing and expanding the item

- `isCollapsed`
- `canCollapse`
- `collapseBehavior`
- `NSSplitViewItem.CollapseBehavior`
- `isSpringLoaded`
- `canCollapseFromWindowResize`

### Customizing appearance

- `allowsFullHeightLayout`
- `titlebarSeparatorStyle`
- `NSTitlebarSeparatorStyle`

### Configuring accessory views

- `topAlignedAccessoryViewControllers`
- `bottomAlignedAccessoryViewControllers`
- `addTopAlignedAccessoryViewController(_:)`
- `insertTopAlignedAccessoryViewController(_:at:)`
- `removeTopAlignedAccessoryViewController(at:)`
- `addBottomAlignedAccessoryViewController(_:)`
- `insertBottomAlignedAccessoryViewController(_:at:)`
- `removeBottomAlignedAccessoryViewController(at:)`
- `NSSplitViewItemAccessoryViewController`

### Getting the View Controller

- `viewController`

### Initializers

- `init(coder:)`

## See Also

- `NSSplitViewController`
- `NSSplitView`
