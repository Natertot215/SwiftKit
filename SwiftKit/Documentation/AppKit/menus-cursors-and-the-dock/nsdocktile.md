---
url: https://developer.apple.com/documentation/appkit/nsdocktile
framework: AppKit
category: Menus, cursors, and the Dock
title: NSDockTile
kind: class
captured: 2026-05-02
---

# NSDockTile

The visual representation of your app’s miniaturized windows and app icon as they appear in the Dock.

## Declaration

```swift
class NSDockTile
```

### Overview

You do not create Dock tile objects explicitly in your app. Instead, you retrieve the Dock tile for an existing window or for the app by calling that object’s `NSWindow/dockTile` method. Also, you do not subclass the `NSDockTile` class; instead, you use the methods of the class to make the following customizations:

- Badge the tile with a custom string.
- Remove or show the application icon badge.
- Draw the tile content yourself.

If you decide to draw the tile content yourself, you must provide a custom content view to handle the drawing.

#### Application Dock Tiles

An application Dock tile defaults to display the application’s `NSApplication/applicationIconImage`.

The application Dock tile never shows a smaller application icon badge.

Whether using the default or custom view, the application Dock tile may be badged with a short custom string.

#### Window Dock Tiles

A window Dock tile defaults to display a miniaturized version of the windows contents with a badge derived from the application Dock icon, including any customized application Dock icon. The default window Dock tile image may not be badged with a custom string.

A window Dock tile can use a custom view to draw the Dock icon. If a custom view is used, no application badge will be added, but the text label will be overlaid on top of the icon.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.5

## Topics

### Drawing the Tile’s Content

- `contentView`

### Getting the Tile Information

- `size`
- `owner`

### Applying Badge Icons to the Tile

- `showsApplicationBadge`
- `badgeLabel`

### Updating the Dock Tile

- `display()`

### Constants

- `Dock Tile Plug-In Support Version`

## See Also

- `NSDockTilePlugIn`
