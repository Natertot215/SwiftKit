---
url: https://developer.apple.com/documentation/appkit/nscombobutton
framework: AppKit
category: Views and controls
title: NSComboButton
kind: class
captured: 2026-05-02
---

# NSComboButton

A button with a pull-down menu and a default action.

## Declaration

```swift
class NSComboButton
```

### Overview

An `NSComboButton` object is a button that displays a title string, image, and an optional control for displaying a menu. Use this control in places where you want to offer a button with a default action and one or more alternative actions. Clicking the title or image executes the default action you provide, and clicking the menu control displays a menu for selecting a different action. If you configure the button to hide the menu control, a long-press gesture displays the menu.

After you create a combo button programmatically or in Interface Builder, choose the button `NSComboButton/style-swift.property` you want and add a title or image for your content. A combo button has a default action, which you specify at creation time. You can also change that action later using the inherited `NSControl/target` and `NSControl/action` properties. To specify one or more alternative actions, configure a menu with those actions and assign it to the button’s `NSComboButton/menu` property.

This control doesn’t use an `NSCell` object for its underlying implementation. It also doesn’t support the addition of a contextual menu.





## Relationships

**Inherits From**: `NSControl`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS 13.0

## Topics

### Creating a Combo Button

- `init(title:image:menu:target:action:)`
- `init(title:menu:target:action:)`
- `init(image:menu:target:action:)`

### Configuring the Button Appearance

- `style`
- `NSComboButton.Style`
- `title`
- `image`
- `imageScaling`

### Specifying the Alternative Actions

- `menu`

## See Also

- `Responding to control-based events using target-action`
- `NSButton`
- `NSColorWell`
- `Combo Box`
- `Date Picker`
- `NSImageView`
- `NSLevelIndicator`
- `Path Control`
- `NSPopUpButton`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- `Search Field`
- `NSSegmentedControl`
- `Slider`
