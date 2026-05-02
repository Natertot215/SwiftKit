---
url: https://developer.apple.com/documentation/appkit/nstextfinderbarcontainer
framework: AppKit
category: Views and controls
title: NSTextFinderBarContainer
kind: protocol
captured: 2026-05-02
---

# NSTextFinderBarContainer

A protocol that provides a container in which the find bar is displayed.

## Declaration

```swift
protocol NSTextFinderBarContainer : NSObjectProtocol
```

### Overview

To display the find bar, a container for the find bar must be specified. You specify a find bar container using the `NSTextFinder/findBarContainer` of the `NSTextFinder` class.

See `NSTextFinder` for more information.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSScrollView`

## Availability

- macOS ?

## Topics

### Find Bar View

- `findBarView`
- `contentView()`
- `isFindBarVisible`

### Find Bar Height

- `findBarViewDidChangeHeight()`

## See Also

- `NSTextFinder`
- `NSTextFinderClient`
