---
url: https://developer.apple.com/documentation/swiftui/view/progressviewstyle(_:)
framework: SwiftUI
category: View styles
title: progressViewStyle(_:)
kind: method
captured: 2026-05-02
---

# progressViewStyle(_:)

Sets the style for progress views in this view.

## Declaration

```swift
nonisolated func progressViewStyle<S>(_ style: S) -> some View where S : ProgressViewStyle

```

### Discussion

For example, the following code creates a progress view that uses the “circular” style:

```swift
ProgressView()
    .progressViewStyle(.circular)
```

## Parameters

- **style**: The progress view style to use for this view.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `Gauge`
- `gaugeStyle(_:)`
- `ProgressView`
- `DefaultDateProgressLabel`
- `DefaultButtonLabel`
