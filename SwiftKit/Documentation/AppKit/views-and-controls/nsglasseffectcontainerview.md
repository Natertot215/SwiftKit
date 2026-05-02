---
url: https://developer.apple.com/documentation/appkit/nsglasseffectcontainerview
framework: AppKit
category: Views and controls
title: NSGlassEffectContainerView
kind: class
captured: 2026-05-02
---

# NSGlassEffectContainerView

A view that efficiently merges descendant glass effect views together when they are within a specified proximity to each other.

## Declaration

```swift
class NSGlassEffectContainerView
```

### Overview

> **TIP:** Using a glass effect container view can improve performance by reducing the number of passes required to render similar glass effect views.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 26.0

## Topics

### Instance Properties

- `contentView`
- `spacing`

## See Also

- `NSGlassEffectView`
- `NSGlassEffectView.Style`
