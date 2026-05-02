---
url: https://developer.apple.com/documentation/appkit/nsbackgroundextensionview
framework: AppKit
category: Views and controls
title: NSBackgroundExtensionView
kind: class
captured: 2026-05-02
---

# NSBackgroundExtensionView

A view that extends content to fill its own bounds.

## Declaration

```swift
class NSBackgroundExtensionView
```

### Overview

A background extension view can be laid out to extend outside the safe area, such as under the titlebar, sidebar, or inspector. By default it lays out its content to stay within the safe area, and uses modifications of the content along the edges to fill the container view.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 26.0

## Topics

### Instance Properties

- `automaticallyPlacesContentView`
- `contentView`
