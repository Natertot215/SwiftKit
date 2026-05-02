---
url: https://developer.apple.com/documentation/appkit/nsscrubberselectionview
framework: AppKit
category: Touch Bar
title: NSScrubberSelectionView
kind: class
captured: 2026-05-02
---

# NSScrubberSelectionView

An abstract base class for specifying the appearance of a highlighted or selected item in a scrubber.

## Declaration

```swift
class NSScrubberSelectionView
```

### Overview

Create a subclass to customize the selection or highlight appearance of an item in your scrubber control. You need to return an instance of your subclass from the `NSScrubberSelectionStyle/makeSelectionView()` method on `NSScrubberSelectionStyle`.





## Relationships

**Inherits From**: `NSScrubberArrangedView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.12.2



## See Also

- `NSScrubberItemView`
- `NSScrubberArrangedView`
- `NSScrubberImageItemView`
- `NSScrubberSelectionStyle`
- `NSScrubberTextItemView`
