---
url: https://developer.apple.com/documentation/appkit/nstextcontainer
framework: AppKit
category: TextKit
title: NSTextContainer
kind: class
captured: 2026-05-02
---

# NSTextContainer

A region where text layout occurs.

## Declaration

```swift
class NSTextContainer
```

### Overview

An `NSLayoutManager` uses `NSTextContainer` to determine where to break lines, lay out portions of text, and so on. An `NSTextContainer` object typically defines rectangular regions, but you can define exclusion paths inside the text container to create regions where text doesn’t flow. You can also subclass to create text containers with nonrectangular regions, such as circular regions, regions with holes in them, or regions that flow alongside graphics.

You can access instances of the `NSTextContainer`, `NSLayoutManager`, and `NSTextStorage` classes from threads other than the main thread as long as the app guarantees access from only one thread at a time.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `NSTextLayoutOrientationProvider`

## Availability

- macOS 10.0

## Topics

### Creating a text container

- `init(size:)`
- `init(coder:)`

### Managing text components

- `layoutManager`
- `textLayoutManager`
- `replaceLayoutManager(_:)`
- `textView`

### Defining the container shape

- `size`
- `exclusionPaths`
- `lineBreakMode`
- `widthTracksTextView`
- `heightTracksTextView`

### Constraining text layout

- `maximumNumberOfLines`
- `lineFragmentPadding`
- `lineFragmentRect(forProposedRect:at:writingDirection:remaining:)`
- `isSimpleRectangularTextContainer`

### Deprecated

- `init(containerSize:)`
- `lineFragmentRect(forProposedRect:sweepDirection:movementDirection:remaining:)`
- `contains(_:)`
- `containerSize`

## See Also

- `Using TextKit 2 to interact with text`
- `NSTextLayoutManager`
- `NSTextLayoutFragment`
- `NSTextLineFragment`
- `NSTextViewportLayoutController`
- `NSTextLayoutOrientationProvider`
