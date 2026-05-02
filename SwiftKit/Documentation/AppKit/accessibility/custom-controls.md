---
url: https://developer.apple.com/documentation/appkit/custom-controls
framework: AppKit
category: Accessibility for AppKit
title: Custom Controls
kind: article
captured: 2026-05-01
---

# Custom Controls

## Abstract
Support accessibility for custom user interface elements by adopting a role-specific protocol and implementing its methods.

## Overview

Role-specific accessibility protocols represent the most common control types found in apps. Adopt a role-specific accessibility protocol if:

- You're creating a custom control that's a subclass of `NSView`, and you want to modify the control's behavior beyond what AppKit provides by default.
- You're working with a specialized control that doesn't subclass `NSView`. See `NSAccessibilityElement` first.

First, identify the role-specific protocol that best matches your control's intended behavior. For example, if your control is something that triggers actions when the user clicks it, adopt the `NSAccessibilityButton` protocol.

After you select an appropriate protocol, adopt that protocol. The compiler may ask you to reimplement some of the `NSAccessibilityProtocol` protocol's accessor or action methods. Simply implement these methods, and your control is ready to use.

## Topics by Category

### Buttons
- `NSAccessibilityButton` - A role-based protocol for button accessibility
- `NSAccessibilityRadioButton` - A role-based protocol for radio button accessibility
- `NSAccessibilitySwitch` - A role-based protocol for switch accessibility
- `NSAccessibilityCheckBox` - A role-based protocol for checkbox accessibility

### Value Controls
- `NSAccessibilityStepper` - A role-based protocol for stepper accessibility
- `NSAccessibilitySlider` - A role-based protocol for slider accessibility

### Groups
- `NSAccessibilityGroup` - A role-based protocol for container elements

### Lists
- `NSAccessibilityTable` - A role-based protocol for table view accessibility
- `NSAccessibilityList` - A role-based protocol for list view accessibility
- `NSAccessibilityOutline` - A role-based protocol for outline view accessibility
- `NSAccessibilityRow` - A role-based protocol for row accessibility

### Text
- `NSAccessibilityStaticText` - A role-based protocol for static text accessibility
- `NSAccessibilityNavigableStaticText` - A role-based protocol for navigable static text

### Images and Color
- `NSAccessibilityImage` - A role-based protocol for image accessibility
- `NSAccessibilityColor` - A role-based protocol for color accessibility

### Loading
- `NSAccessibilityProgressIndicator` - A role-based protocol for progress indicator accessibility
- `NSAccessibilityElementLoading` - A role-based protocol for loading element accessibility

### Dynamic Elements
- `NSAccessibilityContainsTransientUI` - A role-based protocol for dynamic UI changes

### Layout Elements
- `NSAccessibilityLayoutArea` - A role-based protocol for layout area accessibility
- `NSAccessibilityLayoutItem` - A role-based protocol for layout item accessibility

### Supporting Types
- `NSAccessibilityElementProtocol` - A role-based protocol for basic accessibility interaction

## See Also
- Accessibility Functions - Global accessibility functions for custom views and controls
