---
url: https://developer.apple.com/documentation/appkit/nsmenuitem
framework: AppKit
category: Menus, cursors, and the Dock
title: NSMenuItem
kind: class
captured: 2026-05-02
---

# NSMenuItem

A command item in an app menu.

## Declaration

```swift
class NSMenuItem
```

### Overview

The `NSMenuItem` class includes some private functionality needed to maintain binary compatibility with other components of Cocoa. Because of this fact, you can’t replace the `NSMenuItem` class with a different class, but you can subclass it if necessary.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `NSValidatedUserInterfaceItem`

## Availability

- macOS ?

## Topics

### Creating a menu item

- `init(title:action:keyEquivalent:)`
- `init(coder:)`

### Enabling a menu item

- `isEnabled`

### Managing hidden status

- `isHidden`
- `isHiddenOrHasHiddenAncestor`

### Managing the target and action

- `target`
- `action`

### Managing the title

- `title`
- `attributedTitle`

### Managing the tag

- `tag`

### Managing the state

- `state`

### Managing the image

- `image`
- `onStateImage`
- `offStateImage`
- `mixedStateImage`

### Managing the badge

- `badge`

### Managing the section header

- `isSectionHeader`

### Managing submenus

- `submenu`
- `hasSubmenu`
- `parent`

### Managing the separator item

- `isSeparatorItem`
- `separator()`

### Managing the owning menu

- `menu`

### Managing key equivalents

- `keyEquivalent`
- `keyEquivalentModifierMask`

### Managing mnemonics

- `setTitleWithMnemonic(_:)`

### Managing user key equivalents

- `usesUserKeyEquivalents`
- `userKeyEquivalent`
- `allowsAutomaticKeyEquivalentLocalization`
- `allowsAutomaticKeyEquivalentMirroring`
- `allowsKeyEquivalentWhenHidden`

### Managing alternates

- `isAlternate`

### Managing indentation levels

- `indentationLevel`

### Managing tool tips

- `toolTip`

### Representing an object

- `representedObject`

### Managing the view

- `view`

### Getting highlighted status

- `isHighlighted`

### Identifying the Continuity Camera menu item

- `importFromDeviceIdentifier`

### Type Methods

- `sectionHeader(title:)`
- `sectionHeader(withTitle:)`

### Instance Properties

- `subtitle`

### Type Properties

- `writingToolsItems`

## See Also

- `NSMenu`
- `NSMenuItemBadge`
- `NSMenuDelegate`
