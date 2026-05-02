---
url: https://developer.apple.com/documentation/appkit/nsopensavepaneldelegate
framework: AppKit
category: Windows, panels, and screens
title: NSOpenSavePanelDelegate
kind: protocol
captured: 2026-05-02
---

# NSOpenSavePanelDelegate

A set of methods for managing interactions with an open or save panel.

## Declaration

```swift
protocol NSOpenSavePanelDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSPathCell`

## Availability

- macOS ?

## Topics

### Responding to the User’s Selection

- `panel(_:userEnteredFilename:confirmed:)`

### Responding to Panel Changes

- `panelSelectionDidChange(_:)`
- `panel(_:didChangeToDirectoryURL:)`
- `panel(_:willExpand:)`

### Validating the Panel Content

- `panel(_:shouldEnable:)`
- `panel(_:validate:)`

### Instance Methods

- `panel(_:didSelect:)`
- `panel(_:displayNameFor:)`

## See Also

- `NSOpenPanel`
- `NSSavePanel`
