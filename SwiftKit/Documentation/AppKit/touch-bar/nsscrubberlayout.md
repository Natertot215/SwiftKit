---
url: https://developer.apple.com/documentation/appkit/nsscrubberlayout
framework: AppKit
category: Touch Bar
title: NSScrubberLayout
kind: class
captured: 2026-05-02
---

# NSScrubberLayout

An abstract class that describes the layout of items within a scrubber control.

## Declaration

```swift
@MainActor class NSScrubberLayout
```

### Overview

To determine the layout of items in a scrubber, use one of the built-in subclasses (`NSScrubberProportionalLayout` or `NSScrubberFlowLayout`), or create a custom subclass to implement your own layout.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSScrubberFlowLayout`, `NSScrubberProportionalLayout`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.12.2

## Topics

### Creating a scrubber layout

- `init()`
- `init(coder:)`

### Configuring a scrubber layout

- `layoutAttributesClass`
- `scrubber`
- `visibleRect`
- `invalidateLayout()`

### Subclassing a scrubber layout

- `prepare()`
- `scrubberContentSize`
- `layoutAttributesForItem(at:)`
- `layoutAttributesForItems(in:)`
- `shouldInvalidateLayoutForSelectionChange`
- `shouldInvalidateLayoutForHighlightChange`
- `shouldInvalidateLayoutForChange(fromVisibleRect:toVisibleRect:)`
- `automaticallyMirrorsInRightToLeftLayout`

## See Also

- `NSScrubberFlowLayout`
- `NSScrubberFlowLayoutDelegate`
- `NSScrubberProportionalLayout`
- `NSScrubberLayoutAttributes`
