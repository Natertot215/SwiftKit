---
url: https://developer.apple.com/documentation/swiftui/buttonrole
framework: SwiftUI
category: Controls and indicators
title: ButtonRole
kind: struct
captured: 2026-05-02
---

# ButtonRole

A value that describes the purpose of a button.

## Declaration

```swift
struct ButtonRole
```

### Overview

A button role provides a description of a button’s purpose.  For example, the `ButtonRole/destructive` role indicates that a button performs a destructive action, like delete user data:

```swift
Button("Delete", role: .destructive) { delete() }
```





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting button roles

- `cancel`
- `destructive`

### Type Properties

- `close`
- `confirm`

## See Also

- `Button`
- `buttonStyle(_:)`
- `buttonBorderShape(_:)`
- `buttonRepeatBehavior(_:)`
- `buttonRepeatBehavior`
- `ButtonBorderShape`
- `ButtonRepeatBehavior`
- `ButtonSizing`
