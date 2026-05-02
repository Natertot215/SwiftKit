---
url: https://developer.apple.com/documentation/appkit/nspopoverdelegate
framework: AppKit
category: Windows, panels, and screens
title: NSPopoverDelegate
kind: protocol
captured: 2026-05-02
---

# NSPopoverDelegate

A set of optional methods that a popover delegate can implement to provide additional or custom functionality.

## Declaration

```swift
protocol NSPopoverDelegate : NSObjectProtocol
```

### Overview

See `NSPopover` for more information on popovers in general.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Popover Window

- `detachableWindow(for:)`

### Popover Visibility

- `popoverShouldClose(_:)`
- `popoverWillShow(_:)`
- `popoverDidShow(_:)`
- `popoverWillClose(_:)`
- `popoverDidClose(_:)`
- `popoverDidDetach(_:)`
- `popoverShouldDetach(_:)`

## See Also

- `NSPopover`
