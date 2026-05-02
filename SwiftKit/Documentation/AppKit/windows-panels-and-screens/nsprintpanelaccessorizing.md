---
url: https://developer.apple.com/documentation/appkit/nsprintpanelaccessorizing
framework: AppKit
category: Windows, panels, and screens
title: NSPrintPanelAccessorizing
kind: protocol
captured: 2026-05-02
---

# NSPrintPanelAccessorizing

A set of methods that a Print panel object can use to get information from a printing accessory controller.

## Declaration

```swift
protocol NSPrintPanelAccessorizing
```

### Overview

A printing accessory controller manages a custom print panel accessory view and is used to coordinate print settings. If you are implementing a custom printing accessory view, your controller must support this protocol. Implementation of only one method in the protocol is actually required. The other method is considered optional and is used to support the print panel’s built-in preview facilities.







## Availability

- macOS ?

## Topics

### Responding to Being Loaded from a Nib File

- `localizedSummaryItems()`
- `keyPathsForValuesAffectingPreview()`
- `NSPrintPanel.AccessorySummaryKey`

## See Also

- `NSPDFPanel`
