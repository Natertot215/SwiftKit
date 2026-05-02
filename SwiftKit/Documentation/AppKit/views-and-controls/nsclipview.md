---
url: https://developer.apple.com/documentation/appkit/nsclipview
framework: AppKit
category: Views and controls
title: NSClipView
kind: class
captured: 2026-05-01
---

# NSClipView

## Declaration

```swift
class NSClipView
```

## Abstract

An object that clips a document view to a scroll view's frame.

## Overview

An `NSClipView` holds the document view of an `NSScrollView`, clipping the document view to its frame, handling the details of scrolling in an efficient manner, and updating the `NSScrollView` when the document view's size or position changes.

You don't typically use the `NSClipView` class directly; it's provided primarily as the scrolling machinery for the `NSScrollView` class. However, you might use the `NSClipView` class to implement a class similar to `NSScrollView`.

### Interaction with NSScrollView

When using an `NSClipView` within an `NSScrollView` (the usual configuration), you should access the `NSScrollView` properties that control background drawing state, rather than accessing these properties of the `NSClipView`. This recommendation applies to the following properties:

- `backgroundColor`
- `drawsBackground`

The `NSClipView` methods are intended for when the `NSClipView` is used independently of a containing `NSScrollView`. In the usual case, `NSScrollView` should be allowed to manage the background-drawing properties of its associated `NSClipView`.

There is only one background-drawing state per `NSScrollView`/`NSClipView` pair. The two objects do not maintain independent and distinct `drawsBackground` and `backgroundColor` properties; rather, the accessors for these properties on `NSScrollView` largely defer to the associated `NSClipView` and allow the `NSClipView` to maintain the state. Note that this state is not cached by the `NSScrollView` object.

It is also important to note that setting `drawsBackground` to `false` in an `NSScrollView` has the added effect of setting the `NSClipView` property `copiesOnScroll` to `false`. The side effect of setting the `drawsBackground` property directly to the `NSClipView` is the appearance of "trails" (vestiges of previous drawing) in the document view as it is scrolled.

## Topics

### Setting the Document View
- `documentView`

### Scrolling
- `scroll(to:)`
- `autoscroll(with:)`
- `constrainScroll(_:)` (deprecated)
- `constrainBoundsRect(_:)`

### Determining Scrolling Efficiency
- `copiesOnScroll` (deprecated)

### Accessing the Content Insets
- `contentInsets`
- `automaticallyAdjustsContentInsets`

### Accessing the Visible Portion
- `documentRect`
- `documentVisibleRect`

### Setting the Document Cursor
- `documentCursor`

### Working with Background Color
- `drawsBackground`
- `backgroundColor`

### Overriding NSView Methods
- `viewBoundsChanged(_:)`
- `viewFrameChanged(_:)`

## Inheritance

Inherits from `NSView`

## Conformance

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSAccessibilityElementProtocol`
- `NSAccessibilityProtocol`
- `NSAnimatablePropertyContainer`
- `NSAppearanceCustomization`
- `NSCoding`
- `NSDraggingDestination`
- `NSObject`
- `NSStandardKeyBindingResponding`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `Sendable`

## See Also

- `NSScrollView`
- `NSScroller`
