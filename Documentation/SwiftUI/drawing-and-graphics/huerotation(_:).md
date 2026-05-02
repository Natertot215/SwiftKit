---
url: https://developer.apple.com/documentation/swiftui/view/huerotation(_:)
framework: SwiftUI
category: Drawing and graphics
title: hueRotation(_:)
kind: method
captured: 2026-05-02
---

# hueRotation(_:)

Applies a hue rotation effect to this view.

## Declaration

```swift
nonisolated func hueRotation(_ angle: Angle) -> some View

```

### Return Value

A view that applies a hue rotation effect to this view.

### Discussion

Use hue rotation effect to shift all of the colors in a view according to the angle you specify.

The example below shows a series of squares filled with a linear gradient. Each square shows the effect of a 36˚ hueRotation (a total of 180˚ across the 5 squares) on the gradient:

```swift
struct HueRotation: View {
    var body: some View {
        HStack {
            ForEach(0..<6) {
                Rectangle()
                    .fill(.linearGradient(
                        colors: [.blue, .red, .green],
                        startPoint: .top, endPoint: .bottom))
                    .hueRotation((.degrees(Double($0 * 36))))
                    .frame(width: 60, height: 60, alignment: .center)
            }
        }
    }
}
```

## Parameters

- **angle**: The hue rotation angle to apply to the colors in this view.





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
- `saturation(_:)`
- `grayscale(_:)`
- `luminanceToAlpha()`
- `materialActiveAppearance(_:)`
- `materialActiveAppearance`
- `MaterialActiveAppearance`
