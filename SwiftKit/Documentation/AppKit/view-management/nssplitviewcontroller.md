---
url: https://developer.apple.com/documentation/appkit/nssplitviewcontroller
framework: AppKit
category: View management
title: NSSplitViewController
kind: class
captured: 2026-05-02
---

# NSSplitViewController

An object that manages an array of adjacent child views, and has a split view object for managing dividers between those views.

## Declaration

```swift
class NSSplitViewController
```

### Overview

A split view controller manages a set of child views that it displays next to each other in a side-by-side or top-to-bottom arrangement.

A split view controller owns an array of split view items (`NSSplitViewItem`), each of which has a view controller (`NSViewController`) and corresponding view. The split view controller’s `NSSplitViewController/splitView` object manages those child views and the dividers between them.

By default, a split view arranges its child views vertically from top to bottom. To specify a horizontal (side-by-side) arrangement, implement the `NSSplitView/isVertical` property of the `NSSplitViewController/splitView` object to return `true`.

The split view controller serves as the delegate of its `NSSplitViewController/splitView` object. If you override a split view delegate method, your override must call `super`.

To use a split view controller, you must use Auto Layout for the child views and to support animations that collapse and reveal child views. For example, if you design a layout that contains two views, a content area and an optional sidebar, you employ Auto Layout constraints to specify whether the content area shrinks or remains the same size when the sidebar becomes visible.

A split view controller employs lazy loading of its views. For example, adding a collapsed split view item as a new child doesn’t load the associated view until it shows.

For more information about using `NSSplitViewController` in your app, see `navigating-hierarchical-data-using-outline-and-split-views`.





## Relationships

**Inherits From**: `NSViewController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSExtensionRequestHandling`, `NSObjectProtocol`, `NSSeguePerforming`, `NSSplitViewDelegate`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.10

## Topics

### Configuring and Managing a Split View Controller

- `splitView`
- `splitViewItem(for:)`
- `splitViewItems`
- `NSSplitViewItem`

### Modifying a Split View Controller

- `addSplitViewItem(_:)`
- `insertSplitViewItem(_:at:)`
- `removeSplitViewItem(_:)`

### Managing Sidebars

- `toggleSidebar(_:)`
- `minimumThicknessForInlineSidebars`
- `automaticDimension`

### Managing Inspectors

- `toggleInspector(_:)`

### Responding to View Events

- `viewDidLoad()`

### Supporting Protocol Requirements

- `Protocol Implementations`

## See Also

- `NSSplitView`
- `NSSplitViewItem`
