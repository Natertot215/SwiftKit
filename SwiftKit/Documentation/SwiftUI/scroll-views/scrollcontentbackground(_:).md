---
url: https://developer.apple.com/documentation/swiftui/view/scrollcontentbackground(_:)
framework: SwiftUI
category: Scroll views
title: scrollContentBackground(_:)
kind: method
captured: 2026-05-02
---

# scrollContentBackground(_:)

Specifies the visibility of the background for scrollable views within this view.

## Declaration

```swift
nonisolated func scrollContentBackground(_ visibility: Visibility) -> some View

```

### Discussion

The following example hides the standard system background of the List.

```swift
List {
    Text("One")
    Text("Two")
    Text("Three")
}
.scrollContentBackground(.hidden)
```

On macOS 15.0 and later, the visibility of the scroll background helps achieve the seamless window/titlebar appearance for scroll views that fill the window’s content view, or a pane’s full width and height. `List` and `Form` have the seamless appearance by default, configurable by hiding the scroll background. `ScrollView` can become seamless by making the background visible.

## Parameters

- **visibility**: The visibility to use for the background.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `scrollClipDisabled(_:)`
- `ScrollContentOffsetAdjustmentBehavior`
