---
url: https://developer.apple.com/documentation/appkit/nstoolbaritemvalidation
framework: AppKit
category: Views and controls
title: NSToolbarItemValidation
kind: protocol
captured: 2026-05-02
---

# NSToolbarItemValidation

Validation of a toolbar item.

## Declaration

```swift
protocol NSToolbarItemValidation : NSObjectProtocol
```

### Overview

A toolbar item with a valid target and action is enabled by default. To allow a toolbar item to be disabled in certain situations, a toolbar item’s target can implement the `NSToolbarItemValidation/validateToolbarItem(_:)` method.

> **NOTE:**  The `NSToolbarItem` `NSToolbarItem/validate()` method is called only if the item’s target has a valid action defined on its target and if the item isn’t a custom view item. If you want to validate a custom view item, then you have to subclass `NSToolbarItem` and override `NSToolbarItem/validate()`.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Enabling and disabling toolbar items

- `validateToolbarItem(_:)`

## See Also

- `Integrating a Toolbar and Touch Bar into Your App`
- `NSToolbar`
