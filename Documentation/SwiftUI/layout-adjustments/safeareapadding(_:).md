---
url: https://developer.apple.com/documentation/swiftui/view/safeareapadding(_:)
framework: SwiftUI
category: Layout adjustments
title: safeAreaPadding(_:)
kind: method
captured: 2026-05-02
---

# safeAreaPadding(_:)

Adds the provided insets into the safe area of this view.

## Declaration

```swift
nonisolated func safeAreaPadding(_ insets: EdgeInsets) -> some View

```

### Discussion

Use this modifier when you would like to add a fixed amount of space to the safe area a view sees.

```swift
ScrollView(.horizontal) {
    HStack(spacing: 10.0) {
        ForEach(items) { item in
            ItemView(item)
        }
    }
}
.safeAreaPadding(.horizontal, 20.0)
```

See the `View/safeAreaInset(edge:alignment:spacing:content)` modifier for adding to the safe area based on the size of a view.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `ignoresSafeArea(_:edges:)`
- `safeAreaInset(edge:alignment:spacing:content:)`
- `safeAreaPadding(_:_:)`
- `SafeAreaRegions`
