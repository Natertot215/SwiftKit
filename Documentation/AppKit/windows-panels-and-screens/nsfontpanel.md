---
url: https://developer.apple.com/documentation/appkit/nsfontpanel
framework: AppKit
category: Windows, panels, and screens
title: NSFontPanel
kind: class
captured: 2026-05-02
---

# NSFontPanel

The Font panel—a user interface object that displays a list of available fonts, letting the user preview them and change the font used to display text.

## Declaration

```swift
class NSFontPanel
```

### Overview

Actual changes to the font panel are made through conversion messages sent to the shared `NSFontManager` instance. There’s only one Font panel for each app.





## Relationships

**Inherits From**: `NSPanel`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSMenuItemValidation`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Getting the Font Panel

- `shared`
- `sharedFontPanelExists`

### Enabling Font Changes

- `isEnabled`
- `reloadDefaultFontFamilies()`

### Updating the Font Panel

- `setPanelFont(_:isMultiple:)`

### Converting Fonts

- `convert(_:)`

### Working in Modal Loops

- `worksWhenModal`

### Setting an Accessory View

- `accessoryView`

### Structures

- `NSFontPanel.ModeMask`

## See Also

- `NSFontPanel.ModeMask`
- `NSFontPanelValidation`
- `NSFontChanging`
