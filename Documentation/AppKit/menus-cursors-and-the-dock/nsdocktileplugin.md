---
url: https://developer.apple.com/documentation/appkit/nsdocktileplugin
framework: AppKit
category: Menus, cursors, and the Dock
title: NSDockTilePlugIn
kind: protocol
captured: 2026-05-02
---

# NSDockTilePlugIn

A set of methods implemented by plug-ins that allow an app’s Dock tile to be customized while the app is not running.

## Declaration

```swift
protocol NSDockTilePlugIn : NSObjectProtocol
```

### Overview

Customizing an application’s Dock tile when the application itself is not running requires that you write a plug-in. The plug-in’s principal class must implement the `NSDockTilePlugIn` protocol.

The name of the plugin is indicated by a `NSDockTilePlugIn` key in the application’s `Info.plist` file.

The plugin is loaded in a system process at login time or when the application tile is added to the Dock.  When the plugin is loaded, the principal class’ implementation of `NSDockTilePlugIn/setDockTile(_:)` is invoked, passing an `NSDockTile` for the plug-in to customize.  If the principal class implements `NSDockTilePlugIn/dockMenu()` it is invoked whenever the user causes the application’s dock menu to be shown.  When the dock tile is no longer valid (for example,. the application has been removed from the dock) -`NSDockTilePlugIn/setDockTile(_:)` is invoked with `nil`.





## Relationships

**Inherits From**: `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Setting the Dock Tile

- `setDockTile(_:)`

### Getting the Dock Tile Menu

- `dockMenu()`

## See Also

- `NSDockTile`
