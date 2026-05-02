---
url: https://developer.apple.com/documentation/swiftui/controlwidgetconfiguration
framework: SwiftUI
category: App extensions
title: ControlWidgetConfiguration
kind: protocol
captured: 2026-05-02
---

# ControlWidgetConfiguration

A type that describes a control widget’s content.

## Declaration

```swift
@MainActor @preconcurrency protocol ControlWidgetConfiguration
```

### Overview

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

**Conforming Types**: `EmptyControlWidgetConfiguration`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 26.0
- watchOS 26.0

## Topics

### Associated Types

- `Body`

### Instance Properties

- `body`

### Instance Methods

- `description(_:)`
- `displayName(_:)`
- `promptsForUserConfiguration()`
- `pushHandler(_:)`

## See Also

- `ControlWidget`
- `EmptyControlWidgetConfiguration`
- `ControlWidgetConfigurationBuilder`
- `ControlWidgetTemplate`
- `EmptyControlWidgetTemplate`
- `ControlWidgetTemplateBuilder`
- `controlWidgetActionHint(_:)`
- `controlWidgetStatus(_:)`
