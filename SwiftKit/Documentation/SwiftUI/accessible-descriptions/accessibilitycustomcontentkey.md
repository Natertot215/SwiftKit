---
url: https://developer.apple.com/documentation/swiftui/accessibilitycustomcontentkey
framework: SwiftUI
category: Accessible descriptions
title: AccessibilityCustomContentKey
kind: struct
captured: 2026-05-02
---

# AccessibilityCustomContentKey

Key used to specify the identifier and label associated with an entry of additional accessibility information.

## Declaration

```swift
struct AccessibilityCustomContentKey
```

### Overview

Use `AccessibilityCustomContentKey` and the associated modifiers taking this value as a parameter in order to simplify clearing or replacing entries of additional information that are manipulated from multiple places in your code.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Creating a key

- `init(_:)`
- `init(_:id:)`

## See Also

- `accessibilityCustomContent(_:_:importance:)`
