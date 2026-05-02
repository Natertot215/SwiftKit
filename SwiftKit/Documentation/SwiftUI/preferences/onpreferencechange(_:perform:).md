---
url: https://developer.apple.com/documentation/swiftui/view/onpreferencechange(_:perform:)
framework: SwiftUI
category: Preferences
title: onPreferenceChange(_:perform:)
kind: method
captured: 2026-05-02
---

# onPreferenceChange(_:perform:)

Adds an action to perform when the specified preference key’s value changes.

## Declaration

```swift
nonisolated func onPreferenceChange<K>(_ key: K.Type = K.self, perform action: @escaping (K.Value) -> Void) -> some View where K : PreferenceKey, K.Value : Equatable

```

### Return Value

A view that triggers `action` when the value for `key` changes.

## Parameters

- **key**: The key to monitor for value changes.
- **action**: The action to perform when the value for `key` changes. The `action` closure passes the new value as its parameter.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0
