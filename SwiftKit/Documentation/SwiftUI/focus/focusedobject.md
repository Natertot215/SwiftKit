---
url: https://developer.apple.com/documentation/swiftui/focusedobject
framework: SwiftUI
category: Focus
title: FocusedObject
kind: struct
captured: 2026-05-02
---

# FocusedObject

A property wrapper type for an observable object supplied by the focused view or one of its ancestors.

## Declaration

```swift
@MainActor @frozen @propertyWrapper @preconcurrency struct FocusedObject<ObjectType> where ObjectType : ObservableObject
```

### Overview

Focused objects invalidate the current view whenever the observable object changes. If multiple views publish a focused object using the same key, the wrapped property will reflect the object that’s closest to the focused view.





## Relationships

**Conforms To**: `DynamicProperty`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Creating the focused object

- `init()`

### Getting the value

- `projectedValue`
- `wrappedValue`
- `FocusedObject.Wrapper`

## See Also

- `focusedObject(_:)`
- `focusedSceneObject(_:)`
