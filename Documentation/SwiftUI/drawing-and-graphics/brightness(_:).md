---
url: https://developer.apple.com/documentation/swiftui/view/brightness(_:)
framework: SwiftUI
category: Drawing and graphics
title: brightness(_:)
kind: method
captured: 2026-05-02
---

# brightness(_:)

Brightens this view by the specified amount.

## Declaration

```swift
nonisolated func brightness(_ amount: Double) -> some View

```

### Return Value

A view that brightens this view by the specified amount.

### Discussion

Use `brightness(_:)` to brighten the intensity of the colors in a view. The example below shows a series of red squares, with their brightness increasing from 0 (fully red) to 100% (white) in 20% increments.

```swift
struct Brightness: View {
    var body: some View {
        HStack {
            ForEach(0..<6) {
                Color.red.frame(width: 60, height: 60, alignment: .center)
                    .brightness(Double($0) * 0.2)
                    .overlay(Text("\(Double($0) * 0.2 * 100, specifier: "%.0f")%"),
                             alignment: .bottom)
                    .border(Color.gray)
            }
        }
    }
}
```

## Parameters

- **amount**: A value between 0 (no effect) and 1 (full white brightening) that represents the intensity of the brightness effect.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `contrast(_:)`
- `colorInvert()`
- `colorMultiply(_:)`
- `saturation(_:)`
- `grayscale(_:)`
- `hueRotation(_:)`
- `luminanceToAlpha()`
- `materialActiveAppearance(_:)`
- `materialActiveAppearance`
- `MaterialActiveAppearance`
