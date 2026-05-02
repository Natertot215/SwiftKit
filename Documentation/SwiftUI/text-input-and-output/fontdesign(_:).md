---
url: https://developer.apple.com/documentation/swiftui/view/fontdesign(_:)
framework: SwiftUI
category: Text input and output
title: fontDesign(_:)
kind: method
captured: 2026-05-02
---

# fontDesign(_:)

Sets the font design of the text in this view.

## Declaration

```swift
nonisolated func fontDesign(_ design: Font.Design?) -> some View

```

### Return Value

A view that uses the font design you specify.

## Parameters

- **design**: One of the available font designs. Providing `nil` removes the effect of any font design modifier applied higher in the view hierarchy.





## Availability

- iOS 16.1
- iPadOS 16.1
- Mac Catalyst 16.1
- macOS 13.0
- tvOS 16.1
- visionOS 1.0
- watchOS 9.1



## See Also

- `Applying custom fonts to text`
- `font(_:)`
- `fontWeight(_:)`
- `fontWidth(_:)`
- `font`
- `Font`
