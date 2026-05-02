---
url: https://developer.apple.com/documentation/appkit/nsstackview
framework: AppKit
category: Views and controls
title: NSStackView
kind: class
captured: 2026-05-01
---

# NSStackView

## Declaration

```swift
class NSStackView : NSView
```

## Abstract

A view that arranges an array of views horizontally or vertically and updates their placement and sizing when the window size changes.

## Overview

A stack view employs Auto Layout (the system's constraint-based layout feature) to arrange and align an array of views according to your specification. To use a stack view effectively, you need to understand the basics of Auto Layout constraints as described in the Auto Layout Guide.

### Basic Features of Stack Views

A stack view supports vertical and horizontal layouts and interacts dynamically with window resizing and Cocoa animations. You can easily reconfigure the contents of a stack view at runtime. After you create and configure a stack view in Interface Builder, you can add or remove views dynamically without explicitly working with layout constraints. For example, if you configure a stack view with three checkboxes and dynamically add a fourth, the stack view automatically adds constraints as needed, according to the stack view's configuration.

Stack views are nestable: a stack view is a valid element in the `views` array of another stack view.

> **Important:** Do not add views or constraints to a stack view's private views. A stack view's private views might change in future versions of macOS and are not guaranteed to be encoded or decoded with the `NSCoder` class.

### Layout Direction and Gravity Areas

A stack view has three so-called *gravity areas* that each identify a section of the stack view's layout. A horizontal stack view, which is the default type, has a leading, a center, and a trailing gravity area. The ordering of these areas depends on the value of the stack view's `userInterfaceLayoutDirection` property (inherited from the `NSView` class).

To specify vertical layout, use the `orientation` property and the `.vertical` constant from the `NSUserInterfaceLayoutOrientation` enumeration.

### View Detachment and Hiding

A stack view can automatically detach and reattach its views in response to layout changes. A view in a detached state is not present in the stack view's view hierarchy, but it still consumes memory. A view that is hidden, but not detached, remains part of the view hierarchy and continues to participate in Auto Layout, but it is not visible and doesn't receive input events.

To allow views to detach, set the *clipping resistance* for a stack view to a value lower than its default of `NSLayoutConstraint.Priority.required`.

You can influence which views detach first by setting the *visibility priority* for each view. A view with a lower visibility priority detaches before one with a higher priority, and reattaches after it.

## Inheritance

Inherits from: `NSView`

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
- `NSTouchBarProvider`
- `NSUserActivityRestoring`
- `NSUserInterfaceItemIdentification`
- `Sendable`

## See Also

- Organizing Your User Interface with a Stack View
- `NSStackViewDelegate` - A set of methods you use to respond to a stack view detaching and reattaching views.
