---
url: https://developer.apple.com/documentation/appkit/nstokenfield
framework: AppKit
category: Views and controls
title: NSTokenField
kind: class
captured: 2026-05-02
---

# NSTokenField

A text field that converts text into visually distinct tokens.

## Declaration

```swift
class NSTokenField
```

### Overview

Use a token field when you want typed text to be transformed into “tokens”, which are visually distinct elements in the text field interface. For example, you might use a token field in a mail app to display email addresses for individual users. The distinct appearance of tokens makes them easy for users to distinguish from surrounding text.

`NSTokenField` uses an `NSTokenFieldCell` to implement much of the control’s functionality. `NSTokenField` provides cover methods for most methods of `NSTokenFieldCell`, which invoke the corresponding cell method.

> **NOTE:**  In OS X v10.4 and earlier, represented objects associated with token fields had to conform to `NSCoding`. Starting with OS X v10.5, they no longer need to.

In OS X v10.4, `NSTokenField` trims whitespace around tokens but it does not trim whitespace in macOS versions 10.5.0 and 10.5.1. In OS X v10.5.2, you get whitespace-trimming behavior by either linking against the v10.4 binary or linking against the v10.5 binary and *not*not implementing the `NSTokenFieldDelegate/tokenField(_:representedObjectForEditing:)` method. If you do not want the whitespace-trimming behavior, link against the v10.5 binary and implement this method, returning the editing string if you have no represented object.





## Relationships

**Inherits From**: `NSTextField`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityNavigableStaticText`, `NSAccessibilityProtocol`, `NSAccessibilityStaticText`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTextContent`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Configuring the Token Style

- `tokenStyle`

### Configuring the Tokenizing Character Set

- `tokenizingCharacterSet`
- `defaultTokenizingCharacterSet`

### Configuring the Completion Delay

- `completionDelay`
- `defaultCompletionDelay`

### Getting and Setting the Delegate

- `delegate`

### Enumerations

- `NSTokenField.TokenStyle`
