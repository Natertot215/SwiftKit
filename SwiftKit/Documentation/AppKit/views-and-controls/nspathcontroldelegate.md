---
url: https://developer.apple.com/documentation/appkit/nspathcontroldelegate
framework: AppKit
category: Views and controls
title: NSPathControlDelegate
kind: protocol
captured: 2026-05-02
---

# NSPathControlDelegate

A set of methods that can be implemented by the delegate of a path control object to support dragging to and from the control.

## Declaration

```swift
protocol NSPathControlDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Dragging Support

- `pathControl(_:shouldDrag:with:)`
- `pathControl(_:validateDrop:)`
- `pathControl(_:acceptDrop:)`

### Customizing a Pop-Up–Style Path

- `pathControl(_:willDisplay:)`
- `pathControl(_:willPopUp:)`

### Instance Methods

- `pathControl(_:shouldDrag:with:)`
