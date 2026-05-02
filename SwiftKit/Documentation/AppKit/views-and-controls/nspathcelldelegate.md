---
url: https://developer.apple.com/documentation/appkit/nspathcelldelegate
framework: AppKit
category: Views and controls
title: NSPathCellDelegate
kind: protocol
captured: 2026-05-02
---

# NSPathCellDelegate

A set of methods that enable the delegate of a path cell object to customize the Open panel or pop-up menu of a path whose style is set to `NSPathControl/Style/popUp`.

## Declaration

```swift
protocol NSPathCellDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Customizing the Open Panel

- `pathCell(_:willDisplay:)`

### Customizing the Menu

- `pathCell(_:willPopUp:)`

## See Also

- `NSPathCell`
- `NSPathComponentCell`
- `NSPathControlItem`
