---
url: https://developer.apple.com/documentation/appkit/nstokenfieldcell
framework: AppKit
category: Views and controls
title: NSTokenFieldCell
kind: class
captured: 2026-05-02
---

# NSTokenFieldCell

A text field cell subclass that enables tokenized editing of an array of objects.

## Declaration

```swift
class NSTokenFieldCell
```

### Overview

`NSTokenFieldCell` is a subclass of `NSTextFieldCell` that provides tokenized editing of an array of objects similar to the address field in the Mail app. The objects may be strings or objects that can be represented as strings. A single token field cell can be presented in an `NSTokenField` control.





## Relationships

**Inherits From**: `NSTextFieldCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Managing the Token Style

- `tokenStyle`

### Managing the Tokenizing Character Set

- `defaultTokenizingCharacterSet`
- `tokenizingCharacterSet`

### Configuring the Completion Delay

- `completionDelay`
- `defaultCompletionDelay`

### Managing the Delegate

- `delegate`

### Constants

- `NSTokenField.TokenStyle`

## See Also

- `NSTokenFieldCellDelegate`
