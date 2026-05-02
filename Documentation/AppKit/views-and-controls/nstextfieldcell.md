---
url: https://developer.apple.com/documentation/appkit/nstextfieldcell
framework: AppKit
category: Views and controls
title: NSTextFieldCell
kind: class
captured: 2026-05-02
---

# NSTextFieldCell

An object that enhances the text display capabilities of a cell.

## Declaration

```swift
class NSTextFieldCell
```

### Overview

The `NSTextFieldCell` class adds to the text display capabilities of the `NSCell` class by allowing you to set the color of both the text and its background. You can also specify whether the cell draws its background at all.

All of the methods declared by this class are also declared by the `NSTextField` class, which uses `NSTextFieldCell` objects to draw and edit text. The `NSTextField` cover methods call the corresponding `NSTextFieldCell` methods.

Placeholder strings, set using the `NSTextFieldCell/placeholderString` or `NSTextFieldCell/placeholderAttributedString` property, appear in the text field cell if the actual string is `nil` or an empty string. They’re drawn in gray on the cell and aren’t archived in the “pre-10.2” nib format.

#### Designated Initializers

When subclassing `NSTextFieldCell` you must implement the designated initializers `NSCell/init(coder:)` and `NSCell/init(textCell:)`.





## Relationships

**Inherits From**: `NSActionCell`

**Inherited By**: `NSComboBoxCell`, `NSPathComponentCell`, `NSSearchFieldCell`, `NSSecureTextFieldCell`, `NSTableHeaderCell`, `NSTokenFieldCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating a Text Field Cell

- `init(textCell:)`
- `init(coder:)`

### Setting the Text Color

- `textColor`

### Setting the Bezel Style

- `bezelStyle`
- `NSTextField.BezelStyle`

### Controlling the Background

- `backgroundColor`
- `drawsBackground`

### Managing the Field Editor

- `setUpFieldEditorAttributes(_:)`
- `setWantsNotificationForMarkedText(_:)`

### Managing Placeholder Strings

- `placeholderString`
- `placeholderAttributedString`

### Accessing Input Source Locales

- `allowedInputSourceLocales`

## See Also

- `NSSecureTextFieldCell`
