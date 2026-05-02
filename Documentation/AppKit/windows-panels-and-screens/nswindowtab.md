---
url: https://developer.apple.com/documentation/appkit/nswindowtab
framework: AppKit
category: Windows, panels, and screens
title: NSWindowTab
kind: class
captured: 2026-05-02
---

# NSWindowTab

A tab associated with a window that is part of a tabbing group.

## Declaration

```swift
class NSWindowTab
```

### Overview

`NSWindowTab` describes the way a window displays as part of a tabbed window group. The properties of `NSWindowTab` are configurable at any time, but only take effect when the associated `NSWindow` displays in a tab.

AppKit automatically creates an instance of `NSWindowTab` for each `NSWindow`. You can access a window’s tab object using the `NSWindow/tab` property.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.13

## Topics

### Customizing the Title

- `title`
- `attributedTitle`

### Customizing the Tooltip

- `toolTip`

### Adding an Accessory View

- `accessoryView`

## See Also

- `tabbingIdentifier`

- `NSWindow`
- `NSPanel`
- `NSWindowDelegate`
- `NSWindowTabGroup`
