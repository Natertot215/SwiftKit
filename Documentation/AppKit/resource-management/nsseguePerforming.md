---
url: https://developer.apple.com/documentation/appkit/nsseguePerforming
framework: AppKit
category: Resource management
title: NSSeguePerforming
kind: protocol
captured: 2026-05-02
---

# NSSeguePerforming

A set of methods that support the mediation of a custom segue.

## Declaration

```swift
protocol NSSeguePerforming : NSObjectProtocol
```

### Overview

When you subclass `NSStoryboardSegue` to express a custom transition or containment relationship between storyboard scenes, you might also want to provide code that prepares the destination/contained view or window controller object. Put this code in an override of the `NSSeguePerforming/prepare(for:sender:)` method.

To conditionally disallow the performance of a segue, override the `NSSeguePerforming/shouldPerformSegue(withIdentifier:sender:)` method, returning `false`.If you need to programmatically trigger a segue that cannot be expressed in a storyboard file, such as a transition between scenes in different storyboards, use the `NSSeguePerforming/performSegue(withIdentifier:sender:)` method in this protocol.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSCollectionViewItem`, `NSPageController`, `NSSplitViewController`, `NSSplitViewItemAccessoryViewController`, `NSTabViewController`, `NSTitlebarAccessoryViewController`, `NSViewController`, `NSWindowController`

## Availability

- macOS ?

## Topics

### Working with Storyboard Segues

- `performSegue(withIdentifier:sender:)`
- `prepare(for:sender:)`
- `shouldPerformSegue(withIdentifier:sender:)`

## See Also

- `NSStoryboard`
- `NSStoryboardSegue`
