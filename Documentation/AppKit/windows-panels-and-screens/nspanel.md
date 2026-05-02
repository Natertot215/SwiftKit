---
url: https://developer.apple.com/documentation/appkit/nspanel
framework: AppKit
category: Windows, panels, and screens
title: NSPanel
kind: class
captured: 2026-05-02
---

# NSPanel

A special kind of window that typically performs a function that is auxiliary to the main window.

## Declaration

```swift
@MainActor class NSPanel
```

### Overview

For details about how panels work (especially to find out how their behavior differs from window behavior), see `https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/WinPanel/Concepts/UsingPanels.html#//apple_ref/doc/uid/20000224`.





## Relationships

**Inherits From**: `NSWindow`

**Inherited By**: `NSColorPanel`, `NSFontPanel`, `NSSavePanel`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring Panels

- `isFloatingPanel`
- `becomesKeyOnlyIfNeeded`
- `worksWhenModal`

### Constants

- `Alert Panel Return Values`
- `Modal Panel Return Values`
- `Style Masks`

## See Also

- `NSWindow`
- `NSWindowDelegate`
- `NSWindowTab`
- `NSWindowTabGroup`
