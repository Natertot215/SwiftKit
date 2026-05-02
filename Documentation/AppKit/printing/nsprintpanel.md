---
url: https://developer.apple.com/documentation/appkit/nsprintpanel
framework: AppKit
category: Printing
title: NSPrintPanel
kind: class
captured: 2026-05-02
---

# NSPrintPanel

The Print panel that queries the user for information about a print job.

## Declaration

```swift
@MainActor class NSPrintPanel
```

### Overview

A Print panel may let the user select the range of pages to print and the number of copies before executing the Print command. Print panels can display a simplified interface when printing certain types of data. For example, the panel can display a list of print-setting presets, which lets the user enable print settings in groups as opposed to individually. Assigning an appropriate string to the `NSPrintPanel/jobStyleHint-swift.property` property activates the simplified interface and identifies which presets to display.

For design guidance, see `https://developer.apple.com/design/human-interface-guidelines/macos/system-capabilities/printing/`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS ?

## Topics

### Customizing the Panel

- `jobStyleHint`
- `NSPrintPanel.JobStyleHint`
- `options`
- `NSPrintPanel.Options`
- `defaultButtonTitle()`
- `setDefaultButtonTitle(_:)`
- `helpAnchor`

### Managing Accessory Views

- `addAccessoryController(_:)`
- `removeAccessoryController(_:)`
- `NSPrintPanelAccessorizing`
- `accessoryControllers`

### Running the Panel

- `beginSheet(using:on:completionHandler:)`
- `beginSheet(with:modalFor:delegate:didEnd:contextInfo:)`
- `runModal()`
- `runModal(with:)`

### Accessing the Printing Information

- `printInfo`
- `NSPrintInfo`
- `NSPrintPanel.Result`

## See Also

- `NSPageLayout`
