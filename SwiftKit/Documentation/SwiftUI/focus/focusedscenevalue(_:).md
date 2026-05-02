---
url: https://developer.apple.com/documentation/swiftui/view/focusedscenevalue(_:)
framework: SwiftUI
category: Focus
title: focusedSceneValue(_:)
kind: method
captured: 2026-05-02
---

# focusedSceneValue(_:)

Sets the focused value for the given object type at a scene-wide scope.

## Declaration

```swift
nonisolated func focusedSceneValue<T>(_ object: T?) -> some View where T : AnyObject, T : Observable

```

### Discussion

> **IMPORTANT:** This initializer only accepts objects conforming to the `Observable` protocol. For reading environment objects that conform to `ObservableObject`, use `focusedObject(_:)`, instead.

To read this value, use the `FocusedValue` property wrapper.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `focusedValue(_:)`
- `focusedValue(_:_:)`
- `focusedSceneValue(_:_:)`
- `FocusedValues`
