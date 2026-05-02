---
url: https://developer.apple.com/documentation/appkit/nsprintoperation
framework: AppKit
category: Printing
title: NSPrintOperation
kind: class
captured: 2026-05-02
---

# NSPrintOperation

An object that controls operations that generate Encapsulated PostScript (EPS) code, Portable Document Format (PDF) code, or print jobs.

## Declaration

```swift
@MainActor class NSPrintOperation
```

### Overview

An `NSPrintOperation` object works in conjunction with two other objects: an `NSPrintInfo` object, which specifies how the code should be generated, and an `NSView` object, which generates the actual code.

It is important to note that the majority of methods in `NSPrintOperation` copy the instance of `NSPrintInfo` passed into them. Future changes to that print info are not reflected in the print info retained by the current `NSPrintOperation` object. All changes should be made to the print info before passing to the methods of this class. The only method in `NSPrintOperation` which does not copy the `NSPrintInfo` instance is `NSPrintOperation/printInfo`.

> **NOTE:**  You should not subclass `NSPrintOperation`. Methods that return a print operation object return an instance of a concrete subclass whose implementation is private.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS ?

## Topics

### Creating the Printing Operation Object

- `epsOperation(with:inside:to:)`
- `epsOperation(with:inside:to:printInfo:)`
- `epsOperation(with:inside:toPath:printInfo:)`
- `pdfOperation(with:inside:to:)`
- `pdfOperation(with:inside:to:printInfo:)`
- `pdfOperation(with:inside:toPath:printInfo:)`
- `init(view:)`
- `init(view:printInfo:)`

### Setting the Current Print Operation for This Thread

- `current`

### Determining the Type of Operation

- `isCopyingOperation`

### Modifying the Printing Information

- `printInfo`
- `NSPrintInfo`

### Getting the View

- `view`

### Getting the Printing Quality

- `preferredRenderingQuality`
- `NSPrintOperation.RenderingQuality`

### Running the Print Operation

- `run()`
- `runModal(for:delegate:didRun:contextInfo:)`
- `cleanUp()`
- `deliverResult()`

### Modifying the User Interface

- `showsPrintPanel`
- `showsProgressPanel`
- `jobTitle`
- `printPanel`
- `pdfPanel`

### Managing the Drawing Context

- `context`
- `createContext()`
- `destroyContext()`

### Managing Page Information

- `currentPage`
- `pageRange`
- `pageOrder`
- `NSPrintOperation.PageOrder`

### Managing Printing Threads

- `canSpawnSeparateThread`

## See Also

- `NSPrinter`
- `NSPrintInfo`
