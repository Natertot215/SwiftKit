---
url: https://developer.apple.com/documentation/swiftui/immersionstyle/mixed
framework: SwiftUI
category: Immersive spaces
title: mixed
kind: property
captured: 2026-05-02
---

# mixed

An immersion style that displays unbounded content intermixed with other app content, along with passthrough video.

## Declaration

```swift
static var mixed: MixedImmersionStyle { get }
```

### Discussion

When this immersion style is selected, the immersion amount reported by the closure of `View/onImmersionChange(initial:_:)` is `0.0`.

Use the `Scene/immersionStyle(selection:in:)` scene modifier to specify this style for an `ImmersiveSpace`. However, this is the default immersion style if you don’t specify one.

The immersion style affects how windows interact with virtual objects in the environment. In `mixed` immersion, a virtual object obscures part or all of a window that’s behind the object. Similarly, a window obscures a virtual object that’s behind the window.







## Availability

- visionOS 1.0



## See Also

- `automatic`
- `full`
- `progressive`
