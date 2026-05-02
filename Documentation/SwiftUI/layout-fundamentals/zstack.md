---
url: https://developer.apple.com/documentation/swiftui/zstack
framework: SwiftUI
category: Layout fundamentals
title: ZStack
kind: struct
captured: 2026-05-02
---

# ZStack

A view that overlays its subviews, aligning them in both axes.

## Declaration

```swift
@frozen struct ZStack<Content> where Content : View
```

### Overview

The `ZStack` assigns each successive subview a higher z-axis value than the one before it, meaning later subviews appear “on top” of earlier ones.

The following example creates a `ZStack` of 100 x 100 point `Rectangle` views filled with one of six colors, offsetting each successive subview by 10 points so they don’t completely overlap:

```swift
let colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]

var body: some View {
    ZStack {
        ForEach(0..<colors.count) {
            Rectangle()
                .fill(colors[$0])
                .frame(width: 100, height: 100)
                .offset(x: CGFloat($0) * 10.0,
                        y: CGFloat($0) * 10.0)
        }
    }
}
```

The `ZStack` uses an `Alignment` to set the x- and y-axis coordinates of each subview, defaulting to a `Alignment/center` alignment. In the following example, the `ZStack` uses a `Alignment/bottomLeading` alignment to lay out two subviews, a red 100 x 50 point rectangle below, and a blue 50 x 100 point rectangle on top. Because of the alignment value, both rectangles share a bottom-left corner with the `ZStack` (in locales where left is the leading side).

```swift
var body: some View {
    ZStack(alignment: .bottomLeading) {
        Rectangle()
            .fill(Color.red)
            .frame(width: 100, height: 50)
        Rectangle()
            .fill(Color.blue)
            .frame(width:50, height: 100)
    }
    .border(Color.green, width: 1)
}
```

> **NOTE:** If you need a version of this stack that conforms to the `Layout` protocol, like when you want to create a conditional layout using `AnyLayout`, use `ZStackLayout` instead.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a stack

- `init(alignment:content:)`

### Supporting symbols

- `ZStackContent3D`

### Initializers

- `init(alignment:spacing:content:)`

## See Also

- `Adding a background to your view`
- `zIndex(_:)`
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
