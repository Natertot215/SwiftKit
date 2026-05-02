---
url: https://developer.apple.com/documentation/appkit/nsimageview
framework: AppKit
category: Views and controls
title: NSImageView
kind: class
captured: 2026-05-02
---

# NSImageView

A display of image data in a frame.

## Declaration

```swift
class NSImageView
```

### Overview

Image views can be static or editable. A static image view only displays the image that you specify. An editable image view object lets the user change the displayed image. You can also configure an image view to allow copying, pasting, deleting, and dragging of the image.

> **NOTE:**  An image view calls its action method only when the user drags an image into the image view’s bounds, and the image view must be editable to receive dragged images. If you want to display an image and respond to clicks in the image, use an `https://developer.apple.com/library/archive/technotes/tn2219/_index.html#//apple_ref/doc/uid/DTS10004624-CH1-SUBSECTION12` object instead.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityImage`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating the view

- `init(image:)`

### Configuring the cell

- `NSImageCell`

### Specifying the image

- `symbolConfiguration`
- `image`

### Specifying the visual characteristics

- `imageFrameStyle`
- `imageAlignment`
- `imageScaling`
- `animates`
- `contentTintColor`

### Specifying the dynamic range

- `imageDynamicRange`
- `preferredImageDynamicRange`
- `defaultPreferredImageDynamicRange`

### Responding to user events

- `isEditable`
- `allowsCutCopyPaste`

### Configuring symbol effects

- `addSymbolEffect(_:options:animated:)`
- `addSymbolEffect(_:options:animated:)`
- `addSymbolEffect(_:options:animated:)`
- `setSymbolImage(_:contentTransition:options:)`
- `removeSymbolEffect(ofType:options:animated:)`
- `removeSymbolEffect(ofType:options:animated:)`
- `removeSymbolEffect(ofType:options:animated:)`
- `removeAllSymbolEffects(options:animated:)`

## See Also

- `Responding to control-based events using target-action`
- `NSButton`
- `NSColorWell`
- `Combo Box`
- `NSComboButton`
- `Date Picker`
- `NSLevelIndicator`
- `Path Control`
- `NSPopUpButton`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
- `Slider`
