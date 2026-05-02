---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/contenttransitionaddsdrawinggroup
framework: SwiftUI
category: Environment values
title: contentTransitionAddsDrawingGroup
kind: property
captured: 2026-05-02
---

# contentTransitionAddsDrawingGroup

A Boolean value that controls whether views that render content transitions use GPU-accelerated rendering.

## Declaration

```swift
var contentTransitionAddsDrawingGroup: Bool { get set }
```

### Discussion

Setting this value to `true` causes SwiftUI to wrap content transitions with a `View/drawingGroup(opaque:colorMode:)` modifier.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `transition(_:)`
- `Transition`
- `TransitionProperties`
- `TransitionPhase`
- `AsymmetricTransition`
- `AnyTransition`
- `contentTransition(_:)`
- `contentTransition`
- `ContentTransition`
- `PlaceholderContentView`
- `navigationTransition(_:)`
- `NavigationTransition`
- `matchedTransitionSource(id:in:)`
- `matchedTransitionSource(id:in:configuration:)`
- `MatchedTransitionSourceConfiguration`
