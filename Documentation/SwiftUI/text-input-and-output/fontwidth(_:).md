---
url: https://developer.apple.com/documentation/swiftui/view/fontwidth(_:)
framework: SwiftUI
category: Text input and output
title: fontWidth(_:)
kind: method
captured: 2026-05-02
---

# fontWidth(_:)

Sets the font width of the text in this view.

## Declaration

```swift
nonisolated func fontWidth(_ width: Font.Width?) -> some View

```

### Return Value

A view that uses the font width you specify.

## Parameters

- **width**: One of the available font widths. Providing `nil` removes the effect of any font width modifier applied higher in the view hierarchy.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `Applying custom fonts to text`
- `font(_:)`
- `fontDesign(_:)`
- `fontWeight(_:)`
- `font`
- `Font`
