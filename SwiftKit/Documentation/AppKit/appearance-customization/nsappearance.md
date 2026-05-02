---
url: https://developer.apple.com/documentation/appkit/nsappearance
framework: AppKit
category: Appearance customization
title: NSAppearance
kind: class
captured: 2026-05-02
---

# NSAppearance

An object that manages standard appearance attributes for UI elements in an app.

## Declaration

```swift
class NSAppearance
```

### Overview

An `NSAppearance` object manages how AppKit renders your app’s UI elements. Specifically, appearance objects determine which colors and images AppKit uses when drawing windows, views, and controls. Although you can use an appearance object to determine how to draw custom views and controls, a better approach is to choose colors and images that adapt automatically to the current appearance. For example, define a color asset whose actual color value changes for light and dark appearances. You can assign specific appearances to your views in Interface Builder.

The user chooses the default appearance for the system, but you can override that appearance for all or part of your app. Apps inherit the default system appearance, windows inherit their app’s appearance, and views inherit the appearance of their nearest ancestor (either a superview or window). To force a window or view to adopt an appearance, assign a specific appearance object to its `NSAppearanceCustomization/appearance` property.

When AppKit draws a control, it automatically sets the current appearance on the current thread to the control’s appearance. The current appearance influences the drawing path and return values you get when you access system fonts and colors. The current appearance also affects the appearance of text and images, such as the text and template images in a toolbar.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 10.9

## Topics

### Creating an Appearance

- `init(named:)`
- `init(appearanceNamed:bundle:)`
- `init(coder:)`

### Getting the Appearance Name

- `name`
- `NSAppearance.Name`

### Determining the Most Appropriate Appearance

- `bestMatch(from:)`

### Getting and Setting the Current Appearance

- `currentDrawing()`
- `performAsCurrentDrawingAppearance(_:)`
- `current`

### Managing Vibrancy

- `allowsVibrancy`

## See Also

- `NSAppearanceCustomization`
