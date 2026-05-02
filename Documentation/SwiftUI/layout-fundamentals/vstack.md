---
url: https://developer.apple.com/documentation/swiftui/vstack
framework: SwiftUI
category: Layout fundamentals
title: VStack
kind: struct
captured: 2026-05-02
---

# VStack

A view that arranges its subviews in a vertical line.

## Declaration

```swift
@frozen struct VStack<Content> where Content : View
```

### Overview

Unlike `LazyVStack`, which only renders the views when your app needs to display them, a `VStack` renders the views all at once, regardless of whether they are on- or offscreen. Use the regular `VStack` when you have a small number of subviews or don’t want the delayed rendering behavior of the “lazy” version.

The following example shows a simple vertical stack of 10 text views:

```swift
var body: some View {
    VStack(
        alignment: .leading,
        spacing: 10
    ) {
        ForEach(
            1...10,
            id: \.self
        ) {
            Text("Item \($0)")
        }
    }
}
```

> **NOTE:** If you need a vertical stack that conforms to the `Layout` protocol, like when you want to create a conditional layout using `AnyLayout`, use `VStackLayout` instead.





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

- `init(alignment:spacing:content:)`

## See Also

- `Building layouts with stack views`
- `HStack`
