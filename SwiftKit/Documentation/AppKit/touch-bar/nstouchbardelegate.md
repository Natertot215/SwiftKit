---
url: https://developer.apple.com/documentation/appkit/nstouchbardelegate
framework: AppKit
category: Touch Bar
title: NSTouchBarDelegate
kind: protocol
captured: 2026-05-02
---

# NSTouchBarDelegate

A protocol that allows you to provide the items for a bar dynamically.

## Declaration

```swift
protocol NSTouchBarDelegate : NSObjectProtocol
```

### Overview

Use a bar delegate, according to the needs of your app, to dynamically create items (`NSTouchBarItem` instances). For more information, see `NSTouchBar#Item-objects`.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSTextView`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS ?

## Topics

### Providing bar items

- `touchBar(_:makeItemForIdentifier:)`

## See Also

- `Integrating a Toolbar and Touch Bar into Your App`
- `Creating and Customizing the Touch Bar`
- `NSTouchBar`
- `NSTouchBarProvider`
