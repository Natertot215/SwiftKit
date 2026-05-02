---
url: https://developer.apple.com/documentation/appkit/nsscrubbertextitemview
framework: AppKit
category: Touch Bar
title: NSScrubberTextItemView
kind: class
captured: 2026-05-02
---

# NSScrubberTextItemView

A concrete view subclass for displaying text for an item in a scrubber.

## Declaration

```swift
class NSScrubberTextItemView
```

### Overview

Provide the text you want to display in the scrubber item to the `NSScrubberTextItemView/title` property. If you want finer control over the appearance of the text, you can access the underlying text field using the `NSScrubberTextItemView/textField` property.





## Relationships

**Inherits From**: `NSScrubberItemView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.12.2

## Topics

### Providing text content

- `title`
- `textField`

## See Also

- `NSScrubberItemView`
- `NSScrubberArrangedView`
- `NSScrubberImageItemView`
- `NSScrubberSelectionStyle`
- `NSScrubberSelectionView`
