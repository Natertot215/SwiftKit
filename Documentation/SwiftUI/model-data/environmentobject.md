---
url: https://developer.apple.com/documentation/swiftui/environmentobject
framework: SwiftUI
category: Model data
title: EnvironmentObject
kind: struct
captured: 2026-05-02
---

# EnvironmentObject

A property wrapper type for an observable object that a parent or ancestor view supplies.

## Declaration

```swift
@MainActor @frozen @propertyWrapper @preconcurrency struct EnvironmentObject<ObjectType> where ObjectType : ObservableObject
```

### Overview

An environment object invalidates the current view whenever the observable object that conforms to `ObservableObject` changes. If you declare a property as an environment object, be sure to set a corresponding model object on an ancestor view by calling its `View/environmentObject(_:)` modifier.

> **NOTE:** If your observable object conforms to the `Observable` protocol, use `Environment` instead of `EnvironmentObject` and set the model object in an ancestor view by calling its `View/environment(_:)` or `View/environment(_:_:)` modifiers.





## Relationships

**Conforms To**: `DynamicProperty`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating an environment object

- `init()`

### Getting the value

- `wrappedValue`
- `projectedValue`
- `EnvironmentObject.Wrapper`

## See Also

- `environmentObject(_:)`
- `environmentObject(_:)`
