---
url: https://developer.apple.com/documentation/appkit/nsscrubberimageitemview
framework: AppKit
category: Touch Bar
title: NSScrubberImageItemView
kind: class
captured: 2026-05-02
---

# NSScrubberImageItemView

A concrete view subclass for displaying images in a scrubber items.

## Declaration

```swift
class NSScrubberImageItemView
```

### Overview

Provide the image you want to display in the scrubber item to the `NSScrubberImageItemView/image` property. If you want finer control over the appearance of the image, you can access the underlying image view using the `NSScrubberImageItemView/imageView` property.

The image is scaled proportionally to fit the view’s frame. Use the `NSScrubberImageItemView/imageAlignment` property to determine how the scaled image is cropped within that frame.





## Relationships

**Inherits From**: `NSScrubberItemView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.12.2

## Topics

### Providing image content

- `image`
- `imageView`

### Configuring the appearance

- `imageAlignment`

## See Also

- `NSScrubberItemView`
- `NSScrubberArrangedView`
- `NSScrubberSelectionStyle`
- `NSScrubberSelectionView`
- `NSScrubberTextItemView`
