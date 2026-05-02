---
url: https://developer.apple.com/documentation/appkit/nsmenuitembadge
framework: AppKit
category: Menus, cursors, and the Dock
title: NSMenuItemBadge
kind: class
captured: 2026-05-02
---

# NSMenuItemBadge

A control that provides additional quantitative information specific to a menu item, such as the number of available updates.

## Declaration

```swift
class NSMenuItemBadge
```

### Overview

You create a badge using an initializer or a predefined factory method, and then you assign it to the `NSMenuItem/badge` property of a `NSMenuItem` for display.

For example, to display a badge with a count, use the `NSMenuItemBadge/init(count:)` initalizer, passing in the value of `count` as an `Int`.

To display a badge with a custom string, use the `NSMenuItemBadge/init(string:)` initializer, passing in the string you want to display.

To display a badge using a predefined `NSMenuItemBadge/BadgeType`, use a factory method such as `NSMenuItemBadge/newItems(count:)`, passing in the `count` of the badge to display.

> **IMPORTANT:**  If you use one of the predefined badge types, the system localizes and pluralizes the string for you. If you create your own custom badge string, you need to localize and pluralize that string yourself. For more information on how to localize and pluralize text, see `localizing-and-varying-text-with-a-string-catalog`.

The default value of this property is `nil`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Decodable`, `Encodable`, `Equatable`, `Escapable`, `Hashable`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 14.0

## Topics

### Creating menu item badges

- `init(count:)`
- `init(string:)`

### Creating badges of a specific type

- `alerts(count:)`
- `newItems(count:)`
- `updates(count:)`
- `NSMenuItemBadge.BadgeType`

### Accessing menu item badge attributes

- `itemCount`
- `stringValue`
- `type`

### Instance Properties

- `stringValue`

## See Also

- `NSMenu`
- `NSMenuItem`
- `NSMenuDelegate`
