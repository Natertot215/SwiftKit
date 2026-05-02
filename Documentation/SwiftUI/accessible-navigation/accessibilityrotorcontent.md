---
url: https://developer.apple.com/documentation/swiftui/accessibilityrotorcontent
framework: SwiftUI
category: Accessible navigation
title: AccessibilityRotorContent
kind: protocol
captured: 2026-05-02
---

# AccessibilityRotorContent

Content within an accessibility rotor.

## Declaration

```swift
@MainActor @preconcurrency protocol AccessibilityRotorContent
```

### Overview

Generally generated from control flow constructs like `ForEach` and `if`, and `AccessibilityRotorEntry`.

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `AccessibilityRotorEntry`, `ForEach`, `Group`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Supporting types

- `body`
- `Body`

## See Also

- `AccessibilityRotorContentBuilder`
- `AccessibilityRotorEntry`
