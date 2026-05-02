---
url: https://developer.apple.com/documentation/appkit/nsgridrow
framework: AppKit
category: Views and controls
title: NSGridRow
kind: class
captured: 2026-05-02
---

# NSGridRow

A row within a grid view.

## Declaration

```swift
@MainActor class NSGridRow
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.12

## Topics

### Getting the Row Details

- `numberOfCells`
- `isHidden`

### Formatting the Row

- `topPadding`
- `bottomPadding`
- `height`
- `rowAlignment`
- `yPlacement`
- `NSGridRow.Alignment`

### Getting the Grid View

- `gridView`

### Getting Cells

- `cell(at:)`

### Merging Cells in the Row

- `mergeCells(in:)`

### Initializers

- `init(coder:)`

## See Also

- `NSGridColumn`
