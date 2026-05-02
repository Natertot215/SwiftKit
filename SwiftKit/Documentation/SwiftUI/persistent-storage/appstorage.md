---
url: https://developer.apple.com/documentation/swiftui/appstorage
framework: SwiftUI
category: Persistent storage
title: AppStorage
kind: struct
captured: 2026-05-02
---

# AppStorage

A property wrapper type that reflects a value from `UserDefaults` and invalidates a view on a change in value in that user default.

## Declaration

```swift
@frozen @propertyWrapper struct AppStorage<Value>
```







## Relationships

**Conforms To**: `DynamicProperty`, `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Storing a value

- `init(wrappedValue:_:store:)`
- `init(_:store:)`

### Getting the value

- `wrappedValue`
- `projectedValue`

## See Also

- `Restoring your app’s state with SwiftUI`
- `defaultAppStorage(_:)`
- `SceneStorage`
