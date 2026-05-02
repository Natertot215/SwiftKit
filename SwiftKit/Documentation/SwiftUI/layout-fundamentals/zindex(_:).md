---
url: https://developer.apple.com/documentation/swiftui/view/zindex(_:)
framework: SwiftUI
category: Layout fundamentals
title: zIndex(_:)
kind: method
captured: 2026-05-02
---

# zIndex(_:)

Controls the display order of overlapping views.

## Declaration

```swift
nonisolated func zIndex(_ value: Double) -> some View

```

### Discussion

Use `zIndex(_:)` when you want to control the front-to-back ordering of views.

In this example there are two overlapping rotated rectangles. The frontmost is represented by the larger index value.

```swift
VStack {
    Rectangle()
        .fill(Color.yellow)
        .frame(width: 100, height: 100, alignment: .center)
        .zIndex(1) // Top layer.

    Rectangle()
        .fill(Color.red)
        .frame(width: 100, height: 100, alignment: .center)
        .rotationEffect(.degrees(45))
        // Here a zIndex of 0 is the default making
        // this the bottom layer.
}
```

## Parameters

- **value**: A relative front-to-back ordering for this view; the default is `0`.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `Adding a background to your view`
- `ZStack`
- `background(alignment:content:)`
- `background(_:ignoresSafeAreaEdges:)`
- `background(ignoresSafeAreaEdges:)`
- `background(_:in:fillStyle:)`
- `background(in:fillStyle:)`
- `overlay(alignment:content:)`
- `overlay(_:ignoresSafeAreaEdges:)`
- `overlay(_:in:fillStyle:)`
- `backgroundMaterial`
- `containerBackground(_:for:)`
- `containerBackground(for:alignment:content:)`
- `ContainerBackgroundPlacement`
