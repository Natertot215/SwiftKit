---
url: https://developer.apple.com/documentation/appkit/nsscrubberselectionstyle
framework: AppKit
category: Touch Bar
title: NSScrubberSelectionStyle
kind: class
captured: 2026-05-02
---

# NSScrubberSelectionStyle

An abstract class that provides decorative accessory views for selected and highlighted items within a scrubber control.

## Declaration

```swift
@MainActor class NSScrubberSelectionStyle
```

### Overview

Choose a selection style (`NSScrubberSelectionStyle/outlineOverlay` or `NSScrubberSelectionStyle/roundedBackground`), or create a custom selection style by subclassing `NSScrubberSelectionStyle` and overriding `NSScrubberSelectionStyle/makeSelectionView()`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.12.2

## Topics

### Using built-in styles

- `outlineOverlay`
- `roundedBackground`

### Creating a selection style

- `init()`
- `init(coder:)`
- `makeSelectionView()`

## See Also

- `NSScrubberItemView`
- `NSScrubberArrangedView`
- `NSScrubberImageItemView`
- `NSScrubberSelectionView`
- `NSScrubberTextItemView`
