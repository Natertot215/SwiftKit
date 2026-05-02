---
url: https://developer.apple.com/documentation/appkit/nstoolbar
framework: AppKit
category: Views and controls
title: NSToolbar
kind: class
captured: 2026-05-02
---

# NSToolbar

An object that manages the space above your app’s custom content and either below or integrated with the window’s title bar.

## Declaration

```swift
@MainActor class NSToolbar
```

### Overview

An `NSToolbar` object manages the controls and views that apply to the main window’s content area. Toolbars provide convenient access to the commands and features people use most often. Toolbars are also user-configurable and support the display of an interactive customization palette.

Create and configure your toolbar programmatically or using Interface Builder. Add items to the toolbar that correspond to the commands you want to feature in your window. Each item has a corresponding `NSToolbarItem` object, which you use to make changes. Each toolbar manages a unique set of items, but you can synchronize the items and state of multiple toolbars by assigning the same value to their `NSToolbar/identifier-swift.property` properties.

For more information about how to use toolbars, see `integrating-a-toolbar-and-touch-bar-into-your-app`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`, `Sendable`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.1
- macOS ?

## Topics

### Creating an toolbar object

- `init(identifier:)`
- `init()`

### Configuring the toolbar contents

- `delegate`
- `NSToolbarDelegate`

### Getting the toolbar’s identity

- `identifier`
- `NSToolbar.Identifier`

### Configuring the toolbar’s behavior

- `isVisible`
- `displayMode`
- `NSToolbar.DisplayMode`
- `showsBaselineSeparator`
- `allowsUserCustomization`
- `allowsExtensionItems`

### Managing items on the toolbar

- `items`
- `visibleItems`
- `centeredItemIdentifiers`
- `selectedItemIdentifier`
- `willAddItemNotification`
- `didRemoveItemNotification`
- `insertItem(withItemIdentifier:at:)`
- `removeItem(at:)`

### Autosaving the configuration

- `autosavesConfiguration`
- `configuration`
- `setConfiguration(_:)`

### Displaying the customization palette

- `runCustomizationPalette(_:)`
- `customizationPaletteIsRunning`

### Validating visible items

- `validateVisibleItems()`

### Deprecated

- `centeredItemIdentifier`
- `fullScreenAccessoryView`
- `fullScreenAccessoryViewMinHeight`
- `fullScreenAccessoryViewMaxHeight`
- `sizeMode`
- `NSToolbar.SizeMode`

### Instance Properties

- `allowsDisplayModeCustomization`
- `itemIdentifiers`

### Instance Methods

- `removeItem(identifier:)`

## See Also

- `Integrating a Toolbar and Touch Bar into Your App`
- `NSToolbarItemValidation`
