---
url: https://developer.apple.com/documentation/swiftui/keyboardshortcut
framework: SwiftUI
category: Input events
title: KeyboardShortcut
kind: struct
captured: 2026-05-02
---

# KeyboardShortcut

Keyboard shortcuts describe combinations of keys on a keyboard that the user can press in order to activate a button or toggle.

## Declaration

```swift
struct KeyboardShortcut
```







## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Getting standard shortcuts

- `cancelAction`
- `defaultAction`

### Creating a shortcut

- `init(_:modifiers:)`
- `key`
- `modifiers`

### Creating a localized shortcut

- `init(_:modifiers:localization:)`
- `localization`
- `KeyboardShortcut.Localization`

## See Also

- `keyboardShortcut(_:)`
- `keyboardShortcut(_:modifiers:)`
- `keyboardShortcut(_:modifiers:localization:)`
- `keyboardShortcut`
- `KeyEquivalent`
- `EventModifiers`
