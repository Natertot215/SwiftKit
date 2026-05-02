---
url: https://developer.apple.com/documentation/swiftui/withanimation(_:completioncriteria:_:completion:)
framework: SwiftUI
category: Animations
title: withAnimation(_:completionCriteria:_:completion:)
kind: func
captured: 2026-05-02
---

# withAnimation(_:completionCriteria:_:completion:)

Returns the result of recomputing the view’s body with the provided animation, and runs the completion when all animations are complete.

## Declaration

```swift
func withAnimation<Result>(_ animation: Animation? = .default, completionCriteria: AnimationCompletionCriteria = .logicallyComplete, _ body: () throws -> Result, completion: @escaping () -> Void) rethrows -> Result
```

### Discussion

This function sets the given `Animation` as the `Transaction/animation` property of the thread’s current `Transaction` as well as calling `Transaction/addAnimationCompletion` with the specified completion.

The completion callback will always be fired exactly one time. If no animations are created by the changes in `body`, then the callback will be called immediately after `body`.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `withAnimation(_:_:)`
- `AnimationCompletionCriteria`
- `Animation`
