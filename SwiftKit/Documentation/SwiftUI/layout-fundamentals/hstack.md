---
url: https://developer.apple.com/documentation/swiftui/hstack
framework: SwiftUI
category: Layout fundamentals
title: HStack
kind: struct
captured: 2026-05-02
---

# HStack

A view that arranges its subviews in a horizontal line.

## Declaration

```swift
@frozen struct HStack<Content> where Content : View
```

### Overview

Unlike `LazyHStack`, which only renders the views when your app needs to display them onscreen, an `HStack` renders the views all at once, regardless of whether they are on- or offscreen. Use the regular `HStack` when you have a small number of subviews or don’t want the delayed rendering behavior of the “lazy” version.

The following example shows a simple horizontal stack of five text views:

```swift
var body: some View {
    HStack(
        alignment: .top,
        spacing: 10
    ) {
        ForEach(
            1...5,
            id: \.self
        ) {
            Text("Item \($0)")
        }
    }
}
```

> **NOTE:** If you need a horizontal stack that conforms to the `Layout` protocol, like when you want to create a conditional layout using `AnyLayout`, use `HStackLayout` instead.





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
- `VStack`
