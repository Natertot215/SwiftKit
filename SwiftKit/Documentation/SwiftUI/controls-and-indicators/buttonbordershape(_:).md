---
url: https://developer.apple.com/documentation/swiftui/view/buttonbordershape(_:)
framework: SwiftUI
category: Controls and indicators
title: buttonBorderShape(_:)
kind: method
captured: 2026-05-02
---

# buttonBorderShape(_:)

Sets the border shape for buttons in this view.

## Declaration

```swift
nonisolated func buttonBorderShape(_ shape: ButtonBorderShape) -> some View

```

### Discussion

The border shape is used to draw the platter for a bordered button.

The border shape affects buttons of the `PrimitiveButtonStyle/bordered` and `PrimitiveButtonStyle/borderedProminent` styles.

> **NOTE:** In macOS 15 and earlier, some border shapes are only applicable to bordered buttons in widgets.

## Parameters

- **shape**: The shape to use.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Button`
- `buttonStyle(_:)`
- `buttonRepeatBehavior(_:)`
- `buttonRepeatBehavior`
- `ButtonBorderShape`
- `ButtonRole`
- `ButtonRepeatBehavior`
- `ButtonSizing`
