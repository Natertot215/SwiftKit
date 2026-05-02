---
url: https://developer.apple.com/documentation/appkit/nsprintinfo
framework: AppKit
category: Printing
title: NSPrintInfo
kind: class
captured: 2026-05-02
---

# NSPrintInfo

An object that stores information that’s used to generate printed output.

## Declaration

```swift
class NSPrintInfo
```

### Overview

A shared `NSPrintInfo` object is automatically created for an app and is used by default for all printing jobs for that app. The printing information in an `NSPrintInfo` object is stored in a dictionary. To access the standard attributes in the dictionary directly, this class defines a set of keys and provides the `NSPrintInfo/dictionary()` method. You can also initialize an instance of this class using the `NSPrintInfo/init(dictionary:)` method.

You can use this dictionary to store custom information associated with a print job. Any non-object values should be stored as `NSNumber` or `NSValue` objects in the dictionary. See `NSNumber` for a list of types which should be stored as numbers. For other non-object values, use the `NSValue` class.

To store custom information that belongs in printing presets you should use the dictionary returned by the `NSPrintInfo/printSettings` method.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating the Printing Information Object

- `shared`
- `init(dictionary:)`
- `init()`
- `init(coder:)`

### Managing the Printing Rectangle

- `paperSize`
- `topMargin`
- `bottomMargin`
- `leftMargin`
- `rightMargin`
- `imageablePageBounds`
- `orientation`
- `NSPrintInfo.PaperOrientation`
- `paperName`
- `NSPrinter.PaperName`
- `localizedPaperName`

### Pagination

- `horizontalPagination`
- `verticalPagination`
- `NSPrintInfo.PaginationMode`

### Positioning the Image on the Page

- `isHorizontallyCentered`
- `isVerticallyCentered`

### Specifying the Printer

- `printer`
- `NSPrinter`

### Controlling Printing

- `jobDisposition`
- `NSPrintInfo.JobDisposition`
- `setUpPrintOperationDefaultValues()`

### Accessing the Print Info Dictionary

- `dictionary()`

### Print Settings Convenience Methods

- `isSelectionOnly`
- `scalingFactor`

### Accessing Core Printing Information

- `printSettings`
- `NSPrintInfo.SettingKey`
- `pmPrintSession()`
- `pmPageFormat()`
- `pmPrintSettings()`
- `updateFromPMPageFormat()`
- `updateFromPMPrintSettings()`
- `takeSettings(from:)`

### Constants

- `NSPrintInfo.AttributeKey`

### Deprecated

- `defaultPrinter`
- `NSPrintInfo.Orientation`
- `Deprecated Printing Keys`

## See Also

- `NSPrinter`
- `NSPrintOperation`
