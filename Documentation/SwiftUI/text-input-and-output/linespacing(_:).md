---
url: https://developer.apple.com/documentation/swiftui/view/linespacing(_:)
framework: SwiftUI
category: Text input and output
title: lineSpacing(_:)
kind: method
captured: 2026-05-02
---

# lineSpacing(_:)

Sets the amount of space between lines of text in this view.

## Declaration

```swift
nonisolated func lineSpacing(_ lineSpacing: CGFloat) -> some View

```

### Discussion

Use `lineSpacing(_:)` to set the amount of spacing from the bottom of one line to the top of the next for text elements in the view.

In the `Text` view in the example below, 10 points separate the bottom of one line to the top of the next as the text field wraps inside this view. Applying `lineSpacing(_:)` to a view hierarchy applies the line spacing to all text elements contained in the view.

```swift
Text("This is a string in a TextField with 10 point spacing applied between the bottom of one line and the top of the next.")
    .frame(width: 200, height: 200, alignment: .leading)
    .lineSpacing(10)
```

## Parameters

- **lineSpacing**: The amount of space between the bottom of one line and the top of the next line in points.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `lineSpacing`
- `multilineTextAlignment(_:)`
- `multilineTextAlignment`
