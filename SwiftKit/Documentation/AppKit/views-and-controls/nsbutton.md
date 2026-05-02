---
url: https://developer.apple.com/documentation/appkit/nsbutton
framework: AppKit
category: Views and controls
title: NSButton
kind: class
captured: 2026-05-02
---

# NSButton

A control that defines an area on the screen that a user clicks to trigger an action.

## Declaration

```swift
class NSButton
```

### Overview

Buttons are a standard control for initiating actions within your app. You can configure buttons with many different visual styles, but the behavior is the same. When a user clicks it, a button calls the action method of its associated target object. (If you configure a button as continuous, it calls its action method at timed intervals until the user releases the mouse button or the cursor leaves the button boundaries). You use the action method to perform your app-specific tasks.

There are multiple types of buttons, each with a different user interface and behavior. The `NSButtonCell` class defines the button types, and calling the `NSButton/setButtonType(_:)` method configures them.

If you configure it as an accelerator button (type `NSAcceleratorButton` or `NSMultiLevelAcceleratorButton`), you can set a button to send action messages when changes in pressure occur when the user clicks the button.

Buttons can either have two states (on and off) or three states (on, off, and mixed). You enable a three-state button by calling the `NSButton/allowsMixedState` method. On and off (also referred to as alternate and normal) states indicate that the user clicked or didn’t click the button. Mixed is typically used for checkboxes or radio buttons, which allow for an additional intermediate state. For example, suppose the state of a checkbox denotes whether a text field contains bold text. If all text in the text field is bold, then the checkbox is on. If none of the text is bold, then the checkbox is off. If some of the text is bold, then the checkbox is mixed.

For most types of buttons, the value of the button matches its state—the value is `1` for on, `0` for off, or `-1` for mixed. For pressure-sensitive buttons, the value of the button indicates pressure level instead.

`NSButton` and `NSMatrix` both provide a control view, which displays an `NSButtonCell` object. However, while a matrix requires you to access the button cell objects directly, most button class methods act as “covers” for identically declared button cell methods. In other words, the implementation of the button method invokes the corresponding button cell method for you, allowing you to be unconcerned with the existence of the button cell. The only button cell methods that don’t have covers relate to the font you use to display the key equivalent and to specific methods for highlighting or showing the state of the button.





## Relationships

**Inherits From**: `NSControl`

**Inherited By**: `NSPopUpButton`, `NSStatusBarButton`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityButton`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceCompression`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating standard buttons

- `init(checkboxWithTitle:target:action:)`
- `init(image:target:action:)`
- `init(radioButtonWithTitle:target:action:)`
- `init(title:image:target:action:)`
- `init(title:target:action:)`

### Configuring the cell

- `NSButtonCell`

### Configuring buttons

- `setButtonType(_:)`
- `getPeriodicDelay(_:interval:)`
- `setPeriodicDelay(_:interval:)`
- `contentTintColor`
- `hasDestructiveAction`
- `alternateTitle`
- `attributedTitle`
- `attributedAlternateTitle`
- `title`
- `symbolConfiguration`
- `sound`
- `isSpringLoaded`
- `maxAcceleratorLevel`
- `tintProminence`
- `NSTintProminence`
- `borderShape`
- `NSControl.BorderShape`

### Configuring button images

- `image`
- `alternateImage`
- `imagePosition`
- `NSControl.ImagePosition`
- `isBordered`
- `isTransparent`
- `bezelStyle`
- `bezelColor`
- `showsBorderOnlyWhileMouseInside`
- `imageHugsTitle`
- `imageScaling`

### Managing button compression

- `activeCompressionOptions`
- `compress(withPrioritizedCompressionOptions:)`
- `minimumSize(withPrioritizedCompressionOptions:)`

### Managing button state

- `allowsMixedState`
- `state`
- `setNextState()`
- `highlight(_:)`

### Accessing key equivalents

- `keyEquivalent`
- `keyEquivalentModifierMask`

### Handling keyboard events

- `performKeyEquivalent(with:)`

## See Also

- `Responding to control-based events using target-action`
- `NSColorWell`
- `Combo Box`
- `NSComboButton`
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
