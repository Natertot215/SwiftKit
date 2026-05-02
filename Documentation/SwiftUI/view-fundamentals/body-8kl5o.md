---
url: https://developer.apple.com/documentation/swiftui/view/body-8kl5o
framework: SwiftUI
category: View fundamentals
title: body
kind: property
captured: 2026-05-02
---

# body

The content and behavior of the view.

## Declaration

```swift
@ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
```

### Discussion

When you implement a custom view, you must implement a computed `body` property to provide the content for your view. Return a view that’s composed of built-in views that SwiftUI provides, plus other composite views that you’ve already defined:

```swift
struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

For more information about composing views and a view hierarchy, see `Declaring-a-Custom-View`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `Body`
- `modifier(_:)`
- `Previews in Xcode`
