---
url: https://developer.apple.com/documentation/swiftui/view/kerning(_:)
framework: SwiftUI
category: Text input and output
title: kerning(_:)
kind: method
captured: 2026-05-02
---

# kerning(_:)

Sets the spacing, or kerning, between characters for the text in this view.

## Declaration

```swift
nonisolated func kerning(_ kerning: CGFloat) -> some View

```

### Return Value

A view where text has the specified amount of kerning.

## Parameters

- **kerning**: The spacing to use between individual characters in text. Value of `0` sets the kerning to the system default value.





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
- `tracking(_:)`
- `flipsForRightToLeftLayoutDirection(_:)`
- `TextAlignment`
