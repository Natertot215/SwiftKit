---
url: https://developer.apple.com/documentation/swiftui/scrollview
framework: SwiftUI
category: Scroll views
title: ScrollView
kind: struct
captured: 2026-05-02
---

# ScrollView

A scrollable view.

## Declaration

```swift
struct ScrollView<Content> where Content : View
```

### Overview

The scroll view displays its content within the scrollable content region. As the user performs platform-appropriate scroll gestures, the scroll view adjusts what portion of the underlying content is visible. `ScrollView` can scroll horizontally, vertically, or both, but does not provide zooming functionality.

In the following example, a `ScrollView` allows the user to scroll through a `VStack` containing 100 `Text` views. The image after the listing shows the scroll view’s temporarily visible scrollbar at the right; you can disable it with the `showsIndicators` parameter of the `ScrollView` initializer.

```swift
var body: some View {
    ScrollView {
        VStack(alignment: .leading) {
            ForEach(0..<100) {
                Text("Row \($0)")
            }
        }
    }
}
```

#### Controlling Scroll Position

You can influence where a scroll view is initially scrolled by using the `View/defaultScrollAnchor(_:)` view modifier.

Provide a value of `UnitPoint/center`` to have the scroll view start in the center of its content when a scroll view is scrollable in both axes.

```swift
ScrollView([.horizontal, .vertical]) {
    // initially centered content
}
.defaultScrollAnchor(.center)
```

Or provide an alignment of `UnitPoint/bottom`` to have the scroll view start at the bottom of its content when a scroll view is scrollable in its vertical axes.

```swift
ScrollView {
    // initially bottom aligned content
}
.defaultScrollAnchor(.bottom)
```

After the scroll view initially renders, the user may scroll the content of the scroll view.

To perform programmatic scrolling, wrap one or more scroll views with a `ScrollViewReader`.





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

### Creating a scroll view

- `init(_:showsIndicators:content:)`
- `init(_:content:)`

### Configuring a scroll view

- `content`
- `axes`
- `showsIndicators`

### Supporting types

- `body`

## See Also

- `ScrollViewReader`
- `ScrollViewProxy`
