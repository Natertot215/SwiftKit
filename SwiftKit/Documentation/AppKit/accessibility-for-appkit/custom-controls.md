---
url: https://developer.apple.com/documentation/appkit/custom-controls
framework: AppKit
category: Accessibility for AppKit
title: Custom Controls
kind: collectionGroup
captured: 2026-05-02
---

# Custom Controls

Support accessibility for custom user interface elements by adopting a role-specific protocol and implementing its methods.



### Overview

Role-specific accessibility protocols represent the most common control types found in apps. Adopt a role-specific accessibility protocol if:

- You’re creating a custom control that’s a subclass of `NSView`, and you want to modify the control’s behavior beyond what AppKit provides by default.
- You’re working with a specialized control that doesn’t subclass `NSView`. See `NSAccessibilityElement-swift.class` first.

First, identify the role-specific protocol that best matches your control’s intended behavior. For example, if your control is something that triggers actions when the user clicks it, adopt the `NSAccessibilityButton` protocol.

After you select an appropriate protocol, adopt that protocol. The compiler may ask you to reimplement some of the `NSAccessibilityProtocol` protocol’s accessor or action methods. Simply implement these methods, and your control is ready to use.









## Topics

### Buttons

- `NSAccessibilityButton`
- `NSAccessibilityRadioButton`
- `NSAccessibilitySwitch`
- `NSAccessibilityCheckBox`

### Value Controls

- `NSAccessibilityStepper`
- `NSAccessibilitySlider`

### Groups

- `NSAccessibilityGroup`

### Lists

- `NSAccessibilityTable`
- `NSAccessibilityList`
- `NSAccessibilityOutline`
- `NSAccessibilityRow`

### Text

- `NSAccessibilityStaticText`
- `NSAccessibilityNavigableStaticText`

### Images and Color

- `NSAccessibilityImage`
- `NSAccessibilityColor`

### Loading

- `NSAccessibilityProgressIndicator`
- `NSAccessibilityElementLoading`

### Dynamic Elements

- `NSAccessibilityContainsTransientUI`

### Layout Elements

- `NSAccessibilityLayoutArea`
- `NSAccessibilityLayoutItem`

### Supporting Types

- `NSAccessibilityElementProtocol`

## See Also

- `Accessibility Functions`
