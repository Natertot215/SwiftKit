---
url: https://developer.apple.com/documentation/swiftui/view/labelstyle(_:)
framework: SwiftUI
category: View styles
title: labelStyle(_:)
kind: method
captured: 2026-05-02
---

# labelStyle(_:)

Sets the style for labels within this view.

## Declaration

```swift
nonisolated func labelStyle<S>(_ style: S) -> some View where S : LabelStyle

```

### Discussion

Use this modifier to set a specific style for all labels within a view:

```swift
VStack {
    Label("Fire", systemImage: "flame.fill")
    Label("Lightning", systemImage: "bolt.fill")
}
.labelStyle(MyCustomLabelStyle())
```







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `Text`
- `Label`
