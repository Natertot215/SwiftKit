---
url: https://developer.apple.com/documentation/appkit/nsscrubberflowlayout
framework: AppKit
category: Touch Bar
title: NSScrubberFlowLayout
kind: class
captured: 2026-05-02
---

# NSScrubberFlowLayout

A concrete layout object that arranges items end-to-end in a linear strip.

## Declaration

```swift
class NSScrubberFlowLayout
```

### Overview

To set the size of items on a per-item basis, ensure that your scrubber delegate conforms to the `NSScrubberFlowLayoutDelegate` protocol, and provides an implementation of the `NSScrubberFlowLayoutDelegate/scrubber(_:layout:sizeForItemAt:)` method.





## Relationships

**Inherits From**: `NSScrubberLayout`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`

## Availability

- macOS 10.12.2

## Topics

### Configuring the layout

- `itemSpacing`
- `itemSize`

### Invalidating the layout

- `invalidateLayoutForItems(at:)`

## See Also

- `NSScrubberFlowLayoutDelegate`
- `NSScrubberProportionalLayout`
- `NSScrubberLayoutAttributes`
- `NSScrubberLayout`
