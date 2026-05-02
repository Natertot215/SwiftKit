---
url: https://developer.apple.com/documentation/swiftui/scenestorage
framework: SwiftUI
category: Persistent storage
title: SceneStorage
kind: struct
captured: 2026-05-02
---

# SceneStorage

A property wrapper type that reads and writes to persisted, per-scene storage.

## Declaration

```swift
@frozen @propertyWrapper struct SceneStorage<Value>
```

### Overview

You use `SceneStorage` when you need automatic state restoration of the value.  `SceneStorage` works very similar to `State`, except its initial value is restored by the system if it was previously saved, and the value is shared with other `SceneStorage` variables in the same scene.

The system manages the saving and restoring of `SceneStorage` on your behalf. The underlying data that backs `SceneStorage` is not available to you, so you must access it via the `SceneStorage` property wrapper. The system makes no guarantees as to when and how often the data will be persisted.

Each `Scene` has its own notion of `SceneStorage`, so data is not shared between scenes.

Ensure that the data you use with `SceneStorage` is lightweight. Data of a large size, such as model data, should not be stored in `SceneStorage`, as poor performance may result.

If the `Scene` is explicitly destroyed (e.g. the switcher snapshot is destroyed on iPadOS or the window is closed on macOS), the data is also destroyed. Do not use `SceneStorage` with sensitive data.





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

- `init(wrappedValue:_:)`
- `init(_:)`

### Getting the value

- `wrappedValue`
- `projectedValue`

### Initializers

- `init(wrappedValue:_:store:)`

## See Also

- `Restoring your app’s state with SwiftUI`
- `defaultAppStorage(_:)`
- `AppStorage`
