---
url: https://developer.apple.com/documentation/appkit/nstextlayoutmanager
framework: AppKit
category: TextKit
title: NSTextLayoutManager
kind: class
captured: 2026-05-02
---

# NSTextLayoutManager

The primary class that you use to manage text layout and presentation for custom text displays.

## Declaration

```swift
class NSTextLayoutManager
```

### Overview

`NSTextLayoutManager` is the centerpiece of the TextKit object network that maintains the layout geometry through an array of `NSTextContainer` objects. It lays out results using `NSTextLayoutFragment` and `NSTextElement` objects vended from a `NSTextContentManager` that participates in the content layout process.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`, `NSTextSelectionDataSource`

## Availability

- macOS 12.0

## Topics

### Creating a layout manager

- `init()`
- `init(coder:)`

### Configuring global layout manager options

- `layoutQueue`
- `renderingAttributesValidator`
- `usesFontLeading`
- `usesHyphenation`
- `limitsLayoutForSuspiciousContents`

### Managing the layout process

- `delegate`
- `NSTextLayoutManagerDelegate`

### Accessing the text storage

- `textContentManager`
- `textContainer`
- `textSelectionNavigation`
- `textSelections`
- `usageBoundsForTextContainer`
- `enumerateTextSegments(in:type:options:using:)`
- `replace(_:)`
- `replaceContents(in:with:)`
- `replaceContents(in:with:)`

### Adjusting rendering

- `linkRenderingAttributes`
- `addRenderingAttribute(_:value:for:)`
- `enumerateRenderingAttributes(from:reverse:using:)`
- `renderingAttributes(forLink:at:)`
- `invalidateRenderingAttributes(for:)`
- `removeRenderingAttribute(_:for:)`
- `setRenderingAttributes(_:for:)`

### Causing layout generation

- `textViewportLayoutController`
- `invalidateLayout(for:)`
- `textLayoutFragment(for:)`
- `textLayoutFragment(for:)`
- `ensureLayout(for:)`
- `ensureLayout(for:)`
- `enumerateTextLayoutFragments(from:options:using:)`
- `NSTextLayoutManager.SegmentType`
- `NSTextLayoutManager.SegmentOptions`

### Instance Properties

- `resolvesNaturalAlignmentWithBaseWritingDirection`

## See Also

- `Using TextKit 2 to interact with text`
- `NSTextContainer`
- `NSTextLayoutFragment`
- `NSTextLineFragment`
- `NSTextViewportLayoutController`
- `NSTextLayoutOrientationProvider`
