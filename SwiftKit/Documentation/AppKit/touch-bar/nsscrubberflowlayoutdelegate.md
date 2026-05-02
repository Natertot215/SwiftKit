---
url: https://developer.apple.com/documentation/appkit/nsscrubberflowlayoutdelegate
framework: AppKit
category: Touch Bar
title: NSScrubberFlowLayoutDelegate
kind: protocol
captured: 2026-05-02
---

# NSScrubberFlowLayoutDelegate

A protocol that a scrubber delegate can adopt to provide the size of an item.

## Declaration

```swift
protocol NSScrubberFlowLayoutDelegate : NSScrubberDelegate
```

### Overview

This protocol conforms to the `NSScrubberDelegate` protocol. Create an object that conforms to `NSScrubberFlowLayoutDelegate` and assign it to the `NSScrubber/delegate` property of your scrubber object.





## Relationships

**Inherits From**: `NSObjectProtocol`, `NSScrubberDelegate`

## Availability

- macOS ?

## Topics

### Controlling the item size

- `scrubber(_:layout:sizeForItemAt:)`

## See Also

- `NSScrubberFlowLayout`
- `NSScrubberProportionalLayout`
- `NSScrubberLayoutAttributes`
- `NSScrubberLayout`
