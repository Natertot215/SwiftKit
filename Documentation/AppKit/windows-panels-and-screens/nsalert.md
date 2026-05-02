---
url: https://developer.apple.com/documentation/appkit/nsalert
framework: AppKit
category: Windows, panels, and screens
title: NSAlert
kind: class
captured: 2026-05-01
---

# NSAlert

## Declaration

```swift
@MainActor class NSAlert
```

## Abstract

A modal dialog or sheet attached to a document window.

## Overview

The methods of the `NSAlert` class allow you to specify alert level, alert text, button titles, and a custom icon should you require it. The class also lets your alerts display a help button and provides ways for apps to offer help specific to an alert.

To display an alert as a sheet, call the `beginSheetModal(for:completionHandler:)` method; to display one as an app-modal dialog, use the `runModal()` method.

By design, an `NSAlert` object is intended for a single alert—that is, an alert with a unique combination of title, buttons, and so on—that is displayed upon a particular condition. You should create an `NSAlert` object for each alert dialog, creating it only when you need to display an alert, and release it when you are done. If you have a particular alert dialog that you need to show repeatedly, you can retain and reuse an instance of `NSAlert` for this dialog.

After creating an alert using one of the alert creation methods, you can customize it further prior to displaying it by customizing its attributes.

Unless you must maintain compatibility with existing alert-processing code that uses the function-based API, you should allocate (`alloc`) and initialize (`init`) the alert object, and then set its attributes using the appropriate methods of the `NSAlert` class.

### Instance Attributes

`NSAlert` objects have the following attributes:

- **Type**: An alert's type helps convey the importance or gravity of its message to the user. Specified with the `alertStyle` property.
- **Message text**: The main message of the alert. Specified with `messageText`.
- **Informative text**: Additional information about the alert. Specified with `informativeText`.
- **Icon**: An optional, custom icon to display in the alert, which is used instead of the default app icon. Specified with `icon`.
- **Help**: Alerts can let the user get help about them. Use `helpAnchor` and `showsHelp`.
- **Response buttons**: By default an alert has one response button: the OK button. You can add more response buttons using the `addButton(withTitle:)` method.
- **Suppression checkbox**: A suppression checkbox allows the user to suppress the display of a particular alert in subsequent occurrences of the event that triggers it. Use `showsSuppressionButton`.
- **Accessory view**: An accessory view lets you add additional information to an alert; for example, a text field with contact information. Use `accessoryView`, `layout()`.

## Topics

### Creating Alerts
- `init(error:)`

### Configuring Alerts
- `layout()`
- `alertStyle`
- `accessoryView`
- `showsHelp`
- `helpAnchor`
- `delegate`

### Displaying Alerts
- `runModal()`
- `beginSheetModal(for:completionHandler:)`
- `beginSheetModal(for:modalDelegate:didEnd:contextInfo:)`
- `suppressionButton`
- `showsSuppressionButton`

### Accessing Alert Text
- `informativeText`
- `messageText`

### Accessing a Custom Alert Icon
- `icon`

### Accessing Alert Response Buttons
- `buttons`
- `addButton(withTitle:)`

### Getting Alert Windows
- `window`

### Constants
- `NSAlert.Style`
- `NSApplication.ModalResponse`

## Inheritance

Inherits from `NSObject`

## Conforms To

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`
- `Sendable`

## See Also

- Sheet Programming Topics
- Dialogs and Special Panels
- `NSAlertDelegate`

## Subclassing Notes

The `NSAlert` class is not designed for subclassing.
