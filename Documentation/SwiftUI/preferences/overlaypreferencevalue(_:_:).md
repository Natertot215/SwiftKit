---
url: https://developer.apple.com/documentation/swiftui/view/overlaypreferencevalue(_:_:)
framework: SwiftUI
category: Preferences
title: overlayPreferenceValue(_:_:)
kind: method
captured: 2026-05-02
---

# overlayPreferenceValue(_:_:)

Reads the specified preference value from the view, using it to produce a second view that is applied as an overlay to the original view.

## Declaration

```swift
nonisolated func overlayPreferenceValue<Key, T>(_ key: Key.Type = Key.self, @ViewBuilder _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View

```

### Return Value

A view that layers a second view in front of the view.

## Parameters

- **key**: The preference key type whose value is to be read.
- **transform**: A function that produces the overlay view from the preference value read from the original view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `backgroundPreferenceValue(_:_:)`
- `backgroundPreferenceValue(_:alignment:_:)`
- `overlayPreferenceValue(_:alignment:_:)`
