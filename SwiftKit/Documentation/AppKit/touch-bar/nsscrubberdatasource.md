---
url: https://developer.apple.com/documentation/appkit/nsscrubberdatasource
framework: AppKit
category: Touch Bar
title: NSScrubberDataSource
kind: protocol
captured: 2026-05-02
---

# NSScrubberDataSource

A set of methods that a scrubber data source object implements to provide items to the scrubber from an associated data collection in your app.

## Declaration

```swift
protocol NSScrubberDataSource : NSObjectProtocol
```







## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting the scrubber metrics

- `numberOfItems(for:)`

### Getting views for items

- `scrubber(_:viewForItemAt:)`

## See Also

- `NSScrubber`
- `NSScrubberDelegate`
