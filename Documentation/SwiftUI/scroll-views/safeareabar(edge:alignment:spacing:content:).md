---
url: https://developer.apple.com/documentation/swiftui/view/safeareabar(edge:alignment:spacing:content:)
framework: SwiftUI
category: Scroll views
title: safeAreaBar(edge:alignment:spacing:content:)
kind: method
captured: 2026-05-02
---

# safeAreaBar(edge:alignment:spacing:content:)

Shows the specified content as a custom bar beside the modified view.

## Declaration

```swift
nonisolated func safeAreaBar(edge: HorizontalEdge, alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> some View) -> some View

```

### Return Value

A new view that displays `content` beside the modified view, making space for the `content` view by horizontally insetting the modified view, adjusting the safe area and scroll edge effects to match.

### Discussion

Similar to the `View/safeAreaInset(edge:alignment:spacing:content:)-6gwby` modifier, the `content` view is anchored to the specified horizontal edge of the parent view and its width insets the safe area.

Additionally, it extends the edge effect of any scroll views affected by the inset safe area.

## Parameters

- **edge**: The horizontal edge of the view on which `content` is placed.
- **alignment**: The alignment guide used to position `content` vertically.
- **spacing**: Extra distance placed between the two views, or nil to use the default amount of spacing.
- **content**: A view builder function providing the view to display as a custom bar.





## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0



## See Also

- `scrollEdgeEffectStyle(_:for:)`
- `scrollEdgeEffectHidden(_:for:)`
- `ScrollEdgeEffectStyle`
