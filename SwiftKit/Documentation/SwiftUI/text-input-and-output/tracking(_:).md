---
url: https://developer.apple.com/documentation/swiftui/view/tracking(_:)
framework: SwiftUI
category: Text input and output
title: tracking(_:)
kind: method
captured: 2026-05-02
---

# tracking(_:)

Sets the tracking for the text in this view.

## Declaration

```swift
nonisolated func tracking(_ tracking: CGFloat) -> some View

```

### Return Value

A view where text has the specified amount of tracking.

## Parameters

- **tracking**: The amount of additional space, in points, that the view should add to each character cluster after layout. Value of `0` sets the tracking to the system default value.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `truncationMode(_:)`
- `truncationMode`
- `allowsTightening(_:)`
- `allowsTightening`
- `minimumScaleFactor(_:)`
- `minimumScaleFactor`
- `baselineOffset(_:)`
- `kerning(_:)`
- `flipsForRightToLeftLayoutDirection(_:)`
- `TextAlignment`
