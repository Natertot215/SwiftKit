---
url: https://developer.apple.com/documentation/swiftui/view/id(_:)
framework: SwiftUI
category: View fundamentals
title: id(_:)
kind: method
captured: 2026-05-02
---

# id(_:)

Binds a view’s identity to the given proxy value.

## Declaration

```swift
nonisolated func id<ID>(_ id: ID) -> some View where ID : Hashable

```

### Discussion

When the proxy value specified by the `id` parameter changes, the identity of the view — for example, its state — is reset.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `tag(_:includeOptional:)`
- `equatable()`
