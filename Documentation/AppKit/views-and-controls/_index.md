---
url: https://developer.apple.com/documentation/appkit/views-and-controls
framework: AppKit
category: Views and controls
title: Views and Controls
kind: article
captured: 2026-05-01
---

# Views and Controls

## Overview

Views and controls are the building blocks of your app's user interface. This page documents the foundational concepts and available components in AppKit.

## Abstract

Present your content onscreen and handle user input and events.

## Key Concepts

### View Hierarchy

Views can host other views, creating a containment relationship:
- **Superview**: The host view that contains other views
- **Subview**: The embedded view contained within a superview

View hierarchies make it easier to manage views and organize your user interface.

### What You Can Do With Views

- Respond to touches and other events (either directly or in coordination with gesture recognizers)
- Draw custom content using Core Graphics
- Respond to focus changes
- Animate the size, position, and appearance attributes of the view using Core Animation

### Best Practices

Favor AppKit views and controls whenever possible. These components adapt automatically to system changes, and many support appearance customizations to support the look and feel you want in your app. When AppKit doesn't provide the exact view or control you need, you can create a custom view.

## Core Classes

### NSView
`NSView` is the root class for all views and defines their common behavior.

### NSControl
`NSControl` defines additional behaviors that are specific to buttons, switches, and other views designed for user interactions.

## Topic Sections

### View Fundamentals
- `NSView`
- `NSControl`
- `NSCell`
- `NSActionCell`

### Container Views
Use container views to arrange the views of your interface and to facilitate navigation among those views:
- Grid View
- `NSSplitView`
- Stack View (`NSStackView`)
- `NSTabView`
- Scroll View

### Content Views
Use content views to organize and display your app's data:
- Browser View
- Collection View
- Outline View
- Table View
- `NSTextView`

### Controls
Use controls to handle specific types of user interactions. Controls are specialized views that use the target-action design pattern:
- `NSButton`
- `NSColorWell`
- Combo Box
- `NSComboButton`
- Date Picker
- `NSImageView`
- `NSLevelIndicator`
- Path Control
- `NSPopUpButton`
- `NSProgressIndicator`
- `NSRuleEditor`
- `NSPredicateEditor`
- Search Field
- `NSSegmentedControl`
- Slider
- `NSStepper`
- Text Field
- Token Field
- Toolbar
- `NSSwitch`
- `NSMatrix`

### Visual Effects
- `NSVisualEffectView` - Adds translucency and vibrancy effects
- `NSBox` - Stylized rectangular box with optional title
- Liquid Glass Effects (`NSGlassEffectView`, `NSGlassEffectContainerView`)

### UI Validation
- `NSUserInterfaceValidations`
- `NSValidatedUserInterfaceItem`

## Related Resources

For additional information about how to use views and controls, see the [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/components/all-components).
