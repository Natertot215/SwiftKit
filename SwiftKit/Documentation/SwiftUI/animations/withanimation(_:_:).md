---
url: https://developer.apple.com/documentation/swiftui/withanimation(_:_:)
framework: SwiftUI
category: Animations
title: withAnimation(_:_:)
kind: func
captured: 2026-05-02
---

# withAnimation(_:_:)

Returns the result of recomputing the view’s body with the provided animation.

## Declaration

```swift
func withAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result
```

### Discussion

This function sets the given `Animation` as the `Transaction/animation` property of the thread’s current `Transaction`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `withAnimation(_:completionCriteria:_:completion:)`
- `AnimationCompletionCriteria`
- `Animation`
