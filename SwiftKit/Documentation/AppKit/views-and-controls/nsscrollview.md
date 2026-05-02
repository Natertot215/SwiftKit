---
url: https://developer.apple.com/documentation/appkit/nsscrollview
framework: AppKit
category: Views and controls
title: NSScrollView
kind: class
captured: 2026-05-01
---

# NSScrollView

## Declaration

```swift
class NSScrollView : NSView
```

## Abstract

A view that displays a portion of a document view and provides scroll bars that allow the user to move the document view within the scroll view.

## Overview

The `NSScrollView` class is the central coordinator for AppKit's scrolling machinery, which is composed of this class, and the `NSClipView` and `NSScroller` classes.

When using an `NSClipView` object within a scroll view (the usual configuration), you should issue messages that control background drawing state to the scroll view directly, rather than messaging the clip view.

## Inheritance

- Inherits from: `NSView`

## Conforms To

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
- `NSTextFinderBarContainer`
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `Sendable`
- `SendableMetatype`

## Key Properties

### Managing the Views
- `contentView` – The scroll view's content view, the view that clips the document view
- `documentView` – The view the scroll view scrolls within its content view
- `addFloatingSubview(_:for:)` – Adds a floating subview to the document view

### Managing Scrollers
- `horizontalScroller` – The scroll view's horizontal scroller
- `hasHorizontalScroller` – A Boolean that indicates whether the scroll view has a horizontal scroller
- `verticalScroller` – The scroll view's vertical scroller
- `hasVerticalScroller` – A Boolean that indicates whether the scroll view has a vertical scroller
- `autohidesScrollers` – A Boolean that indicates whether the scroll view automatically hides its scroll bars

### Managing Graphics Attributes
- `backgroundColor` – The color of the content view's background
- `drawsBackground` – A Boolean that indicates whether the scroll view draws its background
- `borderType` – A value that specifies the appearance of the scroll view's border
- `documentCursor` – The content view's document cursor

### Scrolling Behavior
- `lineScroll` – The scroll view's line by line scroll amount
- `pageScroll` – The amount of the document view kept visible when scrolling page by page
- `scrollsDynamically` – A Boolean that indicates whether the scroll view redraws its document view while scrolling

### Magnification
- `allowsMagnification` – Allows the user to magnify the scroll view
- `magnification` – The amount by which the content is currently scaled
- `minMagnification` – The minimum value to which the content can be magnified
- `maxMagnification` – The maximum value to which the content can be magnified
- `magnify(toFit:)` – Magnifies the content view proportionally such that the given rectangle fits centered in the scroll view
- `setMagnification(_:centeredAt:)` – Magnify the content by the given amount and center the result on the given point

### Rulers
- `hasHorizontalRuler` – A Boolean that indicates whether the scroll view keeps a horizontal ruler object
- `hasVerticalRuler` – A Boolean that indicates whether the scroll view keeps a vertical ruler object
- `horizontalRulerView` – The scroll view's horizontal ruler view
- `verticalRulerView` – The scroll view's vertical ruler view
- `rulersVisible` – A Boolean that indicates whether the scroll view displays its rulers

## Initializers

- `init(frame:)`
- `init(coder:)`

## See Also

### Views
- `NSScroller` – An object that controls scrolling of a document view within a scroll view
- `NSClipView` – An object that clips a document view to a scroll view's frame
