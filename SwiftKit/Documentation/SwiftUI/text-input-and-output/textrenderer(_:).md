---
url: https://developer.apple.com/documentation/swiftui/view/textrenderer(_:)
framework: SwiftUI
category: Text input and output
title: textRenderer(_:)
kind: method
captured: 2026-05-02
---

# textRenderer(_:)

Returns a new view such that any text views within it will use `renderer` to draw themselves.

## Declaration

```swift
nonisolated func textRenderer<T>(_ renderer: T) -> some View where T : TextRenderer

```

### Return Value

A new view that will use `renderer` to draw its text views.

## Parameters

- **renderer**: The renderer value.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `Creating visual effects with SwiftUI`
- `TextAttribute`
- `TextRenderer`
- `TextProxy`
