---
url: https://developer.apple.com/documentation/appkit/nsaccessibility-swift.struct/attribute
framework: AppKit
category: Accessibility for AppKit
title: NSAccessibility.Attribute
kind: struct
captured: 2026-05-01
---

# NSAccessibility.Attribute

## Declaration

```swift
struct Attribute
```

## Abstract

Constants that describe attributes.

## Overview

`NSAccessibility.Attribute` is a structure that contains static properties representing accessibility attributes for macOS applications. These attributes define various characteristics of user interface elements that assistive technologies need to understand and interact with the UI.

## Availability

- **macOS** (available)

## Conformances

- `Equatable`
- `Hashable`
- `Sendable`

## Common Attributes

The structure provides numerous static properties for different attribute types, including:

### Element Information
- `role` - The element's type (e.g., radio button)
- `roleDescription` - A localized description of the role
- `subrole` - A more specific element type
- `title` - The visible text of the element
- `description` - The element's purpose
- `identifier` - The identity of the element

### Hierarchy & Structure
- `parent` - The element's parent in the hierarchy
- `children` - Child elements (deprecated)
- `childrenInNavigationOrderAttribute` - Children in navigation order
- `window` - The containing window
- `topLevelUIElement` - The top-level containing element

### Value & State
- `value` - The current value
- `minValue` / `maxValue` - Value range
- `enabled` - Whether the element is enabled
- `focused` - Whether the element has focus
- `selected` / `selectedChildren` - Selected items
- `expanded` / `disclosing` - Expansion state

### Visual Properties
- `position` - Element position in screen coordinates
- `size` - Element size in points
- `hidden` - Visibility flag
- `modal` - Whether a window is modal

### Text & Content
- `selectedText` - Currently selected text
- `selectedTextRange` / `selectedTextRanges` - Text selection ranges
- `visibleCharacterRange` - Visible text range
- `numberOfCharacters` - Character count
- `placeholderValue` - Placeholder text

### Table/Grid Attributes
- `rowCount` / `columnCount` - Grid dimensions
- `rows` / `columns` - Grid elements
- `selectedRows` / `selectedColumns` - Selected grid items
- `rowHeaderUIElements` / `columnHeaderUIElements` - Header elements

### Button & Control Attributes
- `defaultButton` / `cancelButton` - Special buttons
- `incrementButton` / `decrementButton` - Stepper buttons
- `minimizeButton` / `fullScreenButton` - Window controls
- `searchButton` / `clearButton` - Search field controls

### Window Attributes
- `mainWindow` - The app's main window
- `focusedWindow` - The window with focus
- `focusedUIElement` - The focused element
- `windows` - All app windows

## Initializer

```swift
init(rawValue: String)
```

Creates an attribute from a raw string value.

## See Also

### Accessibility Types

- `NSAccessibility.Action`
- `NSAccessibility.Role`
- `NSAccessibility.Subrole`
- `NSAccessibility.ParameterizedAttribute`
- `NSAccessibilityOrientation`
- `NSAccessibilityAnnotationPosition`
