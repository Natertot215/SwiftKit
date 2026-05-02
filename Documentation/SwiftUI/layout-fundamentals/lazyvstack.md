---
url: https://developer.apple.com/documentation/swiftui/lazyvstack
framework: SwiftUI
category: Layout fundamentals
title: LazyVStack
kind: struct
captured: 2026-05-02
---

# LazyVStack

A view that arranges its children in a line that grows vertically, creating items only as needed.

## Declaration

```swift
struct LazyVStack<Content> where Content : View
```

### Overview

The stack is “lazy,” in that the stack view doesn’t create items until it needs to render them onscreen.

In the following example, a `ScrollView` contains a `LazyVStack` that consists of a vertical row of text views. The stack aligns to the leading edge of the scroll view, and uses default spacing between the text views.

```swift
ScrollView {
    LazyVStack(alignment: .leading) {
        ForEach(1...100, id: \.self) {
            Text("Row \($0)")
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

### Creating a lazy-loading vertical stack

- `init(alignment:spacing:pinnedViews:content:)`

## See Also

- `Grouping data with lazy stack views`
- `Creating performant scrollable stacks`
- `LazyHStack`
- `PinnedScrollableViews`
