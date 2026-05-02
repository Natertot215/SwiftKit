---
url: https://developer.apple.com/documentation/swiftui/view/previewcontext(_:)
framework: SwiftUI
category: Previews in Xcode
title: previewContext(_:)
kind: method
captured: 2026-05-02
---

# previewContext(_:)

Declares a context for the preview.

## Declaration

```swift
nonisolated func previewContext<C>(_ value: C) -> some View where C : PreviewContext

```



## Parameters

- **value**: The context for the preview; the default is `nil`.





## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0



## See Also

- `PreviewContext`
- `PreviewContextKey`
