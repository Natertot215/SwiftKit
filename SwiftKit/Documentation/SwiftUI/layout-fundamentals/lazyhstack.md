---
url: https://developer.apple.com/documentation/swiftui/lazyhstack
framework: SwiftUI
category: Layout fundamentals
title: LazyHStack
kind: struct
captured: 2026-05-02
---

# LazyHStack

A view that arranges its children in a line that grows horizontally, creating items only as needed.

## Declaration

```swift
struct LazyHStack<Content> where Content : View
```

### Overview

The stack is “lazy,” in that the stack view doesn’t create items until it needs to render them onscreen.

In the following example, a `ScrollView` contains a `LazyHStack` that consists of a horizontal row of text views. The stack aligns to the top of the scroll view and uses 10-point spacing between each text view.

```swift
ScrollView(.horizontal) {
    LazyHStack(alignment: .top, spacing: 10) {
        ForEach(1...100, id: \.self) {
            Text("Column \($0)")
        }
    }
}
```





## Relationships

**Conforms To**: `View`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating a lazy-loading horizontal stack

- `init(alignment:spacing:pinnedViews:content:)`

## See Also

- `Grouping data with lazy stack views`
- `Creating performant scrollable stacks`
- `LazyVStack`
- `PinnedScrollableViews`
