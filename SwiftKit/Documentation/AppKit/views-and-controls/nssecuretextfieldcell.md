---
url: https://developer.apple.com/documentation/appkit/nssecuretextfieldcell
framework: AppKit
category: Views and controls
title: NSSecureTextFieldCell
kind: class
captured: 2026-05-02
---

# NSSecureTextFieldCell

A text field whose value is hidden from the user.

## Declaration

```swift
class NSSecureTextFieldCell
```

### Overview

`NSSecureTextFieldCell` works with `NSSecureTextField` and overrides the general cell use of the field editor to provide its own field editor, which doesn’t display text or allow the user to cut or copy its value.





## Relationships

**Inherits From**: `NSTextFieldCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Working with character echo

- `echosBullets`

## See Also

- `NSTextFieldCell`
