---
url: https://developer.apple.com/documentation/swiftui/immersionstyle/full
framework: SwiftUI
category: Immersive spaces
title: full
kind: property
captured: 2026-05-02
---

# full

An immersion style that displays unbounded content that completely replaces passthrough video.

## Declaration

```swift
static var full: FullImmersionStyle { get }
```

### Discussion

When this immersion style is selected, the immersion amount reported by the closure of `View/onImmersionChange(initial:_:)` is `1.0`.

Use the `Scene/immersionStyle(selection:in:)` scene modifier to specify this style for an `ImmersiveSpace`.

When using this style, the space’s content fully obscures passthrough except for the user’s upper limbs. You can manage limb visibility separately by applying the `Scene/upperLimbVisibility(_:)` scene modifier to the space, or the view modifier equivalent to a view inside the scene.

The immersion style affects how windows interact with virtual objects in the environment. In `full` immersion, windows always render in front of virtual content, no matter how someone positions the window or the content. This helps people to avoid losing track of windows behind virtual content when passthrough is off.







## Availability

- macOS 26.0
- visionOS 1.0



## See Also

- `automatic`
- `mixed`
- `progressive`
