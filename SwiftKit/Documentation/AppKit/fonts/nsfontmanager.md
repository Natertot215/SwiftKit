---
url: https://developer.apple.com/documentation/appkit/nsfontmanager
framework: AppKit
category: Fonts
title: NSFontManager
kind: class
captured: 2026-05-02
---

# NSFontManager

The center of activity for the font-conversion system.

## Declaration

```swift
class NSFontManager
```

### Overview

The font manager records the currently selected font, updates the Font panel and Font menu to reflect the selected font, initiates font changes, and converts fonts in response to requests from text-bearing objects. In a more prosaic role, `NSFontManager` can be queried for the fonts available to the application and for the particular attributes of a font, such as whether it’s condensed or extended.

You typically set up a font manager and the Font menu using Interface Builder. However, you can also do so programmatically by getting the shared font manager instance and having it create the standard Font menu at runtime:

```objc
NSFontManager *fontManager = [NSFontManager sharedFontManager];
NSMenu *fontMenu = [fontManager fontMenu:YES];
```

You can then add the Font menu to your app’s main menu. After the Font menu is installed, your app automatically gains the functionality of both the Font menu and the Font panel.

Font collections are managed by `NSFontManager`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSMenuItemValidation`, `NSObjectProtocol`

## Availability

- macOS ?

## Topics

### Getting the Shared Font Manager

- `shared`

### Changing the Default Font Conversion Classes

- `setFontManagerFactory(_:)`
- `setFontPanelFactory(_:)`

### Getting Available Fonts

- `availableFonts`
- `availableFontFamilies`
- `availableFontNames(with:)`
- `availableMembers(ofFontFamily:)`

### Setting and Examining the Selected Font

- `setSelectedFont(_:isMultiple:)`
- `selectedFont`
- `isMultiple`
- `sendAction()`
- `localizedName(forFamily:face:)`

### Sending Action Methods

- `addFontTrait(_:)`
- `removeFontTrait(_:)`
- `modifyFont(_:)`
- `modifyFontViaPanel(_:)`
- `orderFrontStylesPanel(_:)`
- `orderFrontFontPanel(_:)`
- `NSFontAction`

### Converting Fonts Automatically

- `convert(_:)`

### Converting Fonts Manually

- `convert(_:toFace:)`
- `convert(_:toFamily:)`
- `convert(_:toHaveTrait:)`
- `convert(_:toNotHaveTrait:)`
- `convert(_:toSize:)`
- `convertWeight(_:of:)`
- `currentFontAction`
- `convertFontTraits(_:)`

### Getting a Particular Font

- `font(withFamily:traits:weight:size:)`

### Examining Fonts

- `traits(of:)`
- `fontNamed(_:hasTraits:)`
- `NSFontTraitMask`
- `weight(of:)`

### Managing the Font Panel and Font Menu

- `isEnabled`
- `fontPanel(_:)`
- `setFontMenu(_:)`
- `fontMenu(_:)`

### Accessing the Action Property

- `action`
- `target`

### Setting Attributes

- `setSelectedAttributes(_:isMultiple:)`
- `convertAttributes(_:)`

### Deprecated

- `Deprecated Symbols`

## See Also

- `NSFontCollection`
- `NSMutableFontCollection`
- `NSFontCollectionOptions`
