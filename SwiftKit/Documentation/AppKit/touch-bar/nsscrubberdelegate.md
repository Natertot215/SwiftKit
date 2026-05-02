---
url: https://developer.apple.com/documentation/appkit/nsscrubberdelegate
framework: AppKit
category: Touch Bar
title: NSScrubberDelegate
kind: protocol
captured: 2026-05-02
---

# NSScrubberDelegate

A set of methods that a scrubber delegate implements to respond to user interactions.

## Declaration

```swift
protocol NSScrubberDelegate : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

**Inherited By**: `NSScrubberFlowLayoutDelegate`

## Availability

- macOS ?

## Topics

### Handling item selection and highlighting

- `scrubber(_:didSelectItemAt:)`
- `scrubber(_:didHighlightItemAt:)`

### Handling scrubber scrolling

- `scrubber(_:didChangeVisibleRange:)`

### Tracking user interaction

- `didBeginInteracting(with:)`
- `didFinishInteracting(with:)`
- `didCancelInteracting(with:)`

## See Also

- `NSScrubber`
- `NSScrubberDataSource`
