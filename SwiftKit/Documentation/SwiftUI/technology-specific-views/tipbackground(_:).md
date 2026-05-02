---
url: https://developer.apple.com/documentation/swiftui/view/tipbackground(_:)
framework: SwiftUI
category: Technology-specific views
title: tipBackground(_:)
kind: method
captured: 2026-05-02
---

# tipBackground(_:)

Sets the tip’s view background to a style. Currently this only applies to inline tips, not popover tips.

## Declaration

```swift
nonisolated func tipBackground<S>(_ style: S) -> some View where S : ShapeStyle

```

### Return Value

A view with the specified style drawn behind it.

## Parameters

- **style**: An instance of a type that conforms to `ShapeStyle` that SwiftUI draws behind the modified view.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `popoverTip(_:arrowEdge:action:)`
- `tipCornerRadius(_:antialiased:)`
- `tipImageSize(_:)`
- `tipViewStyle(_:)`
- `tipImageStyle(_:)`
- `tipImageStyle(_:_:)`
- `tipImageStyle(_:_:_:)`
