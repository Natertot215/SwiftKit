---
url: https://developer.apple.com/documentation/swiftui/view/fontweight(_:)
framework: SwiftUI
category: Text input and output
title: fontWeight(_:)
kind: method
captured: 2026-05-02
---

# fontWeight(_:)

Sets the font weight of the text in this view.

## Declaration

```swift
nonisolated func fontWeight(_ weight: Font.Weight?) -> some View

```

### Return Value

A view that uses the font weight you specify.

## Parameters

- **weight**: One of the available font weights. Providing `nil` removes the effect of any font weight modifier applied higher in the view hierarchy.





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
- `fontWidth(_:)`
- `font`
- `Font`
