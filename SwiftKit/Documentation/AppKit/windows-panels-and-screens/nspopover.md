---
url: https://developer.apple.com/documentation/appkit/nspopover
framework: AppKit
category: Windows, panels, and screens
title: NSPopover
kind: class
captured: 2026-05-01
---

# NSPopover

## Declaration

```swift
class NSPopover
```

## Abstract

A means to display additional content related to existing content on the screen.

## Overview

The popover is positioned relative to the existing content and an anchor is used to express the relation between these two units of content. A popover has an appearance that specifies its visual characteristics, as well as a behavior that determines which user interactions will cause the popover to close. A transient popover is closed in response to most user interactions, whereas a semi-transient popover is closed when the user interacts with the window containing the popover's positioning view. Popovers with application-defined behavior are not usually closed on the developer's behalf.

The system automatically positions each popover relative to its positioning view and moves the popover whenever its positioning view moves. A positioning rectangle within the positioning view can be specified for additional granularity.

Popovers can be detached to become a separate window when they are dragged by implementing the appropriate delegate method.

## Availability

- **Introduced:** macOS 10.7

## Inheritance

Inherits from `NSResponder`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSObject`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `Sendable`

## Topics

### Accessing a Popover's Content View Controller
- `contentViewController`

### Managing a Popover's Position and Size
- `behavior`
- `show(relativeTo:of:preferredEdge:)`
- `positioningRect`

### Managing a Popover's Appearance
- `appearance`
- `effectiveAppearance`
- `animates`
- `contentSize`
- `isShown`
- `isDetached`

### Closing a Popover
- `performClose(_:)`
- `close()`

### Getting and Setting the Delegate
- `delegate`

### Constants
- `Behavior`
- `closeReasonUserInfoKey`
- `CloseReason`
- `Appearance`

### Notifications
- `willShowNotification`
- `didShowNotification`
- `willCloseNotification`
- `didCloseNotification`

## See Also

- `NSPopoverDelegate` - A set of optional methods that a popover delegate can implement to provide additional or custom functionality.
