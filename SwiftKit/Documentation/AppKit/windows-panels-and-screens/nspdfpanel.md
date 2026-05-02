---
url: https://developer.apple.com/documentation/appkit/nspdfpanel
framework: AppKit
category: Windows, panels, and screens
title: NSPDFPanel
kind: class
captured: 2026-05-02
---

# NSPDFPanel

A Save or Export as PDF panel that’s consistent with the macOS user interface.

## Declaration

```swift
@MainActor class NSPDFPanel
```

### Overview

A PDF panel has a variety of built-in customization controls, such as page orientation, paper size, and tags. It also supports the use of a custom accessory view controller that allows an app to specify how a PDF file should be created.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.9

## Topics

### Managing the Contents of a PDF Panel

- `accessoryController`
- `options`
- `defaultFileName`

### Displaying a PDF Panel

- `beginSheet(with:modalFor:completionHandler:)`

### Constants

- `NSPDFPanel.Options`

## See Also

- `NSPrintPanelAccessorizing`
