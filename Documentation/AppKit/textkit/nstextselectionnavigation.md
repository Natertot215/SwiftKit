---
url: https://developer.apple.com/documentation/appkit/nstextselectionnavigation
framework: AppKit
category: TextKit
title: NSTextSelectionNavigation
kind: class
captured: 2026-05-02
---

# NSTextSelectionNavigation

An interface you use to expose methods for obtaining results from actions performed on text selections.

## Declaration

```swift
class NSTextSelectionNavigation
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 12.0

## Topics

### Creating a selection navigation

- `init(dataSource:)`

### Selection characteristics

- `allowsNonContiguousRanges`
- `rotatesCoordinateSystemForLayoutOrientation`
- `NSTextSelectionNavigation.Modifier`
- `NSTextSelectionNavigation.Destination`
- `NSTextSelectionNavigation.Direction`
- `textSelection(for:enclosing:inContainerAt:)`

### Accessing the data source

- `textSelectionDataSource`
- `NSTextSelectionDataSource`

### Working with text selections

- `textSelection(for:enclosing:)`
- `textSelections(interactingAt:inContainerAt:anchors:modifiers:selecting:bounds:)`
- `destinationSelection(for:direction:destination:extending:confined:)`

### Controlling cache behavior

- `flushLayoutCache()`

### Finding the insertion point

- `resolvedInsertionLocation(for:writingDirection:)`

### Specifying deletion ranges

- `deletionRanges(for:direction:destination:allowsDecomposition:)`

## See Also

- `NSTextRange`
- `NSTextSelection`
- `NSTextLocation`
