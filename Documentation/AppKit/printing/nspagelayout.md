---
url: https://developer.apple.com/documentation/appkit/nspagelayout
framework: AppKit
category: Printing
title: NSPageLayout
kind: class
captured: 2026-05-02
---

# NSPageLayout

A panel that queries the user for information such as paper type and orientation.

## Declaration

```swift
@MainActor class NSPageLayout
```

### Overview

A page layout panel is typically displayed in response to the user selecting the Page Setup menu item. You obtain an instance with the `NSPageLayout/pageLayout` class method. The pane can then be run as a sheet using `NSPageLayout/beginSheet(with:modalFor:delegate:didEnd:contextInfo:)` or modally using `NSPageLayout/runModal()` or `NSPageLayout/runModal(with:)`.

For design guidance, see `https://developer.apple.com/design/human-interface-guidelines/macos/system-capabilities/printing#page-setup-dialogs`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS ?

## Topics

### Running the page setup dialog

- `beginSheet(using:on:completionHandler:)`
- `beginSheet(with:modalFor:delegate:didEnd:contextInfo:)`
- `runModal()`
- `runModal(with:)`

### Customizing the page setup dialog

- `addAccessoryController(_:)`
- `removeAccessoryController(_:)`
- `accessoryControllers`

### Accessing the printing information

- `printInfo`
- `NSPrintInfo`
- `NSPageLayout.Result`

## See Also

- `NSPrintPanel`
