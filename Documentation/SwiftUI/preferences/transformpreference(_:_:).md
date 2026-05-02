---
url: https://developer.apple.com/documentation/swiftui/view/transformpreference(_:_:)
framework: SwiftUI
category: Preferences
title: transformPreference(_:_:)
kind: method
captured: 2026-05-02
---

# transformPreference(_:_:)

Applies a transformation to a preference value.

## Declaration

```swift
nonisolated func transformPreference<K>(_ key: K.Type = K.self, _ callback: @escaping (inout K.Value) -> Void) -> some View where K : PreferenceKey

```









## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `preference(key:value:)`
