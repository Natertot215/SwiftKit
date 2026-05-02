---
url: https://developer.apple.com/documentation/appkit/nsgridcell
framework: AppKit
category: Views and controls
title: NSGridCell
kind: class
captured: 2026-05-02
---

# NSGridCell

An individual content area within a grid view, typically at the intersection of a row and a column.

## Declaration

```swift
@MainActor class NSGridCell
```

### Overview

Use a grid cell to specify the content view to display and to position the content view within the cell’s area.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.12

## Topics

### Getting the Cell Containers

- `column`
- `row`
- `contentView`
- `emptyContentView`

### Formatting the Cell

- `customPlacementConstraints`
- `rowAlignment`
- `xPlacement`
- `yPlacement`
- `NSGridCell.Placement`

### Initializers

- `init(coder:)`
