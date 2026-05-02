---
url: https://developer.apple.com/documentation/appkit/nsprinter
framework: AppKit
category: Printing
title: NSPrinter
kind: class
captured: 2026-05-02
---

# NSPrinter

An object that describes a printer’s capabilities.

## Declaration

```swift
class NSPrinter
```

### Overview

`NSPrinter` provides information about a printer; it does not modify printer attributes or control a printing job. A printer object can be constructed by specifying either the printer name or the make and model of an available printer. Typically, Cocoa apps don’t create `NSPrinter` objects; instead, the printing system uses these objects to support the printing jobs and when it shows users a list of printers.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Creating the Printer Object

- `init(name:)`
- `init(type:)`

### Getting General Printer Information

- `printerNames`
- `printerTypes`
- `NSPrinter.TypeName`

### Getting Attributes

- `name`
- `type`

### Getting Page and Printer Information

- `pageSize(forPaper:)`
- `NSPrinter.PaperName`
- `languageLevel`

### Querying Tables

- `deviceDescription`

### Deprecated

- `NSPrinter.TableStatus`

### Initializers

- `init(coder:)`

## See Also

- `NSPrintInfo`
- `NSPrintOperation`
