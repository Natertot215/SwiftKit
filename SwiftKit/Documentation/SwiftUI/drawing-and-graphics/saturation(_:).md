---
url: https://developer.apple.com/documentation/swiftui/view/saturation(_:)
framework: SwiftUI
category: Drawing and graphics
title: saturation(_:)
kind: method
captured: 2026-05-02
---

# saturation(_:)

Adjusts the color saturation of this view.

## Declaration

```swift
nonisolated func saturation(_ amount: Double) -> some View

```

### Return Value

A view that adjusts the saturation of this view.

### Discussion

Use color saturation to increase or decrease the intensity of colors in a view.

The example below shows a series of red squares with their saturation increasing from 0 (gray) to 100% (fully-red) in 20% increments:

```swift
struct Saturation: View {
    var body: some View {
        HStack {
            ForEach(0..<6) {
                Color.red.frame(width: 60, height: 60, alignment: .center)
                    .saturation(Double($0) * 0.2)
                    .overlay(Text("\(Double($0) * 0.2 * 100, specifier: "%.0f")%"),
                             alignment: .bottom)
                    .border(Color.gray)
            }
        }
    }
}
```

> **NOTE:** `contrast(_:)`

## Parameters

- **amount**: The amount of saturation to apply to this view.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `brightness(_:)`
- `contrast(_:)`
- `colorInvert()`
- `colorMultiply(_:)`
- `grayscale(_:)`
- `hueRotation(_:)`
- `luminanceToAlpha()`
- `materialActiveAppearance(_:)`
- `materialActiveAppearance`
- `MaterialActiveAppearance`
