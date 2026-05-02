---
url: https://developer.apple.com/documentation/appkit/nsbox
framework: AppKit
category: Views and controls
title: NSBox
kind: class
captured: 2026-05-02
---

# NSBox

A stylized rectangular box with an optional title.

## Declaration

```swift
class NSBox
```

### Overview

Use box objects to visually group the contents of your window. For example, you might use boxes to group related views. Use an `NSBox` object to configure the appearance of the box.

#### Subclassing Notes

An `NSBox` object is a view that draws a line around its rectangular bounds and that displays a title on or near the line (or might display neither line nor title). You can adjust the style of the line (bezel, grooved, or plain) as well as the placement and font of the title. An `NSBox` also has a content view to which other views can be added; it thus offers a way for an application to group related views. You could create a custom subclass of `NSBox` that alters or augments its appearance or that modifies its grouping behavior. For example, you might add color to the lines or background, add a new line style, or have the views in the group automatically snap to an invisible grid when added.

##### Methods to Override

You must override the `NSView/draw(_:)` method (inherited from `NSView`) if you want to customize the appearance of your `NSBox` objects. Depending on the visual effect you’re trying to achieve, you may have to invoke `super`‘s implementation first. For example, if you are compositing a small image in a corner of the box, you would invoke the superclass implementation first. If you’re adding a new style of line, you would provide a way to store a request for this line type (such as a boolean instance variable and related accessor methods). Then, in `NSView/draw(_:)`, if a request for this line type exists, you would draw the entire view yourself (that is, without calling `super`). Otherwise, you would invoke the superclass implementation.

If you wish to change grouping behavior or other behavioral characteristics of the `NSBox` class, consider overriding `NSBox/contentView`, `NSBox/sizeToFit()`, or `NSView/addSubview(_:)` (inherited from `NSView`).

##### Special Considerations

If you are drawing the custom `NSBox` entirely by yourself, and you want it to look exactly like the superclass object (except for your changes), it may take some effort and time to get the details right.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring Boxes

- `borderRect`
- `boxType`
- `borderType`
- `isTransparent`
- `title`
- `titleFont`
- `titlePosition`
- `titleCell`
- `titleRect`

### Customizing

- `borderColor`
- `borderWidth`
- `cornerRadius`
- `fillColor`

### Managing Content

- `contentView`
- `contentViewMargins`

### Sizing

- `setFrameFromContentFrame(_:)`
- `sizeToFit()`

### Constants

- `NSBox.TitlePosition`
- `NSBox.BoxType`

## See Also

- `NSVisualEffectView`
