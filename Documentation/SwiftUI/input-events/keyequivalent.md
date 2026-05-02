---
url: https://developer.apple.com/documentation/swiftui/keyequivalent
framework: SwiftUI
category: Input events
title: KeyEquivalent
kind: struct
captured: 2026-05-02
---

# KeyEquivalent

Key equivalents consist of a letter, punctuation, or function key that can be combined with an optional set of modifier keys to specify a keyboard shortcut.

## Declaration

```swift
struct KeyEquivalent
```

### Overview

Key equivalents are used to establish keyboard shortcuts to app functionality. Any key can be used as a key equivalent as long as pressing it produces a single character value. Key equivalents are typically initialized using a single-character string literal, with constants for unprintable or hard-to-type values.

The modifier keys necessary to type a key equivalent are factored in to the resulting keyboard shortcut. That is, a key equivalent whose raw value is the capitalized string “A” corresponds with the keyboard shortcut Command-Shift-A. The exact mapping may depend on the keyboard layout—for example, a key equivalent with the character value “}” produces a shortcut equivalent to Command-Shift-] on ANSI keyboards, but would produce a different shortcut for keyboard layouts where punctuation characters are in different locations.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `ExpressibleByExtendedGraphemeClusterLiteral`, `ExpressibleByUnicodeScalarLiteral`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Getting arrow keys

- `upArrow`
- `downArrow`
- `leftArrow`
- `rightArrow`

### Getting other special keys

- `clear`
- `delete`
- `deleteForward`
- `end`
- `escape`
- `home`
- `pageDown`
- `pageUp`
- `return`
- `space`
- `tab`

### Creating a key equivalent

- `init(_:)`
- `character`

## See Also

- `keyboardShortcut(_:)`
- `keyboardShortcut(_:modifiers:)`
- `keyboardShortcut(_:modifiers:localization:)`
- `keyboardShortcut`
- `KeyboardShortcut`
- `EventModifiers`
