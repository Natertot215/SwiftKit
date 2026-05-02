---
url: https://developer.apple.com/documentation/appkit/nsscrubberlayoutattributes
framework: AppKit
category: Touch Bar
title: NSScrubberLayoutAttributes
kind: class
captured: 2026-05-02
---

# NSScrubberLayoutAttributes

The layout of a scrubber item.

## Declaration

```swift
class NSScrubberLayoutAttributes
```

### Overview

A layout attributes object is the model for the layout of a single item in a scrubber control.

If you require model attributes in addition to those provided by this class, create a subclass and add appropriate attributes. Subclasses must implement `NSObjectProtocol/isEqual(_:)`, `NSObjectProtocol/hash` and the `NSCopying` protocol.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCopying`, `NSObjectProtocol`

## Availability

- macOS 10.12.2

## Topics

### Creating layout attributes

- `init(forItemAt:)`

### Controlling the layout

- `alpha`
- `frame`
- `itemIndex`

### Initializers

- `init(forItemAtIndex:)`

## See Also

- `NSScrubberFlowLayout`
- `NSScrubberFlowLayoutDelegate`
- `NSScrubberProportionalLayout`
- `NSScrubberLayout`
