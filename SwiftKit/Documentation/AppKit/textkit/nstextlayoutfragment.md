---
url: https://developer.apple.com/documentation/appkit/nstextlayoutfragment
framework: AppKit
category: TextKit
title: NSTextLayoutFragment
kind: class
captured: 2026-05-02
---

# NSTextLayoutFragment

A class that represents the layout fragment typically corresponding to a rendering surface, such as a layer or view subclass.

## Declaration

```swift
class NSTextLayoutFragment
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 12.0

## Topics

### Creating a layout fragment

- `init(coder:)`
- `init(textElement:range:)`

### Getting line fragments

- `textLineFragments`
- `NSTextLayoutFragment.EnumerationOptions`
- `textLineFragment(for:isUpstreamAffinity:)`
- `textLineFragment(forVerticalOffset:requiresExactMatch:)`

### Getting element information

- `state`
- `NSTextLayoutFragment.State`
- `rangeInElement`
- `textElement`

### Accessing the layout manager

- `textLayoutManager`

### Drawing the fragment and attachments

- `layoutFragmentFrame`
- `renderingSurfaceBounds`
- `draw(at:in:)`
- `invalidateLayout()`
- `textAttachmentViewProviders`
- `frameForTextAttachment(at:)`

### Accessing the layout processing queue

- `layoutQueue`

### Defining margins and padding

- `bottomMargin`
- `leadingPadding`
- `topMargin`
- `trailingPadding`

## See Also

- `Using TextKit 2 to interact with text`
- `NSTextLayoutManager`
- `NSTextContainer`
- `NSTextLineFragment`
- `NSTextViewportLayoutController`
- `NSTextLayoutOrientationProvider`
