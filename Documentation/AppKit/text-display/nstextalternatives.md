---
url: https://developer.apple.com/documentation/appkit/nstextalternatives
framework: AppKit
category: Text display
title: NSTextAlternatives
kind: class
captured: 2026-05-02
---

# NSTextAlternatives

A list of alternative strings for a piece of text.

## Declaration

```swift
class NSTextAlternatives
```

### Overview

`NSTextAlternatives` is an immutable value class that stores a list of alternatives for a piece of text and communicates the user’s selection of an alternative via a notification to your app. To support dictation, for example, you might use `NSTextAlternatives` to present a list of alternative interpretations for a word or phrase the user speaks. If the user chooses to replace the initial interpretation with an alternative, `NSTextAlternatives` notifies you of the choice so that you can update the text appropriately.

`NSTextAlternatives` instances are attached to attributed strings as the value of a text attribute, `NSTextAlternativesAttributeName`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 10.8

## Topics

### Initializing a Text Alternatives Object

- `init(primaryString:alternativeStrings:)`

### Storing Alternative Text Strings

- `primaryString`
- `alternativeStrings`

### Selecting an Alternative String

- `noteSelectedAlternativeString(_:)`

### Notifications

- `selectedAlternativeStringNotification`

### Initializers

- `init(coder:)`

## See Also

- `Adopting the system text cursor in custom text views`
- `NSTextInputContext`
- `NSTextInputClient`
- `NSTextContent`
- `NSTextInsertionIndicator`
- `NSTextInsertionIndicator.DisplayMode`
- `NSTextInsertionIndicator.AutomaticModeOptions`
